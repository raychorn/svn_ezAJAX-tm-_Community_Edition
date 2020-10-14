var _global_clientWidth = clientWid$();

function window_onload() {
	_global_clientWidth = clientWid$();

	try {
		if (!!windowOnLoadCallback) {
			if (typeof windowOnLoadCallback == const_function_symbol) windowOnLoadCallback();
		}
	} catch(e) { } finally { };
}
	
