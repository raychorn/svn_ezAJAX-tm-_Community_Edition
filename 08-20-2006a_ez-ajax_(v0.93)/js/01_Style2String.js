function ezStyle2String(aStyle) {
	var st = '';
	var i = 0;
	var isError = false;
	for (var s in aStyle) {
		try {
			if (aStyle[s].length > 0) {
				i++;
			}
		} catch(e) {
			isError = true;
			break;
	//		ezAlertError(ezErrorExplainer(e, '101. ezStyle2String()' + ', s = [' + s + ']', false));
		} finally {
		}
	}
	if (!isError) {
		var j = 0;
		for (var s in aStyle) {
			if (aStyle[s].length > 0) {
				st += s + '=' + aStyle[s] + ((j < i) ? ',' : '');
				j++;
			}
		}
	} else {
		st += ezObjectExplainer(aStyle);
	}
	return st;
}
