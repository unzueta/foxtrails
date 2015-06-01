**********************************************************************
DEFINE CLASS TestFieldFor as FxuTestCase OF FxuTestCase.prg
**********************************************************************
	#IF .f.
	*
	*  this LOCAL declaration enabled IntelliSense for
	*  the THIS object anywhere in this class
	*
	LOCAL THIS AS TestFieldFor OF TestFieldFor.PRG
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
	dVal = DATE()
	tVal = DATETIME()
	mVal = ""
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
	oDispatchContext.domain = "localhost"
	
	TEXT TO mVal NOSHOW PRETEXT 3
		Test
		Memo
		Field
	ENDTEXT
	CREATE CURSOR crsfieldfor ( cf c(5), nf n(6,2), lf l, df d, tf t, mf m)
	INSERT INTO crsfieldfor VALUES ("char",123.45, .t., this.dVal, this.tVal, this.mVal)
	
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

	*
	*  test methods can use any method name not already used by
	*  the parent FXUTestCase class
	*    MODIFY COMMAND FXUTestCase
	*  DO NOT override any test methods except for the abstract 
	*  test methods Setup() and TearDown(), as described above
	*
	*  the three important inherited methods that you call
	*  from your test methods are:
	*    THIS.AssertTrue("Failure message",<Expression>)
	*    THIS.AssertEquals("Failure message",<ExpectedValue>,<Expression>)
	*    THIS.AssertNotNull("Failure message",<Expression>)
	*  all test methods either pass or fail -- the assertions
	*  either succeed or fail
    
	*
	*  here's a simple AssertNotNull example test method
	*

	*********************************************************************
	FUNCTION TestObjectProperty
	SCATTER FIELDS cf NAME obj
	obj.cf = "Prop "
	THIS.AssertTrue("Prop" $ fieldfor("obj.cf"),"Using an object property failed")
	ENDFUNC

	*********************************************************************
	FUNCTION TestAliasedField
	SELECT 0
	THIS.AssertEquals([<tr><th>Cf</th><td><input name="_Ccf" id="cf" type="text" maxlength="5" size="6" value="char"/></td></tr>],fieldfor("crsfieldfor->cf"),"Creation of character field did not return expected results")
	ENDFUNC
	*********************************************************************

	*********************************************************************
	FUNCTION TestCustomLabel
	THIS.AssertTrue([<th>Custom</th>] $ fieldfor("cf","Custom"),"A custom label was not applied to the field")
	ENDFUNC
	*********************************************************************

	*********************************************************************
	FUNCTION TestEditMode
	oDispatchContext.method="edit"
	THIS.AssertEquals([<tr><th>Cf</th><td>char <input type="hidden" name="_Ccf" id="cf" value="char "/></td></tr>],fieldfor("cf"),"Creation of hidden field for edit mode failed")
	ENDFUNC
	*********************************************************************

	*********************************************************************
	FUNCTION TestDateField
	THIS.AssertEquals([<tr><th>Df</th><td><input name="_Ddf" id="df" type="text" value="]+TRANSFORM(this.dVal)+["/></td></tr>],fieldfor("df"),"Creation of date field did not return expected results")
	ENDFUNC
	*********************************************************************

	*********************************************************************
	FUNCTION TestTimeField
	THIS.AssertEquals([<tr><th>Tf</th><td><input name="_Ttf" id="tf" type="text" value="]+TRANSFORM(this.tVal)+["/></td></tr>],fieldfor("tf"),"Creation of time field did not return expected results")
	ENDFUNC
	*********************************************************************

	*********************************************************************
	FUNCTION TestMemoField
	THIS.AssertEquals([<tr><th>Mf</th><td><textarea name="_Mmf" id="mf" columns="]+TRANSFORM(SET("Memowidth"))+[" Rows="5"/>]+this.mVal+[</textarea></td></tr>],fieldfor("mf"),"Creation of memo field did not return expected results")
	ENDFUNC
	*********************************************************************

	*********************************************************************
	FUNCTION TestLogicalField
	THIS.AssertEquals([<tr><td>&nbsp;</td><td><input name="_Llf" id="lf" type="checkbox" value="1" checked="checked"/> Lf</td></tr>],fieldfor("lf"),"Creation of logical field did not return expected results")
	REPLACE lf WITH .f.
	THIS.AssertEquals([<tr><td>&nbsp;</td><td><input name="_Llf" id="lf" type="checkbox" value="1" /> Lf</td></tr>],fieldfor("lf"),"Creation of logical field did not return expected results")
	ENDFUNC
	*********************************************************************

	*********************************************************************
	FUNCTION TestNumericField
	THIS.AssertEquals([<tr><th>Nf</th><td><input name="_Nnf" id="nf" type="text" value="123.45"/></td></tr>],fieldfor("nf"),"Creation of numeric field did not return expected results")
	ENDFUNC
	*********************************************************************

	*********************************************************************
	FUNCTION TestCharacterField
	THIS.AssertEquals([<tr><th>Cf</th><td><input name="_Ccf" id="cf" type="text" maxlength="5" size="6" value="char"/></td></tr>],fieldfor("cf"),"Creation of character field did not return expected results")
	ENDFUNC
	*********************************************************************
	

**********************************************************************
ENDDEFINE
**********************************************************************
