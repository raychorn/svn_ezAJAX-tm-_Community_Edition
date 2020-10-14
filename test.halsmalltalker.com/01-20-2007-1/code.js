browser_is_ff = ((!/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent) && !/Netscape/i.test(navigator.userAgent)) && /Gecko/i.test(navigator.userAgent) && /Firefox/i.test(navigator.userAgent));
browser_is_ie = (/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent) && !/Gecko/i.test(navigator.userAgent) && !/Netscape/i.test(navigator.userAgent) && !/Firefox/i.test(navigator.userAgent) );
browser_is_ns = ((!/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent) && !/Firefox/i.test(navigator.userAgent)) && /Gecko/i.test(navigator.userAgent) && /Netscape/i.test(navigator.userAgent));
browser_is_op = ((!/msie/i.test(navigator.userAgent) && /opera/i.test(navigator.userAgent) && !/Firefox/i.test(navigator.userAgent) && !/Gecko/i.test(navigator.userAgent) && !/Netscape/i.test(navigator.userAgent)));

/*
onerror = function(errorMessage, url, line) {
	var msg = '';
	msg = "There was an error on this page.\n\n";
	msg += "An internal programming error may keep ";
	msg += "this page from displaying properly.\n\n";
	msg += "Click OK to continue.\n\n";
	msg += "Error message: " + errorMessage + "\n";
	msg += "URL: " + url + "\n";
	msg += "Line #: " + line;
	alert(msg);
	return true;
};
*/

var const_function_symbol = 'function';
var const_object_symbol = 'object';

var _db = '';

var bool_ezObjectExplainer_insideObject_stack = [];
var bool_ezObjectExplainer_insideObject_cache = [];

function ezObjectExplainer(obj, oFunc, _cnt) {
	var _db = '';
	var m = -1;
	var i = -1;
	var a = [];
	var cnt = ((_cnt == null) ? '1' : _cnt.toString() + '.0');
	
	function isCntComplex(c) {
		return (c.toString().indexOf('.') > -1);
	}
	
	_db = '';
	if ( (obj.toString != null) && ((typeof obj.toString) == const_function_symbol) && (obj.toString.toString().toLowerCase().indexOf('[native code]') == -1) ) {
		_db += obj.toString();
	} else {
		if ( (obj != null) && ((typeof obj) == const_object_symbol) ) {
			if (obj.length != null) {
			    for (i = 0; i < obj.length; i++) {
					if ( ((typeof oFunc) == const_function_symbol) || (oFunc(obj[i])) ) {
						a.push('[' + obj[i] + ']');
					}
			    }
			} else {
				for (m in obj) {
					if ((typeof obj[m]) == const_object_symbol) {
						a.push(m + ' = [' + ezObjectExplainer(obj[m], oFunc, cnt) + ']');
					} else if ( ((typeof oFunc) == const_function_symbol) || (oFunc(obj[m])) ) {
						a.push(m + ' = [' + obj[m] + ']');
					}
				}
			}
			_db += a.join(((isCntComplex(cnt)) ? ',' : '\n'));
		} else if ( ((typeof oFunc) == const_function_symbol) || (oFunc(obj)) ) {
			_db += obj + '\n';
		}
	}
	return _db;
}

function  getStylesBeginningWith(_targetSelector, func) {
	var s = [];
	var i = -1;
	var j = -1;
	var r = -1;
	var l = -1;
	var css = -1;
	for (i = 0; i < document.styleSheets.length; i++) {
		css = document.styleSheets[i].cssRules;
		if (css == null) {
			css = document.styleSheets[i].rules;
		}
		l = css.length;
		for (j = 0; j < css.length; j++) {
			if (css[j].selectorText.toUpperCase().indexOf(_targetSelector.toUpperCase()) != -1) {
				s.push(css[j].style);
				if ((typeof func) == const_function_symbol) {
					func(css[j], css[j].selectorText, s);
				}
			}
		}
	}
	return s;
}

function  getSpecificStyles(_targetSelector) {
	var s = [];
	
	function aggregateStylesFunc(oStyle, selectorText, array) {
		s.push(selectorText);
	}

	s = getStylesBeginningWith(_targetSelector, aggregateStylesFunc);
	return s;
}

function setSpecificStyles(_targetSelector, styleName, sVal) {
	var s = [];
	
	function setStylesFunc(oStyle, selectorText, array) {
		oStyle.style[styleName] = sVal;
	}

	s = getStylesBeginningWith(_targetSelector, setStylesFunc);
	return s;
}

if (!browser_is_ie) {
	setSpecificStyles('.ColumnBottom', 'marginTop', '89%');
}

