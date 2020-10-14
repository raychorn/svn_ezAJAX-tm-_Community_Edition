// ezJSON.js

ezJSON = function(id, _url) {
	this.id = id;				
	this._url = _url;
	this.noCacheIE = '&noCacheIE=' + (new Date()).getTime();
	this.headLoc = document.getElementsByTagName("head").item(0);
	this.scriptId = 'YJscriptId' + (ezJSON.$.length + 1);
	this.addScriptTag();
};

ezJSON.$ = [];

ezJSON.get$ = function(_url) {
	var instance = ezJSON.$[ezJSON.$.length];
	if (instance == null) {
		instance = ezJSON.$[ezJSON.$.length] = new ezJSON(ezJSON.$.length, _url);
	}
	return instance;
};

ezJSON.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezJSON.$.length) ) {
		var instance = ezJSON.$[id];
		if (!!instance) {
			ezJSON.$[id] = ezObjectDestructor(instance);
			ret_val = (ezJSON.$[id] == null);
		}
	}
	return ret_val;
};

ezJSON.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezJSON.$.length; i++) {
		ezJSON.remove$(i);
	}
	return ret_val;
};

ezJSON.prototype = {
	id : -1,
	_url : -1,
	noCacheIE : -1,
	headLoc : -1,
	scriptId : -1,
	toString : function() {
		var _toString = 'ezJSON(' + this.id + ') :: \n' + 'url = (' + this._url + ')\n' + 'noCacheIE = (' + this.noCacheIE + ')\n' + 'headLoc = (' + this.headLoc + ')\n' + 'scriptId = (' + this.scriptId + ')\n' + 'scriptObj = (' + this.scriptObj + ')\n';
		return _toString;
	},
	buildScriptTag : function() {
		this.scriptObj = document.createElement("script");
		this.scriptObj.setAttribute("type", "text/javascript");
		this.scriptObj.setAttribute("src", this._url + this.noCacheIE);
		this.scriptObj.setAttribute("id", this.scriptId);
	},
	removeScriptTag : function() {
		if ((typeof this.scriptObj) == const_object_symbol) {
			try { this.headLoc.removeChild(this.scriptObj); } catch (e) { };
			this.scriptObj = null;
		}
	},
	addScriptTag : function() {
		if ((typeof this.scriptObj) != const_object_symbol) {
			this.buildScriptTag();
		}
		try { this.headLoc.appendChild(this.scriptObj); } catch (e) { };
	},
	destructor : function() {
		if ((typeof this.scriptObj) == const_object_symbol) {
			this.removeScriptTag();
		}
		return (this.id = ezJSON.$[this.id] = this._url = this.noCacheIE = this.headLoc = this.scriptId = this.scriptObj = null);
	}
};
