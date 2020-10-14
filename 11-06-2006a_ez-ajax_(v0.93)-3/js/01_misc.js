// misc.js

function _ezColorHex(cVal) {
	var x1 = (cVal & 0xff0000) >> 16;
	var x2 = (cVal & 0x00ff00) >> 8;
	var x3 = cVal & 0x0000ff;
	return ezHex(x1) + ezHex(x2) + ezHex(x3);
}

