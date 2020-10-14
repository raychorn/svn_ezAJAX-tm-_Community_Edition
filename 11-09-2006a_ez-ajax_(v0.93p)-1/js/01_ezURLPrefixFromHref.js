// 01_ezURLPrefixFromHref.js

function _ezURLPrefixFromHref(hRef) {
	hRef = ((!!hRef) ? hRef : '');
	var hRefAR = hRef.split('/');
	hRefAR[hRefAR.length - 1] = '';
	return hRefAR.join('/');
}
