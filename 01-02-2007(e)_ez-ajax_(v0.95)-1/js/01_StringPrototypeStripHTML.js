function ezStripHTML() {
	var s = null;
	s = this.replace(/(<([^>]+)>)/ig,"");
	s = s.replace(/(&([^;]+);)/ig,"");
	return s;
}

String.prototype.ezStripHTML = ezStripHTML;

