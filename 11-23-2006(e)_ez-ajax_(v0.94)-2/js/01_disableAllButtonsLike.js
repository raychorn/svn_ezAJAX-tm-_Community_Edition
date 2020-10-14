function _ezDisableAllButtonsLike(aName, bool) {
	var els = document.getElementsByTagName("BUTTON");
	bool = ((bool == false) ? false : true);
	for (var i = 0; i < els.length; i++) {
		if (els[i].id.toUpperCase().indexOf(aName.toUpperCase()) != -1) {
			els[i].disabled = bool;
		}
	}
}

