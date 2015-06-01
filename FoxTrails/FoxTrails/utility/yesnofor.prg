* defines an input field based upon the fields name and type
PARAMETERS lcFieldName, lcLabel, llNoRow, lnTabIndex, llInvert
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
IF EMPTY(lnTabIndex)
  lcTabIndex = "1"
ELSE
  lcTabIndex = TRANSFORM(lnTabIndex)
ENDIF
lxValue = EVALUATE(lcFieldName)
IF ISNULL(lxValue)
	lxValue = ""
ENDIF
lcType = UPPER(TYPE(lcFieldName))
DO CASE
CASE lcType = "N"
  lnValue = lxValue
CASE lcType = "L"
  lnValue = IIF(lxValue,1,0)
CASE lcType = "C"
  lnValue = VAL(lxValue) 
ENDCASE
IF llInvert
  lcYes = "0"
  lcNo = "1"
  lcYesId = lcField+"_alt"
  lcNoId = lcField
ELSE
  lcYes = "1"
  lcNo = "0"
  lcYesId = lcField
  lcNoId = lcField+"_alt"
ENDIF
lcRow = '<tr><th>'+lcLabel+'</th>'
lcRow = lcRow+'<td><input name="_'+lcType+lcField+'" id="'+lcYesId+'" type="radio" value="'+lcYes+'" '+iif(lnValue=VAL(lcYes),'checked="checked"','')+' tabindex="'+lcTabIndex+'" /> <label for="'+lcYesId+'">Yes</label>'
lcRow = lcRow+'&nbsp;&nbsp;&nbsp;<input name="_'+lcType+lcField+'" id="'+lcNoId+'" type="radio" value="'+lcNo+'" '+iif(lnValue=VAL(lcNo),'checked="checked"','')+' tabindex="'+lcTabIndex+'" /> <label for="'+lcNoId+'">No</label>'
lcRow = lcRow+'<script>Element.observe($("'+lcField+'"),"click",function() { if (!this.checked) $("'+lcField+'_alt").checked = true; }); Element.observe($("'+lcField+'_alt"),"click",function() { $("'+lcField+'").trigger("click"); });</script>'
lcRow = lcRow+'</td></tr>'
IF llNoRow
  lcRow = STRTRAN(STRTRAN(lcRow,"<tr>",""),"</tr>","")
ENDIF
RETURN lcRow
