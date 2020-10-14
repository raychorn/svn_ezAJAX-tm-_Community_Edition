function _ezLabelButtonByObj(bObj, sLabel) {
	if (!!bObj) {
		if (typeof sLabel == const_function_symbol) {
			if (ezAJAXEngine.browser_is_ie) {
				sLabel = sLabel(bObj.value);
			} else if (ezAJAXEngine.browser_is_ff) {
				sLabel = sLabel(bObj.textContent);
			}
		} else {
			sLabel = ((sLabel == null) ? '' : sLabel);
		}
		if (ezAJAXEngine.browser_is_ie) {
			bObj.value = sLabel; 
		} else if (ezAJAXEngine.browser_is_ff) {
			bObj.textContent = sLabel; 
		}
	}
}
