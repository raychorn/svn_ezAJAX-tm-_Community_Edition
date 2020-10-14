window.onresize = function () {
	var wid = ezClientWidth();
	var hgt = ezClientHeight();
	_global_clientWidth = wid;

	var fixedWidth = 800;
	var _fixedWidth = fixedWidth;
	try {
		if (!!ezWindowOnReSizeCallback) {
			if (typeof ezWindowOnReSizeCallback == const_function_symbol) _fixedWidth = ezWindowOnReSizeCallback(wid, hgt);
		}
	} catch(e) { };
	
	fixedWidth = ((_fixedWidth != null) ? _fixedWidth : fixedWidth);

	try {
		if ((typeof ezTabsObj) == const_object_symbol) {
			var i = -1;
			var oTabsContainer = -1;
			for (i = 0; i < ezTabsObj.$.length; i++) {
				oTabsContainer = ezTabsObj.$[i];
				if (!!oTabsContainer.onReSizeCallback) {
					if (typeof oTabsContainer.onReSizeCallback == const_function_symbol) oTabsContainer.onReSizeCallback(wid, hgt, fixedWidth);
				}
			}
		}
	} catch(e) { };
}

