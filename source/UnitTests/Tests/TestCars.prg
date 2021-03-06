**********************************************************************
DEFINE CLASS TestCars as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	LOCAL THIS AS TestCars OF TestCars.PRG
	#ENDIF
	
	ioObjectToBeTested = .NULL.
	icSetClassLib = SPACE(0)
	icSetProcLib = SPACE(0)
	icSetPath = SPACE(0)

	
	********************************************************************
	FUNCTION Setup
	********************************************************************
	*
	*  put common setup code here
	*
	*  do NOT call THIS.Assert..() methods here -- this is
	*  NOT a test method
	*

	this.icSetPath = SET("PATH")
	THIS.icSetProcLib = SET("PROCEDURE")
	SET PATH TO (This.icSetPath+";..;..\utility")
	SET PROCEDURE TO dispatch.prg ADDITIVE

	PUBLIC oDispatchContext
	PUBLIC oDispatch
	oDispatch = CREATEOBJECT("dispatcher")
	oDispatchContext = oDispatch.oDispatchContext
	oDispatchContext.domain = "localhost"
	
    	*-- instantiate the object here
	this.ioOBJECTTOBETESTED = NEWOBJECT("car","controllers\car.prg")
	oDispatchContext.Instance = this.ioOBJECTTOBETESTED

	********************************************************************
	ENDFUNC
	********************************************************************
	
	********************************************************************
	FUNCTION TearDown
	********************************************************************
	*
	*  put common cleanup code here -- this method is called
	*
	*  do NOT call THIS.Assert..() methods here -- this is
	*  NOT a test method
	*

	THIS.ioObjectToBeTested = .NULL.
	LOCAL lcSetProcLib
	lcSetProcLib = THIS.icSetProcLib
	SET PROCEDURE TO &lcSetProcLib
	SET PATH TO (this.icSetPATH) 
	CLOSE DATABASES   
	
	********************************************************************
	ENDFUNC
	********************************************************************	

	*********************************************************************
	FUNCTION TestObjectWasCreated
	*********************************************************************
	THIS.AssertNotNullOrEmpty(THIS.ioObjectToBeTested)
	*********************************************************************
	ENDFUNC
	*********************************************************************



**********************************************************************
ENDDEFINE
**********************************************************************
