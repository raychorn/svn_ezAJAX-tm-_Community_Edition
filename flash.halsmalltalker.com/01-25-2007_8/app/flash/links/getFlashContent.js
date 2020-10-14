function getFlashContent(id, fName, w, h, _bgcolor, _quality, divStyles) {
	var _html = '';
	id = (((typeof id) == const_string_symbol) ? id : 'undefined_' + ezUUID$());
	fName = (((typeof fName) == const_string_symbol) ? fName : 'undefined_' + ezUUID$());
	w = (((typeof w) == const_number_symbol) ? w : parseInt(w.toString()));
	h = (((typeof h) == const_number_symbol) ? h : parseInt(h.toString()));
	_bgcolor = (((typeof _bgcolor) == const_string_symbol) ? _bgcolor : '##ffffff');
	_quality = (((typeof _quality) == const_string_symbol) ? _quality : 'medium');
	divStyles = (((typeof divStyles) == const_string_symbol) ? ' ' + divStyles : '');
	global_flashDivInFocus = 'div_flashContent_' + id;
	_html += '<div id="' + global_flashDivInFocus + '" style="border: solid thin silver; z-index: 32767;' + divStyles + '"><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=8,0,0,0" width="' + w + '" height="' + h + '" id="' + id + '" align="middle"><param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="' + fName + '?nocache=' + ezUUID$() + '" /><param name="loop" value="false" /><param name="menu" value="false" /><param name="quality" value="' + _quality + '" /><param name="bgcolor" value="' + _bgcolor + '" /><embed src="' + fName + '?nocache=' + ezUUID$() + '" loop="false" menu="false" quality="' + _quality + '" bgcolor="' + _bgcolor + '" width="' + w + '" height="' + h + '" name="' + id + '" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object></div>';
	return _html;
}
