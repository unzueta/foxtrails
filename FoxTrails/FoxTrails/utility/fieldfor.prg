* defines an input field based upon the fields name and type
PARAMETERS lcFieldName, lcLabel
LOCAL lcAlias, lcField, lcInput, lcRow
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
IF PCOUNT() = 1
	lcLabel = PROPER(lcField)
ENDIF
lcValue = EVALUATE(lcFieldName)
IF ISNULL(lcValue)
	lcValue = ""
ENDIF
lcType = UPPER(TYPE(lcFieldName))
DO CASE
CASE !EMPTY(lcAlias) AND UPPER(lcField) == UPPER(FIELD(1,lcAlias)) AND oDispatchContext.Method = "edit"
	lcRow = '<tr><th>'+lcLabel+'</th>' + ;
	        '<td>'+TRANSFORM(lcValue)+'<input type="hidden" name="_'+lcType+lcField+'" id="'+lcField+'" value="'+TRANSFORM(lcValue)+'"/></td></tr>'
CASE lcType = "D"
	lcRow = datefor(lcFieldName, lcLabel)
CASE lcType = "T"
    lcRow = datefor(lcFieldName, lcLabel)
    lcRow = STRTRAN(lcRow,[size="11" maxlength="10"],[size="15" maxlength="15" ])
CASE lcType = "M"
    lcSize = TRANSFORM(LEN(&lcFieldName))
	lcRow = '<tr><th>'+lcLabel+'</th>' + ;
	        '<td><textarea name="_'+lcType+lcField+'" id="'+lcField+'" columns="'+TRANSFORM(SET("Memowidth"))+'" Rows="5"/>'+lcValue+'</textarea></td></tr>'
CASE lcType = "L"
	lcRow = '<tr><td>&nbsp;</td>' + ;
	        '<td><input name="_'+lcType+lcField+'" id="'+lcField+'" type="checkbox" value="1" '+IIF(EVALUATE(lcFieldName),'checked="checked"','')+'/> '+lcLabel+'</td></tr>'
CASE lcType = "N"
	lcRow = '<tr><th>'+lcLabel+'</th>' + ;
	        '<td><input name="_'+lcType+lcField+'" id="'+lcField+'" type="text" value="'+TRANSFORM(lcValue)+'"/></td></tr>'
OTHERWISE
    lcSize = TRANSFORM(LEN(lcValue)+1)
    lcMax = TRANSFORM(LEN(lcValue))
    IF lcSize = "0"
		lcRow = '<tr><th>'+lcLabel+'</th>' + ;
		        '<td><input name="_'+lcType+lcField+'" id="'+lcField+'" type="text" value="'+lcValue+'"/></td></tr>'
	ELSE
		lcRow = '<tr><th>'+lcLabel+'</th>' + ;
	        '<td><input name="_'+lcType+lcField+'" id="'+lcField+'" type="text" maxlength="'+ lcMax + ;
	        '" size="'+lcSize+'" value="'+TRIM(lcValue)+'"/></td></tr>'
	ENDIF
ENDCASE
RETURN lcRow