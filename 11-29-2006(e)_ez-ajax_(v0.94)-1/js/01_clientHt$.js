function _ezClientHeight() {
	var _clientHt$ = -1;
	var ta = typeof window.innerHeight;
	if (ta.ezTrim().toUpperCase() == const_number_symbol.ezTrim().toUpperCase()) {
		_clientHt$ = window.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight) {
		_clientHt$ = document.documentElement.clientHeight;
	} else if (document.body && document.body.clientHeight) {
		_clientHt$ = document.body.clientHeight;
	}
	return _clientHt$;
}
