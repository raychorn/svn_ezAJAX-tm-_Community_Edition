function ezStripTabs(s) {
	s = ((!s) ? '' : s);
	return this.replace(/\t/ig, s);
}

String.prototype.ezStripTabs = ezStripTabs;

