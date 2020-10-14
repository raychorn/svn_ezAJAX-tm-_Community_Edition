// TabsObj.js

ezTabsObj = function(id, top, left, width, height, tabHeight){
	this.id = id;
	this.tabsDict = ezDictObj.get$();
	this.subTabsDict = ezDictObj.get$();
	this.subTabsDict.bool_returnArray = true;
	this.create(top, left, width, height, tabHeight);
	if (!this.isPositionAbsolute()) ezTabsObj.loadStyles();
};

ezTabsObj.$ = [];

ezTabsObj.layoutWidth = 800;
ezTabsObj.isStylesLoaded = false;

ezTabsObj.loadStyles = function() {
	var _html = '';
	if (!ezTabsObj.isStylesLoaded) {
		ezDynamicObjectLoader(ezAJAXEngine.$[0]._url + 'tabsStyles.css');
		ezTabsObj.isStylesLoaded = true;
	}
};

ezTabsObj.get$ = function(top, left, width, height, tabHeight) {
	var instance = ezTabsObj.$[ezTabsObj.$.length];
	if (instance == null) {
		instance = ezTabsObj.$[ezTabsObj.$.length] = new ezTabsObj(ezTabsObj.$.length, top, left, width, height, tabHeight);
	}
	return instance;
};

ezTabsObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezTabsObj.$.length) ) {
		var instance = ezTabsObj.$[id];
		if (!!instance) {
			ezTabsObj.$[id] = ezObjectDestructor(instance);
			ret_val = (ezTabsObj.$[id] == null);
		}
	}
	return ret_val;
};

ezTabsObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezTabsObj.$.length; i++) {
		ezTabsObj.remove$(i);
	}
	return ret_val;
};

ezTabsObj.activateTab = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.activateTab(iTab);
		}
	}
};

ezTabsObj.openSubTabs = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.openSubTabs(iTab);
		}
	}
};

ezTabsObj.closeSubTabs = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.closeSubTabs(iTab);
		}
	}
};

ezTabsObj.prototype = {
	id : -1,
	top : 0,
	left : 0,
	width : 0,
	height : 0,
	tabHeight : 0,
	layoutWidth : 0,
	classTab : 'tab',
	classActiveTab : 'tab tabActive',
	classHiddenTab : 'tab tabHidden',
	oTabSystem : -1,
	oTabSystemTabs : -1,
	oTabSystemContents : -1,
	tabsCollection : [],
	subTabsCollection : [],
	contentsCollection : [],
	tabsDict : -1,
	subTabsDict : -1,
	styleBorder : '1px solid #347',
	onReSizeCallback : function(_width, _height, _fixedWidth){ var iX = ((_width - _fixedWidth) / 2); iX = ((iX < 0) ? 0 : iX); this.oTabSystem.style.left = iX + 'px'; this.left = iX; },
	html : '',
	toString : function() {
		var s = 'ezTabsObj(' + this.id + ') :: (';
		if (this.id != null) {
			s += 'top = [' + this.top + ']\n';
			s += 'left = [' + this.left + ']\n';
			s += 'width = [' + this.width + ']\n';
			s += 'height = [' + this.height + ']\n';
			s += 'tabHeight = [' + this.tabHeight + ']\n';
			s += 'layoutWidth = [' + this.layoutWidth + ']\n';
			s += 'oTabSystem = [' + this.oTabSystem + ']\n';
			s += 'tabsCollection.length = [' + this.tabsCollection.length + ']\n';
			s += 'tabsCollection = [' + this.tabsCollection + ']\n';
			s += 'subTabsCollection.length = [' + this.subTabsCollection.length + ']\n';
			s += 'subTabsCollection = [' + this.subTabsCollection + ']\n';
			s += 'contentsCollection.length = [' + this.contentsCollection.length + ']\n';
			s += 'contentsCollection = [' + this.contentsCollection + ']\n';
			s += 'tabsDict = [' + this.tabsDict + ']\n';
			s += 'subTabsDict = [' + this.subTabsDict + ']\n';
		}
		s += ')';
		return s;
	},
	openSubTabs : function(iTab) {
		iTab = ((iTab != null) ? iTab : -1);
		var tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		var oDiv = _$(tabDivId);
		var anchorID = 'anchor_' + this.oTabSystem.id + '_tab' + iTab;
		var anchorPos = ezAnchorPosition.get$(anchorID);
		var bool_isActiveTab = false;
		if (!!oDiv) {
			bool_isActiveTab = (oDiv.className.toUpperCase().indexOf('ACTIVE') > -1);
			try { oDiv.style.border = 'thin solid Blue'; } catch(e) { } finally { }
		}
		if (bool_isActiveTab) {
			var tabDivIdOuter = tabDivId + '_outer';
			var oDivOuter = _$(tabDivIdOuter);
			if (!!oDivOuter) {
				if (oDivOuter.innerHTML.length > 0) {
					try { oDivOuter.style.display = const_inline_style; } catch(e) { } finally { }
				}
			}
		}
		ezAnchorPosition.remove$(anchorPos.id);
	},
	contentPageObjFromPageNum : function(iPage) {
		var oContent = _$(this.contentsCollection[iPage]);
		return oContent;
	},
	contentPageForTab : function(iTab) {
		var iPage = this.tabsDict.getValueFor(iTab);
		return ((iPage != null) ? iPage : -1);
	},
	currentActiveTab : function() {
		var oDiv = -1;
		var bool_isAnySubTabActive = false;
		for (var i = 0; i < this.tabsCollection.length; i++) {
			oDiv = _$(this.tabsCollection[i]);
			if (!!oDiv) {
				bool_isAnySubTabActive |= (oDiv.className.toUpperCase().indexOf('ACTIVE') > -1);
				if (bool_isAnySubTabActive) {
					return i;
				}
			}
		}
		return -1;
	},
	isAnySubTabsActive : function(iTab) {
		var oDiv = -1;
		var subTabs = this.subTabsDict.getValueFor(iTab);
		subTabs = ((subTabs != null) ? subTabs : []);
		var bool_isAnySubTabActive = false;
		for (var i = 0; i < subTabs.length; i++) {
			oDiv = _$(this.subTabsCollection[subTabs[i]]);
			if (!!oDiv) {
				bool_isAnySubTabActive |= (oDiv.className.toUpperCase().indexOf('ACTIVE') > -1);
			}
		}
		return bool_isAnySubTabActive;
	},
	closeSubTabs : function(iTab) {
		iTab = ((iTab != null) ? iTab : -1);
		var tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		var oDiv = _$(tabDivId);
		var bool_isTabActivate = false;
		if (!!oDiv) {
			bool_isTabActivate = (oDiv.className.toUpperCase().indexOf('ACTIVE') > -1);
			try { oDiv.style.border = this.styleBorder; } catch(e) { } finally { }
		}
		var tabDivIdOuter = tabDivId + '_outer';
		var oDivOuter = _$(tabDivIdOuter);
		if ( (!!oDivOuter) && (!bool_isTabActivate) ) {
			if (oDivOuter.innerHTML.length > 0) {
				try { oDivOuter.style.display = const_none_style; } catch(e) { } finally { }
			}
		}
	},
	activateTab : function(iTab) {
		var i = -1;
		var oTab = -1;
		var iContentTab = -1;
		var oTabContent = -1;
		iTab = ((iTab != null) ? (iTab - 1) : -1);
		if ( (iTab > -1) && (iTab < this.tabsCollection.length) ) {
			for (i = 0; i < this.tabsCollection.length; i++) {
				oTab = _$(this.tabsCollection[i]);
				if (!!oTab) {
					if (i == iTab) {
						oTab.className = this.classActiveTab;
						var bool_isAnySubTabsActive = this.isAnySubTabsActive(iTab);
					} else {
						oTab.className = this.classTab;
					}
					oTab.style.display = const_inline_style;
				}
			}
			iTab = (iTab + 1);
			iContentTab = this.tabsDict.getValueFor(iTab);
			iContentTab = ((iContentTab != null) ? (iContentTab - 1) : -1);
			for (i = 0; i < this.contentsCollection.length; i++) {
				if (iContentTab > -1) {
					oTabContent = _$(this.contentsCollection[i]);
					if (!!oTabContent) {
						if (i == iContentTab) {
							oTabContent.style.display = const_inline_style;
						} else {
							oTabContent.style.display = const_none_style;
						}
					}
				}
			}
		}
		return this;
	},
	addContentForTab : function(iTab, sContents) {
		var html = '';
		var tabDivId = -1;
		var iContent = -1;
		iTab = ((iTab != null) ? iTab : -1);
		sContents = ((sContents != null) ? sContents : '');

		if (iTab > -1) {
			tabDivId = 'div_' + this.oTabSystem.id + '_content' + iTab;
			html += '<div id="' + tabDivId + '" style="display: none;">';
			html += sContents;
			html += '</div>';
			
			if (!!this.oTabSystemContents) {
				this.oTabSystemContents.innerHTML += html;
				this.contentsCollection.push(tabDivId);
				iContent = this.contentsCollection.length;
				this.tabsDict.push(iTab, iContent);
			}
		}
		return iContent;
	},
	tabAnchor : function(sTitle, eventAttributes) {
		var html = '';
		var iTab = (this.tabsCollection.length + 1);
		sTitle = ((sTitle != null) ? sTitle : '');
		eventAttributes = ((eventAttributes != null) ? eventAttributes : '');
		var anchorID = 'anchor_' + this.oTabSystem.id + '_tab' + iTab;
		html += '<a id="' + anchorID + '" name="' + anchorID + '" href="#Tab' + iTab + '" accesskey="' + iTab + '" tabindex="' + iTab + '" id="tab' + iTab + '" title="' + sTitle + '"' + eventAttributes + '>';
		html += '&nbsp;<font size="1"><small>' + sTitle + '</small></font>';
		html += '</a>';
		return html;
	},
	addTab : function(sTitle, vararg_params) {
		var html = '';
		var iTab = -1;
		var iTabs = [];
		var tabDivId = -1;
		var tabDivIdOuter = -1;
		
		function tabEventHandlerForTab(objId, tabNum) {
			objId = ((objId != null) ? objId : -1);
			tabNum = ((tabNum != null) ? tabNum : -1);
			return ' onclick="ezTabsObj.activateTab(' + objId + ', ' + tabNum + '); return false;"';
		}
		
		sTitle = ((sTitle != null) ? sTitle : '');
		iTab = (this.tabsCollection.length + 1);
		tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		tabDivIdOuter = tabDivId + '_outer';
		
		var bool_isComplexTab = ((arguments.length - 1) > 0);
		var tabEventHandler1 = tabEventHandlerForTab(this.id, iTab);
		var tabEventHandler2 = ' onmouseover="ezTabsObj.openSubTabs(' + this.id + ', ' + iTab + '); return false;" onmouseout="ezTabsObj.closeSubTabs(' + this.id + ', ' + iTab + '); return false;"';
		
		html += '<div id="' + tabDivId + '" class="' + this.classTab + '" style="display: none; height: ' + (this.tabHeight) + 'px; cursor:hand; cursor:pointer;"' + ((bool_isComplexTab) ? '' : tabEventHandler1) + tabEventHandler2 + '>';

		if (bool_isComplexTab) {
			html += '<table width="*" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';
			html += '<td>';
		}

		html += this.tabAnchor(sTitle, ((bool_isComplexTab) ? tabEventHandler1 : ''));
		this.tabsCollection.push(tabDivId);
		iTabs.push(iTab);

		if (bool_isComplexTab) {
			html += '</td>';
			html += '</tr>';
		}

		if (bool_isComplexTab) {
			var _sTitle = '';
		    for (var i = 0; i < arguments.length - 1; i++) {
				_sTitle = arguments[i + 1];
				_sTitle = ((_sTitle != null) ? _sTitle : '');
				if (_sTitle.length > 0) {
					html += '<tr id="' + tabDivIdOuter + '" class="' + this.classTab + '" style="display: none; height: ' + (this.tabHeight) + 'px; cursor:hand; cursor:pointer;">';
					html += '<td>';
					var _iTab = (this.tabsCollection.length + 1);
					tabDivId = 'div_' + this.oTabSystem.id + '_tab' + _iTab;
					iTabs.push(_iTab);
					html += '<div id="' + tabDivId + '" class="' + this.classTab + '" style="display: inline;"' + ((bool_isComplexTab) ? tabEventHandlerForTab(this.id, _iTab) : '') + '>';
					html += this.tabAnchor(_sTitle);
					html += '</div>';
					html += '</td>';
					html += '</tr>';
					this.tabsCollection.push(tabDivId);
					this.subTabsCollection.push(tabDivId);
					this.subTabsDict.push(iTab, _iTab);
				}
			}
			html += '</table>';
		}
		html += '</div>';
		
		if (!!this.oTabSystemTabs) {
			this.oTabSystemTabs.innerHTML += html;
		}
		this.activateTab(iTab);
		return iTabs;
	},
	isPositionAbsolute : function() {
		return ((this.top > -1) && (this.left > -1) && (this.width > -1) && (this.height > -1));
	},
	create : function(top, left, width, height, tabHeight) {
		var _width = ezClientWidth();
		var oTabSystemContainer = _$('TabSystemContainer');
		this.top = ((top != null) ? top : 0);
		this.left = ((left != null) ? left : 0);
		this.width = ((width != null) ? width : 0);
		this.height = ((height != null) ? height : 0);
		this.tabHeight = ((tabHeight != null) ? tabHeight : 20);
		this.layoutWidth = ezTabsObj.layoutWidth;
		if (!!oTabSystemContainer) {
			this.left += ((_width - this.layoutWidth) / 2);

			this.html += '<div id="TabSystem' + this.id + '" style="' + ((this.isPositionAbsolute()) ? 'position: absolute; top: ' + this.top + 'px; left: ' + this.left + 'px; width: ' + this.width + 'px; height: ' + this.height + 'px;' : 'width: 100%;') + '">';
			this.html += '</div>';

			oTabSystemContainer.innerHTML += this.html;
			this.oTabSystem = _$('TabSystem' + this.id);
			
			var html = '';
			html += '<div id="div_TabSystem' + this.id + '_tabs" class="tabs">';
			html += '</div>';
			html += '<div id="div_TabSystem' + this.id + '_contents" class="content">';
			html += '</div>';
			
			this.oTabSystem.innerHTML = html;
			
			this.oTabSystemTabs = _$('div_TabSystem' + this.id + '_tabs');
			this.oTabSystemContents = _$('div_TabSystem' + this.id + '_contents');
		} else {
			alert('ERROR: Programming Error - Missing DHTML Element named "TabSystemContainer".  Cannot create the Tabbed Interface without this missing element.');
		}

		return this;
	},
	init : function() {
		return this;
	},
	destructor : function() {
		ezFlushCache$(this.oTabSystem);
		try { ezDictObj.remove$(this.tabsDict.id); } catch(e) { } finally { }
		try { ezDictObj.remove$(this.subTabsDict.id); } catch(e) { } finally { }
		return (this.id = ezTabsObj.$[this.id] = this.oTabSystem = this.oTabSystemTabs = this.oTabSystemContents = this.tabsCollection = this.contentsCollection = this.tabsDict = this.subTabsDict = null);
	}
};

