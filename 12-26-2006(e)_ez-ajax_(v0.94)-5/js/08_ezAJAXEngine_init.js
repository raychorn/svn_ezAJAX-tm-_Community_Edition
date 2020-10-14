ezAJAXEngine.init = function(url_sBasePath, isXmlHttpPreferred) {
	var _oAJAXEngine = ezAJAXEngine.get$(url_sBasePath, false); // create the gateway object
	try {
		browser_is_op = _oAJAXEngine.browser_is_op;
		browser_is_ns = _oAJAXEngine.browser_is_ns;
		browser_is_ff = _oAJAXEngine.browser_is_ff;
		browser_is_ie = _oAJAXEngine.browser_is_ie;
		
		_oAJAXEngine.bool_showServerBusyIndicator = true;

		_oAJAXEngine.setMethodGet();
		_oAJAXEngine.setReleaseMode(); // this overrides the oAJAXEngine.set_isServerLocal() setting...

		// The following line of code sets-up the Production environment for a preference for XmlHttpRequest rather than iFrame...
		_oAJAXEngine.isXmlHttpPreferred = ((isXmlHttpPreferred == true) ? isXmlHttpPreferred : false);

		ezAJAXEngine.js_global_varName = 'js$';

		_oAJAXEngine.timeout = 120;
		_oAJAXEngine.hideFrameCallback = function () { };
		_oAJAXEngine.showFrameCallback = function () { };

		if (typeof ezThoughtBubbleObj == const_object_symbol) {
			try { ezThoughtBubbleObj.loadStyles(); } catch (e) { }; // preinitialization to make the first thought bubble appear a bit faster...
		}

		if (!ezAJAXEngine.isBrowserVersionCertified()) {
		}

		if ((typeof window_onload) == const_function_symbol) {
			window.onload = function() {
				try { return window_onload(); } catch (e) { };
			};
		} else {
			alert('WARNING :: window_onload has not been defined - there may be some problems during system initialization.');
		}

		if ((typeof window_onUnload) == const_function_symbol) {
			window.onunload = function() {
				try { return window_onUnload(); } catch (e) { };
			};
		} else {
			alert('WARNING :: window_onUnload has not been defined - there may be some problems during system finalization when the browser closes or the app loses focus.');
		}
	} catch (e) { alert('1.1 Error in ezAJAXEngine.preInit()\n' + ezErrorExplainer(e)); };

	oAJAXEngine = _oAJAXEngine;
	return _oAJAXEngine;
};
