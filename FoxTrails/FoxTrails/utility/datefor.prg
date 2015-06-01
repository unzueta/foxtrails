* defines an input field based upon the fields name and type
PARAMETERS lcFieldName,lcLabel
LOCAL lcAlias, lcField, lcInput, lcHtml
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
*-- create the text field
lcHtml = '<tr><th>'+lcLabel+'</th>' + ;
         '<td><span id="'+lcField+'_s"><input name="_'+lcType+lcField+'" id="'+lcField+'" value="'+ETRIM(TRANSFORM(lcValue))+'" size="11" maxlength="10" class="caldate" />'
lcHtml = lcHtml + '<button id="'+lcField+'btn" type="button" class="calbtn">...</button></span>'+CHR(13)

lcHtml = lcHtml + '<script type="text/javascript">'+CHR(13)
lcHtml = lcHtml + 'Event.observe(window,"load",function() {'+CHR(13)
lcHtml = lcHtml + '  Calendar.setup({'+CHR(13)
lcHtml = lcHtml + '     dateField: "'+lcField+'",'+CHR(13)
lcHtml = lcHtml + '     triggerElement: "'+lcField+'btn",'+CHR(13)
lcHtml = lcHtml + '	 dateFormat: "%m/%d/%Y"'+CHR(13)
lcHtml = lcHtml + '  });'+CHR(13)
lcHtml = lcHtml + '  $("'+lcField+'").onblur = formatDate.bind($("'+lcField+'"),"mm/dd/yyyy");'+CHR(13)
lcHtml = lcHtml + '  $("'+lcField+'").onblur();'+CHR(13)
lcHtml = lcHtml + '});'+CHR(13)
lcHtml = lcHtml + '</script>'+CHR(13)
lcHtml = lcHtml + '</td></tr>'

RETURN lcHtml
