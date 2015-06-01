* returns the root url for the site (url not including default.aspx) 
LOCAL lcPath
lcPath = justpath(oDispatchContext.BaseUrl)
IF "/" = lcPath
  lcPath = ""
ENDIF
RETURN lcPath