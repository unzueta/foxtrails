**********************************************************************
DEFINE CLASS TestDispatcher as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	*
	*  this LOCAL declaration enabled IntelliSense for
	*  the THIS object anywhere in this class
	*
	LOCAL THIS AS TestDispatcher OF TestDispatcher.PRG
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
	SET PATH TO (This.icSetPath+";..;..\utility")
	
	SET PROCEDURE TO dispatch.prg ADDITIVE
	this.ioOBJECTTOBETESTED = CREATEOBJECT("dispatcher")

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
	
	********************************************************************
	ENDFUNC
	********************************************************************	

	FUNCTION TestObjectWasCreated
	THIS.AssertNotNullOrEmpty(THIS.ioObjectToBeTested)
	ENDFUNC

	FUNCTION TestContextWasCreated
	THIS.AssertNotNullOrEmpty(THIS.ioObjectToBeTested.oDispatchContext)
	ENDFUNC

	FUNCTION TestDispatchRequest
	THIS.AssertTrue(("</html>" $ this.ioOBJECTTOBETESTED.DispatchRequest("http://localhost/Default.aspx","/Default.aspx")),"dispatcher.DispatchRequest() did not return a valid html document")
	ENDFUNC
	
	FUNCTION TestParseUrl
	LOCAL oDc
	*-- hack to call private parseurl method
	This.ioOBJECTTOBETESTED.DispatchRequest("http://domain/directory/asppage/controller/method/arg1/arg2?querystring","/directory/asppage")
	*-- verify that all components match the url above.
	oDC = this.ioOBJECTTOBETESTED.oDispatchContext
	THIS.AssertEquals("domain",oDC.domain,"Domain name is invalid")
	THIS.AssertEquals("http://domain/directory/asppage",oDC.baseUrl,"BaseUrl is invalid")
	THIS.AssertEquals("asppage",oDC.AspPage,"Asppage is invalid")
	THIS.AssertEquals("controller",oDC.controller,"Controller is invalid")
	THIS.AssertEquals("method",oDC.method,"Method name is invalid")
	THIS.AssertEquals(2,ALEN(oDC.arguments),"Incorrect number of arguments")
	THIS.AssertEquals("querystring",oDC.querystring,"Query string is invalid")
	oDC = null
	ENDFUNC
	
	FUNCTION TestDefaultControllerName
	LOCAL oDc
	*-- hack to call private parseurl method
	This.ioOBJECTTOBETESTED.DispatchRequest("http://localhost/directory/asppage","/directory/asppage")
	*-- verify that all components match the url above.
	oDC = this.ioOBJECTTOBETESTED.oDispatchContext
	THIS.AssertEquals("default",oDC.controller,"Controller name is invalid")
	oDC = null
	ENDFUNC

	FUNCTION TestDefaultMethodName
	LOCAL oDc
	*-- hack to call private parseurl method
	This.ioOBJECTTOBETESTED.DispatchRequest("http://localhost/directory/asppage/controller","/directory/asppage")
	*-- verify that all components match the url above.
	oDC = this.ioOBJECTTOBETESTED.oDispatchContext
	THIS.AssertEquals("index",oDC.method,"Method name is invalid")
	oDC = null
	ENDFUNC

	FUNCTION TestCreateInstance
	LOCAL oDc
	*-- hack to call private createinstance method
	This.ioOBJECTTOBETESTED.DispatchRequest("http://localhost/directory/asppage/controller/last","/directory/asppage")
	*-- verify that all components match the url above.
	oDC = this.ioOBJECTTOBETESTED.oDispatchContext
	THIS.Assertnotnull(oDC.lastinstance,"Create instance did not create the controller")
	oDC = null
	ENDFUNC
	
	FUNCTION TestProcessQuery
	LOCAL oDc
	*-- hack to call private createinstance method
	This.ioOBJECTTOBETESTED.DispatchRequest("http://localhost/directory/asppage/controller/last?arg1=1&_narg2=2","/directory/asppage")
	*-- verify that all components match the url above.
	oDC = this.ioOBJECTTOBETESTED.oDispatchContext
	THIS.Assertequals("1",oDC.lastinstance.arg1)
	This.assertequals(2,oDC.lastinstance.arg2)
	oDC = null
	ENDFUNC

	FUNCTION TestGetKey
		this.assertequals("_",this.ioOBJECTTOBETESTED.GetKey(""))
		this.assertequals("TEST",this.ioOBJECTTOBETESTED.GetKey("_CTEST"))
		this.assertequals("_",this.ioOBJECTTOBETESTED.GetKey("._"))
		this.assertequals("_TEST",this.ioOBJECTTOBETESTED.GetKey("._TEST"))
		FOR i = 1 TO LEN("~!@$%^*.")
			c = SUBSTR("~!@$%^*.",i,1)
			this.assertequals("_",this.ioOBJECTTOBETESTED.GetKey(c))
			this.assertequals("_TEST",this.ioOBJECTTOBETESTED.GetKey(c+"TEST"))
		NEXT
	ENDFUNC
	
	FUNCTION TestCoerceValue
		LOCAL ltNow
		ltNow = DATETIME()
		this.assertequals("VALUE",this.ioOBJECTTOBETESTED.CoerceValue("_C","VALUE"))
		this.assertequals(ltNow,this.ioOBJECTTOBETESTED.CoerceValue("_T",TRANSFORM(ltNow)))
		this.assertequals({},this.ioOBJECTTOBETESTED.CoerceValue("_D","  /  /  "))
		this.assertequals(.t.,this.ioOBJECTTOBETESTED.CoerceValue("_L","true"))
		this.assertequals(.t.,this.ioOBJECTTOBETESTED.CoerceValue("_L","1"))
		this.assertequals(.t.,this.ioOBJECTTOBETESTED.CoerceValue("_L","-1"))
		this.assertequals(.t.,this.ioOBJECTTOBETESTED.CoerceValue("_L","Y"))
		this.assertequals(500,this.ioOBJECTTOBETESTED.CoerceValue("_N","500.00"))
		this.assertequals("VALUE",this.ioOBJECTTOBETESTED.CoerceValue("TEST","VALUE"))
	ENDFUNC	
	FUNCTION TestHasErrors
		LOCAL oDC
		oDC = this.ioOBJECTTOBETESTED.oDispatchContext
		this.assertfalse(oDC.hasErrors(),oDC.errors[1])
	ENDFUNC
	
ENDDEFINE
