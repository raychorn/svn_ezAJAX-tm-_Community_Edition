var const_number_symbol = 'number';

function ezUUID$() {
	return (new Date().getTime() + "" + Math.floor(65535 * Math.random()));
}

function ezClientWidth() {
	var _clientWid$ = -1;
	var ta = typeof window.innerWidth;
	if (ta.toUpperCase() == const_number_symbol.toUpperCase()) {
		_clientWid$ = window.innerWidth;
	} else if (document.documentElement && document.documentElement.clientWidth) {
		_clientWid$ = document.documentElement.clientWidth;
	} else if (document.body && document.body.clientWidth) {
		_clientWid$ = document.body.clientWidth;
	}
	return _clientWid$;
}

function ezClientHeight() {
	var _clientHt$ = -1;
	var ta = typeof window.innerHeight;
	if (ta.toUpperCase() == const_number_symbol.toUpperCase()) {
		_clientHt$ = window.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight) {
		_clientHt$ = document.documentElement.clientHeight;
	} else if (document.body && document.body.clientHeight) {
		_clientHt$ = document.body.clientHeight;
	}
	return _clientHt$;
}
function popUpWindowForURL(aURL, winName, aWid, aHt) {
	winName = ((winName == null) ? 'window' + ezUUID$() : winName);
	aWid = ((aWid == null) ? ezClientWidth() - 50 : aWid);
	aHt = ((aHt == null) ? ezClientHeight() - 25 : aHt);
	window.open(aURL,winName,'width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1');
}

