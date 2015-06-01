      var side_bar_html = "";
      var gmarkers = [];
      var agents = [];
      var htmls = [];
      // arrays to hold variants of the info window html with get direction forms open
      var to_htmls = [];
      var from_htmls = [];
      var reasons=[];
      var gdir = {};
      var map = {};

    Event.observe(window,"load",function() {
    if (GBrowserIsCompatible()) {

      // create the map
      map = new GMap2(document.getElementById("map"));
      map.addControl(new GLargeMapControl());
      map.addControl(new GMapTypeControl());
      map.checkResize();
      // === create a GDirections Object ===
      gdir=new GDirections(map, document.getElementById("directions"));

      // === Array for decoding the failure codes ===
      reasons[G_GEO_SUCCESS]            = "Success";
      reasons[G_GEO_MISSING_ADDRESS]    = "Missing Address: The address was either missing or had no value.";
      reasons[G_GEO_UNKNOWN_ADDRESS]    = "Unknown Address:  No corresponding geographic location could be found for the specified address.";
      reasons[G_GEO_UNAVAILABLE_ADDRESS]= "Unavailable Address:  The geocode for the given address cannot be returned due to legal or contractual reasons.";
      reasons[G_GEO_BAD_KEY]            = "Bad Key: The API key is either invalid or does not match the domain for which it was given";
      reasons[G_GEO_TOO_MANY_QUERIES]   = "Too Many Queries: The daily geocoding quota for this site has been exceeded.";
      reasons[G_GEO_SERVER_ERROR]       = "Server error: The geocoding request could not be successfully processed.";
      reasons[G_GEO_BAD_REQUEST]        = "A directions request could not be successfully parsed.";
      reasons[G_GEO_MISSING_QUERY]      = "No query was specified in the input.";
      reasons[G_GEO_UNKNOWN_DIRECTIONS] = "The GDirections object could not compute directions between the points.";

      // === catch Directions errors ===
      GEvent.addListener(gdir, "error", function() {
        var code = gdir.getStatus().code;
        var reason="Code "+code;
        if (reasons[code]) {
          reason = reasons[code]
        } 
        alert("Failed to obtain directions, "+reason);
      });
      GEvent.addListener(gdir, "load", function() {
	map.closeInfoWindow();
      });

	   	    createMarker({
      		name: 'Western Avenue Office (Corporat',
      		html: '<p><b>Western Avenue Office (Corporat</b><br>4259 N. Western Ave.<br/>Chicago, IL 60618<br/>(888) 539-2102</p>',
      		lon: -87.688417,lat:41.959008,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: '26th Street Office',
      		html: '<p><b>26th Street Office</b><br>3210 W. 26th St.<br/>Chicago, IL 60623<br/>(773) 254-4666</p>',
      		lon: -87.705511,lat:41.844657,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Highwood Office',
      		html: '<p><b>Highwood Office</b><br>124 Washington Ave.<br/>Highwood, IL 60040<br/>(847) 748-2925</p>',
      		lon: -87.812055,lat:42.207172,
		city: 'Highwood'
   	    });
	   	    createMarker({
      		name: 'Rockford Office',
      		html: '<p><b>Rockford Office</b><br>3504 E. State St.<br/>Rockford, IL 61108<br/>(815) 333-2645</p>',
      		lon: -89.041635,lat:42.266143,
		city: 'Rockford'
   	    });
	   	    createMarker({
      		name: 'Rochelle Office',
      		html: '<p><b>Rochelle Office</b><br>120 May Mart Dr<br/>Rochelle, IL 61068<br/>(815) 352-7160</p>',
      		lon: -89.061684,lat:41.933863,
		city: 'Rochelle'
   	    });
	   	    createMarker({
      		name: 'Clark Street Office',
      		html: '<p><b>Clark Street Office</b><br>6928 N. Clark St.<br/>Chicago, IL 60626<br/>(773) 381-8470</p>',
      		lon: -87.673761,lat:42.007362,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Alsip Office',
      		html: '<p><b>Alsip Office</b><br>12203 S. Pulaski<br/>Alsip, IL 60803<br/>(708) 879-3880</p>',
      		lon: -87.71933,lat:41.670913,
		city: 'Alsip'
   	    });
	   	    createMarker({
      		name: 'Kankakee Office',
      		html: '<p><b>Kankakee Office</b><br>203 E. Court St.<br/>Kankakee, IL 60901<br/>(815) 352-7166</p>',
      		lon: -87.863727,lat:41.120405,
		city: 'Kankakee'
   	    });
	   	    createMarker({
      		name: 'Roundlake Office',
      		html: '<p><b>Roundlake Office</b><br>219 N Cedar Lake Rd.<br/>Roundlake, IL 60073<br/>(847) 201-2050</p>',
      		lon: -88.09315,lat:42.352975,
		city: 'Roundlake'
   	    });
	   	    createMarker({
      		name: 'Glendale Heights Office',
      		html: '<p><b>Glendale Heights Office</b><br>2103 A  Bloomingdale Rd<br/>Glendale Heights, IL 60139<br/>(630) 672-7070</p>',
      		lon: -88.079958,lat:41.936145,
		city: 'Glendale Heights'
   	    });
	   	    createMarker({
      		name: 'Prospect Heights Office',
      		html: '<p><b>Prospect Heights Office</b><br>644 N. Milwaukee Ave.<br/>Prospect Heights, IL 60070<br/>(847) 215-0008</p>',
      		lon: -87.889371,lat:42.107339,
		city: 'Prospect Heights'
   	    });
	   	    createMarker({
      		name: 'Carpentersville Office',
      		html: '<p><b>Carpentersville Office</b><br>150 S. Kennedy Dr.<br/>Suite 14<br/>Carpentersville, IL 60110<br/>(847) 645-2120</p>',
      		lon: -88.258153,lat:42.119121,
		city: 'Carpentersville'
   	    });
	   	    createMarker({
      		name: 'Crystal Lake Office',
      		html: '<p><b>Crystal Lake Office</b><br>432 W. Virginia St.<br/>Crystal Lake, IL 60014<br/>(815) 301-2045</p>',
      		lon: -88.336625,lat:42.234596,
		city: 'Crystal Lake'
   	    });
	   	    createMarker({
      		name: 'Addison Office',
      		html: '<p><b>Addison Office</b><br>520 W. Lake Street<br/>Suite D<br/>Addison, IL 60101<br/>(630) 563-4725</p>',
      		lon: -88.044564,lat:41.953752,
		city: 'Addison'
   	    });
	   	    createMarker({
      		name: 'Ashland Avenue Office',
      		html: '<p><b>Ashland Avenue Office</b><br>1048 N. Ashland Ave.<br/>Chicago, IL 60622<br/>(773) 572-6475</p>',
      		lon: -87.66753,lat:41.901091,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Belvidere Office',
      		html: '<p><b>Belvidere Office</b><br>405 S. State Street<br/>Belvidere, IL 61008<br/>(815) 323-4040</p>',
      		lon: -88.840417,lat:42.256389,
		city: 'Belvidere'
   	    });
	   	    createMarker({
      		name: 'Harvard Office',
      		html: '<p><b>Harvard Office</b><br>37 N. Ayer St.<br/>Harvard, IL 60033<br/>(815) 560-6855</p>',
      		lon: -88.615105,lat:42.420549,
		city: 'Harvard'
   	    });
	   	    createMarker({
      		name: 'Arlington Heights Office',
      		html: '<p><b>Arlington Heights Office</b><br>1740 W. Algonquin Rd<br/>Arlington Height, IL 60005<br/>(847) 483-8006</p>',
      		lon: -88.005368,lat:42.057647,
		city: 'Arlington Height'
   	    });
	   	    createMarker({
      		name: 'Melrose Park Office',
      		html: '<p><b>Melrose Park Office</b><br>1900 W. Lake St.<br/>Melrose Park, IL 60160<br/>(708) 865-2078</p>',
      		lon: -87.856778,lat:41.893351,
		city: 'Melrose Park'
   	    });
	   	    createMarker({
      		name: 'Cicero Avenue Office',
      		html: '<p><b>Cicero Avenue Office</b><br>3104 N. Cicero Ave.<br/>Chicago, IL 60641<br/>(773) 725-9700</p>',
      		lon: -87.747007,lat:41.937227,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Fullerton Avenue Office',
      		html: '<p><b>Fullerton Avenue Office</b><br>5010 W. Fullerton Ave.<br/>Chicago, IL 60639<br/>(773) 622-6773</p>',
      		lon: -87.751691,lat:41.924339,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Des Plaines Office',
      		html: '<p><b>Des Plaines Office</b><br>1440 E. Miner Street<br/>Des Plaines, IL 60016<br/>(847) 824-3232</p>',
      		lon: -87.888146,lat:42.042021,
		city: 'Des Plaines'
   	    });
	   	    createMarker({
      		name: 'Bensenville Office',
      		html: '<p><b>Bensenville Office</b><br>215 W. Grand Ave.<br/>Bensenville, IL 60106<br/>(630) 694-1185</p>',
      		lon: -87.946962,lat:41.931195,
		city: 'Bensenville'
   	    });
	   	    createMarker({
      		name: 'Kedzie Avenue Office',
      		html: '<p><b>Kedzie Avenue Office</b><br>4710 S. Kedzie Ave.<br/>Chicago, IL 60632<br/>(773) 650-7740</p>',
      		lon: -87.704087,lat:41.807665,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Waukegan Office',
      		html: '<p><b>Waukegan Office</b><br>2312 Grand Ave.<br/>Waukegan, IL 60085<br/>(847) 569-8185</p>',
      		lon: -87.861,lat:42.37045,
		city: 'Waukegan'
   	    });
	   	    createMarker({
      		name: 'Diversey Avenue Office',
      		html: '<p><b>Diversey Avenue Office</b><br>3418 W. Diversey<br/>Chicago, IL 60647<br/>(773) 489-8710</p>',
      		lon: -87.712687,lat:41.932108,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Hanover Park Office',
      		html: '<p><b>Hanover Park Office</b><br>2005 E. Irving Park Rd.<br/>Hanover Park, IL 60133<br/>(630) 213-6044</p>',
      		lon: -88.154586,lat:42.008199,
		city: 'Hanover Park'
   	    });
	   	    createMarker({
      		name: 'Cicero Office',
      		html: '<p><b>Cicero Office</b><br>6026 W. Cermak Ave.<br/>Cicero, IL 60804<br/>(708) 222-3160</p>',
      		lon: -87.774997,lat:41.850951,
		city: 'Cicero'
   	    });
	   	    createMarker({
      		name: 'South Commercial Office',
      		html: '<p><b>South Commercial Office</b><br>8928 S.Commercial Ave.<br/>Chicago, IL 60617<br/>(773) 375-2056</p>',
      		lon: -87.551499,lat:41.733123,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Palatine Office',
      		html: '<p><b>Palatine Office</b><br>513 E. Dundee Rd.<br/>Palatine, IL 60074<br/>(847) 934-0789</p>',
      		lon: -88.031635,lat:42.139081,
		city: 'Palatine'
   	    });
	   	    createMarker({
      		name: 'Elgin Office',
      		html: '<p><b>Elgin Office</b><br>302-B S. McLean Blvd.<br/>Elgin, IL 60123<br/>(847) 608-7260</p>',
      		lon: -88.312104,lat:42.026962,
		city: 'Elgin'
   	    });
	   	    createMarker({
      		name: 'Wheeling Office',
      		html: '<p><b>Wheeling Office</b><br>30 W. Dundee Rd.<br/>Wheeling, IL 60090<br/>(847) 850-1299</p>',
      		lon: -87.916417,lat:42.13967,
		city: 'Wheeling'
   	    });
	   	    createMarker({
      		name: 'Mundelein Office',
      		html: '<p><b>Mundelein Office</b><br>670 E. Hawley St<br/>Mundelein, IL 60060<br/>(847) 388-1915</p>',
      		lon: -87.994005,lat:42.271453,
		city: 'Mundelein'
   	    });
	   	    createMarker({
      		name: 'West Chicago Office',
      		html: '<p><b>West Chicago Office</b><br>173 N. Neltnor Blvd.<br/>#C2<br/>West Chicago, IL 60185<br/>(630) 621-1160</p>',
      		lon: -88.19433,lat:41.886631,
		city: 'West Chicago'
   	    });
	   	    createMarker({
      		name: 'Mount Prospect Office',
      		html: '<p><b>Mount Prospect Office</b><br>1720 W. Algonquin Rd.<br/>Suites 106-10<br/>Mount Prospect, IL 60056<br/>(847) 879-7115</p>',
      		lon: -87.960842,lat:42.035871,
		city: 'Mount Prospect'
   	    });
	   	    createMarker({
      		name: 'DeKalb Office',
      		html: '<p><b>DeKalb Office</b><br>665 E. Lincoln Hwy.<br/>DeKalb, IL 60115<br/>(815) 333-2655</p>',
      		lon: -88.746395,lat:41.928581,
		city: 'DeKalb'
   	    });
	   	    createMarker({
      		name: 'North Avenue Office',
      		html: '<p><b>North Avenue Office</b><br>3900 W. North Ave.<br/>Chicago, IL 60647<br/>(773) 572-6450</p>',
      		lon: -87.724215,lat:41.909997,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Aurora Office',
      		html: '<p><b>Aurora Office</b><br>700 E. New York St.<br/>Suite #160<br/>Aurora, IL 60505<br/>(630) 851-4255</p>',
      		lon: -88.301118,lat:41.754366,
		city: 'Aurora'
   	    });
	   	    createMarker({
      		name: 'Joliet Office',
      		html: '<p><b>Joliet Office</b><br>562 N. Collins St.<br/>Joliet, IL 60432<br/>(815) 727-7262</p>',
      		lon: -88.072497,lat:41.534887,
		city: 'Joliet'
   	    });
	   	    createMarker({
      		name: 'East Chicago Indiana Office',
      		html: '<p><b>East Chicago Indiana Office</b><br>801 W. Chicago Ave.<br/>East Chicago, IN 46312<br/>(219) 378-1418</p>',
      		lon: -87.480949,lat:41.629127,
		city: 'East Chicago'
   	    });
	   	    createMarker({
      		name: 'Marquette Office',
      		html: '<p><b>Marquette Office</b><br>3957 W. Marquette<br/>Chicago, IL 60629<br/></p>',
      		lon: -87.721412,lat:41.771252,
		city: 'Chicago'
   	    });
	   	    createMarker({
      		name: 'Stone Park Office',
      		html: '<p><b>Stone Park Office</b><br>1638 N. Manheim Rd.<br/>Stone Park, IL 60165<br/></p>',
      		lon: -87.883923,lat:41.902167,
		city: 'Stone Park'
   	    });
	   	    createMarker({
      		name: '26th Street West Office',
      		html: '<p><b>26th Street West Office</b><br>4323 W. 26th. St.<br/>Chicago, IL 60623<br/></p>',
      		lon: -87.732031,lat:41.844035,
		city: 'Chicago'
   	    });
	           map.setCenter(gmarkers[0].point, 9);
    }

    else {
      alert("Sorry, the Google Maps API is not compatible with this browser");
    }

    // This Javascript is based on code provided by the
    // Blackpool Community Church Javascript Team
    // http://www.commchurch.freeserve.co.uk/   
    // http://econym.googlepages.com/index.htm
    });

      // A function to create the marker and set up the event window
      function createMarker(agent) {
        agent.point = new GLatLng(agent.lat,agent.lon);
        var marker = new GMarker(agent.point);
	marker.point = agent.point;
	var html = agent.html;
        var i = gmarkers.length;

        // The info window version with the "to here" form open
        to_htmls[i] = html + '<br>Directions: <b>To here<\/b> - <a href="javascript:fromhere(' + i + ')">From here<\/a>' +
           '<br>Start address:<form action="javascript:getDirections('+i+')">' +
           '<input type="text" SIZE=40 MAXLENGTH=40 name="saddr" id="saddr" value="" /><br>' +
           '<INPUT value="Get Directions" TYPE="SUBMIT"><br>' +
           'Walk <input type="checkbox" name="walk" id="walk" /> &nbsp; Avoid Highways <input type="checkbox" name="highways" id="highways" />' +
           '<input type="hidden" id="daddr" value="'+agent.name+"@"+ agent.point.lat() + ',' + agent.point.lng() + 
           '"/>';
        // The info window version with the "from here" form open
        from_htmls[i] = html + '<br>Directions: <a href="javascript:tohere(' + i + ')">To here<\/a> - <b>From here<\/b>' +
           '<br>End address:<form action="javascript:getDirections()">' +
           '<input type="text" SIZE=40 MAXLENGTH=40 name="daddr" id="daddr" value="" /><br>' +
           '<INPUT value="Get Directions" TYPE="SUBMIT"><br>' +
           'Walk <input type="checkbox" name="walk" id="walk" /> &nbsp; Avoid Highways <input type="checkbox" name="highways" id="highways" />' +
           '<input type="hidden" id="saddr" value="'+agent.name+"@"+ agent.point.lat() + ',' + agent.point.lng() +
           '"/>';
        // The inactive version of the direction info
        html = html + '<br>Directions: <a href="javascript:tohere('+i+')">To here<\/a> - <a href="javascript:fromhere('+i+')">From here<\/a>';

        GEvent.addListener(marker, "click", function() {
          marker.openInfoWindowHtml(html);
        });
        // save the info we need to use later for the side_bar
        gmarkers.push(marker);
	agents.push(agent);
        htmls[i] = html;
        return marker;
      }
      
      // ===== request the directions =====
      function getDirections(i) {
        // ==== Set up the walk and avoid highways options ====
        var opts = {};
        if (document.getElementById("walk").checked) {
           opts.travelMode = G_TRAVEL_MODE_WALKING;
        }
        if (document.getElementById("highways").checked) {
           opts.avoidHighways = true;
        }
        // ==== set the start and end locations ====
        var saddr = document.getElementById("saddr").value
        var daddr = document.getElementById("daddr").value
        gdir.load("from: "+saddr+" to: "+daddr, opts);
      }


      // This function picks up the click and opens the corresponding info window
      function geoSearch() {
	var zipcode = $F('zipcode');
	var miles = parseInt($F('miles'));
	side_bar_html = "";
	if (zipcode.length > 0) {
	  // geocode zipcode
	  var geocoder = new GClientGeocoder();
  	  geocoder.getLatLng(
    	    zipcode,
    	    function(geoPoint) {
      	      if (geoPoint) {
          	  point = geoPoint;
	      } else {
	  	  point = gmarkers[0].getPoint();
	      }
	      map.clearOverlays();
	      for (var j = 0; j < gmarkers.length; j++) {
	        var distKm=gmarkers[j].getPoint().distanceFrom(point)/1000;
	        var distMiles = distKm * 0.621371;
	        if (distMiles <= miles) {
		  map.addOverlay(gmarkers[j]);
        	  side_bar_html += '<a href="javascript:myclick(' + j + ')">' + agents[j].name + '<\/a><br>';
	        }
	      }
	      switch (miles) {
		case 1: newZoom = 14; break;
		case 5: newZoom = 12; break;
		case 10: newZoom = 10; break;
		case 25: newZoom = 9; break;
		case 50: newZoom = 8; break;
		default: newZoom = 7; break;
	      }
	      map.setCenter(point,newZoom);
              document.getElementById("side_bar").innerHTML = side_bar_html;
	      document.getElementById("directions").innerHTML = '<hr/>';
    	    }
  	  );
	}
      }
      function myclick(i) {
	map.setCenter(gmarkers[i].point,15);
        gmarkers[i].openInfoWindowHtml(htmls[i]);
	document.getElementById("directions").innerHTML = '<hr/>';
      }

      // functions that open the directions forms
      function tohere(i) {
        gmarkers[i].openInfoWindowHtml(to_htmls[i]);
      }
      function fromhere(i) {
        gmarkers[i].openInfoWindowHtml(from_htmls[i]);
      }
