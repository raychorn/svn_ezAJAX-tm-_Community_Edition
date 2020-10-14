ezAJAXObj = function(id){
	this.id = id;				
};

ezAJAXObj.$ = [];

ezAJAXObj.get$ = function() {
	var instance = ezAJAXObj.$[ezAJAXObj.$.length];
	if (instance == null) {
		instance = ezAJAXObj.$[ezAJAXObj.$.length] = new ezAJAXObj(ezAJAXObj.$.length);
	}
	return instance;
};

ezAJAXObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezAJAXObj.$.length) ) {
		var instance = ezAJAXObj.$[id];
		if (!!instance) {
			ezAJAXObj.$[id] = ezObjectDestructor(instance);
			ret_val = (ezAJAXObj.$[id] == null);
		}
	}
	return ret_val;
};

ezAJAXObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezAJAXObj.$.length; i++) {
		ezAJAXObj.remove$(i);
	}
	return ret_val;
};

ezAJAXObj.prototype = {
	id : -1,
	data : [],
	names : [],
	toString : function() {
		function toStr(a, d) {
			var s = '[';
			var i = -1;
			var aName = '';

			try {
				var n = a.length;
				for (i = 0; i < n; i++) {
					aName = a[i];
					s += aName + " = \{" + d[aName].toString() + "\}" + '\n';
				}
			} catch(e) {
			} finally {
			}

			s += ']';
			return s;
		}
		var s = 'id = [' + this.id + '], ' + toStr(this.names, this.data);
		return s;
	},
	init : function() {
		this.names = [];
		this.data = [];
		return this;
	},
	push : function(aName, datum) {
		this.names.push(aName);
		this.data[aName] = datum;
	},
	pop : function() {
		var aName = this.names.pop();
		return this.data[aName];
	},
	named : function(aName) {
		return this.data[aName];
	},
	destructor : function() {
		return (this.id = ezAJAXObj.$[this.id] = this.data = this.names = null);
	}
};

