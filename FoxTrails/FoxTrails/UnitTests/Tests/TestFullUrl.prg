**********************************************************************
DEFINE CLASS TestFullUrl as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	*
	*  this LOCAL declaration enabled IntelliSense for
	*  the THIS object anywhere in this class
	*
	LOCAL THIS AS TestFullUrl OF TestFullUrl.PRG
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

	PUBLIC oDispatchContext
	PUBLIC oDispatch
	oDispatch = CREATEOBJECT("dispatcher")
	oDispatchContext = oDispatch.oDispatchContext
	oDispatchContext.BaseUrl = "http://test.com/default.aspx"
	oDispatchContext.domain = "test.com"
	oDispatchContext.instance = CREATEOBJECT("Empty")
	ADDPROPERTY(odispatchContext.instance,"usessl",.f.)
	
    *-- instantiate the object here

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

	FUNCTION TestNormalUrl
		THIS.AssertEquals("http://test.com/default.aspx/default",fullurl("/default"))
	ENDFUNC

	FUNCTION TestSecureUrl
		THIS.AssertEquals("https://test.com/default.aspx/default",fullurl("/default",.t.))
	ENDFUNC

	FUNCTION TestDevelopmentUrl
		*-- force any url without a period in the domain name to non-ssl
		oDispatchContext.BaseUrl = "http://devurl/default.aspx"
		oDispatchContext.domain = "devurl"
		THIS.AssertEquals("http://devurl/default.aspx/default",fullurl("/default",.t.))
	ENDFUNC
ENDDEFINE
**********************************************************************
