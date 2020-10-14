function _ezGetStyle(el, style) {
    var value = '';
	if (!!el) {
		try { value = el.style[ez2CamelCase(style)]; } catch(e) { } finally { };
	   
	    if (!value) {
	        if (typeof document.defaultView == "object") {
	            value = document.defaultView.getComputedStyle(el, "").getPropertyValue(style);
			}
	        else if (el.currentStyle) {
	            value = el.currentStyle[ez2CamelCase(style)];
			}
		}
	}

	return value || "";
}

