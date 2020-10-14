window.onresize = function () {
	var wid = ezClientWidth();
	var hgt = ezClientHeight();
	_global_clientWidth = wid;

	try {
		if (!!ezWindowOnReSizeCallback) {
			if (typeof ezWindowOnReSizeCallback == const_function_symbol) ezWindowOnReSizeCallback(wid, hgt);
		}
	} catch(e) { } finally { };
}

