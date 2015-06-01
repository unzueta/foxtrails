*--- GenMigrate
*--- Creates migration code from currently open table
SET TALK OFF
SET CENTURY ON
SET STRICTDATE TO 0

IF EMPTY(ALIAS())
	MESSAGEBOX("Usage: Call program with an open dbf")
	RETURN
ENDIF

LOCAL laFields, lnCount, lcMigration, ;
      lcFields, lcType, lcTypeDef, ;
      lcCreate, lcTags, lcInserts, ;
      lcPrefix, lcSuffix, ;
      lcValues, lcIndent
      
*-- get structure of table
LOCAL ARRAY laFields[1]
lcFields = ""
lcValues = ""
lcInserts = ""
lcIndent = REPLICATE(CHR(9),2)
lnTotalFields = AFIELDS(laFields)
FOR lnField = 1 TO lnTotalFields
  lcType = laFields[lnField,2] 
  DO CASE
  CASE lcType $ "DTILMYIGBFW"
    lcTypeDef = lcType
  CASE lcType $ "CV"
    lcTypeDef = TEXTMERGE("<<lcType>>(<<laFields[lnField,3]>>)")
  CASE lcType = "N"
    lcTypeDef = TEXTMERGE("<<lcType>>(<<laFields[lnField,3]>>,<<laFields[lnField,4]>>)")
  ENDCASE
  IF lnField % 3 = 1
  	lcPrefix = ",;"+CHR(13)+lcIndent+CHR(9)
  ELSE
    lcPrefix = ", "
  ENDIF
  lcFields = lcFields + TEXTMERGE("<<lcPrefix>><<LOWER(laFields[lnField,1])>> <<lcTypeDef>>")
NEXT
lcFields = SUBSTR(lcFields,2)
lcCreate = TEXTMERGE([<<lcIndent>>CREATE TABLE (this.targetDir+"<<LOWER(ALIAS())>>.dbf") (<<lcFields>>)])

SCAN FOR !DELETED()
    lcFields = ""
    lcValues = ""
	FOR lnField = 1 TO lnTotalFields
	  lcType = laFields[lnField,2]
	  lxValue = EVALUATE(ALIAS()+"->"+laFields[lnField,1])
	  DO CASE
	  CASE lcType $ "DT"
	    lcPrefix = [{  ]
	    lcSuffix = [}]
	  CASE lcType $ "NILYBF"
	    lcPrefix = ""
	    lcSuffix = ""
	  CASE lcType $ "CV"
	    lcPrefix = [']
	    lcSuffix = [']
	    IF ['] $ lxValue
	    	lcPrefix = '['
	    	lcSuffix = ']'
	    ENDIF
	    lxValue = TRIM(lxValue)
	  OTHERWISE
	    *-- unsupported type for insert
	    LOOP
	  ENDCASE
	  IF lnField % 3 = 1
	  	lcPrefix = ",;"+CHR(13)+lcIndent+CHR(9)+lcPrefix
	  ELSE
	    lcPrefix = ", "+lcPrefix
	  ENDIF
  	  lcFields = lcFields + CHRTRAN(TEXTMERGE("<<lcPrefix>><<LOWER(laFields[lnField,1])>>"),"'{}[] ","")
	  lcValues = lcValues + TEXTMERGE("<<lcPrefix>><<lxValue>><<lcSuffix>>")
	NEXT
	lcFields = SUBSTR(lcFields,2)
	lcValues = SUBSTR(lcValues,2)
	lcInserts = lcInserts + TEXTMERGE("<<lcIndent>>INSERT INTO <<LOWER(ALIAS())>> (<<lcFields>>) VALUES (<<lcValues>>)"+CHR(13))
ENDSCAN
TEXT TO lcMigrate TEXTMERGE NOSHOW
DEFINE CLASS migrate AS Session
	targetDir = ""
	PROCEDURE Init
		SET CENTURY ON
		SET STRICTDATE TO 0
	ENDPROC
	
	PROCEDURE Up
<<lcCreate>>
		
<<lcInserts>>
		
		USE IN <<LOWER(ALIAS())>>
	ENDPROC
	
	PROCEDURE Down
		DROP TABLE (this.targetDir+"<<LOWER(ALIAS())>>.dbf")
	ENDPROC
ENDDEFINE
ENDTEXT

_CLIPTEXT = lcMigrate
KEYBOARD '{CTRL-V}'
MODIFY COMMAND 
