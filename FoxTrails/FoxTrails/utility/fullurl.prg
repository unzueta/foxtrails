* Creates a fully qualified url from the oDispatchContext and the desired controller/method/parms
* Usage:
* <<FullUrl("/customer/list")>>
PARAMETERS newControllerPath, llUseSSL
LOCAL lcUrl
IF PCOUNT() = 1 AND "https:" = LOWER(LEFT(oDispatchContext.BaseUrl,6))
  llUseSSL = .t.
ENDIF
IF LEFT(newControllerPath,1) <> "/"
	newControllerPath = "/" + newControllerPath
ENDIF
lcUrl = oDispatchContext.BaseUrl+newControllerPath
IF "localhost" $ lcUrl OR (NOT "." $ oDispatchContext.domain)
    llUseSSL = .f.
ENDIF
IF llUseSSL
	lcUrl = STRTRAN(lcUrl,"http:","https:")
ELSE
	lcUrl = STRTRAN(lcUrl,"https:","http:")
ENDIF
RETURN lcUrl
