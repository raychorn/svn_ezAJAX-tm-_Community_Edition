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
				a.push(cnt++ + ' :: ' + m + ' = [' + obj[m] + ']');
			}
		}
		_db += a.join('\n');
	} else {
		_db += cnt++ + ' :: ' + obj + '\n';
	}
	_db += '\n';
	return _db;
}

