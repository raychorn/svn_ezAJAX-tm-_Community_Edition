// ThoughtBubbleObj.js

ezThoughtBubbleObj = function(id, top, left, width, height){
	this.id = id;
	if (ezThoughtBubbleObj.dict$ == -1) {
		ezThoughtBubbleObj.dict$ = ezDictObj.get$();
		ezThoughtBubbleObj.dict$.bool_returnArray = true;
	}
	this.anchorID = 'anchor_ezThoughtBubble_' + this.id;
	this.create(top, left, width, height);
};

ezThoughtBubbleObj.$ = [];
ezThoughtBubbleObj.dict$ = -1; // anchor.id associated with thought bubble instance to allow many thought bubbles at a time...

ezThoughtBubbleObj.showThoughtBubbleForAnchor = function(id) {
	var oTBUB = -1;
	if (id == '') { // must wait for the browser to complete loading the window before attempting to make thought bubbles or bad things happen to the placement of those thought bubbles...
		return; // cannot show a thought bubble unless there is an id and name for the object; the name can be supplied but there must be an id...
	}
	var oPos = ezAnchorPosition.get$(id); 
	if (!!oPos) {
		if ( ( (oPos.x == -1) && (oPos.y == -1) ) || ( (oPos.x == null) && (oPos.y == null) ) ) {
			oPos.x = event.clientX - 40;
			oPos.y = event.clientY - 50;
			var oAnchor = _$(id);
			if (!!oAnchor) {
				oAnchor.name = id;
			}
		} else {
			oPos.y -= 52;
		}
		var oTBUBid = ((ezThoughtBubbleObj.dict$ != -1) ? ezThoughtBubbleObj.dict$.getValueFor(id) : null);
		if (oTBUBid != null) {
			oTBUBid = (((typeof oTBUBid) == const_object_symbol) ? oTBUBid.pop() : oTBUBid);
			oTBUB = ezThoughtBubbleObj.$[oTBUBid];
			if (!!oTBUB) {
				var oDivTBUB = _$(oTBUB.thoughtBubbleID);
				if (!!oDivTBUB) {
					oTBUB.top = oPos.y;
					oTBUB.left = oPos.x;
					oDivTBUB.style.top = oTBUB.top;
					oDivTBUB.style.left = oTBUB.left;
				}
				var oObj = _$(oTBUB.thoughtBubbleID);
				if (!!oObj) {
					try { oObj.style.display = const_inline_style; } catch(e) { } finally { };
				}
			}
		} else {
			oTBUB = ezThoughtBubbleObj.get$(oPos.y, oPos.x, 200, 50);
			if (!!oTBUB) {
				var oObj = _$(oTBUB.thoughtBubbleID);
				if (!!oObj) {
					var cObj = _$(oTBUB.thoughtBubbleContentsID);
					if (!!cObj) {
						cObj.innerHTML = '<font size="1">[' + ezThoughtBubbleObj.$.length + ']</font>';
					}
					try { oObj.style.display = const_inline_style; } catch(e) { } finally { };
					ezThoughtBubbleObj.dict$.push(id, oTBUB.id);
				}
			}
		}
		ezAnchorPosition.remove$(oPos.id);
	}
};

ezThoughtBubbleObj.dismissThoughtBubbleForAnchor = function(id) {
	var oTBUB = -1;
	var oTBUBid = ezThoughtBubbleObj.dict$.getValueFor(id);
	if (!!oTBUBid) {
		oTBUBid = (((typeof oTBUBid) == const_object_symbol) ? oTBUBid.pop() : oTBUBid);
		oTBUB = ezThoughtBubbleObj.$[oTBUBid];
		if (!!oTBUB) {
			var oObj = _$(oTBUB.thoughtBubbleID);
			if (!!oObj) {
				try { oObj.style.display = const_none_style; } catch(e) { } finally { };
			}
		}
	}
};

ezThoughtBubbleObj.get$ = function(top, left, width, height) {
	var instance = ezThoughtBubbleObj.$[ezThoughtBubbleObj.$.length];
	if (instance == null) {
		instance = ezThoughtBubbleObj.$[ezThoughtBubbleObj.$.length] = new ezThoughtBubbleObj(ezThoughtBubbleObj.$.length, top, left, width, height);
	}
	return instance;
};

ezThoughtBubbleObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezThoughtBubbleObj.$.length) ) {
		var instance = ezThoughtBubbleObj.$[id];
		if (!!instance) {
			ezThoughtBubbleObj.$[id] = ezObjectDestructor(instance);
			ret_val = (ezThoughtBubbleObj.$[id] == null);
		}
	}
	return ret_val;
};

ezThoughtBubbleObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezThoughtBubbleObj.$.length; i++) {
		ezThoughtBubbleObj.remove$(i);
	}
	return ret_val;
};

ezThoughtBubbleObj.prototype = {
	id : -1,
	top : 0,
	left : 0,
	width : 0,
	height : 0,
	anchorID : -1,
	oThoughtBubble : -1,
	thoughtBubbleID : -1,
	thoughtBubbleContentsID : -1,
	html : '',
	toString : function() {
		var s = 'ezThoughtBubbleObj(' + this.id + ') :: (';
		if (this.id != null) {
			s += 'top = [' + this.top + ']\n';
			s += 'left = [' + this.left + ']\n';
			s += 'width = [' + this.width + ']\n';
			s += 'height = [' + this.height + ']\n';
			s += 'anchorID = [' + this.anchorID + ']\n';
			s += 'thoughtBubbleID = [' + this.thoughtBubbleID + ']\n';
			s += 'thoughtBubbleContentsID = [' + this.thoughtBubbleContentsID + ']\n';
			s += 'oThoughtBubble = [' + this.oThoughtBubble + ']\n';
		}
		s += ')';
		return s;
	},
	createThoughtBubble : function() {
		var _html = '';

		_html += '<div style="margin-left:10px;margin-bottom:10px;" id="tab_bubble"> ';
		_html += '<table cellpadding="0" cellspacing="0" border="0" class="bubble"> ';
		_html += '<tr><td class="nw"></td>';
		_html += '<td colspan="3" class="n"><img width="1" height="1"></td>';
		_html += '<td nowrap class="ne"></td>';
		_html += '</tr>';
		_html += '<tr>';
		_html += '<td class="w"><img width="1" height="1"></td>';
		this.thoughtBubbleContentsID = 'div_thoughtBubble_contents_' + this.id;
		_html += '<td colspan="3" class="c" width="*"><div id="' + this.thoughtBubbleContentsID + '"></div></td>';
		_html += '<td nowrap class="e"><img width="1" height="1"></td>';
		_html += '</tr>';
		_html += '<tr><td class="sw"></td>';
		_html += '<td width="5" class="s"></td>';
		_html += '<td width="20" nowrap class="tap"></td>';
		_html += '<td width="5" class="s"></td>';
		_html += '<td nowrap class="se"></td>';
		_html += '</tr>';
		_html += '</table>';
		_html += '</div>';
		
		return _html;
	},
	create : function(top, left, width, height) {
		var oThoughtBubbleContainer = _$('ThoughtBubbleContainer');
		this.top = ((top != null) ? top : 0);
		this.left = ((left != null) ? left : 0);
		this.width = ((width != null) ? width : 0);
		this.height = ((height != null) ? height : 0);
		if (!!oThoughtBubbleContainer) {
			this.thoughtBubbleID = 'ThoughtBubble_' + this.id;
			this.oThoughtBubble = _$(this.thoughtBubbleID);
			if (this.oThoughtBubble == null) {
				this.html += '<div id="' + this.thoughtBubbleID + '" style="position: absolute;  display: none; top: ' + this.top + 'px; left: ' + this.left + 'px; width: ' + this.width + 'px; height: ' + this.height + 'px;">';
				this.html += this.createThoughtBubble();
				this.html += '</div>';
				oThoughtBubbleContainer.innerHTML += this.html;
				this.oThoughtBubble = _$(this.thoughtBubbleID);
			}
		}

		return this;
	},
	init : function() {
		return this;
	},
	destructor : function() {
		ezFlushCache$(this.oShoppingCart);
		try { ezDictObj.remove$(this.cartDict.id); } catch(e) { } finally { }
		return (this.id = ezThoughtBubbleObj.$[this.id] = this.top = this.left = this.width = this.height = this.oThoughtBubble = this.html = this.thoughtBubbleID = this.thoughtBubbleContentsID = this.anchorID = null);
	}
};

