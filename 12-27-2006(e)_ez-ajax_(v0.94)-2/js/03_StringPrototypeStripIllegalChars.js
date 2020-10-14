function ezStripIllegalChars() {
	return this.ezURLEncode(); 
}

String.prototype.ezStripIllegalChars = ezStripIllegalChars;

