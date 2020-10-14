// TabsObj.js

TabsObj = function(id, top, left, width, height){
	this.id = id;
	this.create(top, left, width, height);
};

TabsObj.$ = [];

TabsObj.get$ = function(top, left, width, height) {
	var instance = TabsObj.$[TabsObj.$.length];
	if (instance == null) {
		instance = TabsObj.$[TabsObj.$.length] = new TabsObj(TabsObj.$.length, top, left, width, height);
	}
	return instance;
};

TabsObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < TabsObj.$.length) ) {
		var instance = TabsObj.$[id];
		if (!!instance) {
			TabsObj.$[id] = ezObjectDestructor(instance);
			ret_val = (TabsObj.$[id] == null);
		}
	}
	return ret_val;
};

TabsObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < TabsObj.$.length; i++) {
		TabsObj.remove$(i);
	}
	return ret_val;
};

TabsObj.activateTab = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= TabsObj.$.length) {
		oTabsObj = TabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.activateTab(iTab);
		}
	}
};

TabsObj.expandTab = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= TabsObj.$.length) {
		oTabsObj = TabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.expandTab(iTab);
		}
	}
};

TabsObj.contractTab = function(oTabsObjId, iTab) {
	var oTabsObj = -1;
	if (oTabsObjId <= TabsObj.$.length) {
		oTabsObj = TabsObj.$[oTabsObjId];
		if (!!oTabsObj) {
			iTab = ((iTab != null) ? iTab : -1);
			oTabsObj.contractTab(iTab);
		}
	}
};

TabsObj.prototype = {
	id : -1,
	top : 0,
	left : 0,
	width : 0,
	height : 0,
	classTab : 'tab',
	classActiveTab : 'tab tabActive',
	classHiddenTab : 'tab tabHidden',
	oTabSystem : -1,
	oTabSystemTabs : -1,
	oTabSystemContents : -1,
	tabsCollection : [],
	contentsCollection : [],
	html : '',
	toString : function() {
		var s = 'TabsObj(' + this.id + ') :: (';
		if (this.id != null) {
			s += 'top = [' + this.top + ']\n';
			s += 'left = [' + this.left + ']\n';
			s += 'width = [' + this.width + ']\n';
			s += 'height = [' + this.height + ']\n';
			s += 'oTabSystem = [' + this.oTabSystem + ']\n';
			s += 'tabsCollection.length = [' + this.tabsCollection.length + ']\n';
			s += 'tabsCollection = [' + this.tabsCollection + ']\n';
			s += 'contentsCollection.length = [' + this.contentsCollection.length + ']\n';
			s += 'contentsCollection = [' + this.contentsCollection + ']\n';
		}
		s += ')';
		return s;
	},
	expandTab : function(iTab) {
		iTab = ((iTab != null) ? (iTab - 1) : -1);
		var tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		var tabDivIdOuter = tabDivId + '_outer';
		var oDivOuter = _$(tabDivIdOuter);
		if (!!oDivOuter) {
			try { oDivOuter.style.display = const_inline_style; } catch(e) { } finally { }
		}
	},
	contractTab : function(iTab) {
		iTab = ((iTab != null) ? (iTab - 1) : -1);
		var tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		var tabDivIdOuter = tabDivId + '_outer';
		var oDivOuter = _$(tabDivIdOuter);
		if (!!oDivOuter) {
			try { oDivOuter.style.display = const_none_style; } catch(e) { } finally { }
		}
	},
	combineTabs : function(iTab, vararg_params) {
		var i = -1;
		var oTab = -1;
		var anArg = -1;
		var _html = '';
		var sourceTabs = [];
		var oTabOuter = -1;
		iTab = ((iTab != null) ? (iTab - 1) : -1);
		if (iTab > -1) {
		    for (i = 0; i < arguments.length - 1; i++) {
				anArg = arguments[i + 1];
				if (anArg != null) sourceTabs.push(parseInt(anArg.toString()) - 1);
			}
	//		ezAlert('Combine Tabs (' + sourceTabs + ') into Tab (' + iTab + ').');
			for (i = 0; i < sourceTabs.length; i++) {
				oTab = _$(this.tabsCollection[sourceTabs[i]]);
				if (!!oTab) {
					_html += '<br>' + oTab.innerHTML;
					oTab.style.display = const_none_style;
					oTab.className = this.classHiddenTab;
	//		ezAlert(oTab.innerHTML + '\n========================================\n');
				}
			}
			oTab = _$(this.tabsCollection[iTab]);
			if (!!oTab) {
				var tabDivId = 'div_' + this.oTabSystem.id + '_tab' + (iTab + 1);
				var tabDivIdOuter = tabDivId + '_outer';
				oTabOuter = _$(tabDivIdOuter);
				if (!!oTabOuter) {
					oTabOuter.innerHTML = _html;
				}
	//	ezAlert(oTab.innerHTML + '\n========================================\n');
			}
		}
	},
	activateTab : function(iTab) {
		var i = -1;
		var oTab = -1;
		var oTabContent = -1;
		iTab = ((iTab != null) ? (iTab - 1) : -1);
		if ( (iTab > -1) && (iTab < this.tabsCollection.length) && (iTab < this.contentsCollection.length) ) {
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
			for (i = 0; i < this.contentsCollection.length; i++) {
				oTabContent = _$(this.contentsCollection[i]);
				if (!!oTabContent) {
					if (i == iTab) {
						oTabContent.style.display = const_inline_style;
					} else {
						oTabContent.style.display = const_none_style;
					}
				}
			}
		}
		return this;
	},
	addContentForTab : function(iTab, sContents) {
		var html = '';
		var tabDivId = -1;
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
			}
		}
		return this.contentsCollection.length;
	},
	addTab : function(sTitle) {
		var html = '';
		var iTab = -1;
		var tabDivId = -1;
		var tabDivIdOuter = -1;
		sTitle = ((sTitle != null) ? sTitle : '');
		iTab = (this.tabsCollection.length + 1);
		tabDivId = 'div_' + this.oTabSystem.id + '_tab' + iTab;
		tabDivIdOuter = tabDivId + '_outer';
		html += '<div id="' + tabDivId + '" class="' + this.classTab + '" style="display: none; cursor:hand; cursor:pointer;" onclick="TabsObj.activateTab(' + this.id + ', ' + iTab + '); return false;" onmouseover="TabsObj.expandTab(' + this.id + ', ' + iTab + '); return false;" onmouseout="TabsObj.contractTab(' + this.id + ', ' + iTab + '); return false;">';
		html += '<a id="anchor_' + this.oTabSystem.id + '_tab' + iTab + '" href="#Tab' + iTab + '" accesskey="' + iTab + '" tabindex="' + iTab + '" id="tab' + iTab + '" title="' + sTitle + '">';
		html += '&nbsp;<font size="1"><small>' + sTitle + '</small></font>';
		html += '</a>';
		html += '<div id="' + tabDivIdOuter + '" style="display: none; cursor:hand; cursor:pointer;">';
		html += '</div>';
		html += '</div>';

		if (!!this.oTabSystemTabs) {
			this.oTabSystemTabs.innerHTML += html;
			this.tabsCollection.push(tabDivId);
		}
		this.activateTab(iTab);
		return iTab;
	},
	create : function(top, left, width, height) {
		var oTabSystemContainer = _$('TabSystemContainer');
		this.top = ((top != null) ? top : 0);
		this.left = ((left != null) ? left : 0);
		this.width = ((width != null) ? width : 0);
		this.height = ((height != null) ? height : 0);
		if (!!TabSystemContainer) {
			this.html += '<div id="TabSystem' + this.id + '" style="position: absolute; top: ' + this.top + 'px; left: ' + this.left + 'px; width: ' + this.width + 'px; height: ' + this.height + 'px;">';
			this.html += '</div>';

			TabSystemContainer.innerHTML += this.html;
			this.oTabSystem = _$('TabSystem' + this.id);
			
			var html = '';
			html += '<div id="div_TabSystem' + this.id + '_tabs" class="tabs">';
			html += '</div>';
			html += '<div id="div_TabSystem' + this.id + '_contents" class="content">';
			html += '</div>';
			
			this.oTabSystem.innerHTML = html;
			
			this.oTabSystemTabs = _$('div_TabSystem' + this.id + '_tabs');
			this.oTabSystemContents = _$('div_TabSystem' + this.id + '_contents');
		}

		return this;
	},
	init : function() {
		return this;
	},
	destructor : function() {
		ezFlushCache$(this.oTabSystem);
		return (this.id = TabsObj.$[this.id] = this.oTabSystem = this.oTabSystemTabs = this.oTabSystemContents = this.tabsCollection = this.contentsCollection = null);
	}
};

