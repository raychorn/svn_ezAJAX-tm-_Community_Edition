// 01_getScrollLeft.js

function getScrollLeft() {
	if (typeof window.pageXOffset == const_number_symbol)
		return window.pageXOffset;
	if (document.documentElement.scrollLeft)
		return Math.max(document.documentElement.scrollLeft,document.body.scrollLeft);
	else if (document.body.scrollLeft != null)
		return document.body.scrollLeft;
	return 0;
}

