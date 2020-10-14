function _ezFlushCache$(oO) {
	if (!!oO) {
		var els = [];
		try { els = oO.getElementsByTagName("*"); } catch(e) { } finally { };
		ezUnHookAllEventHandlers(oO);
		for (var i = 0; i < els.length; i++) {
			if (els[i].id) {
				$cache[els[i].id] = null;
			}
		}
	}
}
