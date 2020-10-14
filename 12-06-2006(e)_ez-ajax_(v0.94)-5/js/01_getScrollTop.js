// 01_getScrollTop.js

function getScrollTop(){
	if (typeof window.pageYOffset == const_number_symbol)
		return window.pageYOffset;
	if (document.documentElement.scrollTop)
		return Math.max(document.documentElement.scrollTop,document.body.scrollTop);
	else if(document.body.scrollTop != null)
		return document.body.scrollTop;
	return 0;
}