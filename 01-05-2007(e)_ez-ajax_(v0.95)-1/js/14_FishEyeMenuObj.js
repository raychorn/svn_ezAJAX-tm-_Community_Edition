// FishEyeMenuObj.js

ezFishEyeMenuObj = function(id, top, left, width, height){
	this.id = id;
	this.iHeight = 32;
	this.iWidth = 32;
	this.myDiv = 'div_FishEye_' + this.id;
	this.theDiv = 'div_FishEyeContainer_' + ezUUID$();
	this.iconsDict = ezDictObj.get$();
	this.iconsDict.bool_returnArray = false;
	this.create(top, left, width, height);
};

ezFishEyeMenuObj.$ = [];

ezFishEyeMenuObj.get$ = function(top, left, width, height) {
	var instance = ezFishEyeMenuObj.$[ezFishEyeMenuObj.$.length];
	if (instance == null) {
		instance = ezFishEyeMenuObj.$[ezFishEyeMenuObj.$.length] = new ezFishEyeMenuObj(ezFishEyeMenuObj.$.length, top, left, width, height);
	}
	return instance;
};

ezFishEyeMenuObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezFishEyeMenuObj.$.length) ) {
		var instance = ezFishEyeMenuObj.$[id];
		if (!!instance) {
			ezFishEyeMenuObj.$[id] = ezObjectDestructor(instance);
			ret_val = (ezFishEyeMenuObj.$[id] == null);
		}
	}
	return ret_val;
};

ezFishEyeMenuObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezFishEyeMenuObj.$.length; i++) {
		ezFishEyeMenuObj.remove$(i);
	}
	return ret_val;
};

ezFishEyeMenuObj.onClick = function(id, imgUrl) {
	var ar = id.split('_');
	var fObj = ezFishEyeMenuObj.$[ar[ar.length - 2]];
	if (!!fObj) {
		var func = fObj.iconsDict.getValueFor(imgUrl);
		if ((typeof func) == const_function_symbol) {
			func();
		}
	}
};

ezFishEyeMenuObj.onmouseover = function(id) {
	var ar = id.split('_');
	var _id = ar[ar.length - 2];
	_id = parseInt(_id.toString());
	var _id2 = ar[ar.length - 1];
	_id2 = parseInt(_id2.toString());
	var fObj = ezFishEyeMenuObj.$[_id];
	if (!!fObj) {
		var iObjL = _$('img_fishEyeIcon_' + _id + '_' + (_id2 - 1));
		var iObj = _$(id);
		var iObjR = _$('img_fishEyeIcon_' + _id + '_' + (_id2 + 1));
		
		if (!!iObjL) {
			iObjL._height = iObjL.height;
			iObjL._width = iObjL.width;
			var i = ezInt(iObjL.height * 1.5);
			iObjL.height = Math.max(i, fObj.height); 
			iObjL.width = i;
		}
		
		if (!!iObj) {
			iObj._height = iObj.height;
			iObj._width = iObj.width;
			iObj.height = Math.max(iObj.height * 2, fObj.height); 
			iObj.width = iObj.height * 2;
		}

		if (!!iObjR) {
			iObjR._height = iObjR.height;
			iObjR._width = iObjR.width;
			var j = ezInt(iObjR.height * 1.5);
			iObjR.height = Math.max(j, fObj.height); 
			iObjR.width = j;
		}
	}
};

ezFishEyeMenuObj.onmouseout = function(id) {
	var ar = id.split('_');
	var _id = ar[ar.length - 2];
	_id = parseInt(_id.toString());
	var _id2 = ar[ar.length - 1];
	_id2 = parseInt(_id2.toString());
	var fObj = ezFishEyeMenuObj.$[_id];
	if (!!fObj) {
		var iObjL = _$('img_fishEyeIcon_' + _id + '_' + (_id2 - 1));
		var iObj = _$(id);
		var iObjR = _$('img_fishEyeIcon_' + _id + '_' + (_id2 + 1));
		
		if (!!iObjL) {
			iObjL.height = iObjL._height; 
			iObjL.width = iObjL._width;
		}
		
		if (!!iObj) {
			iObj.height = iObj._height; 
			iObj.width = iObj._width;
		}

		if (!!iObjR) {
			iObjR.height = iObjR._height; 
			iObjR.width = iObjR._width;
		}
	}
};

ezFishEyeMenuObj.prototype = {
	id : -1,
	top : 0,
	left : 0,
	width : 0,
	iHeight : 0,
	iWidth : 0,
	height : 0,
	iconsDict : -1,
	myDiv : '',
	theDiv : '',
	html : '',
	toString : function() {
		var s = 'ezFishEyeMenuObj(' + this.id + ') :: (';
		if (this.id != null) {
			s += 'top = [' + this.top + ']\n';
			s += 'left = [' + this.left + ']\n';
			s += 'width = [' + this.width + ']\n';
			s += 'height = [' + this.height + ']\n';
			s += 'iHeight = [' + this.iHeight + ']\n';
			s += 'iWidth = [' + this.iWidth + ']\n';
			s += 'theDiv = [' + this.theDiv + ']\n';
			s += 'myDiv = [' + this.myDiv + ']\n';
			s += 'iconsDict = [' + this.iconsDict + ']\n';
		}
		s += ')';
		return s;
	},
	create : function(top, left, width, height) {
		document.write('<div id="' + this.theDiv + '"></div>');
		var oFishEyeContainer = _$(this.theDiv);
		this.top = ((top != null) ? top : 0);
		this.left = ((left != null) ? left : 0);
		this.width = ((width != null) ? width : 0);
		this.height = ((height != null) ? height : 0);
		if (!!oFishEyeContainer) {
			this.html += '<div id="' + this.myDiv + '" style="position: absolute; top: ' + this.top + 'px; left: ' + this.left + 'px; width: ' + this.width + 'px; height: ' + this.height + 'px;">';
			this.html += '</div>';
			oFishEyeContainer.innerHTML += this.html;
		}

		return this;
	},
	addIcon : function(imgUrl, onClickFunc, aCaption) {
		var oDiv = _$(this.myDiv);
		imgUrl = (((typeof imgUrl) == const_string_symbol) ? imgUrl : '');
		onClickFunc = (((typeof onClickFunc) == const_function_symbol) ? onClickFunc : function() { alert('No Action was specified for this icon.'); });
		aCaption = (((typeof aCaption) == const_string_symbol) ? aCaption : '');
		this.iconsDict.push(imgUrl, onClickFunc);
		if (!!oDiv) {
			oDiv.innerHTML += '<div id="div_fishEyeIcon_' + this.id + '_' + this.iconsDict.length() + '"><table><tr><td><img id="img_fishEyeIcon_' + this.id + '_' + this.iconsDict.length() + '" width="' + this.iWidth + '" height="' + this.iHeight + '" src="' + imgUrl + '" height="' + (this.height / 2) + '" border="0" title="' + aCaption + '" onmouseover="ezFishEyeMenuObj.onmouseover(this.id); return false;" onmouseout="ezFishEyeMenuObj.onmouseout(this.id); return false;" onclick="ezFishEyeMenuObj.onClick(this.id, \'' + imgUrl + '\'); return false;"></td></tr><tr><td><span class="textClass">' + aCaption + '</span></td></tr></table></div>';
		}
		return this;
	},
	horizontal : function() {
		var i = -1;
		var divID = 'div_fishEyeIcon_' + this.id + '_';
		var dObj = -1;
		var _html = '';
		var oDiv = _$(this.myDiv);
		if (!!oDiv) {
			_html += '<table>';
			_html += '<tr>';
			var n = this.iconsDict.length();
			for (i = 1; i <= n; i++) {
				dObj = _$(divID + i.toString());
				if (!!dObj) {
					_html += '<td>' + dObj.innerHTML + '</td>';
				}
			}
			_html += '</tr>';
			_html += '</table>';
			oDiv.innerHTML = _html;
		}
		return this;
	},
	imgSize : function(w,h) {
		w = parseInt(w.toString());
		h = parseInt(h.toString());
		return this;
	},
	init : function() {
		return this;
	},
	destructor : function() {
		try { ezDictObj.remove$(this.iconsDict.id); } catch(e) { };
		return (this.id = ezFishEyeMenuObj.$[this.id] = this.iconsDict = this.myDiv = this.theDiv = this.top = this.left = this.width = this.height = this.html = this.iHeight = this.iWidth = null);
	}
};

