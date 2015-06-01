* defines an input field based upon the fields name and type
PARAMETERS lcFieldName
LOCAL lcAlias, lcField, lcHtml
DO CASE
CASE "." $ lcFieldName
	lcAlias = ALIAS()
	lcField = JUSTEXT(lcFieldName)
CASE "->" $ lcFieldName
	lcAlias = JUSTSTEM(STRTRAN(lcFieldName,"->","."))
	lcField = JUSTEXT(STRTRAN(lcFieldName,"->","."))
OTHERWISE
	lcAlias = ALIAS()
	lcField = lcFieldName
ENDCASE
lcValue = EVALUATE(lcFieldName)
IF ISNULL(lcValue)
	lcValue = ""
ENDIF
lcType = UPPER(TYPE(lcFieldName))
DO CASE
CASE lcType = "L"
	lcHtml = lcField+": " +IIF(lcValue,'true','false')
CASE lcType = "N"
    lcHtml = lcField+": " +TRANSFORM(lcValue) 
OTHERWISE
	lcValue = STRTRAN(ETRIM(TRANSFORM(lcValue)),"'","\'")
	lcHtml = lcField+": '" + lcValue + "'"
ENDCASE
RETURN lcHtml
