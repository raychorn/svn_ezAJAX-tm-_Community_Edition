// 01_ezURLPrefixFromHref.js

function ezURLPrefixFromHref(hRef) {
	hRef = ((!!hRef) ? hRef : '');
	var hRefAR = hRef.split('/');
	hRefAR[hRefAR.length - 1] = '';
	return hRefAR.join('/');
}
