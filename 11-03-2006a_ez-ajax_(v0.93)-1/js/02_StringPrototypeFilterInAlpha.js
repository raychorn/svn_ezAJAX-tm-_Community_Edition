function ezFilterInAlpha() {
	var t = '';
	var _ch = '';
	for (var i = 0; i < this.length; i++) {
		_ch = this.substr(i, 1);
		if (_ch.ezIsAlpha()) {
			t += _ch;
		}
	}
	return t;
}

String.prototype.ezFilterInAlpha = ezFilterInAlpha;

