function handle_DynamicCodeInitiator_ezAJAXEngine_init() { 
	if (cache_processDynamicCodeTracker[handle_DynamicCodeInitiator_ezAJAXEngine_init] != null) { 
		clearInterval(cache_processDynamicCodeTracker[handle_DynamicCodeInitiator_ezAJAXEngine_init]); 
		cache_processDynamicCodeTracker[handle_DynamicCodeInitiator_ezAJAXEngine_init] = null; 
		stack_processDynamicCodeTracker.pop(); 
	}; 
	try { ezAJAXEngine.init(url_sBasePath, isXmlHttpPreferred); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; 
}; 

function boolIsModuleLoaded_ezAJAXEngine_init() { return true; }; 

ezAJAXEngine_init = function(url_sBasePath, isXmlHttpPreferred) {
	if (global_previouslyLoadedObjects.indexOf('modules=ezAJAXEngine') != -1) { 
		try { ezAJAXEngine.init(url_sBasePath, isXmlHttpPreferred); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; 
	} else { 
		var i = url_sBasePath.toLowerCase().indexOf('/ezAjax/ezAJAX_functions.cfm'.toLowerCase());
		var sP = ((i > -1) ? url_sBasePath.substring(0, i) : url_sBasePath);
		var myURL = sP + '/ezAjax/loader.cfm?out=1&dsr=1&modules=ezAJAXEngine&callback=' + 'try { ezAJAXEngine.init(\'' + url_sBasePath.ezURLEncode() + '\', ' + isXmlHttpPreferred + '); } catch (e) { ezAlertError(ezErrorExplainer(e)); };'.ezURLEncode();
		ezAlert('myURL = [' + myURL + ']');
		ezDynamicObjectLoader(myURL); 
		processDynamicCodeTracker(handle_DynamicCodeInitiator_ezAJAXEngine_init, boolIsModuleLoaded_ezAJAXEngine_init); 
	}
};
