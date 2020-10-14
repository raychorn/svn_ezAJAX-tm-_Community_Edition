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

ezTabsObj.hideSubTabs = function(oTabsObjId) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			oTabsObj.hideSubTabs();
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
	isTabClickable : false,
	isAddingSubTab : false,
	classTab : 'tab',
	classActiveTab : 'tab tabActive',
	classHiddenTab : 'tab tabHidden',
	classSubTab : 'subtab',
	oTabSystem : -1,
	oTabSystemTabs : -1,
	oTabSystemContents : -1,
	tabsCollection : [],
	subTabsCollection : [],
	contentsCollection : [],
	tabsDict : -1,
	subTabsDict : -1,
	styleBorder : '1px solid #347',
	onReSizeCallback : function(_width, _height, _fixedWidth){ },
	onActivateTabsCallback : function(iTab){},
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
	hideSubTabs : function() {
		var tabDivId = -1;
		var tabDivIdOuter = -1;
		var oDivOuter = -1;
		if (!!oDivOuter) {
			for (var i = 0; i < this.subTabsCollection.length; i++) {
				tabDivId = 'div_' + this.oTabSystem.id + '_tab' + (i + 1);
				tabDivIdOuter = tabDivId + '_outer';
				oDivOuter = _$(tabDivIdOuter);
	//			ezAlert('tabDivId = [' + tabDivId + ']' + ', tabDivIdOuter = [' + tabDivIdOuter + ']' + ', oDivOuter = [' + oDivOuter + ']');
				if (!!oDivOuter) {
					if (oDivOuter.innerHTML.length > 0) {
						try { oDivOuter.style.display = const_none_style; } catch(e) { } finally { }
					}
				}
			}
		}
	},
	openSubTabs : function(iTab) {
		iTab = ((iTab != null) ? iTab : -1);
		var tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		var oDiv = _$(tabDivId);
		var anchorID = 'anchor_' + this.oTabSystem.id + '_tab' + iTab;
		var anchorPos = ezAnchorPosition.get$(anchorID);
		var anchorPosL = ezAnchorPosition.get$(anchorID + '_L');
		var anchorPosR = ezAnchorPosition.get$(anchorID + '_R');
		var bool_isActiveTab = false;
		if (!!oDiv) {
			bool_isActiveTab = (oDiv.className.toUpperCase().indexOf('ACTIVE') > -1);
			try { oDiv.style.border = 'thin solid Blue'; } catch(e) { } finally { }
		}

		this.hideSubTabs();
		
		if (bool_isActiveTab) {
			var tabDivIdOuter = tabDivId + '_outer';
			var oDivOuter = _$(tabDivIdOuter);
			if (!!oDivOuter) {
				var oAnchor = _$(anchorID);
				if (!!oAnchor) {
					oDivOuter.style.top = (anchorPos.y + oAnchor.offsetHeight + 6) + 'px';
					oDivOuter.style.left = (anchorPosL.x - (oAnchor.offsetWidth * 2) + 20) + 'px';
					oDivOuter.style.width = (Math.max(anchorPosL.x, anchorPosR.x) - Math.min(anchorPosL.x, anchorPosR.x)) + 20 + 'px';
				}
				if (oDivOuter.innerHTML.length > 0) {
					try { oDivOuter.style.display = const_inline_style; } catch(e) { } finally { }
				}
			}
		}
		ezAnchorPosition.remove$(anchorPos.id);
		ezAnchorPosition.remove$(anchorPosL.id);
		ezAnchorPosition.remove$(anchorPosR.id);
	},
	contentPageObjFromPageNum : function(iPage) {
		var oContent = _$(this.contentsCollection[iPage]);
		return oContent;
	},
	contentPageForTab : function(iTab) {
		var iPage = this.tabsDict.getValueFor(iTab);
		return ((iPage != null) ? iPage : -1);
	},
	contentForPageNum : function(iPage) {
		try { return this.contentPageObjFromPageNum(iPage - 1).innerHTML; } catch(e) { return ''; } finally { };
	},
	tabAnchorForTabNum : function(iTab) {
		try { return _$(this.tabsCollection[iTab - 1]).innerHTML; } catch(e) { return ''; } finally { };
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
	closeSubTabs : function(iTab) {
		iTab = ((iTab != null) ? iTab : -1);
		var tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		var oDiv = _$(tabDivId);
		var bool_isTabActivate = false;
		if (!!oDiv) {
			bool_isTabActivate = (oDiv.className.toUpperCase().indexOf('ACTIVE') > -1);
			try { oDiv.style.border = this.styleBorder; } catch(e) { } finally { }
		}
	},
	activateContentPage : function(iContentTab) {
		var i = -1;
		var oTabContent = -1;
		iContentTab = ((iContentTab != null) ? iContentTab : -1);
		for (i = 0; i < this.contentsCollection.length; i++) {
			if (iContentTab > -1) {
				oTabContent = _$(this.contentsCollection[i]);
				if (!!oTabContent) {
					if (i == iContentTab) {
						try { oTabContent.style.display = const_inline_style; } catch(e) { } finally { };
					} else {
						try { oTabContent.style.display = const_none_style; } catch(e) { } finally { };
					}
				}
			}
		}
	},
	activateTab : function(iTab) {
		var i = -1;
		var j = -1;
		var k = -1;
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
					} else {
						oTab.className = this.classTab;
					}
					oTab.style.display = const_inline_style;
				}
			}
			iTab = (iTab + 1);
			if ( (this.isTabClickable) && (typeof this.onActivateTabsCallback == const_function_symbol) ) {
				try { this.onActivateTabsCallback(iTab); } catch(e) {} finally { }
			}
			iContentTab = this.tabsDict.getValueFor(iTab);
			if ((typeof iContentTab) == const_object_symbol) {
				this.activateContentPage(iContentTab[0]);
			} else {
				iContentTab = ((iContentTab != null) ? (iContentTab - 1) : -1);
				this.activateContentPage(iContentTab);
			}
		}
		return this;
	},
	setContentForTab : function(iTab, iPage, sContents) {
	},
	addContentForTab : function(iTab, sContents) {
		var html = '';
		var iPage = -1;
		var iPageCnt = -1;
		var tabDivId = -1;
		var iContent = -1;
		iTab = ((iTab != null) ? iTab : -1);
		sContents = ((sContents != null) ? sContents : '');

		if (iTab > -1) {
			iPage = this.tabsDict.getValueFor(iTab);
			iPageCnt = (((typeof iPage) == const_object_symbol) ? (iPage.length + 1) : ((iPage == null) ? 1 : 2));
			tabDivId = 'div_' + this.oTabSystem.id + '_content' + iTab + '_' + iPageCnt;
			html += '<div id="' + tabDivId + '" style="display: none;">';
			html += sContents;
			html += '</div>';
			
		try {
			if (!!this.oTabSystemContents) {
				this.oTabSystemContents.innerHTML += html;
				this.contentsCollection.push(tabDivId);
				iContent = this.contentsCollection.length;
				this.tabsDict.push(iTab, iContent);
			}
		} catch(e) { } finally { };
		}
		this.isTabClickable = false;
		this.activateTab(iTab);
		this.isTabClickable = true;
		return iContent;
	},
	tabAnchor : function(sTitle, eventAttributes) {
		var html = '';
		var iTab = ((this.isAddingSubTab) ? (this.subTabsCollection.length + 1) : (this.tabsCollection.length + 1));
		sTitle = ((sTitle != null) ? sTitle : '');
		eventAttributes = ((eventAttributes != null) ? eventAttributes : '');
		var anchorID = 'anchor_' + this.oTabSystem.id + '_' + ((this.isAddingSubTab) ? 'SubTab' : 'tab') + iTab;

		html += '<a id="' + anchorID + '_L" name="' + anchorID + '_L">&nbsp;</a>';

		html += '<a id="' + anchorID + '" name="' + anchorID + '" href="#' + ((this.isAddingSubTab) ? 'Sub' : '') + 'Tab' + iTab + '" accesskey="' + iTab + '" tabindex="' + iTab + '" title="' + sTitle + '"' + eventAttributes + '>';
		html += '&nbsp;<font size="1"><small>' + sTitle + '</small></font>';
		html += '</a>';

		html += '<a id="' + anchorID + '_R" name="' + anchorID + '_R">&nbsp;</a>';
		return html;
	},
	addTab : function(sTitle) {
		var html = '';
		var iTab = -1;
		var iTabs = [];
		var tabDivId = -1;
		
		function tabEventHandlerForTab(objId, tabNum) {
			objId = ((objId != null) ? objId : -1);
			tabNum = ((tabNum != null) ? tabNum : -1);
			return ' onclick="ezTabsObj.activateTab(' + objId + ', ' + tabNum + '); return false;"';
		}
		
		var tabEventHandler2 = '';
		
		sTitle = ((sTitle != null) ? sTitle : '');
		if (!this.isAddingSubTab) {
			iTab = (this.tabsCollection.length + 1);
			tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
			tabEventHandler2 = ' onmouseover="ezTabsObj.openSubTabs(' + this.id + ', ' + iTab + '); return false;" onmouseout="ezTabsObj.closeSubTabs(' + this.id + ', ' + iTab + '); return false;"';
		} else {
			iTab = (this.subTabsCollection.length + 1);
			tabDivId = 'div_' + this.oTabSystem.id + '_subTab' + iTab;
		}
		
		var tabEventHandler1 = tabEventHandlerForTab(this.id, iTab);
		
		html += '<div id="' + tabDivId + '" class="' + this.classTab + '" style="display: none; height: ' + (this.tabHeight) + 'px; cursor:hand; cursor:pointer;"' + tabEventHandler1 + tabEventHandler2 + '>';

		html += this.tabAnchor(sTitle, tabEventHandler1);
		if (!this.isAddingSubTab) {
			this.tabsCollection.push(tabDivId);
		} else {
			this.subTabsCollection.push(tabDivId);
		}
		iTabs.push(iTab);

		html += '</div>';
		
		if (!!this.oTabSystemTabs) {
			this.oTabSystemTabs.innerHTML += html;
		}
		if (!this.isAddingSubTab) {
			this.isTabClickable = false;
			this.activateTab(iTab);
			this.isTabClickable = true;
		}
		return iTabs;
	},
	renderSubTabsFrom : function(anAR) {
		var i = -1;
		var html = '';
		var oObj = -1;
		var objID = -1;
		var id = -1;
		anAR = (((typeof anAR) == const_object_symbol) ? anAR : []);

		html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
		for (i = 0; i < anAR.length; i++) {
			id = anAR[i];
			objID = this.subTabsCollection[id - 1];
			oObj = _$(objID);
			if (!!oObj) {
				html += '<tr>';
				html += '<td><div id="' + objID + '_actual' + '" class="' + this.classSubTab + '">' + oObj.innerHTML + '</div></td>';
				html += '</tr>';
			}
		}
		html += '</table>';
		
		return html;
	},
	addSubTab : function(iTab, sTitle) {
		var iSubTab = -1;
		var iSubTabs = -1;
		var tabDivId = -1;
		var tabDivIdOuter = -1;

		iTab = ((iTab != null) ? iTab : -1);
		sTitle = ((sTitle != null) ? sTitle : '');
		
		if (iTab > -1) {
			this.isAddingSubTab = true;
			iSubTabs = this.addTab(sTitle);
			this.isAddingSubTab = false;
	
			if ((typeof iSubTabs) == const_object_symbol) {
				iSubTab = iSubTabs.pop();
				this.subTabsDict.push(iTab, iSubTab);

				tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
				tabDivIdOuter = tabDivId + '_outer';
				var oOuter = _$(tabDivIdOuter);
				var _html = '';
				var subTabsAR = this.subTabsDict.getValueFor(iTab);
				if (oOuter == null) {
					_html += '<div id="' + tabDivIdOuter + '" onmouseout="ezTabsObj.hideSubTabs(' + this.id + '); return false;" style="position: absolute; top: 0px; left: 0px; width: 0px; display: none; z-index: 32767;">';
					_html += this.renderSubTabsFrom(subTabsAR);
					_html += '</div>';
					if (!!this.oTabSystemTabs) {
						this.oTabSystemTabs.innerHTML += _html;
					}
				} else {
					oOuter.innerHTML = this.renderSubTabsFrom(subTabsAR);
				}
			}
		} else {
			alert('Error: Programming Error - The value for iTab (' + iTab + ') is invalid when used to call the addSubTab() method for the ezTabsObj object instance.');
		}
		return iSubTab;
	},
	isPositionAbsolute : function() {
		return ((this.top > -1) && (this.left > -1) && (this.width > -1) && (this.height > -1));
	},
	create : function(top, left, width, height, tabHeight) {
		var _width = ezClientWidth();
		var oTabSystemContainer = _$('TabSystemContainer');
		this.top = ((top != null) ? top : -1);
		this.left = ((left != null) ? left : -1);
		this.width = ((width != null) ? width : -1);
		this.height = ((height != null) ? height : -1);
		this.tabHeight = ((tabHeight != null) ? tabHeight : 20);
		this.layoutWidth = ezTabsObj.layoutWidth;
		var bool_isTooManyObjects = false;
		try { bool_isTooManyObjects = ((oTabSystemContainer.length) && (oTabSystemContainer.length > 0) && ((typeof oTabSystemContainer) == const_object_symbol)); } catch(e) { } finally { };
		if ( (!!oTabSystemContainer) && (!bool_isTooManyObjects) ) {
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
		} else if (!bool_isTooManyObjects) {
			alert('ERROR: Programming Error - Missing DHTML Element with id of "TabSystemContainer".  Cannot create the Tabbed Interface without this missing element.');
		} else if (bool_isTooManyObjects) {
			alert('ERROR: Programming Error - Too Many DHTML Elements with id of "TabSystemContainer".  Cannot create the Tabbed Interface due to existence of too many elements - remove all but one of these elements.');
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

