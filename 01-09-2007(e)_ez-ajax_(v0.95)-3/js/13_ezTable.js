function performDismissTable(divs) {
	var ar = unescape(divs).split('=');
	var aName = ar.pop();
	var cObj = _$(aName);
	if (!!cObj) {
		cObj.style.display = const_none_style;
	}
}

function ezBeginTable(aPrompt, vararg_params) {
	var html = '';

	function injectParmsFrom(d, aKey) {
		var _content = '';
		var _ar = d.getValueFor(aKey);
		if ( (!!_ar) && (typeof _ar == const_object_symbol) ) {
			for (var i = 0; i < _ar.length; i++) {
				if ( (!!_ar[i]) && (typeof _ar[i] == const_string_symbol) ) _content += ' ' + _ar[i].ezURLDecode();
			}
		}
		return _content;
	}
	
	aDict = ezDictObj.get$();
	aDict.bool_returnArray = true;

	if (arguments.length > 1) {
	    for (var i = 1; i < arguments.length; i++) {
			aDict.fromSpec(arguments[i]);
		}
	}
	
	var bool_includeDismissButton = false;
	var bAR = aDict.getValueFor('bool');

	if (!!bAR) {
		for (var j = 0; j < bAR.length; j++) {
			if ( (!!bAR[j]) && (typeof bAR[j] == const_string_symbol) ) {
				var bText = bAR[j].ezURLDecode();
				var pAR = bText.split('=');
				if (pAR.length == 2) if (pAR[0].toUpperCase() == 'includeDismissButton'.toUpperCase()) bool_includeDismissButton = ((pAR[1].toUpperCase() == 'true'.toUpperCase()) ? true : false);
			}
		}
	}

	var dAR = aDict.getValueFor('div');
	dAR = ((!!dAR) ? dAR : '');

	html += '<table' + injectParmsFrom(aDict, 'table') + ' cellpadding="-1" cellspacing="-1">';

	if (!!aPrompt) {
		if (aPrompt.ezTrim().length > 0) {
			html += '<tr' + injectParmsFrom(aDict, 'tr') + '>';
			html += '<td' + injectParmsFrom(aDict, 'td') + '>';
			if (bool_includeDismissButton) {
				html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
				html += '<tr>';
				html += '<td width="80%" align="center">';
			}
			html += '<span' + injectParmsFrom(aDict, 'span') + '>';
			html += aPrompt;
			html += '</span>';
			if (bool_includeDismissButton) {
				html += '</td>';
				html += '<td width="*" align="right">';
				html += '<button class="buttonMenuClass" onclick="performDismissTable(\'' + dAR + '\'); return false;">[X]</button>';
				html += '</td>';
				html += '</tr>';
				html += '</table>';
			}
			html += '</td>';
			html += '</tr>';
		}
	}

	ezDictObj.remove$(aDict.id);
	return html;
}

function ezEndTable() {
	return '</table>';
}

