DEFINE CLASS car AS base OF Controllers\base.prg
	
	PROCEDURE init
		USE db\cars SHARED
	ENDPROC

	PROCEDURE year
		SELECT distinct year ;
		from cars INTO CURSOR years ;
		ORDER BY year DESC
		oDispatchContext.RenderLayout = ""
		oDispatchContext.setMimeType("text/xml")
	ENDPROC

	PROCEDURE make
		LPARAMETERS lcyear
		LOCAL lnYear
		lnYear = VAL(lcYear)
		
		SELECT distinct make ;
		from cars INTO CURSOR makes ;
		where year = lnyear ;
		ORDER BY make
		oDispatchContext.RenderLayout = ""
		oDispatchContext.setMimeType("text/xml")
	ENDPROC

	PROCEDURE model
		LPARAMETERS lcyear, lcmake
		LOCAL lnYear
		lnYear = VAL(lcYear)

		SELECT distinct model ;
		from cars INTO CURSOR models ;
		where year = lnyear and make = lcmake ;
		ORDER BY model
		oDispatchContext.RenderLayout = ""
		oDispatchContext.setMimeType("text/xml")
	ENDPROC

ENDDEFINE
