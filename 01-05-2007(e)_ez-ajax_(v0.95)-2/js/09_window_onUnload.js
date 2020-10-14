function window_onUnload() {
	// BEGIN: Clean-Up any Objects that are still laying about to ensure there are no memory leaks in case there were any closures...

	try {
		if ((typeof ezAnchorPosition) == const_object_symbol)
			ezAnchorPosition.remove$s();
		if ((typeof ezDictObj) == const_object_symbol)
			ezDictObj.remove$s();
		if ((typeof ezAJaxContextObj) == const_object_symbol)
			ezAJaxContextObj.remove$s();
		if ((typeof ezAJAXObj) == const_object_symbol)
			ezAJAXObj.remove$s();
		if ((typeof ezGUIActsObj) == const_object_symbol)
			ezGUIActsObj.remove$s();
		if ((typeof QObj) == const_object_symbol)
			QObj.remove$s();
		if ((typeof ezAJAXEngine) == const_object_symbol)
			ezAJAXEngine.remove$s();
		if ((typeof ezTabsObj) == const_object_symbol)
			ezTabsObj.remove$s();
		if ((typeof ezGeonosisObj) == const_object_symbol)
			ezGeonosisObj.remove$s();
		if ((typeof ezJSON) == const_object_symbol)
			ezJSON.remove$s();
		if ((typeof ezFishEyeMenuObj) == const_object_symbol)
			ezFishEyeMenuObj.remove$s();
		if ((typeof ezShoppingCartObj) == const_object_symbol)
			ezShoppingCartObj.remove$s();
	} catch (e) { };
	// END! Clean-Up any Objects that are still laying about to ensure there are no memory leaks in case there were any closures...

	try {
		if (!!ezWindowOnUnloadCallback) {
			if (typeof ezWindowOnUnloadCallback == const_function_symbol) ezWindowOnUnloadCallback();
		}
	} catch(e) { } finally { };
}

