    *** URLDecodes a text string:
    * Replaces %hh tokens with ascii characters
    * Assuming fewer than 65000 '%'s

    *** Input: tcInput - Text string to decode
    *** Return: Decoded string
    * Author: Albert Ballinger

    Lparameter tcInput

    Local lnPcntPos, lcOutput, lnPcntCount, i
    tcInput = Strtran(tcInput, "+", " ")

    Local Array laPercents[1]
    lnPcntCount = Alines(laPercents, Strtran(tcInput, "%", Chr(13)))

    lcOutput = laPercents[1]

    For i = 2 To lnPcntCount
        lcOutput = m.lcOutput + Chr(Evaluate('0x' + Left(laPercents[i], 2))) + ;
            substr(laPercents[i], 3)
    ENDFOR
    DO CASE
    CASE "</" $ lcOutput
    CASE "SCRIPT" $ UPPER(lcOutput)
    OTHERWISE
	    Return lcOutput
	ENDCASE
	RETURN ""