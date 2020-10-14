// 05_handleEzAJAXDebugButtonClick.js

function _handleEzAJAXDebugButtonClick(_oAJAXEngine) {
	var serverName = ezFullyQualifiedAppPrefix();
	var cObj = _$('td_ajaxHelperPanel'); 
	var bObj = _$('btn_helperPanel'); 
	var tbObj = _$('table_ajaxHelperPanel'); 
	if ( (!!cObj) && (!!bObj) && (!!tbObj) ) { 
		cObj.style.display = ((cObj.style.display == const_none_style) ? const_inline_style : const_none_style); 
		bObj.src = serverName + ((cObj.style.display == const_inline_style) ? '/images/prev.gif' : '/images/next.gif');
		if (cObj.style.display == const_inline_style) { 
			tbObj.style.width = _global_clientWidth; 
			try { _oAJAXEngine.setDebugMode(); } catch(e) { } finally { };
		} else { 
			try { _oAJAXEngine.setReleaseMode(); } catch(e) { } finally { };
		}; 
	}; 
}
