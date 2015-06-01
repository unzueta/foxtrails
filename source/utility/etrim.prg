PARAMETERS lcValue
IF TYPE('lcValue') <> "C"
	lcValue = TRANSFORM(lcValue)
ENDIF
RETURN HtmlEncode(TRIM(lcValue))