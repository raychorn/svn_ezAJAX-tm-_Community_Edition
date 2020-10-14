function ezReplaceSubString(i, j, s) {
	var s = this.substring(0, i) + s + this.substring(j, this.length);
	return s;
}

String.prototype.ezReplaceSubString = ezReplaceSubString;

