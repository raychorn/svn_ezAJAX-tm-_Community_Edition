function _ezSetStyle(aStyle, styles) {
	try {
		var a = styles.split(';');
		for (var i = 0; i < a.length; i++) {
			var b = a[i].ezTrim().split(':');
			if (b.length == 2) {
				aStyle[b[0].ezTrim()] = b[1].ezTrim();
			}
		}
	} catch(e) {
	} finally {
	}
}

