// ShoppingCartObj.js

ezShoppingCartObj = function(id, top, left, width, height){
	this.id = id;
	this.cartDict = ezDictObj.get$();
	this.cartDict.bool_returnArray = true;
	this.create(top, left, width, height);
};

ezShoppingCartObj.$ = [];

ezShoppingCartObj.get$ = function(top, left, width, height) {
	var instance = ezShoppingCartObj.$[ezShoppingCartObj.$.length];
	if (instance == null) {
		instance = ezShoppingCartObj.$[ezShoppingCartObj.$.length] = new ezShoppingCartObj(ezShoppingCartObj.$.length, top, left, width, height);
	}
	return instance;
};

ezShoppingCartObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezShoppingCartObj.$.length) ) {
		var instance = ezShoppingCartObj.$[id];
		if (!!instance) {
			ezShoppingCartObj.$[id] = ezObjectDestructor(instance);
			ret_val = (ezShoppingCartObj.$[id] == null);
		}
	}
	return ret_val;
};

ezShoppingCartObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezShoppingCartObj.$.length; i++) {
		ezShoppingCartObj.remove$(i);
	}
	return ret_val;
};

ezShoppingCartObj.prototype = {
	id : -1,
	top : 0,
	left : 0,
	width : 0,
	height : 0,
	cartDict : -1,
	oShoppingCart : -1,
	html : '',
	toString : function() {
		var s = 'ezShoppingCartObj(' + this.id + ') :: (';
		if (this.id != null) {
			s += 'top = [' + this.top + ']\n';
			s += 'left = [' + this.left + ']\n';
			s += 'width = [' + this.width + ']\n';
			s += 'height = [' + this.height + ']\n';
			s += 'cartDict = [' + this.cartDict + ']\n';
			s += 'oShoppingCart = [' + this.oShoppingCart + ']\n';
		}
		s += ')';
		return s;
	},
	create : function(top, left, width, height) {
		var oShoppingCartContainer = _$('ShoppingCartContainer');
		this.top = ((top != null) ? top : 0);
		this.left = ((left != null) ? left : 0);
		this.width = ((width != null) ? width : 0);
		this.height = ((height != null) ? height : 0);
		if (!!oShoppingCartContainer) {
			this.html += '<div id="ShoppingCart' + this.id + '" style="position: absolute; top: ' + this.top + 'px; left: ' + this.left + 'px; width: ' + this.width + 'px; height: ' + this.height + 'px;">';
			this.html += '</div>';

			oShoppingCartContainer.innerHTML += this.html;
			this.oShoppingCart = _$('ShoppingCart' + this.id);
		}

		return this;
	},
	init : function() {
		return this;
	},
	destructor : function() {
		ezFlushCache$(this.oShoppingCart);
		try { ezDictObj.remove$(this.cartDict.id); } catch(e) { } finally { }
		return (this.id = ezShoppingCartObj.$[this.id] = this.cartDict = null);
	}
};

