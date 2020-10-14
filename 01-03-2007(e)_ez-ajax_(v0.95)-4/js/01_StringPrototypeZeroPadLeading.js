function zeroPadLeading(num) {
	var s = '';
	num = ((!!num) ? num : this.length);
	var i = Math.max(this.length, num) - Math.min(this.length, num);
	for (; i > 0; i--) {
		s += '0';
	}
	return (s + this);
}

String.prototype.ezZeroPadLeading = zeroPadLeading;
