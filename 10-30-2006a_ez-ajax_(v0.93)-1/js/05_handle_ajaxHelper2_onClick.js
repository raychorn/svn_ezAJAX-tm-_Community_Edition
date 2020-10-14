// 05_handle_ajaxHelper2_onClick.js

function _handle_ajaxHelper2_onClick() {
	var serverName = ezFullyQualifiedAppPrefix();
	var cObj = _$('td_ajaxHelperPanel2'); 
	var bObj = _$('btn_helperPanel2'); 
	var tbObj = _$('table_ajaxHelperPanel2');
	if ( (!!cObj) && (!!bObj) && (!!tbObj) ) { 
		cObj.style.display = ((cObj.style.display == const_none_style) ? const_inline_style : const_none_style); 
		bObj.src = serverName + ((cObj.style.display == const_inline_style) ? '/images/prev.gif' : '/images/next.gif');
		if (cObj.style.display == const_inline_style) { 
			tbObj.style.width = _global_clientWidth; 
		}; 
	};
}

