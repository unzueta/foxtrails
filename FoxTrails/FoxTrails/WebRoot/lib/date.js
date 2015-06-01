<!-- Adapted by Brian Marquis to use prototype library -->

Date.isDate = function(objName) {
	var value = $F(objName);
	return value.isDate();
}

String.prototype.isDate = function() {
	try {
		var dValue = parseDateString(this);
	} catch (e) {
		return false;
	}
	return true;
}

// Formats the date with the given date mask. The mask is returned
// and the internal date is not altered.
Date.prototype.formatDate = function( strMask ){
	// Create the values for each part of the potential date mask.
	var objParts = {
		"d": this.getDate(),
		"dd": this.getDate().toString().padl(2,'0'),
		"ddd": [ "Sun","Mon","Tue","Wed","Thr","Fri","Sat" ][ this.getDay() ],
		"dddd": [ "Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday" ][ this.getDay() ],
		"m": this.getMonth()+1,
		"mm": (this.getMonth()+1).toString().padl(2,'0'),
		"mmm": [ "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec" ][ this.getMonth()],
		"mmmm": [ "January","February","March","April","May","June","July","August","September","October","November","December" ][ this.getMonth()],
		"yy": this.getFullYear().toString().substring( 2, 4 ),
		"yyyy": this.getFullYear(),
		"h": this.getHours(),
		"hh": this.getHours().toString().padl(2,'0'),
		"H": (this.getHours()>12)?(this.getHours()-12):this.getHours(),
		"HH": ((this.getHours()>12)?(this.getHours()-12):this.getHours()).toString().padl(2,'0'),
		"M": this.getMinutes(),
		"MM": this.getMinutes().toString().padl(2,'0'),
		"S": this.getSeconds(),
		"SS": this.getSeconds().toString().padl(2,'0'),
		"S": this.getSeconds(),
		"SS": this.getSeconds().toString().padl(2,'0'),
		"a": (this.getHours()>12)?"p":"a",
		"am": (this.getHours()>12)?"pm":"am",
		"A": (this.getHours()>12)?"P":"A",
		"AM": (this.getHours()>12)?"PM":"AM"
	}
    
	// Check to see if we have special date formatting options.
	switch ( strMask ){
	case "short":
		return( objParts[ "m" ] + "/" + objParts[ "d" ] + "/" + objParts[ "yyyy" ] );
		break;
 
	case "medium":
		return( objParts[ "mmm" ] + " " + objParts[ "d" ] + ", " + objParts[ "yyyy" ] );
		break;
 
	case "long":
		return( objParts[ "mmmm" ] + " " + objParts[ "d" ] + ", " + objParts[ "yyyy" ] );
		break;
 
	case "full":
		return( objParts[ "dddd" ] + ", " + objParts[ "mmmm" ] + " " + objParts[ "d" ] + ", " + objParts[ "yyyy" ] );
		break;
 
	default:
		// There was no special date formatting, so just use the mask.
		return(
			strMask.replace(
				new RegExp( "(d{1,4}|m{1,4}|y{4}|y{2}|h{1,2}|H{1,2}|M{1,2}|S{1,2}|[aA][mM]?)", "gi" ),
					function( $1 ){
						return( objParts[ $1 ] );
					})
			);
		break;
	}
  }
  
Object.extend(String.prototype,{
    padl: function( length, c ) {
        var result = this;
        while ( result.length < length ) {
            result = c + result;
        }
        return result;
    },
    padr: function( length, c ) {
        var result = this;
        while ( result.length < length ) {
            result += c;
        }
        return result;
    },
    ltrim: function() {
        var result = this.replace(/^ +/,'');
	return result;
    },
    rtrim: function() {
        var result = this.replace(/ +$/,'');
	return result;
    },
    trim: function() {
	return this.ltrim().rtrim();
    }

});

function dateBuilder(name) {
  /* this function adds the javascript code
   * to build a hidden date field from a
   * set of date triplet fields.
   */
  $(name).triplet = $A(['mon', 'day', 'year']);
  $(name).triplet.each( function(part) {
      $(name+"_"+part).onfocus = function() {
        if ("mm/dd/yyyy".indexOf(this.value) > -1) {
	  this.value = '';
	  this.className = '';
	}
      }.bind($(name+"_"+part));
      $(name+"_"+part).onblur = function(part) {
        var mask = part.substr(0,1); mask += mask;
		if (part == 'year') {
			mask += mask;
		}
        if (this.value.trim().length == 0 || this.value.padl(2,"0") == "00") {
	  this.value = mask;
	  this.className = 'mask';
	}
      }.bind($(name+"_"+part),part);

      $(name+"_"+part).onkeyup = function(e,name,part) {
         // update the hidden field when any field in the triplet changes
         $(name).value = $(name).triplet.map( function( elem ) {
		 return $F(name+"_"+elem).padl(2,'0');
	 }).join("/");
         // if we have two characters in the currently selected field
	 // then set the focus to the next field in the triplet
	 var key = e.which || e.keyCode;
	 if (this.value.length > 1 && key != 9 && key != 16) {
	   var next = $(name).triplet.indexOf(part)+1;
	   if ( next < 3 ) {
		 setTimeout("$('"+name+"_"+($(name).triplet[next])+"').focus();",5);
	   }
	 }
      }.bindAsEventListener($(name+"_"+part),name,part);
  });
}
