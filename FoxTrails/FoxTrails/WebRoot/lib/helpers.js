function updateSelect(element, transport) {
	var element = $(element);
	var value = $F(element);
	var select = transport.responseXML.getElementsByTagName("select")[0];
	var optionArray = $A(select.getElementsByTagName("option"));
	element.options.length = 0;
	element.selectedIndex = -1;
	if ( optionArray.length > 0 ) {		
	    optionArray.each( function(option) {
	        var optionText = Try.these(
                function() { return option.childNodes[0].nodeValue },
                function() { return option.nodeValue }
            ) || '';
		    element.options[element.options.length] = new Option(optionText,optionText);
		    if (optionText == value) {
			element.selectedIndex = element.options.length - 1;
		    }
	    });
        }
	
	if ( element.onchange ) {
		element.onchange();
	}
}
function setSelectedIndex(element,value) {
	element = $(element);
	for ( var i = 0; i < element.options.length; i++ ) {
		if (element.options[i].value == value || element.options[i].text == value) {
			element.selectedIndex = i;
			break;
		}
	}
}
function validate(element,hash) {
	var messages = $A([]);
	hash.each( function( pair ) {
		var field = $(pair.key);
		var validator = pair.value;
        var error = false;
		if (validator.required) {
            if ($(field).type == 'select-one') { 
               if ($(field).selectedIndex == -1) {
				  messages.push(validator.required);	
                  error = true;
               }
            } else if ( $(field).type == 'checkbox' || $(field).type == 'radio' ) { 
               if (!$(field).checked) {
                  messages.push(validator.required);
                  error = true;
               }
            } else if ( !Field.present(field)) {
				messages.push(validator.required);	
                error = true;
            }
        }
        if ( !error ) {
           if ( validator.callback ) {
              validator.message = validator.callback();
              if (validator.message.length>0) {
                  messages.push(validator.message);
                  error = true;
              }
		   } else if ( validator.re && $F(field).search(validator.re) == -1 ) {
		  	  messages.push(validator.message);
              error = true;
           }
		}
        if (validator.indicator) {
            $(validator.indicator).className = (error)?'required':'';
        }
	});
	element = $(element);
	if (element) {
		var message = messages.join("<br />");
		element.update(message);
		if (message.length>0) {
			element.show();
		} else {
			element.hide();
		}
	}
	return (messages.length == 0);
}

Object.extend(String.prototype, {
  evalJSON: function() {
    try {
      return this ? eval('(' + this + ')') : null;
    } catch (e) { return null }
  },
  mask: function(format,reverse) {
	var result = '';
	var source = this;
	if (reverse) {
	    source = source.reverse();
	    format = format.reverse();
	}
	var si = 0;
	for (var fi = 0; fi < format.length; fi++) {
		var fc = format.charAt(fi);
		var re = null;
		switch (fc) {
		case '#':
			re = /\d| /; break;
		case '9':
			re = /\d/; break;
		case 'X':
			re = /\w/; break;
		case 'A':
			re = /[A-Za-z]/; break;
		default:
			result += fc;
			continue;
		}
	
		var source = source.substr(si);
		var si = source.search(re);
		if (si == -1) {
			break;
		} else {
			var sc = source.charAt(si);
			if (fc == '#' && sc == '0') {
				sc = ' ';
			}
			result += sc;
			si++;
			if (si >= source.length) {
				break;
			}
		}
	}
	if (reverse) {
	    return result.reverse();
	}
	return result;
  },
  reverse: function() {
    var r = '';
    var i = this.length-1;
    while (i>-1) {
        r += this.charAt(i--);
    }
    return r;
  }
});

/* this block adds padl, padr, ltrim, rtrim and trim
 * methods to all javascript strings and string variables
 * returns the resulting string.
 * the existing string is unmodified
 * var greeting = "Hello World".padl(21).padr(31);
 */
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
  /* this function adds the javascript events
   * to a set of date triplet fields.
   * name = id of hidden field
   * name_mon = month input field
   * name_day = day input field
   * name_year = year input field
   */
  $(name).triplet = $A(['mon', 'day', 'year']);
  $(name).triplet.each( function(part) {
      $(name+"_"+part).onfocus = function() {
        if ("mm/dd/yy".indexOf(this.value) > -1) {
	  this.value = '';
	  this.removeClassName('mask');
	}
      }.bind($(name+"_"+part));
      $(name+"_"+part).onblur = function(part) {
        var mask = part.substr(0,1); mask += mask;
        if (this.value.trim().length == 0 || this.value.padl(2,"0") == "00") {
	  this.value = mask;
	  this.addClassName('mask');
	}
      }.bind($(name+"_"+part),part);

      $(name+"_"+part).onkeyup = function(name,part) {
         // update the hidden field when any field in the triplet changes
         $(name).value = $(name).triplet.map( function( elem ) {
		 return $F(name+"_"+elem).padl(2,'0');
	 }).join("/");
         // if we have two characters in the currently selected field
	 // then set the focus to the next field in the triplet
	 if (this.value.length > 1) {
	   var next = $(name).triplet.indexOf(part)+1;
	   if ( next < 3 ) {
	     $(name+'_'+$(name).triplet[next]).focus();
	   }
	 }
      }.bind($(name+"_"+part),name,part);
  });
}
