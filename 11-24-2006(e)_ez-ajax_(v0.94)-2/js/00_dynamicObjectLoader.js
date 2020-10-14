var global_previouslyLoadedObjects = '';
var isGlobalErrorMessageIssued = false;

function ezDynamicObjectLoader() {
	var i = -1;
	var file = '';
	var fileObj = -1;
	try {
		for (i = 0; i < arguments.length; i++) {
			file = arguments[i];
			fileObj = -1;
			if (global_previouslyLoadedObjects.indexOf(file) == -1) { 
				if (file.indexOf(".css") != -1) {
					fileObj = document.createElement("link");
					fileObj.setAttribute("rel", "stylesheet");
					fileObj.setAttribute("type", "text/css");
					fileObj.setAttribute("href", file);
				} else {
					fileObj = document.createElement('script');
					fileObj.setAttribute("type","text/javascript");
					fileObj.setAttribute("src", file);
				}
				if ((typeof fileObj) == const_object_symbol) {
					document.getElementsByTagName("head").item(0).appendChild(fileObj);
					var ar = global_previouslyLoadedObjects.split(',');
					ar.push(file);
					global_previouslyLoadedObjects = ar.join(',');
				}
			}
		}
	} catch(e) { if (!isGlobalErrorMessageIssued) { alert('ERROR: Programming Error - The ezDynamicObjectLoader function may not be compatible with your browser.'); isGlobalErrorMessageIssued = true; }; } finally { };
}
