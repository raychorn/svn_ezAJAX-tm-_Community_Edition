function ezObjectExplainer(obj) {
	var _db = '';
	var m = -1;
	var i = -1;
	var a = [];
	var cnt = 1;
	
	_db = '';
	if ( (!!obj) && (typeof obj == const_object_symbol) ) {
		if (!!obj.length) {
		    for (i = 0; i < obj.length; i++) {
				a.push(cnt++ + ' :: ' + 'obj[' + i + '] = [' + obj[i] + ']');
		    }
		} else {
			for (m in obj) {
				if ((typeof obj[m]) == const_object_symbol) {
					a.push(cnt++ + ' :: ' + m + ' = [' + ezObjectExplainer(obj[m]) + ']');
				} else {
					a.push(cnt++ + ' :: ' + m + ' = [' + obj[m] + ']');
				}
			}
		}
		_db += a.join('\n');
	} else {
		_db += cnt++ + ' :: ' + obj + '\n';
	}
	return _db;
}

