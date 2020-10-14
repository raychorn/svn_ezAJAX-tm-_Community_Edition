function _ezSimulateCheckBoxClick(id) {
	var cObj = $(id);
	if (!!cObj) {
		cObj.checked = ((cObj.checked) ? false : true);
		if (typeof cObj.onclick == const_function_symbol) cObj.onclick();
	}
}

