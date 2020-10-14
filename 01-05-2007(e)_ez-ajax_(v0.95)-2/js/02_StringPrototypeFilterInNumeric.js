function ezFilterInNumeric() {
	var _ch = '';
	var t = '';
	for (var i = 0; i < this.length; i++) {
		_ch = this.substr(i, 1);
		if (_ch.ezIsNumeric()) {
			t += _ch;
		}
	}
	return t;
}

String.prototype.ezFilterInNumeric = ezFilterInNumeric;

