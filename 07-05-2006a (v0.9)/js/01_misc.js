// misc.js

function ezHex(ch) {
	var HEX = "0123456789ABCDEF";

	function _intAsHex(i) {
		if (i != null) {
		    var ii = i & 0xFF;
			return HEX.charAt((ii >> 4) & 0xF) + HEX.charAt(ii & 0xF);
		}
		return '';
	};

	if (typeof ch == const_string_symbol) {
	    var charCode = ch.charCodeAt(0) & 0xFF;
		return HEX.charAt((charCode >> 4) & 0xF) + HEX.charAt(charCode & 0xF);
	} else if (typeof ch == const_number_symbol) {
		return _intAsHex(ch);
	}
	return ch;
}

function ezColorHex(cVal) {
	var x1 = (cVal & 0xff0000) >> 16;
	var x2 = (cVal & 0x00ff00) >> 8;
	var x3 = cVal & 0x0000ff;
	return ezHex(x1) + ezHex(x2) + ezHex(x3);
}

