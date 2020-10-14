ezAJaxContextObj = function(id){
	this.id = id;	
	this.queryString = '';
	this.parmsDict = -1;
	this.argsDict = -1;
};

ezAJaxContextObj.$ = [];

ezAJaxContextObj.get$ = function() {
	var instance = ezAJaxContextObj.$[ezAJaxContextObj.$.length];
	if (instance == null) {
		instance = ezAJaxContextObj.$[ezAJaxContextObj.$.length] = new ezAJaxContextObj(ezAJaxContextObj.$.length);
	}
	return instance;
};

ezAJaxContextObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezAJaxContextObj.$.length) ) {
		var instance = ezAJaxContextObj.$[id];
		if (!!instance) {
			ezAJaxContextObj.$[id] = ezObjectDestructor(instance);
			ret_val = (ezAJaxContextObj.$[id] == null);
		}
	}
	return ret_val;
};

ezAJaxContextObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezAJaxContextObj.$.length; i++) {
		ezAJaxContextObj.remove$(i);
	}
	return ret_val;
};

ezAJaxContextObj.prototype = {
	id : -1,
	queryString : '',
	parmsDict : -1,
	argsDict : -1,
	toString : function() {
		var aKey = -1;
		var s = '\nezAJaxContextObj(' + this.id + ') :: (\n';
		s += 'queryString = [' + this.queryString + ']' + '\n';
		s += 'parmsDict = [' + this.parmsDict + ']' + '\n';
		s += 'argsDict = [' + this.argsDict + ']' + '\n';
		s += ')';
		return s;
	},
	init : function() {
		this.queryString = '';
		try { this.parmsDict.destructor(); } catch(e) { } finally {	};
		this.parmsDict = -1;
		try { this.argsDict.destructor(); } catch(e) { } finally { };
		this.argsDict = -1;
		return this;
	},
	destructor : function() {
		try { this.parmsDict.destructor(); } catch(e) {	} finally {	};
		this.parmsDict = -1;
		try { this.argsDict.destructor(); } catch(e) { } finally { };
		return (this.id = ezAJaxContextObj.$[this.id] = this.queryString = this.parmsDict = this.argsDict = null);
	}
};

