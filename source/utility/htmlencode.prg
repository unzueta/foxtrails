PARAMETERS lcString,decode
LOCAL ARRAY laEncoding[4,2]
laEncoding[1,1] = "&"
laEncoding[1,2] = "&amp;"
laEncoding[2,1] = ["]
laEncoding[2,2] = "&quot;"
laEncoding[3,1] = "<"
laEncoding[3,2] = "&lt;"
laEncoding[4,1] = ">"
laEncoding[4,2] = "&gt;"

FOR lnIndex = 1 TO ALEN(laEncoding,1)
	IF decode
		lcString = STRTRAN(lcString,laEncoding[lnIndex,2],laEncoding[lnIndex,1])
	ELSE
		lcString = STRTRAN(lcString,laEncoding[lnIndex,1],laEncoding[lnIndex,2])
	ENDIF
NEXT
RETURN lcString