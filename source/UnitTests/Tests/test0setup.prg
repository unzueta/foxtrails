**********************************************************************
DEFINE CLASS TEST0SETUP as FxuTestCase OF FxuTestCase.prg
**********************************************************************

	icTestPrefix = "Create"
	#IF .f.
	LOCAL THIS AS TEST0SETUP OF TEST0SETUP.PRG
	#ENDIF
	
	********************************************************************
	FUNCTION Setup
	********************************************************************
	********************************************************************
	ENDFUNC
	********************************************************************
	
	********************************************************************
	FUNCTION TearDown
	********************************************************************
	********************************************************************
	ENDFUNC
	********************************************************************	
	FUNCTION CreateTestData
		DO ..\Utility\Migrate WITH .t.
	ENDFUNC
	

**********************************************************************
ENDDEFINE
**********************************************************************
