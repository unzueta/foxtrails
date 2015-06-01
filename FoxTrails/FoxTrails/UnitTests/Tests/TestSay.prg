**********************************************************************
DEFINE CLASS TestSay as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	LOCAL THIS AS TestSay OF TestSay.PRG
	#ENDIF
	
	ioObjectToBeTested = .NULL.
	icSetClassLib = SPACE(0)
	icSetProcLib = SPACE(0)
	icSetPath = SPACE(0)

*!*		icTestPrefix = "<Your preferred prefix here>"
	
	********************************************************************
	FUNCTION Setup
	********************************************************************
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
	this.ioOBJECTTOBETESTED = NEWOBJECT("say","controllers\say.prg")
	oDispatchContext.Instance = this.ioOBJECTTOBETESTED
	
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

	*********************************************************************
	FUNCTION TestHello
	*********************************************************************
	THIS.AssertNotNullOrEmpty(THIS.ioObjectToBeTested.Hello())
	THIS.Assertequals("Hello World",THIS.ioObjectToBeTested.greeting)
	THIS.AssertNotNullOrEmpty(THIS.ioObjectToBeTested.Hello("Tester"))
	THIS.Assertequals("Hello Tester",THIS.ioObjectToBeTested.greeting)
	THIS.AssertNotNullOrEmpty(THIS.ioObjectToBeTested.now)
	THIS.Assertfalse(oDispatchContext.hasErrors(),"An error occurred while calling the hello method")

	oDispatchContext.renderedView = RenderVml("Views/say/hello.vml",this.ioOBJECTTOBETESTED)
	lcHtml = RenderVml("Layouts/say.vml",this.ioOBJECTTOBETESTED)
	THIS.AssertTrue("Tester" $ lcHtml, "The greeting did not render properly")
	THIS.AssertTrue("</html>" $ lcHtml, "The layout did not create a closing </html> tag")
	
	*********************************************************************
	ENDFUNC
	*********************************************************************
	
	
**********************************************************************
ENDDEFINE
**********************************************************************
