dispatch = NEWOBJECT("dispatcher","dispatch.prg")
IF TYPE("pcUrl") <> "U"
	WITH dispatch.oDispatchContext
		.request = pcDC.request
		.session = pcDC.session
		.response = pcDC.response
		.server = pcDC.server
	ENDWITH
	SET STEP ON
	RETURN dispatch.dispatchrequest(pcUrl,pcFilePath)
ENDIF

DEFINE CLASS Dispatcher AS Session OLEPUBLIC
	
	oDispatchContext = ""
	autocompile = .f.
	lredirect = .f.
	lUseCache = .f.
	
	PROCEDURE Init()
	
		LOCAL lcHome, lcPath
		
		*-- set the initial environment
		SET EXCLUSIVE OFF
		SET TALK OFF
		SET DELETED ON
		SET REPROCESS TO -1
		SET MULTILOCKS ON
		
		IF Application.Startmode = 3 OR Application.StartMode = 5
		   lcHome = ADDBS(JUSTPATH(Application.ServerName))
		ELSE
		   lcHome = SYS(5) + ADDBS(CURDIR())
		ENDIF
		CD "&lcHome"
		lcPath = SET("PATH")
		IF ! "Utility" $ lcPath
			SET PATH TO ("Utility;"+lcPath)
		ENDIF
		This.oDispatchContext = NEWOBJECT("DispatchContext")
		
	ENDPROC
	
	PROCEDURE DispatchRequest( lcUrl As String, lcFilePath )
		LOCAL arg, lcArgList
		PRIVATE oDispatchContext, oDispatch
		oDispatchContext = this.oDispatchContext
		oDispatch = this
		
		This.ParseUrl(lcUrl,lcFilePath)
		This.CreateInstance()
		oDispatchContext.Instance.GetSession()
		oDispatchContext.Instance.OpenTables()
		This.ProcessQueryString()
		WITH This.oDispatchContext
			.Result = .instance.AfterInit()
			IF !This.lRedirect AND LEN(.method) > 0
				IF !isnull(.arguments[1])
					lcArgList = "("
					FOR EACH arg IN .arguments
						IF TYPE("arg") = "L"
						   LOOP
						ENDIF
						arg = urldecode(arg)
						IF LEN(lcArgList )>1
							lcArgList = lcArgList + ","
						ENDIF
						lcArgList = lcArgList + '"'+arg+'"'
					ENDFOR
					lcArgList = lcArgList + ")"
				ELSE
					lcArgList = "()"
				ENDIF
				.Result = EVALUATE(".instance." + .method + lcArgList)
			ENDIF
			IF !This.lRedirect
				IF FILE("Views/"+.Controller+"/"+.RenderAction+".vml")
					.renderedView = RenderVml("Views/"+.Controller+"/"+.RenderAction+".vml",.Instance,this.lUseCache)
					This.oDispatchContext.html = .renderedView
				ENDIF
				IF FILE("Layouts/"+.RenderLayout+".vml")
					.renderedLayout = RenderVml("Layouts/"+.RenderLayout+".vml",.Instance,this.lUseCache)
					This.oDispatchContext.html = .renderedLayout
				ENDIF
			ENDIF
			*-- release our instance so we can compile fxp's on the fly.
			.Instance = null
			CLEAR CLASS (.Controller)
            CLEAR PROGRAM (.Controller)
            CLEAR RESOURCES
            CLOSE DATABASES
		ENDWITH
		RETURN This.oDispatchContext.html
	ENDPROC
	
	HIDDEN PROCEDURE ParseUrl(lcUrl,lcFilePath)
		LOCAL lnPos

		WITH this.oDispatchContext
			.url = lcUrl
			if "?" $ .url
				IF ISNULL(.request)
					.queryString = SUBSTR(.url, AT("?",.url)+1)
				ENDIF
				.url = LEFT(.url, AT("?",.url)-1)
			endif
			IF "//" $ .url
				.domain = SUBSTR(.url,AT("//",.url)+2)
				.domain = LEFT(.domain,AT("/",.domain)-1)
			ENDIF
			lnPos = AT(JUSTFNAME(LOWER(lcFilePath)),LOWER(.url))
			.BaseUrl = LEFT(.url,AT(lcFilePath,.url)-1)+lcFilePath
			* get asp page
			IF lnPos > 0
				.ASPPage = SUBSTR(.Url,lnPos)
				lnPos = AT("/",.ASPPage)
			ENDIF
			* get controller
			IF lnPos > 0
				.controller = SUBSTR(.ASPPage,lnPos+1)
				.ASPPage= LEFT(.ASPPage,lnPos-1)
				lnPos = AT("/",.controller)
			ENDIF
			IF LEN(.controller) = 0
				.controller = "default"
			ENDIF
			
			* get method
			IF lnPos > 0
				.method = SUBSTR(.controller,lnPos+1)
				.controller = LEFT(.controller,lnPos-1)
				lnPos = AT("/",.method)
			ELSE
				.method = "index"
			ENDIF
			
			* parameters
			IF lnPos > 0
				ALINES(.arguments,SUBSTR(.method,lnPos+1),4,"/")
				.method = LEFT(.method,lnPos-1)
			ELSE
				.arguments[1] = null
			ENDIF

			.RenderLayout = .Controller
			.RenderAction = .Method		

		ENDWITH
	ENDPROC
	
	HIDDEN PROCEDURE CreateInstance()
		WITH this.oDispatchContext
			IF this.autocompile
	            *% RSJ - Try compiling controller PRG if newer than FXP
	            lnFiles=ADIR(laController,FULLPATH("Controllers\"+.controller+".*"))
	            ltPrgTime = DATETIME()
	            ltFxpTime = ltPrgTime
	            llFxpExists = .F.
	            FOR lnI = 1 TO lnFiles
	                        DO CASE
	                        CASE ".PRG" $ UPPER(laController[lnI,1])
	                                    ltPrgTime = CTOT(DTOC(laController[lnI,3])+" "+laController[lnI,4])
	                        CASE ".FXP" $ UPPER(laController[lnI,1])
	                                    llFxpExists = .T.
	                                    ltFxpTime = CTOT(DTOC(laController[lnI,3])+" "+laController[lnI,4])                                              
	                        ENDCASE
	            NEXT lnI
	            IF (ltPrgTime > ltFxpTime) OR NOT llFxpExists
	                        TRY
	                                    COMPILE (FULLPATH("Controllers\"+.controller+".prg"))
	                        CATCH
	                                    STRTOFILE("Error: "+MESSAGE(),"compile_error.txt")
	                        ENDTRY
	            ENDIF
			ENDIF
			.instance = NEWOBJECT(.controller,FULLPATH("Controllers\"+.controller+".prg"))
		ENDWITH
	ENDPROC

	PROCEDURE ProcessQueryString()
		LPARAMETERS pcKey
		LOCAL lcExact, lcKey, lcValue
		LOCAL ARRAY laVars[1], laPair[2]
		lcExact = SET("Exact")
		SET EXACT OFF
		IF PCOUNT() = 0
		 pcKey = ""
		ELSE
		 pcKey = LOWER(pckey)
		ENDIF
		WITH This.oDispatchContext
			IF ISNULL(.Request)
				IF !EMPTY(.queryString)
					laVars[1] = .queryString
					ALINES(laVars,.queryString,0,"&")
					FOR EACH lcPair IN laVars
						ALINES(laPair,lcPair,1,"=")
						IF laPair[1] = pcKey
							lcKey = this.getKey(laPair[1])
							IF ALEN(laPair) = 2
								lcValue = urldecode(laPair[2])
							ELSE
								lcValue = ""
							ENDIF
							.Instance.AddProperty(lcKey,this.CoerceValue(laPair[1],lcValue))
						ENDIF
					ENDFOR
				ENDIF
				RETURN
			ENDIF
			IF LEN(pcKey) > 0
				lcValue = this.CoerceValue(pcKey,.Session.Value(pcKey))
				IF !ISNULL(lcValue)
					.Instance.AddProperty(this.getKey(pcKey),lcValue)
				ENDIF
			ENDIF
			FOR EACH lcKey  IN .Request.QueryString
				IF LOWER(lcKey) = pcKey
					.Instance.AddProperty(this.getKey(lcKey),this.CoerceValue(lcKey,.Request.QueryString(lcKey).Item()))
				ENDIF
			ENDFOR
			FOR EACH lcKey  IN .Request.Form
				IF LOWER(lcKey) = pcKey
					.Instance.AddProperty(this.getKey(lcKey),this.CoerceValue(lcKey,.Request.Form(lcKey).Item()))
				ENDIF
			ENDFOR
		ENDWITH
	ENDPROC

	PROCEDURE getKey()
		LPARAMETERS lcKey
		DO CASE
		CASE LEN(lcKey)=0
			lcKey = "_"
		CASE LEFT(lcKey,1) = "_"
			lcKey = SUBSTR(lcKey,3)
		CASE LEFT(lcKey,2) = "._"
			IF LEN(lcKey) = 2
				lcKey = "_"
			ELSE
				lcKey = "_"+SUBSTR(lcKey,3)
			ENDIF
		CASE LEFT(lcKey,1) $ "~!@$%^*."
			IF LEN(lcKey) = 1
				lcKey = "_"
			ELSE
				lcKey = "_" + this.GetKey(SUBSTR(lcKey,2))
			ENDIF
		ENDCASE
		RETURN lcKey
	ENDPROC
	
	PROCEDURE CoerceValue()
		LPARAMETERS lcKey,lcValue
		LOCAL lcType,lcField,lcValue
		IF LEFT(lcKey,1) = "_"
			lcType = UPPER(SUBSTR(lcKey,2,1))
		ELSE
			lcType = "C"
		ENDIF
		DO CASE
		CASE lcType = "T"
			lcValue = CTOT(lcValue)
		CASE lcType = "D"
			lcValue = CTOD(lcValue)
		CASE lcType = "L"
			lcValue = INLIST(UPPER(lcValue),"Y","T",".T.","1","-1","TRUE")
		CASE lcType $ "NYI"
			lcValue = VAL(lcValue)
		OTHERWISE
			lcValue = TRIM(lcValue)
		ENDCASE
		RETURN lcValue
	ENDPROC

	PROCEDURE Error
		LPARAMETERS nError, cMethod, nLine
		LOCAL lcError
		lcError = ""
		TEXT TO lcError TEXTMERGE NOSHOW PRETEXT 3
			<<MESSAGE()>> (Error <<nError>> at line <<nLine>>)<br />
			<<PROGRAM(PROGRAM(-1)-1)>>
		ENDTEXT	
		This.AddError(lcError)
		RETURN
	ENDPROC
	
	PROCEDURE AddError( ErrMsg )
		LOCAL numErrors
		IF ISNULL(This.oDispatchContext.Errors[1])
			numErrors = 1
		ELSe
			numErrors = ALEN( This.oDispatchContext.Errors ) + 1
		ENDIF
		DIMENSION this.oDispatchContext.errors[ numErrors ]
		this.oDispatchContext.errors[ numErrors ] = ErrMsg
		STRTOFILE(ErrMsg+CHR(10),"foxtrails.err",1)
	ENDPROC		
	PROCEDURE DebugRequest( lcUrl As String, lcFilePath )
		LOCAL loFox, lcReturn
		lcReturn = ""
		loFox = GETOBJECT(,"visualfoxpro.application.9")
		loFox.SetVar("pcUrl",@lcUrl)
		loFox.SetVar("pcFilePath",@lcFilePath)
		loFox.SetVar("pcDC",this.oDispatchContext)
		lcReturn = loFox.eval("dispatch()")
		RELEASE loFox
		RETURN lcReturn
	ENDPROC
ENDDEFINE

DEFINE CLASS DispatchContext As Relation
	URL = ""
	BaseUrl = ""
	ASPPage = ""
	Controller = ""
	Method = ""
	RenderLayout = ""
	renderedLayout = ""
	renderAction = ""
	renderedView = ""
	Html = ""
	domain = ""
	queryString = ""

	Result = null	
	Instance = null
	MTS = null
	Request = null
	Response = null
	Session = null
	Server = null
	
	DIMENSION arguments[1]
	DIMENSION errors[1]
	
	PROCEDURE Init
		This.ResetContext()
		TRY
			this.mts = CREATEOBJECT("MTxAS.AppServer.1")
			IF !ISNULL(this.mts) 
				this.request = this.mts.getObjectContext().Item("Request")
				this.response = this.mts.getObjectContext().Item("Response")
				this.session = this.mts.getObjectContext().Item("Session")
				this.server = this.mts.getObjectContext().Item("Server")
			ENDIF			
		CATCH TO loException
		ENDTRY
	ENDPROC

	PROCEDURE ResetContext
		This.URL = ""
		This.BaseUrl = ""
		This.ASPPage = ""
		This.Controller = ""
		This.Method = ""
		This.RenderLayout = ""
		This.renderedLayout = ""
		This.renderAction = ""
		This.renderedView = ""
		This.Html = ""

		This.Result = null	
		This.Instance = null
		This.MTS = null
		This.Request = null
		This.Response = null
		This.Session = null
		This.Server = null
		
		DIMENSION arguments[1]
		DIMENSION errors[1]
		This.arguments[1] = null
		this.errors[1] = null
		
	ENDPROC	
	PROCEDURE hasErrors()
		RETURN ! ISNULL(this.errors[1])
	ENDPROC
	PROCEDURE setMimeType()
		LPARAMETERS lcMimeType
		IF !ISNULL(This.Response)
			This.Response.ContentType = lcMimeType
		ENDIF
	ENDPROC
ENDDEFINE