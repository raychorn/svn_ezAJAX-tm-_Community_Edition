function ezRemoveArrayItem(a,i) {
	try {
		var j = a.length;
		for (; i < j; i++) {
			if (a[i] == null) {
				break;
			}
			a[i] = a[i + 1];
		}
		a[a.length - 1] = null;
	} catch (e) { };
}

