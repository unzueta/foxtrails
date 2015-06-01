**********************************************************************
DEFINE CLASS TestBase as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	*
	*  this LOCAL declaration enabled IntelliSense for
	*  the THIS object anywhere in this class
	*
	LOCAL THIS AS TestBase OF TestBase.PRG
	#ENDIF
	
	*  
	*  declare properties here that are used by one or
	*  more individual test methods of this class
	*
	*  for example, if you create an object to a custom
	*  THIS.Property in THIS.Setup(), estabish the property
	*  here, where it will be available (to IntelliSense)
	*  throughout:
	*
	ioObjectToBeTested = .NULL.
	icSetClassLib = SPACE(0)
	icSetProcLib = SPACE(0)
	icSetPath = SPACE(0)

	* the icTestPrefix property in the base FxuTestCase class defaults
	* to "TEST" (not case sensitive). There is a setting on the interface
	* tab of the options form (accessible via right-clicking on the
	* main FoxUnit form and choosing the options item) labeld as
	* "Load and run only tests with the specified icTestPrefix value in test classes"
	*
	* If this is checked, then only tests in any test class that start with the
	* prefix specified with the icTestPrefix property value will be loaded
	* into FoxUnit and run. You can override this prefix on a per-class basis.
	*
	* This makes it possible to create ancillary methods in your test classes
	* that can be shared amongst other test methods without being run as
	* tests themselves. Additionally, this means you can quickly and easily 
	* disable a test by modifying it and changing it's test prefix from
	* that specified by the icTestPrefix property
	
	* Additionally, you could set this in the INIT() method of your derived class
	* but make sure you dodefault() first. When the option to run only
	* tests with the icTestPrefix specified is checked in the options form,
	* the test classes are actually all instantiated individually to pull
	* the icTestPrefix value.

*!*		icTestPrefix = "<Your preferred prefix here>"
	
	********************************************************************
	FUNCTION Setup
	********************************************************************
	*
	*  put common setup code here -- this method is called
	*  whenever THIS.Run() (inherited method) to run each
	*  of the custom test methods you add, specific test
	*  methods that are not inherited from FoxUnit
	*
	*  do NOT call THIS.Assert..() methods here -- this is
	*  NOT a test method
	*
    *  for example, you can instantiate all the object(s)
    *  you will be testing by the custom test methods of 
    *  this class:
    this.icSetPath = SET("PATH")
	THIS.icSetProcLib = SET("PROCEDURE")
	
	SET PATH TO (This.icSetPath+";..;..\UTILITY")
	SET PROCEDURE TO dispatch.prg ADDITIVE

	PUBLIC oDispatchContext
	PUBLIC oDispatch
	oDispatch = CREATEOBJECT("dispatcher")
	oDispatchContext = oDispatch.oDispatchContext
	oDispatchContext.domain = "localhost"
	
    *-- instantiate the object here
    this.ioOBJECTTOBETESTED = NEWOBJECT("base","Controllers\base.prg")

	********************************************************************
	ENDFUNC
	********************************************************************
	
	********************************************************************
	FUNCTION TearDown
	********************************************************************
	*
	*  put common cleanup code here -- this method is called
	*  whenever THIS.Run() (inherited method) to run each
	*  of the custom test methods you add, specific test
	*  methods that are not inherited from FoxUnit
	*
	*  do NOT call THIS.Assert..() methods here -- this is
	*  NOT a test method
	*
    *  for example, you can release  all the object(s)
    *  you will be testing by the custom test methods of 
    *  this class:
    THIS.ioObjectToBeTested = .NULL.
	LOCAL lcSetProcLib
	lcSetProcLib = THIS.icSetProcLib
	SET PROCEDURE TO &lcSetProcLib
	SET PATH TO (this.icSetPATH) 
	CLOSE DATABASES
	RELEASE oDispatchController
	RELEASE oDispatch
	ENDFUNC
	********************************************************************
	
	FUNCTION TestInTestDirectory
	This.assertequals("TESTS\",RIGHT(CURDIR(),6),"Not running in tests directory")
	ENDFUNC
	
	FUNCTION TestObjectWasCreated
	THIS.AssertNotNullOrEmpty(THIS.ioObjectToBeTested)
	ENDFUNC

	*********************************************************************
	*
	* Make sure all stub function calls succeed
	*
	*********************************************************************
	FUNCTION TestFunctionStubs
	This.Asserttrue(this.ioOBJECTTOBETESTED.OpenTables(),"Open Tables method failed")
	This.Asserttrue(this.ioOBJECTTOBETESTED.AfterInit(),"AfterInit method failed")
	This.Asserttrue(this.ioOBJECTTOBETESTED.Index(),"Index method failed")
	ENDFUNC
	
	*********************************************************************
	*
	*  Make sure we get a 36 character guid
	*
	*********************************************************************
	FUNCTION TestNewGuid
	THIS.AssertEquals(36,LEN(THIS.ioObjectToBeTested.NewGuid()),"Invalid Guid")
	ENDFUNC

	*********************************************************************
	*
	* Make sure we get a valid session id and matching session record
	*
	*********************************************************************
	FUNCTION TestGetSession
	SET SAFETY ON
	
	This.Asserttrue(this.ioOBJECTTOBETESTED.GetSession(),"GetSession() method failed")
	This.assertnotnullorempty(this.ioOBJECTTOBETESTED.sid,"SID is empty or null")
	ENDFUNC

ENDDEFINE
