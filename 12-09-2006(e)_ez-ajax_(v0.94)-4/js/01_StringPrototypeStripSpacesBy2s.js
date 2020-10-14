function ezStripSpacesBy2s() {
	return this.replace(/\  /ig, "");
}

String.prototype.ezStripSpacesBy2s = ezStripSpacesBy2s;

