function window_onUnload() {
	// BEGIN: Clean-Up any Objects that are still laying about to ensure there are no memory leaks in case there were any closures...

	AnchorPosition.remove$s();
	DictObj.remove$s();
	AJaxContextObj.remove$s();
	AJAXObj.remove$s();
	GUIActsObj.remove$s();
	QObj.remove$s();
	ezAJAXEngine.remove$s();
	// END! Clean-Up any Objects that are still laying about to ensure there are no memory leaks in case there were any closures...

	try {
		if (!!windowOnUnloadCallback) {
			if (typeof windowOnUnloadCallback == const_function_symbol) windowOnUnloadCallback();
		}
	} catch(e) { } finally { };
}

