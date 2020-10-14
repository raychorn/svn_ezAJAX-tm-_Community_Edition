function ezFlushCache$(oO) {
	if (!!oO) {
		var els = oO.getElementsByTagName("*");
		ezUnHookAllEventHandlers(oO);
		for (var i = 0; i < els.length; i++) {
			if (els[i].id) {
				$cache[els[i].id] = null;
			}
		}
	}
}
