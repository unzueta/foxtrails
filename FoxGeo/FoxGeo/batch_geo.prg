DECLARE Sleep IN kernel32 INTEGER dwMillisecond

gm_apikey = ""
USE offices
LOCAL loHttp AS MSXML2.ServerXMLHTTP.3.0
loHTTP = CreateObject("MSXML2.ServerXMLHTTP.3.0")
lcGMURL = "http://maps.google.com/maps/geo?q=<<lcAddress>>&output=csv&oe=utf8&sensor=false" && &key="

SCAN FOR VAL(lat) = 0
	*-- do some address scrubbing here
	*-- PO Boxes --> zipcode only
	IF "BOX" $ UPPER(address_2)
		lcAddress = TRIM(city)+", "+TRIM(state)+" "+TRANSFORM(zip)
	ELSE
		lcAddress = TRIM(address_2)+", "+TRIM(city)+", "+TRIM(state)+" "+TRANSFORM(zip)
	ENDIF
	lcAddress = urlencode(lcAddress)
	loHttp.open("GET",TEXTMERGE(lcGMUrl),.f.)
	loHttp.send()
	lcResult = loHttp.responseText
	
	IF VAL(lcResult) == 200
		SELECT offices
		REPLACE lat WITH GETWORDNUM(lcResult,3,",")
		REPLACE lon WITH GETWORDNUM(lcResult,4,",")
	ENDIF
	Sleep(2000) && wait for two seconds to avoid triggering google's transaction limit
ENDSCAN
USE IN SELECT("offices")