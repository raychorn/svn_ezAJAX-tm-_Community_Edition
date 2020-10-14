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
function popUpWindowForURL(aURL, winName, aWid, aHt, opts) {
	winName = ((winName == null) ? 'window' + ezUUID$() : winName);
	var mWid = ezClientWidth() - 50;
	aWid = ((aWid == null) ? mWid : aWid);
	var mHt = ezClientHeight() - 25;
	aHt = ((aHt == null) ? mHt : aHt);
	opts = ((opts == null) ? '' : ',' + opts);
	window.open(aURL,winName,'width=' + Math.min(aWid, mWid) + ',height=' + Math.min(aHt, mHt) + ',resizeable=yes,scrollbars=1' + opts);
}

