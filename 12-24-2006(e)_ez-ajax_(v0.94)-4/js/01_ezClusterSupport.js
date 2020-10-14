// ezClusterSupport.js

function ezFilePath2HrefUsingCommonFolder(fPath, hRef, commonFolder) {
	fPath = ((!!fPath) ? fPath : '');
	hRef = ((!!hRef) ? hRef : '');
	commonFolder = ((!!commonFolder) ? commonFolder : '');
	var _commonFolderF = '\\' + commonFolder + '\\';
	var _commonFolderH = '/' + commonFolder;
	var newHref = '';
	var newHrefAR = [];
	var i = -1;
	var k = -1;
	if ( (fPath.toUpperCase().indexOf(_commonFolderF.toUpperCase()) > -1) && (hRef.toUpperCase().indexOf(_commonFolderH.toUpperCase()) > -1) ) {
		var hRefAR = hRef.split('/');
		var fPathAR = fPath.split('\\');
		for (i = 0; i < hRefAR.length; i++) {
			newHrefAR.push(hRefAR[i]);
			if (hRefAR[i].toUpperCase() == commonFolder.toUpperCase()) {
				break;
			}
		}
		for (k = 0; k < fPathAR.length; k++) {
			if (fPathAR[k].toUpperCase() == commonFolder.toUpperCase()) {
				k++;
				break;
			}
		}
		for (; k < fPathAR.length; k++) {
			newHrefAR.push(fPathAR[k]);
		}
		newHref = newHrefAR.join('/');
	}
	return newHref;
}
		
