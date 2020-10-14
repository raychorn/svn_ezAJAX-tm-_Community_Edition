function window_onUnload() {
	// BEGIN: Clean-Up any Objects that are still laying about to ensure there are no memory leaks in case there were any closures...

	ezAnchorPosition.remove$s();
	ezDictObj.remove$s();
	ezAJaxContextObj.remove$s();
	ezAJAXObj.remove$s();
	ezGUIActsObj.remove$s();
	QObj.remove$s();
	ezAJAXEngine.remove$s();
	ezTabsObj.remove$s();
	// END! Clean-Up any Objects that are still laying about to ensure there are no memory leaks in case there were any closures...

	try {
		if (!!ezWindowOnUnloadCallback) {
			if (typeof ezWindowOnUnloadCallback == const_function_symbol) ezWindowOnUnloadCallback();
		}
	} catch(e) { } finally { };
}

