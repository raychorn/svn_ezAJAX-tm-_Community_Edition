var global_previouslyLoadedObjects = '';
var isGlobalErrorMessageIssued = false;

function ezDynamicObjectLoader(vararg_params) {
	var i = -1;
	var file = '';
	var fileObj = -1;
	try {
		var ar = global_previouslyLoadedObjects.split(',');
		for (i = 0; i < arguments.length; i++) {
			file = arguments[i];
			fileObj = -1;
			if (global_previouslyLoadedObjects.indexOf(file) == -1) { 
				if (file.indexOf(".css") != -1) {
					fileObj = document.createElement("link");
					fileObj.rel = 'stylesheet';
					fileObj.type = 'text/css';
					fileObj.href = file;
				} else {
					fileObj = document.createElement('script');
					fileObj.type = 'text/javascript';
					fileObj.src = file;
					fileObj.id = 'ezDynamicObjectLoader.' + ar.length;
					fileObj.setAttribute('class', 'ezDynamicObjectLoader');
				}
				if ((typeof fileObj) == const_object_symbol) {
					document.getElementsByTagName('head')[0].appendChild(fileObj);
					ar.push(file);
					global_previouslyLoadedObjects = ar.join(',');
				}
			}
		}
	} catch(e) { if (!isGlobalErrorMessageIssued) { alert('ERROR: Programming Error - The ezDynamicObjectLoader function may not be compatible with your browser.'); isGlobalErrorMessageIssued = true; }; } finally { };
}

var stack_processDynamicCodeTracker = [];
var cache_processDynamicCodeTracker = [];

function _processDynamicCodeTracker(aNum) { aNum = (((typeof aNum) == const_number_symbol) ? aNum : -1); if (aNum > -1) { return processDynamicCodeTracker(stack_processDynamicCodeTracker[aNum][0], stack_processDynamicCodeTracker[aNum][1]); } };				

function processDynamicCodeTracker(aCallBack, aConditionFunc) {
	var bool = ( ((typeof aCallBack) == const_function_symbol) && ((typeof aConditionFunc) == const_function_symbol) && (aConditionFunc()) && (cache_processDynamicCodeTracker[aCallBack] == null) );
	try {
		if (bool) {
			var ar = [];
			ar.push(aCallBack);
			ar.push(aConditionFunc);
			stack_processDynamicCodeTracker.push(ar);
			cache_processDynamicCodeTracker[aCallBack] = setInterval('_processDynamicCodeTracker(' + (stack_processDynamicCodeTracker.length - 1) + ')', 250);
		} else if ( ((typeof aCallBack) == const_function_symbol) && (aConditionFunc()) && (cache_processDynamicCodeTracker[aCallBack] != null) ) {
			clearInterval(cache_processDynamicCodeTracker[aCallBack]);
			cache_processDynamicCodeTracker[aCallBack] = null;
			stack_processDynamicCodeTracker.pop();
			try { aCallBack(); } catch (e) { alert('1.2 The API Function known as "processDynamicCodeTracker" has failed while processing the Call-Back.\n' + ezErrorExplainer(e)); };
		}
	} catch (e) { alert('1.1 The API Function known as "processDynamicCodeTracker" has failed.\n' + ezErrorExplainer(e)); };
}
