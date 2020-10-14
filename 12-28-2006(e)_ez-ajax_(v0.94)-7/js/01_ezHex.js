// 01_ezHex.js

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

