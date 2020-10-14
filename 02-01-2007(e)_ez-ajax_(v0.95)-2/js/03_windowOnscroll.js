window.onscroll = function () {
	try {
		if (typeof ezWindowOnscrollCallback == const_function_symbol) {
			ezWindowOnscrollCallback(document.body.scrollTop, document.body.scrollLeft);
		}
	} catch(e) { alert('ERROR in ezWindowOnscrollCallback().'); }; 
};


