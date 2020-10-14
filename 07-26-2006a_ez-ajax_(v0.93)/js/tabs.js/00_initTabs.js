/** TabParams
* eventType		- What action activates a tab? "click" | "mouseover" 
*                       | "mousedown" | "mouseup" .
*
* tabTagName	    - "span" | "img" | "*" -- span or img speeds up initialization.
*                    use "*" if your have both span and img tabs.
* imgOverExt	    - A file name suffix before the extension .
*                    if src="calendar.gif" is the normal file and you want it to 
*                    be "calendaro.gif" on mouseover, then imgOverExt is "o".
*
* imgActiveExt	    - A file name suffix before the extension .
*                    if src="calendaro.gif" is the normal file and you want it to 
*                    be "calendaro.gif" on mouseover, then imgOverExt is "o".
*
* cookieScope		- "page" | "site" | "none" 
*                     -- "page" 
*                         page scope (default) saves multiple tab states for different 
*                         tabsystems on your site. 
*                         Page scope is useful when you want to save the state of
*                         different tabsystems on your site. Page scope uses multiple 
*                         cookies.
*
*                    -- "site"
*                        site scope saves the state for tabSystems that
*                        may be used on multiple pages (such as with included files.
*                        This is most useful for using the same tabSystem(s) on 
*                        different pages, as with a server side include file. Site scope 
*                        uses only 1 cookie.
*
*                    -- "none"
*                        No cookie will be used.
*/
	TabParams = {
	eventType       : "click",
	tabTagName      : "a",
	imgOverExt      : "",
	imgActiveExt    : "",
	cookieScope		: "page"
};

_vis_tabs_begin = 1;
_vis_tabs_end = 2;

try {
	if ((typeof tabsSystemCallBack) == const_function_symbol) {
		tabsSystemCallBack();
	}
} catch(e) {
	var funcNameAR = tabsSystemCallBack.toString().split('(');
	var _funcNameAR = funcNameAR[0].split(' ');
	ezAlertError(ezErrorExplainer(e, 'An Error in user-defined code for Call-Back named "' + _funcNameAR.pop() + '" handled during initialization of tabs.js interface.'));
} finally {
}

_num_vis_tabs_max = (_vis_tabs_end - _vis_tabs_begin) + 1;

_const__tab = "tab";
_const_cell_tab = "cell_" + _const__tab;

_const__content = "content";

_const_content_loading = "content_loading";

_const_hiliteDiv_id = "xxxxxYYYYYzzzzz";
_const_hilite_style = "BORDER-RIGHT:black 1px solid;BORDER-TOP:black 1px solid;BORDER-LEFT:black 1px solid;BORDER-BOTTOM:black 1px solid;background-color: White;";

_const_hiliteDiv_begin = "<span id=" + _const_hiliteDiv_id + " style=\"" + _const_hilite_style + "\">";
_const_hiliteDiv_end = "</span>";

_const_begin_hilite = _const_hiliteDiv_begin + "<font size=\"-1\" color=\"#FF0000\"><B><U><I>";
_const_end_hilite = "</I></U></B></font>" + _const_hiliteDiv_end;

_const_tr_tag_begin = "<TR";
_const_id_param_begin = "id=";
_const_style_param_begin = "style=";

_allow_RefreshVCRControls = true;
_allow_AutoTabsAdjustment = false;

function activeTabNumFrom(ts) {
	var ch = -1;
	if (ts != null) {
		var _activeTab = ts.activeTab;
		if (_activeTab != null) {
			var s = _activeTab.id.trim();
			for (var i = s.length - 1; i >= 0; i--) {
				ch = s.charCodeAt(i);
				if ( (ch < 48) || (ch > 57) ) {
					i++;
					break;
				}
			}
			var _num = parseInt(s.substring(i, s.length).trim());
			return (isNaN(_num) == false) ? _num : -1;
		}
	}
	return -1;
}

function _tabChanged(_num) {
	if (_allow_AutoTabsAdjustment) {
		var _vis_tabs_max = _num_vis_tabs_max - 1;
		
		if (_num == _vis_tabs_end) {
			_objE = _$(_const_cell_tab + (_num + 1));
			if (_objE != null) {
				_objE.style.display = const_inline_style;
				_vis_tabs_begin++;
				_vis_tabs_end++;

				_objB_name = _const_cell_tab + (_num - _vis_tabs_max);
				_objB = _$(_objB_name);
				if (_objB != null) {
					_objB.style.display = const_none_style;
				}
			}
		}
		if (_num == _vis_tabs_begin) {
			_objB_name = _const_cell_tab + (_num - 1);
			_objB = _$(_objB_name);
			if (_objB != null) {
				_objB.style.display = const_inline_style;
				_vis_tabs_begin--;
				_vis_tabs_end--;

				_objE = _$(_const_cell_tab + (_num + _vis_tabs_max));
				if (_objE != null) {
					_objE.style.display = const_none_style;
				}
			}
		}
	}

	var _obj = _$(_const__content + _num.toString());
	if (_obj != null) {
		_obj.style.display = const_inline_style;
	}
}

function setStyleForAllTabs(s, i, j) {
	for(; i <= j; i++) {
		var _obj = _$(_const_cell_tab + i.toString());
		if (_obj != null) {
			_obj.style.display = s;
		}
	}
}

function refreshTabs(ts) {
	var _id = -1;
	if ( (ts != null) && (ts.activeTab != null) ) {
		_id = ts.activeTab.id
	}
	var _obj = _$("cell_" + _id);
	var _num = activeTabNumFrom(ts);
	var d = '';
	if (_obj != null) {
		d = _obj.style.display;
	}
	
	if ( (_num > _vis_tabs_end) && (d.toUpperCase() == const_none_style.toUpperCase()) ) {
		_vis_tabs_end = _num;
		_vis_tabs_begin = (_vis_tabs_end - _num_vis_tabs_max) + 1;
		setStyleForAllTabs(const_none_style, 1, ts.tabs.length);
		setStyleForAllTabs(const_inline_style, _vis_tabs_begin, _vis_tabs_end);
	}
}

function tabChanged() {
	var _obj = _$("cell_" + this.activeTab.id);
	var _num = activeTabNumFrom(this);
	
	ezAlert('tabChanged() :: ' + '_num = [' + _num + ']');
	
	return( _tabChanged(_num));
}

function tabsSystemInit() {
	tabInit();

	var ts = TabSystem.list["TabSystem1"];
	
	ezAlert('tabsSystemInit() :: ' + 'ts = [' + ts + ']');

	if (ts != null) {
		ts.addEventListener("onchange", tabChanged);

		refreshTabs(ts);
		
		var obj = _$(_const_content_loading);
		if (obj != null) {
			obj.style.display = const_none_style;
		}
	}
}

