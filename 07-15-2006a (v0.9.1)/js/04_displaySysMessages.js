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
		tbObj.bgColor = ((t.ezTrim().toUpperCase() != const_debug_symbol.ezTrim().toUpperCase()) ? 'red' : 'silver');
		ezFlushCache$(sObj);

		cObj.style.width = (ezClientWidth() - 30) + 'px';
		cObj.style.height = (ezClientHeight() - 50) + 'px';

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
	return ezDispaySysMessages(s, 'DEBUG');
}

function ezAlertHTML(s) {
	return ezDispayHTMLSysMessages(s, 'ERROR');
}

function dismissSysMessages() {
	return _displaySysMessages('', '', false, 'textarea_sysMessages_body');
}

function ezAlertError(s) {
	return ezDispaySysMessages(s, 'ERROR');
}

function ezAlertHTMLError(s) {
	return ezDispayHTMLSysMessages(s, 'ERROR');
}

