var _global_clientWidth = ezClientWidth();

function window_onload() {
	_global_clientWidth = ezClientWidth();

	try {
		if (!!ezWindowOnLoadCallback) {
			if (typeof ezWindowOnLoadCallback == const_function_symbol) ezWindowOnLoadCallback();
		}
	} catch(e) { ezAlertError(ezErrorExplainer(e)); };
}
	
