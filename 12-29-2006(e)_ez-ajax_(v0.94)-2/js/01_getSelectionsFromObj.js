function ezSelectionsFromObj(obj) {
	var i = -1;
	var a = [];
	var aa = [];

	try {
		if ( (obj != null) && (obj.selectedIndex != null) && (obj.options.length != null) ) {
			for (i = 0; i <= obj.options.length; i++) {
				try {
					if (obj.options[i].selected == true) {
						aa[aa.length] = obj.options[i].value;
					}
				} catch(e) {
					a.push(ezErrorExplainer(e, 'B. ezSelectionsFromObj', false));
				} finally {
				}
			}
			a[0] = obj.id;
			a[1] = aa;
		}
	} catch(e) {
		a.push(ezErrorExplainer(e, 'A. ezSelectionsFromObj', false));
	} finally {
	}
	return a;
}

