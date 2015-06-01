**************************************************
*-- Form:         form1 (c:\projects\foxtrails\utility\mkscaff.scx)
*-- ParentClass:  form
*-- BaseClass:    form
*-- Time Stamp:   08/15/07 03:32:02 PM
*

oBuilder = NEWOBJECT("buildscaf")
oBuilder.Show(1)

PROCEDURE generate
LOCAL lcTable,lcClass,lcPrg,lcLayout,lcViewList,lcViewEdit
IF !USED()
	MESSAGEBOX("No table open in the current work area")
ENDIF
lcTable = PROPER(ALIAS())
lcId = FIELD(1)
lcField = FIELD(2)
IF LEN(lcTable) < 4
	lcTable = PADL(lcTable,4)
ENDIF
DO CASE
CASE RIGHT(lcTable,3) = "ies"
	lcClass = ALLTRIM(LEFT(lcTable, LEN(lcTable)-3)+"y")
CASE RIGHT(lcTable,1) = "s"
	lcClass = ALLTRIM(LEFT(lcTable, LEN(lcTable)-1))
OTHERWISE
	lcClass = ALLTRIM(LEFT(lcTable, LEN(lcTable)-1))
ENDCASE

SET TEXTMERGE DELIMITERS TO "{{","}}"

TEXT TO lcPrg TEXTMERGE NOSHOW
DEFINE CLASS {{LOWER(lcClass)}} AS base OF controllers\base.prg
	criteria = ""
		
	PROCEDURE list
		USE DB\{{lcTable}} SHARED IN 0
		SELECT * FROM {{lcTable}} WHERE UPPER({{lcField}}) LIKE '%'+UPPER(this.criteria)+'%' INTO Cursor cur{{lcTable}}
		USE IN {{lcTable}}
	ENDPROC

	PROCEDURE add
		USE DB\{{lcTable}} ORDER TAG {{lcId}} SHARED IN 0
		SELECT {{lcTable}}
		SEEK "~NEWID~" && force to end of file
		oDispatchContext.renderAction = "edit"
	ENDPROC
	PROCEDURE edit
		PARAMETERS lcid
		USE DB\{{lcTable}} ORDER TAG {{lcId}} SHARED IN 0
		IF !SEEK(lcid)
			oDispatchContext.renderAction = "edit"
			THROW "Record not found"
		ENDIF			
	ENDPROC

	PROCEDURE save
		USE DB\{{lcTable}} order tag {{lcId}} SHARED IN 0
		IF SEEK(this.{{lcId}})
			GATHER NAME this
		ELSE
			INSERT INTO {{lcTable}} FROM NAME this
		ENDIF
		oDispatchContext.renderAction = "index"
	ENDPROC

	PROCEDURE delete
		USE DB\{{lcTable}} order tag {{lcId}} SHARED IN 0
		IF SEEK(this.{{lcId}})
			DELETE
		ENDIF
		oDispatchContext.renderAction = "search"
	ENDPROC
	PROCEDURE QueryUnload
		ThisForm.Release()
	ENDPROC
ENDDEFINE
ENDTEXT
STRTOFILE(lcPrg,"Controllers\"+LOWER(lcClass)+".prg")

TEXT TO lcLayout TEXTMERGE NOSHOW
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<title>{{lcClass}} Maintenance</title>
<script type="text/javascript" src="<<webroot()>>/lib/prototype.js"></script>
<script type="text/javascript" src="<<webroot()>>/lib/effects.js"></script>
<script type="text/javascript" src="<<webroot()>>/lib/calendarview.js"></script>
<link rel="stylesheet" href="<<webroot()>>/css/calendarview.css" />
<script type="text/javascript" src="<<webroot()>>/lib/date.js"></script>
<script type="text/javascript" src="<<webroot()>>/lib/dateparse.js"></script>
</head>
<body>
<% IF oDispatchContext.hasErrors() %>
<div class="error">
<% FOR EACH cError IN oDispatchContext.Errors %>
<p><<cError>></p>
<% NEXT %>
</div>
<% ENDIF %>
<% IF lower(.renderAction) $ "index|list" %>
<form id="searchform" action="<<fullurl("/{{LOWER(lcClass)}}/list")>>" method="post">
      <p>
      {{PROPER(lcField)}}: <input type="text" name="_ccriteria" id="_ccriteria" value="<<{{lcClass}}.criteria>>"/> <input type="submit" id="search" value="Search"/>
      </p>
</form>
<% ENDIF %>
<< oDispatchContext.renderedView >>
</body>
</html>

ENDTEXT
STRTOFILE(lcLayout,"Layouts\"+LOWER(lcClass)+".vml")

TEXT TO lcViewList TEXTMERGE NOSHOW
<div id="results">
<table>
<%
SELECT Cur{{lcTable}}
SCAN
%>
<tr><td>
  <<linkto("/{{LOWER(lcClass)}}/edit/"+TRANSFORM(cur{{lcTable}}.{{lcId}}),Cur{{lcTable}}->{{lcField}})>>
</td></tr>
<%
ENDSCAN
%>
</table>
<p><<linkto("/{{LOWER(lcClass)}}/add","Add new {{LOWER(lcClass)}}")>></p>
</div>
ENDTEXT
TRY
	MKDIR Views\&lcClass
CATCH
ENDTRY
STRTOFILE(lcViewList,"Views\"+lcClass+"\list.vml") 
TEXT TO lcViewEdit TEXTMERGE NOSHOW
<div id="results">
<form action="<<fullurl("/{{LOWER(lcClass)}}/save")>>" method="post">
<table>
<% SELECT {{lcTable}}
FOR i = 1 TO FCOUNT("{{lcTable}}")%>
<< fieldfor( "{{lcTable}}."+field(i) ) >>
<% ENDFOR%>
<tr><td><input type="submit" value="Save"/> <input type="button" value="Delete" onclick="document.location='<<fullurl("/{{LOWER(lcClass)}}/delete/?{{lcId}}="+TRANSFORM({{lcTable}}.{{lcId}}))>>';"/></td></tr>
</table>
</form>
</div>

ENDTEXT
STRTOFILE(lcViewEdit,"Views\"+lcClass+"\edit.vml") 

SET TEXTMERGE DELIMITERS
ENDPROC

DEFINE CLASS buildscaf AS form


	Top = 0
	Left = 0
	Height = 467
	Width = 315
	DoCreate = .T.
	Caption = "Fox Trails Scaffold Builder"
	BackColor = RGB(255,255,255)
	Name = "Form1"
	DIMENSION filelist[1]


	ADD OBJECT command1 AS commandbutton WITH ;
		Top = 348, ;
		Left = 72, ;
		Height = 61, ;
		Width = 133, ;
		Caption = "Make Scaffold", ;
		Name = "Command1"


	ADD OBJECT list1 AS listbox WITH ;
		RowSourceType = 5, ;
		RowSource = "thisform.filelist", ;
		Height = 277, ;
		Left = 48, ;
		Top = 48, ;
		Width = 228, ;
		Name = "List1"


	PROCEDURE Load
		WITH THISFORM
			hmfiles = ADIR(.filelist,"DB\*.dbf")
		ENDW
	ENDPROC


	PROCEDURE command1.Click
		WITH ThisForm
			IF .list1.value = 0
				MESSAGEBOX("Please select a file to scaffold")
				RETURN
			ENDIF
			lcFile = .filelist[.list1.value,1]
			USE ("DB\"+lcFile) SHARED
			DO generate
			USE
		ENDWITH
	ENDPROC


ENDDEFINE
*
*-- EndDefine: form1
**************************************************
