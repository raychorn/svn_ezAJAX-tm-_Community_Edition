var _global_clientWidth = clientWid$();

function window_onload() {
	_global_clientWidth = clientWid$();

	register_AJAX_function("showAJAXEnds();");

	while (_stack_AJAX_functions.length) {
		handle_next_AJAX_function(); // kick-start the process of fetching HTML from the server...
	}

	try {
		if (!!windowOnLoadCallback) {
			if (typeof windowOnLoadCallback == const_function_symbol) windowOnLoadCallback();
		}
	} catch(e) { } finally { };
}
	
