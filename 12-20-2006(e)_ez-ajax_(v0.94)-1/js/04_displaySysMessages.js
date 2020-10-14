var _div_sysMessages = 'div_sysMessages_' + ezUUID$();

function initDisplaySysMessages() {
	var html = '';
	var oO = _$(_div_sysMessages);

	if (oO == null) {
		html += '<div id="' + _div_sysMessages + '" style="display: none;">';
		html += '<table width="*" border="1" cellspacing="-1" cellpadding="-1" bgcolor="#FFFF80">';
		html += '<tr>';
		html += '<td>';
		html += '<table width="*" cellspacing="-1" cellpadding="-1">';
		html += '<tr id="div_sysMessages_titleBar_tr" bgcolor="silver">';
		html += '<td align="center">';
		html += '<span id="span_sysMessages_title" class="boldPromptTextClass"></span>';
		html += '</td>';
		html += '<td align="right">';
		html += '<button class="buttonClass" title="Click this button to dismiss this pop-up." onclick="dismissSysMessages(); return false;">[X]</button>';
		html += '</td>';
		html += '</tr>';
		html += '<tr>';
		html += '<td colspan="2">';
		html += '<div id="div_sysMessages_body"></div>';
		html += '<span id="span_sysMessages_body" class="textClass"><textarea id="textarea_sysMessages_body" class="codeSmaller" readonly style="width: 800px; height: 500px;"></textarea></span>';
		html += '</td>';
		html += '</tr>';
		html += '</table>';
		html += '</td>';
		html += '</tr>';
		html += '</table>';
		html += '</div>';
	
		document.write(html);
	}
}

function _displaySysMessages(s, t, bool_hideShow, taName, useHTML) {
	var cObj = _$(_div_sysMessages);
	var tObj = _$('span_sysMessages_title');
	var sObj = _$('span_sysMessages_body');
	var tbObj = _$('div_sysMessages_titleBar_tr');
	var taObj = _$(taName);
	var s_ta = '';
	s = ((s == null) ? '' : s);
	t = ((t == null) ? '' : t);
	useHTML = ((useHTML == true) ? useHTML : false);
	if ( (!!cObj) && (!!sObj) && (!!tObj) && (!!tbObj) ) {
		bool_hideShow = ((bool_hideShow == true) ? bool_hideShow : false);
		tbObj.bgColor = (((t.ezTrim().toUpperCase() == const_debug_symbol.ezTrim().toUpperCase()) || (t.ezTrim().toUpperCase() != const_error_symbol.ezTrim().toUpperCase())) ? 'silver' : 'red');

		if ( (s.length > 0) && (t.length > 0) ) {
			if (typeof showAlertMessageCallback == const_function_symbol) {
				try { showAlertMessageCallback(); } catch(e) {} finally { }
			}
		} else {
			if (typeof dismissAlertMessageCallback == const_function_symbol) {
				try { dismissAlertMessageCallback(); } catch(e) {} finally { }
			}
		}
		
		try {
			if ( ((typeof cObj) == const_object_symbol) && (cObj.length) ) {
				cObj = cObj[0];
			}
		} catch(e) { } finally { }

		try {
			if ( ((typeof taObj) == const_object_symbol) && (taObj.length) ) {
				taObj = taObj[0];
			}
		} catch(e) { } finally { }

		cObj.style.width = (ezClientWidth() - 35) + 'px';
		cObj.style.height = (ezClientHeight() - 75) + 'px';
		cObj.style.zIndex = 32767;
		
		var dmObj = _$(const_div_floating_debug_menu);
		if ( (!!dmObj) && (dmObj.style.display == const_inline_style) ) {
			var h = parseInt(dmObj.style.height) * 2;
			cObj.style.top = (h + 5) + 'px';
			cObj.style.height = (parseInt(cObj.style.height) - (h + 5)) + 'px';
		}

		var dObj = _$('div_sysMessages_body');
		if ( (useHTML) && (!!dObj) ) {
			s_ta = dObj.innerHTML;
			dObj.innerHTML = s_ta + s;
			dObj.style.display = const_inline_style;
		} else {
			if (!!dObj) {
				dObj.innerHTML = '';
				dObj.style.display = const_none_style;
			}
			if (!!taObj) {
				taObj.value += s + '\n';
				taObj.style.width = cObj.style.width;
				taObj.style.height = cObj.style.height;
			}
		}
		if (!!taObj) {
			taObj.style.display = ((taObj.value.length == 0) ? const_none_style : const_inline_style);
			if (!bool_hideShow) {
				taObj.value = '';
			}
		}
		tObj.innerHTML = t;
		cObj.style.display = ((bool_hideShow) ? const_inline_style : const_none_style);
		cObj.style.position = const_absolute_style;
		cObj.style.left = 5 + 'px';
		cObj.style.top = document.body.scrollTop + 15 + 'px';
	} else {
		alert('ERROR: Programming Error - Missing ' + ((cObj == null) ? 'cObj = [' + cObj + ']' : '') + ((sObj == null) ? ' sObj = [' + sObj + ']' : '') + ((tObj == null) ? ' tObj = [' + tObj + ']' : '') + ((tbObj == null) ? ' tbObj = [' + tbObj + ']' : ''));
	}
}

function ezDispaySysMessages(s, t) {
	return _displaySysMessages(s, t, true, 'textarea_sysMessages_body');
}

function ezDispayHTMLSysMessages(s, t) {
	return _displaySysMessages(s, t, true, 'textarea_sysMessages_body', true);
}

function ezAlert(s) {
	return ezDispaySysMessages(s, const_debug_symbol);
}

function ezAlertHTML(s) {
	return ezDispayHTMLSysMessages(s, const_debug_symbol);
}

function ezAlertCODE(s) {
	return ezDispaySysMessages(s, 'SOURCE CODE');
}

function dismissSysMessages() {
	return _displaySysMessages('', '', false, 'textarea_sysMessages_body');
}

function ezAlertError(s) {
	return ezDispaySysMessages(s, const_error_symbol);
}

function ezAlertHTMLError(s) {
	return ezDispayHTMLSysMessages(s, const_error_symbol);
}

initDisplaySysMessages();

