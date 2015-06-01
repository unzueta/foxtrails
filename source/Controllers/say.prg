DEFINE CLASS say AS base OF Controllers\base.prg
	greeting = ""
	now = {}
	PROCEDURE hello
		LPARAMETERS lcUser
		IF PCOUNT() = 0
			lcUser = "World"
		ENDIF
		this.now = DATETIME()
		this.greeting = "Hello " + lcUser
	ENDPROC

ENDDEFINE
