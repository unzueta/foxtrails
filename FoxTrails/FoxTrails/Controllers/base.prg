DEFINE CLASS base AS custom
	sid = ""
	
	PROCEDURE Init
	ENDPROC

	PROCEDURE opentables
	ENDPROC
	
	PROCEDURE AfterInit
	ENDPROC
	
	PROCEDURE index
	ENDPROC

	PROCEDURE newGuid
	  LOCAL oGUID, cGUID
	  oGUID = CreateObject("scriptlet.typelib")
	  cGUID = Strextract(oGUID.GUID, "{", "}" )
	  oGUID = null
	  RELEASE oGUID
	  RETURN cGUID
	ENDPROC
	
	PROCEDURE getSession
		LOCAL tnow,texpire,lcSelect
		*-- retrieve our session id from the request
		TRY
			oDispatch.ProcessQueryString("sid")
			IF ISNULL(this.sid)
				This.sid = ""
			ENDIF
		CATCH
			This.sid = ""
		ENDTRY
		IF "" = this.sid
		  this.sid = this.newGuid()
		  IF !ISNULL(oDispatchContext.Session)
			  oDispatchContext.Session.Value("sid") = this.sid
		  ENDIF
		ENDIF
	ENDPROC
	
	PROCEDURE Destroy
		CLEAR PROGRAM base.prg
	ENDPROC
ENDDEFINE
