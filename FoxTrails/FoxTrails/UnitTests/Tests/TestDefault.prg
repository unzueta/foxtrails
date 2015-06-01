**********************************************************************
DEFINE CLASS TestDefault as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	*
	*  this LOCAL declaration enabled IntelliSense for
	*  the THIS object anywhere in this class
	*
	LOCAL THIS AS TestDefault OF TestDefault.PRG
	#ENDIF
	
	ioObjectToBeTested = .NULL.
	icSetClassLib = SPACE(0)
	icSetProcLib = SPACE(0)
	icSetPath = SPACE(0)

	********************************************************************
	FUNCTION Setup
	********************************************************************

    this.icSetPath = SET("PATH")
	THIS.icSetProcLib = SET("PROCEDURE")
	
	SET PATH TO (This.icSetPath+";..;..\Utility")
	SET PROCEDURE TO dispatch.prg ADDITIVE

	PUBLIC oDispatchContext
	PUBLIC oDispatch
	oDispatch = CREATEOBJECT("dispatcher")
	oDispatchContext = oDispatch.oDispatchContext
	oDispatchContext.domain = "localhost"
	
    *-- instantiate the object here
    this.ioOBJECTTOBETESTED = NEWOBJECT("default","Controllers/default.prg")
    oDispatchContext.instance = this.ioOBJECTTOBETESTED

	********************************************************************
	ENDFUNC
	********************************************************************
	
	********************************************************************
	FUNCTION TearDown
	********************************************************************
    THIS.ioObjectToBeTested = .NULL.
	LOCAL lcSetProcLib
	lcSetProcLib = THIS.icSetProcLib
	SET PROCEDURE TO &lcSetProcLib
	SET PATH TO (this.icSetPATH) 
	CLOSE DATABASES
	RELEASE oDispatchController
	RELEASE oDispatch
	
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
	
ENDDEFINE

