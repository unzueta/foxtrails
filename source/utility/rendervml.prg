PARAMETERS lcVml, loController, llCache
LOCAL lcScript,lcController, llCompile
LOCAL lcFxp, lcMask, lcPrg
PRIVATE pcHtml
pcHtml = ""
IF ISNULL(loController)
	lcController = "controller"
ELSE
	lcController = loController.Class
ENDIF

llCompile = .f.
IF llCache
  *-- determine if we need to recompile the cached vml template
  lcFxp =  FULLPATH(STRTRAN(UPPER(lcVml),".VML",".FXP"))
  lcMask = FULLPATH(STRTRAN(UPPER(lcVml),".VML",".*"))
  lcPrg =  FULLPATH(STRTRAN(UPPER(lcVml),".VML",".PRG"))
  *% RSJ - Try compiling controller PRG if newer than FXP
  lnFiles=ADIR(laFiles,lcMask)
  ltPrgTime = DATETIME()
  ltFxpTime = ltPrgTime
  llFxpExists = .F.
  FOR lnI = 1 TO lnFiles
    DO CASE
    CASE ".VML" $ UPPER(laFiles[lnI,1])
       ltPrgTime = CTOT(DTOC(laFiles[lnI,3])+" "+laFiles[lnI,4])
    CASE ".FXP" $ UPPER(laFiles[lnI,1])
       llFxpExists = .T.
       ltFxpTime = CTOT(DTOC(laFiles[lnI,3])+" "+laFiles[lnI,4])
    ENDCASE
  NEXT lnI
  IF (ltPrgTime > ltFxpTime) OR NOT llFxpExists
    llCompile = .T.
  ENDIF
ENDIF
IF llCompile OR !llCache
  *-- read vml file
  lcScript = FILETOSTR(lcVml)

  pcHtml = ""
  *-- prepend our parameters
  lcScript = "PARAMETERS "+lcController+CHR(13)+;
	     "TEXT TO pcHtml NOSHOW TEXTMERGE"+ CHR(13)+;
	     lcScript

  *-- convert Foxpro commands <% ... %> into vfp code blocks
  lcScript = STRTRAN(lcScript ,"%>",CHR(13)+;
             "TEXT TO pcHtml NOSHOW TEXTMERGE ADDITIVE"+CHR(13))
  lcScript = STRTRAN(lcScript ,"<%",CHR(13)+"ENDTEXT"+CHR(13))

  *-- add closing endtext statement
  lcScript = lcScript + CHR(13) + ;
		     "ENDTEXT"+ CHR(13)
ENDIF
IF llCache
  IF llCompile
	  TRY
	    STRTOFILE(lcScript,lcPrg)
	    COMPILE (FULLPATH(lcPrg))
	  CATCH
	    STRTOFILE("Error: "+MESSAGE(),"compile_error.txt")
	  ENDTRY
  ENDIF
  DO (lcPrg) WITH loController
ELSE
  EXECSCRIPT(lcScript,loController )
ENDIF
RETURN pcHtml
