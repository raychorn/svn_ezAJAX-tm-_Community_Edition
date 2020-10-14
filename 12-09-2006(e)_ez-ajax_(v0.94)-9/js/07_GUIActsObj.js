// GUIActsObj.js

ezGUIActsObj = function(id){
	this.id = id;				
	this.stack = [];
	this.ooStack = [];
	this.ooStateCache = [];
	this.aspectStack = [];
	this.stylesStack = [];
};

ezGUIActsObj.$ = [];

ezGUIActsObj.get$ = function() {
	var instance = ezGUIActsObj.$[ezGUIActsObj.$.length];
	if (instance == null) {
		instance = ezGUIActsObj.$[ezGUIActsObj.$.length] = new ezGUIActsObj(ezGUIActsObj.$.length);
	}
	return instance;
};

ezGUIActsObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezGUIActsObj.$.length) ) {
		var instance = ezGUIActsObj.$[id];
		if (!!instance) {
			ezGUIActsObj.$[id] = ezObjectDestructor(instance);
			ret_val = (ezGUIActsObj.$[id] == null);
		}
	}
	return ret_val;
};

ezGUIActsObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezGUIActsObj.$.length; i++) {
		ezGUIActsObj.remove$(i);
	}
	return ret_val;
};

ezGUIActsObj.prototype = {
	id : -1,
	stack : [],
	ooStack : [],
	ooStateCache : [],
	aspectStack : [],
	stylesStack : [],
	buttonsStack : [],
	toString : function() {
		var s = 'id = (' + this.id + ') :: (';
		s += '\n';
		for (var i = 0; i < this.stack.length; i++) {
			s += i + ' = [' + this.stack[i] + ']' + ((i < (this.stack.length - 1)) ? ', ' : '');
		}
		s += ')';
		return s;
	},
	pushButton : function(id) {
		var aHandle = -1;
		var oo = $(id);
		if (!!oo) {
			this.stack.push(id);
			this.ooStack.push(oo);
			this.ooStateCache[id] = oo.disabled;
			oo.disabled = true;
			aHandle = this.stack.length - 1;
			this.buttonsStack.push(aHandle);
		}
		return aHandle;
	},
	push : function(id) {
		var aHandle = -1;
		var oo = $(id);
		if (!!oo) {
			this.stack.push(id);
			this.ooStack.push(oo);
			this.aspectStack.push(ezDictObj.get$());
			this.stylesStack.push(ezDictObj.get$());
			aHandle = this.stack.length - 1;
		}
		return aHandle;
	},
	revertAspectsDict : function(aDict, oo) {
		var i = -1;
		if ( (!!aDict) && (!!oo) ) {
			var keys = aDict.getKeys();
			for (i = 0; i < keys.length; i++) {
				var aVal = aDict.getValueFor(keys[i]);
				oo[keys[i]] = aVal;
			}
		}
	},
	revertStylesDict : function(aDict, oo) {
		var i = -1;
		if ( (!!aDict) && (!!oo) ) {
			var keys = aDict.getKeys();
			for (i = 0; i < keys.length; i++) {
				ezSetStyle(oo.style, keys[i] + ': ' + aDict.getValueFor(keys[i]) + ';');
			}
		}
	},
	pop : function(aHandle) {
		var oo = -1;
		if ( (aHandle > -1) && (aHandle == (this.ooStack.length - 1)) ) {
			oo = this.ooStack.pop();
			if (!!oo) {
				this.iterateDicts(this.aspectStack.pop(), this.revertAspectsDict, oo);
				this.iterateDicts(this.stylesStack.pop(), this.revertStylesDict, oo);
			}
			this.destructDicts();
			return this.stack.pop();
		} else {
			alert('WARNING: Programming Error - Cannot pop from anywhere but the end of the stack towards beginning of the stack - the stack is a LIFO buffer...');
		}
		return -1;
	},
	popBtn : function(aHandle) {
		var oo = -1;
		if ( (aHandle > -1) && (aHandle <= (this.ooStack.length - 1)) ) {
			oo = this.ooStack.pop();
			if (!!oo) {
				oo.disabled = this.ooStateCache[oo.id];
			}
			return this.stack.pop();
		} else {
			alert('WARNING: Programming Error - Cannot pop from anywhere but the end of the stack towards beginning of the stack - the stack is a LIFO buffer...');
		}
		return -1;
	},
	popAll : function() {
		while (this.stack.length > 0) {
			this.pop(i);
		}
	},
	popAllButtons : function() {
		while (this.buttonsStack.length > 0) {
			this.popBtn(this.buttonsStack.pop());
		}
	},
	replaceAspectNamedFor : function(aHandle, aName, aVal) {
		var oo = -1;
		if ( (aHandle > -1) && (aHandle < this.ooStack.length) ) {
			oo = this.ooStack[aHandle];
			if (!!oo) {
				if (!!aName) {
					var aDict = this.aspectStack[aHandle];
					aDict.push(aName, oo[aName]);
					oo[aName] = aVal;
					return aHandle;
				}
			}
		}
		return -1;
	},
	replaceStyleNamedFor : function(aHandle, aName, aVal) {
		var oo = -1;
		if ( (aHandle > -1) && (aHandle < this.ooStack.length) ) {
			oo = this.ooStack[aHandle];
			if (!!oo) {
				if (!!aName) {
					var aa = aVal.split(';');
					if ( (aVal.indexOf(':') != -1) && (aa.length == 2) ) {
						var aStyle = ezGetStyle(oo, aName);
						var aDict = this.stylesStack[aHandle];
						aDict.push(aName, aStyle);
						ezSetStyle(oo.style, aVal + ((aVal.indexOf(';') == -1) ? ';' : ''));
						return aHandle;
					} else {
						alert('WARNING: Programming Error - the style of (' + aVal + ', ' + aa.length + ') is not properly formed or has too many styles specified - kindly modify your code to make (' + aVal + ') into a properly formed style spec that specifies a single style (hint: properly formed style specs are just like the ones you would normally code into a style="font-size: 10px;" block however you may leave-off the final ";" in case you are passing in a single style spec).');
					}
				}
			}
		}
		return -1;
	},
	length : function() {
		return (this.stack.length);
	},
	iterateDicts : function(anArrayOrDict, func, oO) {
		var i = -1;
		var aDict = -1;
		if ( (!!anArrayOrDict) && (!!oO) ) {
			if (typeof anArrayOrDict == const_object_symbol) {
				if ( (!!anArrayOrDict.length) && (typeof anArrayOrDict.length != const_function_symbol) ) {
					for (i = 0; i < anArrayOrDict.length; i++) {
						aDict = anArrayOrDict[i];
						if ( (!!aDict) && (!!func) && (typeof func == const_function_symbol) ) {
							func(aDict, oO);
						}
					}
				} else {
					if ( (!!func) && (typeof func == const_function_symbol) ) {
						func(anArrayOrDict, oO);
					}
				}
			}
		}
	},
	destructDict : function(aDict) {
		if (!!aDict) {
			ezDictObj.remove$(aDict.id);
		}
	},
	destructDicts : function() {
		this.iterateDicts(this.aspectStack, this.destructDict);
		this.iterateDicts(this.stylesStack, this.destructDict);
	},
	init : function() {
		this.stack = [];
		this.ooStack = [];
		this.destructDicts();
		this.aspectStack = [];
		this.stylesStack = [];
		this.buttonsStack = [];
		return this;
	},
	destructor : function() {
		this.destructDicts();
		return (this.id = ezGUIActsObj.$[this.id] = this.aspectStack = this.stylesStack = this.stylesDict = this.aspectDict = this.ooStack = this.stack = this.buttonsStack = null);
	}
};

