function initDisplaySysMessages() {
	var html = '';

	html += '<div id="div_sysMessages" style="display: none;">';
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
	html += '<span id="span_sysMessages_body" class="textClass"></span>';
	html += '</td>';
	html += '</tr>';
	html += '</table>';
	html += '</td>';
	html += '</tr>';
	html += '</table>';
	html += '</div>';

	document.write(html);
}

function _displaySysMessages(s, t, bool_hideShow, taName, useHTML) {
	var cObj = $('div_sysMessages');
	var tObj = $('span_sysMessages_title');
	var sObj = $('span_sysMessages_body');
	var tbObj = $('div_sysMessages_titleBar_tr');
	var taObj = _$(taName);
	var s_ta = '';
	s = ((s == null) ? '' : s);
	t = ((t == null) ? '' : t);
	useHTML = ((useHTML == true) ? useHTML : false);
	if ( (!!cObj) && (!!sObj) && (!!tObj) && (!!tbObj) ) {
		bool_hideShow = ((bool_hideShow == true) ? bool_hideShow : false);
		s_ta = ((useHTML) ? sObj.innerHTML : ((!!taObj) ? taObj.value : ''));
		tbObj.bgColor = (((t.ezTrim().toUpperCase() == const_debug_symbol.ezTrim().toUpperCase()) || (t.ezTrim().toUpperCase() != const_error_symbol.ezTrim().toUpperCase())) ? 'silver' : 'red');
		ezFlushCache$(sObj);

		if ( (s.length > 0) && (t.length > 0) ) {
			if (typeof showAlertMessageCallback == const_function_symbol) {
				try { showAlertMessageCallback(); } catch(e) {} finally { }
			}
		} else {
			if (typeof dismissAlertMessageCallback == const_function_symbol) {
				try { dismissAlertMessageCallback(); } catch(e) {} finally { }
			}
		}
		
		cObj.style.width = (ezClientWidth() - 30) + 'px';
		cObj.style.height = (ezClientHeight() - 50) + 'px';
		cObj.style.zIndex = 32767;

		sObj.innerHTML = ((useHTML) ? ((s.length > 0) ? s_ta + '\n' : '') + s : '<textarea id="' + taName + '" class="codeSmaller" readonly style="width: ' + cObj.style.width + '; height: ' + cObj.style.height + ';">' + ((s.length > 0) ? s_ta + '\n' : '') + s + '</textarea>');
		if (taObj == null) {
			taObj = _$(taName);
			if ( (!!taObj) && (taObj.value.length == 0) ) {
				taObj.style.display = const_none_style;
			}
		}
		ezFlushCache$(tObj);
		tObj.innerHTML = t;
		cObj.style.display = ((bool_hideShow) ? const_inline_style : const_none_style);
		cObj.style.position = const_absolute_style;
		cObj.style.left = 5 + 'px';
		cObj.style.top = document.body.scrollTop + 15 + 'px';
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
	return ezDispayHTMLSysMessages(s, const_error_symbol);
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

