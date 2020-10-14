// 01_ezFirstFolderAfterDomainNameFromHref.js

function _ezFirstFolderAfterDomainNameFromHref(hRef) {
	var i = -1;
	var fName = '';
	var domainAR = -1;
	hRef = ((!!hRef) ? hRef : '');
	var hRefAR = hRef.split('/');
	for (i = 0; i < hRefAR.length; i++) {
		domainAR = hRefAR[i].split('.');
		if ( (domainAR.length > 2) && ((i + 1) < hRefAR.length) ) {
			fName = hRefAR[i + 1];
			break;
		}
	}
	return fName;
}
