// 05_handle_ajaxHelper2_onClick.js

function isContentShownForAjaxHelper2ButtonClick() {
	var cObj = _$('td_ajaxHelperPanel2'); 
	if (!!cObj) { 
		return (cObj.style.display == const_inline_style);
	}
	return false;
}

function hideContentForAjaxHelper2ButtonClick() {
	var cObj = _$('td_ajaxHelperPanel2'); 
	if (!!cObj) { 
		cObj.style.display = ((cObj.style.display == const_none_style) ? const_inline_style : const_none_style);
		return cObj.style.display;
	}
	return -1;
}

function buttonLabelForAjaxHelper2ButtonClick(dispValue) {
	var serverName = ezFullyQualifiedAppPrefix();
	var bObj = _$('btn_helperPanel2'); 
	if (!!bObj) { 
		bObj.src = (((typeof serverName) == const_string_symbol) ? serverName : '') + ((dispValue == const_inline_style) ? '/images/prev.gif' : '/images/next.gif');
	}
}

function _handle_ajaxHelper2_onClick() {
	var tbObj = _$('table_ajaxHelperPanel2');
	if (!!tbObj) { 
		buttonLabelForAjaxHelper2ButtonClick(hideContentForAjaxHelper2ButtonClick());
		if (isContentShownForEzAJAXDebugButtonClick()) {
			buttonLabelForEzAJAXDebugButtonClick(hideContentForEzAJAXDebugButtonClick());
		}
	}
}

