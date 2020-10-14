var global_reposition_stack = [];
var global_reposition_cache = [];

function repositionBasedOnFloatingDebugPanel(oObj) {
	var dObj = $(const_div_floating_debug_menu);
	if (!!dObj) {
		oObj.style.position = dObj.style.position;
		oObj.style.top = ((dObj.style.top.length == 0) ? 0 : parseInt(dObj.style.top)) + 'px';
		oObj.style.left = '100px';
		oObj.style.width = (clientWid$() - 175) + 'px';

		if (global_reposition_cache[oObj.id] == null) {
			global_reposition_cache[oObj.id] = oObj;
			global_reposition_stack.push(oObj.id);
		}
	}
}

window.onscroll = function () {
	var cObj = $('div_sysMessages');
	if (!!cObj) {
		cObj.style.position = const_absolute_style;
		cObj.style.top = document.body.scrollTop + 15 + 'px';
	}
	var cObj = $('iframe_showAJAXBegins');
	if (!!cObj) {
		cObj.style.position = const_absolute_style;
		cObj.style.top = document.body.scrollTop + 0 + 'px';
	}

	var bool_isDebugPanelRepositionable = false;
	try {
		if (!!windowOnscrollCallback) {
			if (typeof windowOnscrollCallback == const_function_symbol) {
				bool_isDebugPanelRepositionable = windowOnscrollCallback(document.body.scrollTop, document.body.scrollLeft);
				bool_isDebugPanelRepositionable = ((bool_isDebugPanelRepositionable == true) ? bool_isDebugPanelRepositionable : false);
			}
		}
	} catch(e) { } finally { };

	if (bool_isDebugPanelRepositionable) {
		var dObj = $(const_div_floating_debug_menu);
		if (!!dObj) {
			dObj.style.position = const_absolute_style;
			dObj.style.top = document.body.scrollTop + 15 + 'px';
			dObj.style.left = 0 + 'px';
			
			var i = -1;
			var oo = -1;
			for (i = 0; i < global_reposition_stack.length; i++) {
				oo = global_reposition_cache[global_reposition_stack[i]];
				if (!!oo) {
					repositionBasedOnFloatingDebugPanel(oo);
				}
			}
		}
	}
};


