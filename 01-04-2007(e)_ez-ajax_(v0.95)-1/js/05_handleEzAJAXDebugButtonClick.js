// 05_handleEzAJAXDebugButtonClick.js

function isContentShownForEzAJAXDebugButtonClick() {
	var cObj = _$('td_ajaxHelperPanel'); 
	if (!!cObj) { 
		return (cObj.style.display == const_inline_style);
	}
	return false;
}

function hideContentForEzAJAXDebugButtonClick() {
	var cObj = _$('td_ajaxHelperPanel'); 
	if (!!cObj) { 
		cObj.style.display = ((cObj.style.display == const_none_style) ? const_inline_style : const_none_style);
		cObj.style.top = '0px';
		return cObj.style.display;
	}
	return -1;
}

function buttonLabelForEzAJAXDebugButtonClick(dispValue) {
	var serverName = ezFullyQualifiedAppPrefix();
	var bObj = _$('btn_helperPanel'); 
	if (!!bObj) { 
		bObj.src = (((typeof serverName) == const_string_symbol) ? serverName : '') + ((dispValue == const_inline_style) ? '/images/prev.gif' : '/images/next.gif');
	}
}

function handleEzAJAXDebugButtonClick(_oAJAXEngine) {
	var d = hideContentForEzAJAXDebugButtonClick();
	buttonLabelForEzAJAXDebugButtonClick(d);
	if (d == const_inline_style) { 
		try { _oAJAXEngine.setDebugMode(); } catch(e) { } finally { };
	} else { 
		try { _oAJAXEngine.setReleaseMode(); } catch(e) { } finally { };
	}
	if (isContentShownForAjaxHelper2ButtonClick()) {
		buttonLabelForAjaxHelper2ButtonClick(hideContentForAjaxHelper2ButtonClick());
	}
	handleEzAJAXUseXmlHttpRequestButtonClick(_$('btn_useXmlHttpRequest'), oAJAXEngine, true);
}
