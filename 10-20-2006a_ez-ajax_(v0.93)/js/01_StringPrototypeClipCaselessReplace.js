function ezClipCaselessReplace(keyword, sText) {
	var _ff = this.toUpperCase().indexOf(keyword.toUpperCase());
	if (_ff != -1) {
		return this.ezReplaceSubString(_ff, _ff + keyword.length, sText);
	}

	return this;
}

String.prototype.ezClipCaselessReplace = ezClipCaselessReplace;

