// TabsObj.js

ezTabsObj = function(id, top, left, width, height, tabHeight){
	this.id = id;
	this.tabsDict = ezDictObj.get$();
	this.subTabsDict = ezDictObj.get$();
	this.subTabsDict.bool_returnArray = true;
	this._subTabsDict = ezDictObj.get$();
	this._subTabsDict.bool_returnArray = false;
	this.subTabsContentDict = ezDictObj.get$();
	this.subTabsContentDict.bool_returnArray = false;
	this.const_tabsTableBegin = '<table cellpadding="-1" cellspacing="-1"><tr id="tr_tabsLayout_' + id + '">';
	this.const_tabsTableCellEnd = '';
	this.const_tabsTableEnd = this.const_tabsTableCellEnd + '</tr></table>';
	this.create(top, left, width, height, tabHeight);
	this.timerTickCount = 250;
	this.timerTickMaxCount = 5000;
	this.timerID = setInterval('ezTabsObj.dismissSubTabsTimer(' + this.id + ');', this.timerTickCount);
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

ezTabsObj.debugThis = function(oTabsObjId, sText) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			sText = ((sText != null) ? sText : '');
			oTabsObj.debugThis(sText);
		}
	}
};

ezTabsObj.activateTab = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.debugThis('ezTabsObj.activateTab(' + oTabsObjId + ', ' + iTab + ')');
			oTabsObj.activateTab(iTab);
		}
	}
};

ezTabsObj.clickSubTab = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.debugThis('ezTabsObj.clickSubTab(' + oTabsObjId + ', ' + iTab + ')');
			oTabsObj.clickSubTab(iTab);
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
			oTabsObj.mouseCount = (oTabsObj.timerTickCount * 5);
			oTabsObj.debugThis('(==) ezTabsObj.openSubTabs(' + oTabsObjId + ', ' + iTab + ')' + ', oTabsObj.mouseCount = [' + oTabsObj.mouseCount + ']');
		}
	}
};

ezTabsObj.deactivateTab = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.deactivateTab(iTab);
		}
	}
};

ezTabsObj.dismissSubTabsTimer = function(oTabsObjId) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if ( (!!oTabsObj) && (oTabsObj.openSubTabNum > -1) ) {
			oTabsObj.debugThis('1.(-) ezTabsObj.dismissSubTabsTimer(' + oTabsObjId + ')' + ', oTabsObj.mouseCount = [' + oTabsObj.mouseCount + ']' + ', oTabsObj.timerTickCount = [' + oTabsObj.timerTickCount + ']');
			oTabsObj.mouseCount -= oTabsObj.timerTickCount;
			oTabsObj.debugThis('2.(-) ezTabsObj.dismissSubTabsTimer(' + oTabsObjId + ')' + ', oTabsObj.mouseCount = [' + oTabsObj.mouseCount + ']');
			if (oTabsObj.mouseCount != -1) {
				oTabsObj.debugThis('(*) ezTabsObj.dismissSubTabsTimer(' + oTabsObjId + ')' + ', oTabsObj.openSubTabNum = [' + oTabsObj.openSubTabNum + ']');
				ezTabsObj.hideSubTabs(oTabsObjId, oTabsObj.openSubTabNum);
			}
		}
	}
};

ezTabsObj.trackSubTabMouseOver = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.mouseCount += (oTabsObj.timerTickCount * 5);
			oTabsObj.mouseCount = Math.min(oTabsObj.mouseCount, oTabsObj.timerTickMaxCount);
			oTabsObj.debugThis('(+) ezTabsObj.trackSubTabMouseOver(' + oTabsObjId + ')' + ', mouseCount = [' + oTabsObj.mouseCount + ']');
		}
	}
};

ezTabsObj.hideSubTabs = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= ezTabsObj.$.length) {
		oTabsObj = ezTabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			if (iTab < 0) {
				return;
			}
			oTabsObj.debugThis('(?) ezTabsObj.hideSubTabs(' + oTabsObjId + ')' + ', oTabsObj.mouseCount = [' + oTabsObj.mouseCount + ']');
			if (oTabsObj.mouseCount <= 0) {
				oTabsObj.debugThis('(HIDE) ezTabsObj.hideSubTabs(' + oTabsObjId + ', ' + iTab + ')');
				oTabsObj._hideSubTabs();
				oTabsObj.mouseCount = -1;
				oTabsObj.debugThis('(=) ezTabsObj.dismissSubTabsTimer(' + oTabsObjId + ')' + ', oTabsObj.mouseCount = [' + oTabsObj.mouseCount + ']');
			}
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
	minSubTabWidth : 0,
	layoutWidth : 0,
	isDebugMode : false,
	isTabClickable : false,
	isIgnoreTabActivation : false,
	isAddingSubTab : false,
	isSubTabsAbsolutePositioned : false,
	isSubTabDismissable : false,
	isSubTabsOpenForActiveTabOnly : false,
	mouseCount : -1,
	timerID : -1,
	timerTickCount : 0,
	openSubTabNum : -1,
	classTab : 'tab',
	classActiveTab : 'tab tabActive',
	classHiddenTab : 'tab tabHidden',
	classSubTab : 'subtab',
	oTabSystem : -1,
	oTabSystemTabs : -1,
	oTabSystemContents : -1,
	tabsCollection : [],
	subTabsCollection : [],
	subTabsAnchorCollection : [],
	contentsCollection : [],
	tabsDict : -1,
	subTabsDict : -1,
	_subTabsDict : -1,
	subTabsContentDict : -1,
	styleBorder : '1px solid #347',
	onReSizeCallback : function(_width, _height, _fixedWidth){ this.left = (_width - _fixedWidth) / 2; this.left = ((this.left < 0) ? 0 : this.left); },
	onActivateTabsCallback : function(iTab){},
	onClickSubTabCallback : function(iSubTab, iTab){},
	html : '',
	toString : function() {
		var s = 'ezTabsObj(' + this.id + ') :: (';
		if (this.id != null) {
			s += 'top = [' + this.top + ']\n';
			s += 'left = [' + this.left + ']\n';
			s += 'width = [' + this.width + ']\n';
			s += 'height = [' + this.height + ']\n';
			s += 'tabHeight = [' + this.tabHeight + ']\n';
			s += 'minSubTabWidth = [' + this.minSubTabWidth + ']\n';
			s += 'layoutWidth = [' + this.layoutWidth + ']\n';
			s += 'isDebugMode = [' + this.isDebugMode + ']\n';
			s += 'isSubTabsOpenForActiveTabOnly = [' + this.isSubTabsOpenForActiveTabOnly + ']\n';
			s += 'oTabSystem = [' + this.oTabSystem + ']\n';
			s += 'tabsCollection.length = [' + this.tabsCollection.length + ']\n';
			s += 'tabsCollection = [' + this.tabsCollection + ']\n';
			s += 'subTabsCollection.length = [' + this.subTabsCollection.length + ']\n';
			s += 'subTabsCollection = [' + this.subTabsCollection + ']\n';
			s += 'contentsCollection.length = [' + this.contentsCollection.length + ']\n';
			s += 'contentsCollection = [' + this.contentsCollection + ']\n';
			s += 'tabsDict = [' + this.tabsDict + ']\n';
			s += 'subTabsDict = [' + this.subTabsDict + ']\n';
			s += '_subTabsDict = [' + this._subTabsDict + ']\n';
			s += 'subTabsContentDict = [' + this.subTabsContentDict + ']\n';
		}
		s += ')';
		return s;
	},
	hideSubTabs : function(iTab, bool) {
		iTab = ((iTab != null) ? iTab : -1);
		bool = ((bool == true) ? bool : false);
		var tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		var oDiv = _$(tabDivId);
		var anchorID = 'anchor_' + this.oTabSystem.id + '_tab' + iTab;
		var bool_isActiveTab = false;
		if (!!oDiv) {
			bool_isActiveTab = (oDiv.className.toUpperCase().indexOf('ACTIVE') > -1);
		}

		if ( (bool) || ( (bool_isActiveTab) && (this.isSubTabDismissable) ) ) {
			var tabDivIdOuter = tabDivId + '_outer';
			var oDivOuter = _$(tabDivIdOuter);
			if (!!oDivOuter) {
				if (oDivOuter.innerHTML.length > 0) {
					try { oDivOuter.style.display = const_none_style; } catch(e) { } finally { }
				}
			}
			if (!bool) {
				this.isSubTabDismissable = false;
			}
			this.openSubTabNum = -1;
		}
	},
	_hideSubTabs : function() {
		var i = -1;
		var tabDivId = -1;
		var tabDivIdOuter = -1;
		var oDivOuter = -1;
		for (i = 1; i <= this.tabsCollection.length; i++) {
			tabDivId = this.tabsCollection[i - 1];
			tabDivIdOuter = tabDivId + '_outer';
			oDivOuter = _$(tabDivIdOuter);
			if (!!oDivOuter) {
				if (oDivOuter.innerHTML.length > 0) {
					try { oDivOuter.style.display = const_none_style; } catch(e) { } finally { }
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

		if ( (!this.isSubTabsOpenForActiveTabOnly) || (bool_isActiveTab) ) {
			var tabDivIdOuter = tabDivId + '_outer';
			var oDivOuter = _$(tabDivIdOuter);
			if (!!oDivOuter) {
				this._hideSubTabs();
				var oAnchor = _$(anchorID);
				if (!!oAnchor) {
					if (this.isSubTabsAbsolutePositioned) {
						oDivOuter.style.top = (anchorPos.y + oAnchor.offsetHeight + 6) + 'px';
						oDivOuter.style.left = (anchorPosL.x - (oAnchor.offsetWidth * 2) + 20) + 'px';
					} else {
						var oO = oDivOuter.parentElement;
						while ( (!!oO) && (oO.id.length == 0) ) {
							oO = oO.parentElement;
						}
						var xPos = -1;
						var yPos = -1;
						if (!!oO) {
							xPos = ezElementPositonX(oO);
							yPos = ezElementPositonY(oO);
						}
						
						if ( (!ezAJAXEngine.browser_is_ie) || (oO == null) ) {
							yPos = anchorPos.y + (this.tabHeight - 5);
						}

						if (oDivOuter.style.position != const_absolute_style) {
							oDivOuter.style.position = const_absolute_style;
						}
						oDivOuter.style.top = (yPos + (this.tabHeight / 4)) + 'px';
						oDivOuter.style.width = (Math.max(anchorPosL.x, anchorPosR.x) - Math.min(anchorPosL.x, anchorPosR.x)) + 40 + 'px';
						oDivOuter.style.left = (anchorPosL.x - this.left) + 'px';
						if ( (this.minSubTabWidth > 0) && (parseInt(oDivOuter.style.width) < this.minSubTabWidth) ) {
							oDivOuter.style.width = this.minSubTabWidth + 'px';
						}
					}
				}
				if (oDivOuter.innerHTML.length > 0) {
					try { oDivOuter.style.display = const_inline_style; } catch(e) { } finally { }
				}
			}
			this.openSubTabNum = iTab;
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
	deactivateTab : function(iTab) {
		iTab = ((iTab != null) ? iTab : -1);
		var tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		var oDiv = _$(tabDivId);
		if (!!oDiv) {
			try { oDiv.style.border = this.styleBorder; } catch(e) { } finally { }
		}
	},
	activateContentPage : function(iContentTab) {
		var i = -1;
		var oTabContent = -1;
		var _oTabContent = -1;
		iContentTab = ((iContentTab != null) ? iContentTab : -1);
		_oTabContent = _$(this.contentsCollection[iContentTab]);
		if (!!_oTabContent) {
			for (i = 0; i < this.contentsCollection.length; i++) {
				oTabContent = _$(this.contentsCollection[i]);
				if (!!oTabContent) {
					try { oTabContent.style.display = const_none_style; } catch(e) { } finally { };
				}
			}
			try { _oTabContent.style.display = const_inline_style; } catch(e) { } finally { };
		}
	},
	clickSubTab : function(iSubtab) {
		iSubtab = ((iSubtab != null) ? iSubtab : -1);
		var iTab = this._subTabsDict.getValueFor(iSubtab);
		if (typeof this.onClickSubTabCallback == const_function_symbol) {
			try { this.onClickSubTabCallback(iSubtab, iTab); } catch(e) {} finally { }
		}
		var iContentTab = this.subTabsContentDict.getValueFor(iSubtab);
		iContentTab = (((typeof iContentTab) == const_string_symbol) ? parseInt(iContentTab) : iContentTab);

		this.isIgnoreTabActivation = true;
		if ((typeof iContentTab) == const_object_symbol) {
			this.activateContentPage(iContentTab[0] - 1);
		} else {
			this.activateContentPage(iContentTab - 1);
		}
	},
	activateTab : function(iTab) {
		var i = -1;
		var j = -1;
		var k = -1;
		var oTab = -1;
		var iContentTab = -1;
		var oTabContent = -1;
		var elPosY = -1;
		var elPosX = 0;
		var _elPosY = -1;
		var elPrevPosX_L = -1;
		var elPrevPosX_R = -1;
		var prevTabID = -1;
		var prevAnchorID_L = -1;
		var prevAnchorPos_L = -1;
		var prevAnchorID_R = -1;
		var prevAnchorPos_R = -1;
		var oAnchor = -1;
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
			this._hideSubTabs();
			if (!this.isIgnoreTabActivation) {
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
				this.isIgnoreTabActivation = true;
			} else {
				this.isIgnoreTabActivation = false;
			}
		}
		return this;
	},
	addContentForSubTab : function(iSubTab, sContents) {
		var html = '';
		var iPage = -1;
		var iPageCnt = -1;
		var tabDivId = -1;
		var iContent = -1;

		iSubTab = ((iSubTab != null) ? iSubTab : -1);
		sContents = ((sContents != null) ? sContents : '');
		if (iSubTab > -1) {
			iPage = this.subTabsContentDict.getValueFor(iSubTab);
			iPageCnt = (((typeof iPage) == const_object_symbol) ? (iPage.length + 1) : ((iPage == null) ? 1 : 2));
			tabDivId = 'div_' + this.oTabSystem.id + '_contentSubTab' + iSubTab + '_' + iPageCnt;
			html += '<div id="' + tabDivId + '" style="display: none;">';
			html += sContents;
			html += '</div>';
			
			try {
				if (!!this.oTabSystemContents) {
					this.oTabSystemContents.innerHTML += html;
					this.contentsCollection.push(tabDivId);
					iContent = this.contentsCollection.length;
					this.subTabsContentDict.push(iSubTab, iContent);
				}
			} catch(e) { } finally { };
		}
		return iContent;
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
		var anchorID = 'anchor_' + this.oTabSystem.id + '_' + ((this.isAddingSubTab) ? 'subTab' : 'tab') + iTab;
		
		if (this.isAddingSubTab) {
			this.subTabsAnchorCollection.push(anchorID);
		}

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
		var bool_isAddingSubTab = this.isAddingSubTab;
		var subtabsContainerDivId = -1;
		
		function tabEventHandlerForTab(objId, tabNum) {
			objId = ((objId != null) ? objId : -1);
			tabNum = ((tabNum != null) ? tabNum : -1);
			if (!bool_isAddingSubTab) {
				return ' onclick="ezTabsObj.activateTab(' + objId + ', ' + tabNum + '); return false;"';
			} else {
				return ' onclick="ezTabsObj.clickSubTab(' + objId + ', ' + tabNum + '); return false;"';
			}
		}
		
		var tabEventHandler2 = '';
		
		sTitle = ((sTitle != null) ? sTitle : '');
		if (!bool_isAddingSubTab) {
			iTab = (this.tabsCollection.length + 1);
			tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
			subtabsContainerDivId = 'div_' + this.oTabSystem.id + '_subtabsContainer' + iTab;
			tabEventHandler2 = ' onmouseover="ezTabsObj.openSubTabs(' + this.id + ', ' + iTab + '); return false;" onmouseout="ezTabsObj.deactivateTab(' + this.id + ', ' + iTab + '); return false;"';
		} else {
			iTab = (this.subTabsCollection.length + 1);
			tabDivId = 'div_' + this.oTabSystem.id + '_subTab' + iTab;
			subtabsContainerDivId = '';
		}
		
		var tabEventHandler1 = tabEventHandlerForTab(this.id, iTab);

		html += '<div id="' + tabDivId + '" class="' + this.classTab + '" style="display: none; height: ' + (this.tabHeight) + 'px; cursor:hand; cursor:pointer;"' + tabEventHandler1 + tabEventHandler2 + '>';

		html += this.tabAnchor(sTitle, tabEventHandler1);
		if (!bool_isAddingSubTab) {
			this.tabsCollection.push(tabDivId);
		} else {
			this.subTabsCollection.push(tabDivId);
		}
		iTabs.push(iTab);

		if (!bool_isAddingSubTab) {
			html += '<div id="' + subtabsContainerDivId + '"></div>';
		}

		html += '</div>';
		
		if (!!this.oTabSystemTabs) {
			var oTR = _$('tr_tabsLayout_' + this.id);
			if (!!oTR) {
				var c = oTR.insertCell(oTR.cells.length);
				c.innerHTML = html;
			} else {
				this.oTabSystemTabs.innerHTML += html;
			}
		}
		if (!bool_isAddingSubTab) {
			this.isTabClickable = false;
			this.activateTab(iTab);
			this.isTabClickable = true;
		}
		return iTabs;
	},
	renderSubTabsFrom : function(iTab, anAR) {
		var i = -1;
		var html = '';
		var oObj = -1;
		var objID = -1;
		var id = -1;
		iTab = ((iTab != null) ? iTab : -1);
		anAR = (((typeof anAR) == const_object_symbol) ? anAR : []);

		html += '<table id="table_subtabsWrapper_' + iTab + '" border="0" width="100%" cellpadding="-1" cellspacing="-1">'; 
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
		var subtabsContainerDivId = -1;
		var oSubtabsContainerDiv = -1;

		iTab = ((iTab != null) ? iTab : -1);
		sTitle = ((sTitle != null) ? sTitle : '');
		
		if (iTab > -1) {
			this.isAddingSubTab = true;
			iSubTabs = this.addTab(sTitle);
			this.isAddingSubTab = false;
	
			if ((typeof iSubTabs) == const_object_symbol) {
				iSubTab = iSubTabs.pop();
				this.subTabsDict.push(iTab, iSubTab);
				this._subTabsDict.push(iSubTab, iTab);

				tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
				subtabsContainerDivId = 'div_' + this.oTabSystem.id + '_subtabsContainer' + iTab;
				tabDivIdOuter = tabDivId + '_outer';
				var oOuter = _$(tabDivIdOuter);
				var _html = '';
				var subTabsAR = this.subTabsDict.getValueFor(iTab);
				if (oOuter == null) {
					var tableID = 'table_subtabsWrapper_' + iTab;
					_html += '<div id="' + tabDivIdOuter + '" onmouseover="var oTable = _$(\'' + tableID + '\'); try { ezTabsObj.debugThis(' + this.id + ', \'onmouseover :: oTable.border = [\' + oTable.border + \'], \'); } catch (e) { }; if ( (this.style.display == const_inline_style) && (!!oTable) && (oTable.border == 0) ) { ezTabsObj.trackSubTabMouseOver(' + this.id + ', ' + iTab + '); oTable.border=1; }; return false;" onmouseout="var oTable = _$(\'' + tableID + '\'); try { ezTabsObj.debugThis(' + this.id + ', \'onmouseout :: oTable.border = [\' + oTable.border + \'], \'); } catch (e) { }; if ( (this.style.display == const_inline_style) && (!!oTable) && (oTable.border == 1) ) { ezTabsObj.hideSubTabs(' + this.id + ', ' + iTab + '); oTable.border=0; }; return false;" style="' + ((this.isSubTabsAbsolutePositioned) ? 'position: absolute; top: 0px; left: 0px; width: 0px; ' : '') + 'display: none; cursor:hand; cursor:pointer; z-index: 32767;">';
					_html += this.renderSubTabsFrom(iTab, subTabsAR);
					_html += '</div>';
					oSubtabsContainerDiv = _$(subtabsContainerDivId);
					if (!!oSubtabsContainerDiv) {
						oSubtabsContainerDiv.innerHTML += _html;
					}
				} else {
					_html += this.renderSubTabsFrom(iTab, subTabsAR);
					oOuter.innerHTML = _html;
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
	debugThis : function(sTxt) {
		var oDiv = _$(this.debuggerDivName);
		var oObj = _$(this.debuggerDivName + '_ta');
		if ( (this.isDebugMode) && (!!oObj) && (!!oDiv) ) {
			if (oDiv.style.display == const_none_style) {
				oDiv.style.display = const_inline_style;
			}
			this.debuggerCount++;
			oObj.value = '(' + this.debuggerCount + ') ' + sTxt + '\n' + oObj.value;
		}
	},
	create : function(top, left, width, height, tabHeight) {
		var _width = ezClientWidth();
		var oTabSystemContainer = _$('TabSystemContainer');
		this.top = ((top != null) ? top : -1);
		this.left = ((left != null) ? left : -1);
		this.width = ((width != null) ? width : -1);
		this.height = ((height != null) ? height : -1);
		this.tabHeight = ((tabHeight != null) ? tabHeight : ((!ezAJAXEngine.browser_is_ie) ? 15 : 20));
		this.layoutWidth = ezTabsObj.layoutWidth;
		var bool_isTooManyObjects = false;
		try { bool_isTooManyObjects = ((oTabSystemContainer.length) && (oTabSystemContainer.length > 0) && ((typeof oTabSystemContainer) == const_object_symbol)); } catch(e) { } finally { };
		if ( (!!oTabSystemContainer) && (!bool_isTooManyObjects) ) {
			this.left += ((_width - this.layoutWidth) / 2);
			this.left = ((this.left < 0) ? 0 : this.left);

			this.html += '<div id="TabSystem' + this.id + '" style="' + ((this.isPositionAbsolute()) ? 'position: absolute; top: ' + this.top + 'px; left: ' + this.left + 'px; width: ' + this.width + 'px; height: ' + this.height + 'px;' : 'width: 100%;') + '">';
			this.html += '</div>';

			oTabSystemContainer.innerHTML += this.html;
			this.oTabSystem = _$('TabSystem' + this.id);
			
			var html = '';
			html += '<div id="div_TabSystem' + this.id + '_tabs" class="tabs" style="height: ' + this.tabHeight + 'px;">';
			if (!ezAJAXEngine.browser_is_ie) {
				html += (this.const_tabsTableBegin + this.const_tabsTableEnd);
			}
			html += '</div>';
			html += '<div id="div_TabSystem' + this.id + '_contents" class="content">';
			html += '</div>';

			this.debuggerCount = 0;
			this.debuggerDivName = 'div_TabSystem_debugger' + this.id + '_contents';
			html += '<div id="' + this.debuggerDivName + '" style="display: none;">';
			html += '<textarea id="' + this.debuggerDivName + '_ta" readonly style="width: 800px; height: 100px;"></textarea>';
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
		try { ezDictObj.remove$(this._subTabsDict.id); } catch(e) { } finally { }
		if (this.timerID > -1) {
			clearInterval(this.timerID);
			this.timerID = null;
		}
		return (this.id = ezTabsObj.$[this.id] = this.oTabSystem = this.oTabSystemTabs = this.oTabSystemContents = this.tabsCollection = this.contentsCollection = this.tabsDict = this.subTabsDict = this._subTabsDict = null);
	}
};

