function _ezButtonLabelByObj(btnObj) {
	if (!!btnObj) {
		return ((ezAJAXEngine.browser_is_ff) ? btnObj.textContent : btnObj.value);
	} else {
		alert('ERROR: Programming Error - ezButtonLabelByObj() function requires a valid object pointer for a button however this was not supplied.');
	}
}
