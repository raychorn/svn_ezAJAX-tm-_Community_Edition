function popUpWindowForURL(aURL, winName, aWid, aHt) {
	winName = ((winName == null) ? 'window' + ezUUID$() : winName);
	aWid = ((aWid == null) ? ezClientWidth() - 50 : aWid);
	aHt = ((aHt == null) ? ezClientHeight() - 25 : aHt);
	window.open(aURL,winName,'width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1');
}

