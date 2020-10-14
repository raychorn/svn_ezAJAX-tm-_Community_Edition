// 01_getViewportHeight.js

function ezGetViewportHeight() {
	if (window.innerHeight)
		return window.innerHeight;
	if (typeof window.document.documentElement.clientHeight == const_number_symbol)
		return window.document.documentElement.clientHeight;
	return window.document.body.clientHeight;
}
