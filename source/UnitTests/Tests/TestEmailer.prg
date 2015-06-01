**********************************************************************
DEFINE CLASS TestEmailer as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	*
	*  this LOCAL declaration enabled IntelliSense for
	*  the THIS object anywhere in this class
	*
	LOCAL THIS AS TestEmailer OF TestEmailer.PRG
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
	icSetProcLib = SPACE(0)
	icSetPath = SPACE(0)
*!*		icTestPrefix = "<Your preferred prefix here>"
	
	********************************************************************
	FUNCTION Setup
    this.icSetPath = SET("PATH")
	SET PATH TO (This.icSetPath+";..;..\utility")
    THIS.ioObjectToBeTested = NEWOBJECT("emailer","emailer.prg")
	ENDFUNC
	********************************************************************
	
	********************************************************************
	FUNCTION TearDown
    THIS.ioObjectToBeTested = .NULL.
	SET PATH TO (this.icSetPATH) 
	CLOSE DATABASES   
	ENDFUNC
	********************************************************************	

	*********************************************************************
	FUNCTION TestCreation
	THIS.Assertnotnullorempty(this.IOOBJECTTOBETESTED,"Emailer Instance not created")
	ENDFUNC

	FUNCTION TestSimpleEmail
		*-- This test requires a valid smtp server and may fail
		*-- if the smtp server is misconfigured. Technically
		*-- a dependancy like that invalidates the test, since
		*-- a failure does not necessarily mean the object being
		*-- tested has a bug. Modify as needed and uncomment
*!*			this.IOOBJECTTOBETESTED.from="me@mydomain.com"
*!*			this.IOOBJECTTOBETESTED.to="me@mydomain.com"
*!*			this.IOOBJECTTOBETESTED.subject="Emailer Unit Test"
*!*			this.IOOBJECTTOBETESTED.textBody="This is a unit test of the emailer utility"
*!*			this.IOOBJECTTOBETESTED.smtpServer = "localhost"
*!*			this.IOOBJECTTOBETESTED.smtpUser = "somebody"
*!*			this.IOOBJECTTOBETESTED.smtpPass = "somepass"
*!*			This.asserttrue(this.IOOBJECTTOBETESTED.sendEmail(),this.IOOBJECTTOBETESTED.errorMessage)
	ENDFUNC
**********************************************************************
ENDDEFINE
**********************************************************************
