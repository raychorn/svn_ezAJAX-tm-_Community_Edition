// 01_ezFullyQualifiedAppPrefix.js

function _ezFullyQualifiedAppPrefix() {
	var ar = window.location.href.split('?');
	var ar2 = ar[0].split('/');
	var _ar = [];
	var sAR = -1;
	var sD = '';
	var aboutToStop = ar2.length - 1;
	var i = -1;
	var j = -1;
	for (i = 0; i < ar2.length; i++) {
		sAR = ar2[i].split('.');
		sD = ar2[i];
		if ( (typeof sAR == const_object_symbol) && (sAR.length > 2) ) {
			var sDAR = [];
			if (sAR.length == 4) sAR[1] = null;
			for (j = 0; j < sAR.length; j++) {
				if (sAR[j] != null) {
					sDAR.push(sAR[j]);
				}
			}
			sD = sDAR.join('.');
			aboutToStop = i + 1;
		}
		_ar.push(sD);
		if (i == aboutToStop) break;
	}
	return _ar.join('/');
}
