PARAMETERS tcValue, llNoPlus
LOCAL lcResult, lcChar, lnSize, lnX
 
*** Do it in VFP Code
lcResult=""
 
FOR lnX=1 to len(tcValue)
   lcChar = SUBSTR(tcValue,lnX,1)
   IF ATC(lcChar,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") > 0
      lcResult=lcResult + lcChar
      LOOP
   ENDIF
   IF lcChar=" " AND !llNoPlus
      lcResult = lcResult + "+"
      LOOP
   ENDIF
   *** Convert others to Hex equivalents
   lcResult = lcResult + "%" + RIGHT(transform(ASC(lcChar),"@0"),2)
ENDFOR
 
RETURN lcResult