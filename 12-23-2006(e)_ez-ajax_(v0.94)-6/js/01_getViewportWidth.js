// 01_getViewportWidth.js

function ezGetViewportWidth() {
	if(window.innerWidth)
		return window.innerWidth - 16;
	if (typeof window.document.documentElement.clientWidth == const_number_symbol)
		return window.document.documentElement.clientWidth;
	return window.document.body.clientWidth;
}

