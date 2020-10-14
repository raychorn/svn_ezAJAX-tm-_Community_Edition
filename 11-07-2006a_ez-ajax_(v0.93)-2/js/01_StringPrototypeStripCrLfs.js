function ezStripCrLfs() {
	return this.replace(/\n/ig, "").replace(/\r/ig, "");
}

String.prototype.ezStripCrLfs = ezStripCrLfs;

