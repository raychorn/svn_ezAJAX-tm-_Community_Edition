ezAJAXEngine = function(id, u, _d) {
	this.id = id;		

	if (!u) this.throwError("No server-side ezAJAX(tm) Event Handler was specified.", true);
	if (!(!!document.getElementById)) this.throwError("Your browser does not meet the minimum requirements. \nPortions of the page have been disabled and therefore \nthe page may not work as expected.", true);

	this.url = u;
	var ar = this.url.split('/'); 
	if (ar.length > 3) { ar.pop(); ar[ar.length - 1] = ''; }; // remove the required portion of the URL to reveal the base URL...
	this._url = ar.join('/');

	this.mode = ((!!_d && _d == true) ? this.debug_mode_symbol : this.release_mode_symbol);

	this.ajaxID = 'id_' + ezAJAXEngine.releaseNumber + '_ezAJAX_' + ezAJAXEngine.items.length;
	this.formID = 'id_' + ezAJAXEngine.releaseNumber + '_ezAJAX_Form_' + ezAJAXEngine.items.length;
};

ezAJAXEngine.$ = [];

ezAJAXEngine.items = [];

ezAJAXEngine.get$ = function(_url, _debugFlag) {
	if ( (ezAJAXEngine.isCommunityEdition) && (ezAJAXEngine.$.length == 1) ) {
		return null;
	}
	var instance = ezAJAXEngine.$[ezAJAXEngine.$.length];
	if (instance == null) {
		instance = ezAJAXEngine.$[ezAJAXEngine.$.length] = new ezAJAXEngine(ezAJAXEngine.$.length, _url, _debugFlag);
	}
	return instance;
};

ezAJAXEngine.browser_is_ff = ((!/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent) && !/Netscape/i.test(navigator.userAgent)) && /Gecko/i.test(navigator.userAgent) && /Firefox/i.test(navigator.userAgent));
ezAJAXEngine.browser_is_ie = (/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent) && !/Gecko/i.test(navigator.userAgent) && !/Netscape/i.test(navigator.userAgent) && !/Firefox/i.test(navigator.userAgent) );
ezAJAXEngine.browser_is_ns = ((!/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent) && !/Firefox/i.test(navigator.userAgent)) && /Gecko/i.test(navigator.userAgent) && /Netscape/i.test(navigator.userAgent));
ezAJAXEngine.browser_is_op = ((!/msie/i.test(navigator.userAgent) && /opera/i.test(navigator.userAgent) && !/Firefox/i.test(navigator.userAgent) && !/Gecko/i.test(navigator.userAgent) && !/Netscape/i.test(navigator.userAgent)));

ezAJAXEngine.releaseNumber = 'ezAJAXEngine';

ezAJAXEngine.isCommunityEdition = true;

ezAJAXEngine.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezAJAXEngine.$.length) ) {
		var instance = ezAJAXEngine.$[id];
		if (!!instance) {
			ezAJAXEngine.$[id] = ezObjectDestructor(instance);
			ret_val = (ezAJAXEngine.$[id] == null);
		}
	}
	return ret_val;
};

ezAJAXEngine.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezAJAXEngine.$.length; i++) {
		ezAJAXEngine.remove$(i);
	}
	return ret_val;
};

ezAJAXEngine.init = function(url_sBasePath, isXmlHttpPreferred) {
	var _oAJAXEngine = ezAJAXEngine.get$(url_sBasePath, false); // create the gateway object
	try {
		browser_is_op = _oAJAXEngine.browser_is_op;
		browser_is_ns = _oAJAXEngine.browser_is_ns;
		browser_is_ff = _oAJAXEngine.browser_is_ff;
		browser_is_ie = _oAJAXEngine.browser_is_ie;
		
		_oAJAXEngine.bool_showServerBusyIndicator = true;

		_oAJAXEngine.setMethodGet();
		_oAJAXEngine.setReleaseMode(); // this overrides the oAJAXEngine.set_isServerLocal() setting...

		// The following line of code sets-up the Production environment for a preference for XmlHttpRequest rather than iFrame...
		_oAJAXEngine.isXmlHttpPreferred = ((isXmlHttpPreferred == true) ? isXmlHttpPreferred : false);

		ezAJAXEngine.js_global_varName = 'js$';

		_oAJAXEngine.timeout = 120;
		_oAJAXEngine.hideFrameCallback = function () { };
		_oAJAXEngine.showFrameCallback = function () { };

		if (typeof ezThoughtBubbleObj == const_object_symbol) {
			try { ezThoughtBubbleObj.loadStyles(); } catch (e) { }; // preinitialization to make the first thought bubble appear a bit faster...
		}

		if (!ezAJAXEngine.isBrowserVersionCertified()) {
		}

		if ((typeof window_onload) == const_function_symbol) {
			window.onload = function() {
				try { return window_onload(); } catch (e) { };
			};
		} else {
			alert('WARNING :: window_onload has not been defined - there may be some problems during system initialization.');
		}

		if ((typeof window_onUnload) == const_function_symbol) {
			window.onunload = function() {
				try { return window_onUnload(); } catch (e) { };
			};
		} else {
			alert('WARNING :: window_onUnload has not been defined - there may be some problems during system finalization when the browser closes or the app loses focus.');
		}
	} catch (e) { alert('1.1 Error in ezAJAXEngine.preInit()\n' + ezErrorExplainer(e)); };

	oAJAXEngine = _oAJAXEngine;
	return _oAJAXEngine;
};

ezAJAXEngine._cacheCounters = [];

ezAJAXEngine.xmlHttp_reqObject = function() {
	var oXmlHttpReqObj = new Object();
	
	if (!!oXmlHttpReqObj) {
		oXmlHttpReqObj.oRequest = false;
		oXmlHttpReqObj.oGateway = -1;
	}
	return oXmlHttpReqObj;
};

ezAJAXEngine._initXmlHttpRequest = function(sSearch) {
	sSearch = (((typeof sSearch) == const_string_symbol) ? sSearch.ezURLDecode() : '');
	var _search = sSearch;
	var i = _search.indexOf('?') + 1;
	var j = _search.indexOf('&');
	var idStr = _search.substring(i,j);

	var _id = parseInt(idStr);
	var oInstance = ezAJAXEngine.$[_id];
	if (!!oInstance) {
		var _url = _search.substring(j + 1, _search.length);
		oInstance._initXmlHttpRequest(_url);
	}
};

ezAJAXEngine.browserVersion = function() {
	var i = -1;
	var ar = navigator.userAgent.split(';');
	var tok = ((ezAJAXEngine.browser_is_ie) ? 'msie' : ((ezAJAXEngine.browser_is_ff) ? 'firefox' : ((ezAJAXEngine.browser_is_ns) ? 'netscape' : ((ezAJAXEngine.browser_is_op) ? 'opera' : ''))));
	for (i = 0; i < ar.length; i++) {
		if (ar[i].toLowerCase().indexOf(tok) > -1) {
			var _ar = ar[i].split(' ');
			if (!ezAJAXEngine.browser_is_ie) {
				var s_ar = -1;
				var sAR = -1;
				while (_ar.length > 0) {
					s_ar = _ar.pop();
					sAR = s_ar.split('/');
					if ( (sAR.length == 2) && (sAR[0].toLowerCase().indexOf(tok) > -1) ) {
						s_ar = sAR.pop();
						break;
					}
				}
			} else {
				s_ar = _ar.pop();
			}
			return s_ar;
		}
	}
	return -1;
};

ezAJAXEngine.browserCertificationCallback = function(){ alert('You are using a browser version that has not been certified to work with ezAJAX(tm) - PLS download the latest browser version and try again OR your experience with ezAJAX(tm) may be less than is desired.'); };

ezAJAXEngine.isBrowserVersionCertified = function() {
	var bVer = ezAJAXEngine.browserVersion();
	var arVer = bVer.split('.');
	var i = -1;
	var s = '';
	if (arVer.length > 1) {
		for (i = 1; i < arVer.length; i++) {
			s += arVer[i];
		}
	}
	var sVer = ((arVer.length > 0) ? arVer[0] : '') + '.' + s;
	bVer = ((bVer != sVer) ? sVer : bVer);
	var bool = ( (ezAJAXEngine.browser_is_ie && (parseFloat(bVer) >= 6.0)) || (ezAJAXEngine.browser_is_ff && (parseFloat(sVer) >= 1.5)) || (ezAJAXEngine.browser_is_ns && (parseFloat(bVer) >= 8.0)) || (ezAJAXEngine.browser_is_op && (parseFloat(bVer) >= 9.0)) );
	if ((typeof ezAJAXEngine.browserCertificationCallback) == const_function_symbol) {
		if (!bool) ezAJAXEngine.browserCertificationCallback();
	}
	return bool;
};

ezAJAXEngine.isBrowserOfType = function(id) {
	var bool = false;
	id = ((id != null) ? id.toUpperCase() : '');
	if ( (id == 'IEXPLORER') || (id == 'IE') ) {
		bool = ezAJAXEngine.browser_is_ie;
	} else if ( (id == 'FIREFOX') || (id == 'FF') ) {
		bool = ezAJAXEngine.browser_is_ff;
	} else if ( (id == 'NETSCAPE') || (id == 'NS') ) {
		bool = ezAJAXEngine.browser_is_ns;
	} else if ( (id == 'OPERA') || (id == 'OP') ) {
		bool = ezAJAXEngine.browser_is_op;
	}
	return bool;
};

ezAJAXEngine.ezAJAX_serverBusy_divName = function() {
	return 'ezajax_html_container';
};

function handleValidateAJAXRuntimeLicense() { // this is a dummy function that simply exists as a placeholder...
}

ezAJAXEngine.receivePacketMethod = function() {
	return const_simpler_symbol;
};

ezAJAXEngine.receivePacket = function(qObj, callBackJSOrFunc) {
	var bool_isSimplerMethod = true;
	try {
		bool_isSimplerMethod = (ezAJAXEngine.receivePacketMethod().toLowerCase() == const_simpler_symbol.toLowerCase());
	} catch(e) {
		bool_isSimplerMethod = true;
	} finally {
	}
	try {
		if (!!qObj) {
			var nRecs = -1;
			var oParms = -1;
			var argsDict = ezDictObj.get$();
			var cDict = ezDictObj.get$();
			var aDict = -1;
			var html = '';
	
			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.ezTrim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.ezTrim(), v);
				}
			};

			function searchForCommunityRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.ezTrim().toUpperCase().indexOf('isCommunityEdition'.toUpperCase()) != -1) {
					cDict.push(n.ezTrim(), v.ezTrim());
				}
			};

			try {
				var qStats = qObj.named('qDataNum');
				if (qStats == null) {
					qStats = qObj.named('qStats');
				}
				if (!!qStats) {
					nRecs = qStats.dataRec[1];
				}
			} catch(e) {
				nRecs = -1;
				ezAlertError(ezErrorExplainer(e, 'Error in abstract code handler upon return from ezAJAX(tm) Server Command. Reason: Unable to process the returned data structure due to a possible system error.'));
			} finally {
			}
			if (nRecs > 0) {
				oParms = qObj.named('qParms');
				if (!!oParms) {
					oParms.iterateRecObjs(searchForArgRecs);
					oParms.iterateRecObjs(searchForCommunityRecs);

					if ( (!ezAJAXEngine.isCommunityEdition) && (nRecs > 1) ) {
						var i = -1;
						var qDataN = -1;
						for (i = 0; i < qObj.names.length; i++) {
							qDataN = qObj.named(qObj.names[i]);
							if (!!qDataN) {
								qDataN.iterateRecObjs(anyErrorRecords);
							}
						}
					} else {
						qObj.named('qData1').iterateRecObjs(anyErrorRecords);
					}

					ezAJAXEngine.isCommunityEdition = ((cDict.getValueFor('isCommunityEdition') == 'true') ? true : false);
					for (var i = 0; i < ezAJAXEngine.$.length; i++) {
						if (!!ezAJAXEngine.$[i]) ezAJAXEngine.$[i].isCommunityEdition = ezAJAXEngine.isCommunityEdition;
					}

					if (!bool_isAnyErrorRecords) {
						argsDict.intoNamedArgs();

						if (callBackJSOrFunc != null) {
							if (bool_isSimplerMethod) {
								try {
									if ((typeof callBackJSOrFunc) == const_function_symbol) {
										callBackJSOrFunc(qObj, nRecs, qStats, argsDict, qObj.named('qData1')); // Enterprise Edition would pass the last parm as an array of qData objects...
									} else {
										alert('ERROR: Programming Error - Undefined Object callBackJSOrFunc is (' + callBackJSOrFunc + '), this seems to be in error within the function known as ezAJAXEngine.receivePacket().')
									}
								} catch(e) {
									var funcNameAR = callBackJSOrFunc.toString().split('(');
									var _funcNameAR = funcNameAR[0].split(' ');
									ezAlertError(ezErrorExplainer(e, 'A. Error in user-defined code for Call-Back named "' + _funcNameAR.pop() + '" handled upon return from ezAJAX(tm) Server Command.'));
								} finally {
								}
							} else {
								if ((typeof callBackJSOrFunc) == const_function_symbol) {
									callBackJSOrFunc(qObj);
								} else {
									alert('B. ERROR: Programming Error - Undefined Object callBackJSOrFunc is (' + callBackJSOrFunc + '), this seems to be in error within the function known as ezAJAXEngine.receivePacket().')
								}
							}
						}
					} else {
						if (bool_isHTMLErrorRecords) {
							ezAlertHTMLError(s_explainError);
						} else {
							ezAlertError(s_explainError);
						}
					}
				}
			}
			ezDictObj.remove$(argsDict.id);
		} else {
			alert('ERROR: Programming Error - Undefined Object qObj is (' + qObj + ') and callBackJSOrFunc is (' + callBackJSOrFunc + '), one of them is in error within the function known as ezAJAXEngine.receivePacket().')
		}
	} catch(e) {
		ezAlertError(ezErrorExplainer(e, 'Error in abstract code handled upon return from ezAJAX(tm) Server Command.'));
	} finally {
	}
};

ezAJAXEngine.receiveJSONPacket = function(jObj, callBackJSOrFunc) {
	var i = -1;
	var r = -1;
	var c = -1;
	var cols = -1;
	var jSONObj = -1;
	var jSONEle = -1;
	var aQ = -1;
	var qObj = ezAJAXObj.get$();
	try {
		qObj.init();
		for (i = 0; i < jObj.names.length; i++) {
			jSONObj = jObj[jObj.names[i]];
			cols = jSONObj.columnlist.split(',');
			aQ = QObj.get$(jSONObj.columnlist);
			for (r = 0; r < jSONObj.recordcount; r++) {
				aQ.QueryAddRow();
				for (c = 0; c < cols.length; c++) {
					jSONEle = jSONObj.data[cols[c]];
					if ( ((typeof jSONEle) == const_object_symbol) && (jSONEle.length != null) ) {
						jSONEle = jSONEle[r];
					}
					aQ.QuerySetCell(cols[c], jSONEle, aQ.recordCount());
				}
			}
			qObj.push(jObj.names[i], aQ);
		}
		return ezAJAXEngine.receivePacket(qObj, callBackJSOrFunc);
	} catch (e) { ezAlertError('ezAJAXEngine.receiveJSONPacket has experienced a problem... Problem specification follows:\n' + ezErrorExplainer(e)); };
};

ezAJAXEngine.transmitPacket = function(ajaxObj) {
	return ( (!!ajaxObj) ? ajaxObj._transmitPacket() : alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.transmitPacket().'));
};

ezAJAXEngine.serverTimeout = function(id, ajaxObj) {
	return ( (!!ajaxObj) ? ajaxObj._serverTimeout(id) : alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.serverTimeout().'));
};

ezAJAXEngine.resetStatus = function(ajaxObj) {
	return ( (!!ajaxObj) ? ajaxObj._resetStatus() : alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.resetStatus().'));
};

ezAJAXEngine.RuntimeLicenseStatus = '';

ezAJAXEngine.initDebugMenu = function(ajaxObj) {
	var _html = '';
	if (!!ajaxObj) {
		var oDiv = _$('div_debugContainer');
		var bool_canShowDebugMenu = false;
		if (typeof ajaxObj.showAJAXDebugMenuCallback == const_function_symbol) {
			try { bool_canShowDebugMenu = ajaxObj.showAJAXDebugMenuCallback(); } catch(e) {} finally {	}
		}
		if ( (!!oDiv) && (bool_canShowDebugMenu) ) {
			if (ezAJAXEngine.browser_is_ff) {
				oDiv.style.height = '50px';
				oDiv.style.width = '100px';
			}
			oDiv.style.display = const_inline_style;
			var oBtn = _$('btn_helperPanel');
			if (!!oBtn) {
				oBtn.align = ((ezAJAXEngine.browser_is_ff) ? 'bottom' : 'middle');
			}
		}

		var oDiv = _$('div_scopesContainer');
		var bool_canShowScopesMenu = false;
		if (typeof ajaxObj.showAJAXScopesMenuCallback == const_function_symbol) {
			try { bool_canShowScopesMenu = ajaxObj.showAJAXScopesMenuCallback(); } catch(e) {} finally {	}
		}
		if ( (!!oDiv) && (bool_canShowScopesMenu) ) {
			if (ezAJAXEngine.browser_is_ff) {
				oDiv.style.height = '50px';
				oDiv.style.width = '100px';
			}
			oDiv.style.display = const_inline_style;
			var oBtn = _$('btn_helperPanel2');
			if (!!oBtn) {
				oBtn.align = ((ezAJAXEngine.browser_is_ff) ? 'bottom' : 'middle');
			}
		}
	
		var oDiv = _$('div_browserContainer');
		var bool_canShowBrowserDebug = false;
		if (typeof ajaxObj.showAJAXBrowserDebugCallback == const_function_symbol) {
			try { bool_canShowBrowserDebug = ajaxObj.showAJAXBrowserDebugCallback(); } catch(e) {} finally {	}
		}
		if ( (!!oDiv) && (bool_canShowBrowserDebug) ) {
			if (ezAJAXEngine.browser_is_ff) {
				oDiv.style.height = '50px';
			}
			oDiv.innerHTML = '<NOBR>&nbsp;|&nbsp;<span class="normalx9TextClass">isIE = [' + ((ajaxObj.browser_is_ie) ? 'true' : 'false') + ']</span>&nbsp;|&nbsp;<span class="normalx9TextClass">isFF = [' + ((ajaxObj.browser_is_ff) ? 'true' : 'false') + ']</span>&nbsp;|&nbsp;<span class="normalx9TextClass">isNS = [' + ((ajaxObj.browser_is_ns) ? 'true' : 'false') + ']</span>&nbsp;|&nbsp;<span class="normalx9TextClass">isOP = [' + ((ajaxObj.browser_is_op) ? 'true' : 'false') + ']</span></NOBR>';
		}
		
		ajaxObj.hideFrame();
		var cObj = $('btn_hideShow_iFrame');
		if (!!cObj) {
			if (ajaxObj.visibility == 'visible') {
				ezLabelButtonByObj(cObj, labelShow2HideButton);
			}
		}
	
		var cObj = $('btn_useXmlHttpRequest');
		if (!!cObj) {
			if (ajaxObj.isXmlHttpPreferred == false) {
				ezLabelButtonByObj(cObj, labelIFrame2XmlHttpRequestButton);
			} else  {
				var bObj = _$('btn_hideShow_iFrame');
				if (!!bObj) {
					bObj.style.display = const_none_style;
				}
			}
		}
	
		var cObj = $('btn_useMethodGetOrPost');
		if (!!cObj) {
			if (ajaxObj.isMethodGet()) {
				ezLabelButtonByObj(cObj, labelGet2PostButton);
			}
		}
	
		var cObj = $('btn_useDebugMode');
		if (!!cObj) {
			if (ajaxObj.isReleaseMode() == true) {
				ezLabelButtonByObj(cObj, labelDebug2ReleaseButton);
			}
		}
	
		var cObj = $(ajaxObj.ezAJAX_serverBusy_divName);
		var dObj = $(const_div_floating_debug_menu);
		if ( (!!cObj) && (!!dObj) ) {
			if (dObj.style.display == const_none_style) {
				dObj.style.position = cObj.style.position;
				dObj.style.top = parseInt(cObj.style.top) + 25 + 'px';
				dObj.style.left = (ezClientWidth() - 75) + 'px';
			}
		}
	
		dObj = _$('div_objectsContainer');
		if (!!dObj) {
			dObj.style.display = const_inline_style;
		}

		if ( (ezAJAXEngine.browser_is_ff) || (ezAJAXEngine.browser_is_op) ) {
			var fDiv = _$(const_div_floating_debug_menu);
			if (!!fDiv) {
				fDiv.style.width = (parseInt(fDiv.style.width) + 250) + 'px';
			}
		}
		if ((typeof window.onscroll) == const_function_symbol) {
			window.onscroll();
		}
	} else {
		alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.initDebugMenu().')
	}
};

ezAJAXEngine.js_global_varName = 'qObj';
ezAJAXEngine.bof_cfajax_comment_symbol = '\/* BOF CFAJAX *\/';
ezAJAXEngine.eof_cfajax_comment_symbol = '\/* EOF CFAJAX *\/';

ezAJAXEngine.prototype = {
	id : -1,
	errors : [],
	iframeSrc : '',
	sent : null,
	received : null,
	counter : 0,
	multithreaded : true,
	postMethodThreshold : 2000,
	delay : 1,
	timeout : 10,
	statusReset : 3,
	statusdelay : 333,
	statusID : null,
	delayID : null,
	timeoutID : null,
	statusResetID : null,
	Get_symbol : 'get',
	method : this.Get_symbol,
	Idle_symbol : 'idle',
	status : this.Idle_symbol,
	Post_symbol : 'post',
	Received_symbol : 'received',
	Sending_symbol : 'sending',
	release_mode_symbol : "release",
	debug_mode_symbol : "debug",
	isFrameShown : false,
	isPacketJSON : false,
	isXmlHttpPreferred : false,
	isCommunityEdition : true,
	ezAJAX_serverBusy_bgColor : '#FFFFBF',
	ezAJAX_serverBusy_divName : 'ezajax_html_container',
	isServerBusy_divName_changed : false,
	isServerBusy_divName_populated : false,
	ezAJAX_serverBusy_width : 30,
	ezAJAX_serverBusy_height : 30,
	ezAJAX_serverBusy_loadingImage : 'images/loadingCircle.gif',
	ezAJAX_serverBusy_HTML : '<span class="ajaxLoadingStatusClass"><NOBR>ezAJAX&#8482 Busy !</NOBR></span>',
	ezAJAX_serverReady_HTML : '<span class="normalStatusClass">Ready !</span>',
	ezAJAX_http_colon_slash_slash_symbol : 'http:' + '/' + '/',
	ezAJAX_serverBusyCallback : function(cObj){ if (!!cObj) { cObj.style.top = '0px';	cObj.style.left = (ezClientWidth() - this.ezAJAX_serverBusy_width - 10) + 'px'; } },
	myHTML : '',
	bool_showServerBusyIndicator : false,
	bool_echoReceivedBytesToWindowStatus : true,
	_xmlHttp_reqObject : ezAJAXEngine.xmlHttp_reqObject(),
	browser_is_ie : ezAJAXEngine.browser_is_ie,
	browser_is_ff : ezAJAXEngine.browser_is_ff,
	browser_is_ns : ezAJAXEngine.browser_is_ns,
	browser_is_op : ezAJAXEngine.browser_is_op,
	currentContextName : '',
	namedContextCache : [],
	namedContextStack : [],
	stack_ezAJAX_functions : [],
	hideFrameCallback : function(){},
	showFrameCallback : function(){},
	createAJAXEngineCallback : function(){},
	showAJAXBeginsHrefCallback : function(){},
	showAJAXBeginsStylesCallback : function(){},
	showAJAXDebugMenuCallback : function(){ return true; },
	showAJAXScopesMenuCallback : function(){ return true; },
	showAJAXBrowserDebugCallback : function(){ return true; },
	toString : function() {
		var s = 'id = [' + this.id + ']';
		
		function reportLengthOf(anObj) {
			var _s = '';
			try {
				_s += ' (' + anObj.length + ')';
			} catch(e) {
			};
			return _s;
		}
		
		s += '\najaxID = [' + this.ajaxID + ']';
		s += '\niframeSrc = [' + this.iframeSrc + ']';
		s += '\nsent' + reportLengthOf(this.sent) + ' = [' + this.sent + ']';
		s += '\nreceived' + reportLengthOf(this.received) + ' = [' + this.received + ']';
		s += '\ncounter = [' + this.counter + ']';
		s += '\ndelay = [' + this.delay + ']';
		s += '\ntimeout = [' + this.timeout + ']';
		s += '\nstatusReset = [' + this.statusReset + ']';
		s += '\nstatusdelay = [' + this.statusdelay + ']';
		s += '\nmode = [' + this.mode + ']';
		s += '\nmethod = [' + this.method + ']';
		s += '\nstatus = [' + this.status + ']';
		s += '\npostMethodThreshold = [' + this.postMethodThreshold + ']';
		s += '\nisXmlHttpPreferred = [' + this.isXmlHttpPreferred + ']';
		s += '\nbrowser_is_ie = [' + this.browser_is_ie + ']';
		s += '\nbrowser_is_ff = [' + this.browser_is_ff + ']';
		s += '\nbrowser_is_ns = [' + this.browser_is_ns + ']';
		s += '\nbrowser_is_op = [' + this.browser_is_op + ']';
		s += '\ntop = [' + this.top + ']';
		s += '\nleft = [' + this.left + ']';
		s += '\nwidth = [' + this.width + ']';
		s += '\nheight = [' + this.height + ']';
		s += '\nbgcolor = [' + this.bgcolor + ']';
		s += '\nvisibility = [' + this.visibility + ']';
		s += '\n_url' + reportLengthOf(this._url) + ' = [' + this._url + ']';
		s += '\nurl' + reportLengthOf(this.url) + ' = [' + this.url + ']';
		s += '\nerrors' + reportLengthOf(this.errors) + ' = [' + this.errors + ']';
		return s;
	},
	onReceive : function() {}, 
	onSend : function() {},    
	onTimeout : function() {   
		this.throwError("(Warning) The current request has timed out. Please \ntry your request again.");
	},
	doAJAX : function(cmd, callBackFuncName, vararg_params) { 
		var args = [];
		var i = 0;
		var n = arguments.length;
		cmd = ((cmd != null) ? cmd : '');
		callBackFuncName = ((callBackFuncName != null) ? callBackFuncName : '');
	    for (i += 2; i < n; i++) {
			args += arguments[i].toString().ezURLEncode();
			if (i < (n - 1)) {
				args += ',';
			}
		}
		ezAJAXCommand(this, cmd, callBackFuncName, args.toString());
	}, 
	register_ezAJAX_function : function(f) {
		this.stack_ezAJAX_functions.push(f);
	},
	handleNext_ezAJAX_function : function() {
		var f = -1;
		if (this.stack_ezAJAX_functions.length > 0) {
			f = this.stack_ezAJAX_functions.pop();
			try {
				if (f != null) { eval(f); }
			} catch(ee) {
				ezAlertError(ezErrorExplainer(ee, 'handleNext_ezAJAX_function :: Error #102 - The specified JavaScript code (' + f + ') that has been queued for execution by the ezAJAXEngine is invalid. Double-check to make this this code is correct and try again after making the required changes to your code.'));
			} finally {
			}
		}
	},
	ajaxBegins : function(width) {
		var resp = '';
		if (width == null) {
			width = this.ezAJAX_serverBusy_width;
		}
		resp = '<table width="' + parseInt(width) + 'px" bgcolor="' + this.ezAJAX_serverBusy_bgColor + '" border="0" cellpadding="-1" cellspacing="-1">';
		resp += '<tr>';
		resp += '<td height="' + this.ezAJAX_serverBusy_height + '">';
		return resp;
	},
	ajaxEnds : function() {
		var resp = '';
		resp += '</td>';
		resp += '</tr>';
		resp += '</table>';
		return resp;
	},
	showAJAXBegins : function(sMsg, sImage, imageHeight) {
		var resp = '';
		var frObj = -1;
		var cObj = _$(this.ezAJAX_serverBusy_divName);
		this.isServerBusy_divName_changed = (this.ezAJAX_serverBusy_divName != ezAJAXEngine.ezAJAX_serverBusy_divName());
		if (!!cObj) {
			imageHeight = ((!!imageHeight) ? imageHeight : '100%');
	
			var ar_docHref = document.location.href.split('?');
			if (ar_docHref.length > 1) {
				ar_docHref.pop();
			}
			var docHref = ar_docHref.join('');
			ar_docHref = docHref.split('/');
			if ( (ar_docHref.length > 1) && (ar_docHref[ar_docHref.length - 1].toLowerCase().indexOf('.cfm') > -1) ) {
				ar_docHref.pop();
			}
			docHref = ar_docHref.join('/');
			docHref = docHref + ((docHref.charAt(docHref.length - 1) != '/') ? '/' : '');
			
			var _docHref = '';
			if (typeof this.showAJAXBeginsHrefCallback == const_function_symbol) {
				try { _docHref = this.showAJAXBeginsHrefCallback(docHref); } catch(e) {} finally { }
			}
			docHref = ((_docHref != null) ? _docHref : docHref);

			sImage = ((!!sImage) ? sImage : this.ezAJAX_serverBusy_loadingImage);
			if (sImage.toUpperCase().indexOf(this.ezAJAX_http_colon_slash_slash_symbol) == -1) {
				sImage = docHref + sImage;
			}
			
			resp = '';
			resp += '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';
			resp += '<html><head><title>System Activity Display</title>';
			resp += '<link rel=stylesheet type="text/css" href="' + docHref + 'ezAjax/ezAjaxStyles.css">';
			resp += '</head>';
			resp += '<body>';
			resp += this.ajaxBegins();
			resp += '<img height="' + imageHeight + '" src="' + sImage + '" border="0">';
			resp += this.ajaxEnds();
			resp += '</body></html>';

			if (!this.isServerBusy_divName_changed) {
				frObj = _$('iframe_showAJAXBegins_' + this.ajaxID);
				if (frObj != null) {
					try { frObj.contentWindow.document.writeln(resp); } catch(e) { };

					frObj.style.display = const_inline_style;
					cObj.style.position = const_absolute_style;
					if (typeof this.ezAJAX_serverBusyCallback == const_function_symbol) {
						try { this.ezAJAX_serverBusyCallback(cObj, resp); } catch(e) {} finally { }
					}
					cObj.style.height = this.ezAJAX_serverBusy_height + 'px';
					cObj.style.width = this.ezAJAX_serverBusy_width + 'px';
					frObj.style.position = const_absolute_style;
					frObj.style.top = '0px';
					frObj.style.left = '0px';
					frObj.style.height = this.ezAJAX_serverBusy_height + 'px';
					frObj.style.width = this.ezAJAX_serverBusy_width + 'px';
					frObj.style.zIndex = 1;
					if (typeof this.showAJAXBeginsStylesCallback == const_function_symbol) {
						try { this.showAJAXBeginsStylesCallback(frObj.style, cObj.style); } catch(e) {} finally { }
					}
				}
			} else {
				if ((typeof this.ezAJAX_serverBusyCallback) == const_function_symbol) {
					try { this.ezAJAX_serverBusyCallback(cObj, resp); } catch(e) {} finally { }
				}
			}
	
			var dObj = $(const_div_floating_debug_menu);
			if (!!dObj) {
				dObj.style.position = const_absolute_style;
			}
		} else {
			alert('ERROR: Programming Error - Cannot display the Server Busy indicator.');
		}
	},
	showAJAXEnds : function() {
		var frObj = $('iframe_showAJAXBegins_' + this.ajaxID);
		if (!!frObj) {
			if (frObj.style.display != const_none_style) {
				frObj.style.display = const_none_style;
			}
		}
	},
	clearAJAXEnds : function() {
		var resp = '';
		var divName = this.ezAJAX_serverBusy_divName;
		var cObj = $(divName);
	
		if ( (!!cObj) && (!this.isServerBusy_divName_changed) ) {
			if (cObj.innerHTML.length > 0) {
				ezFlushCache$(cObj); 
			}
			resp = this.ajaxBegins();
			resp += '<b>' + this.ezAJAX_serverReady_HTML + '</b>';
			resp += this.ajaxEnds();
			cObj.innerHTML = resp;
		}
	},
	setMethodGet : function() {
		this.method = this.Get_symbol;
		return (this.method);
	},
	setMethodPost : function() {
		this.method = this.Post_symbol;
		return (this.method);
	},
	isMethodGet : function() {
		return (this.method == this.Get_symbol);
	},
	isMethodPost : function() {
		return (this.method == this.Post_symbol);
	},
	getUrl : function() {
		return this.url + ((this.url.indexOf("?") == -1) ? "?" : "&") + "uuid=" + ezUUID$();
	},
	isReleaseMode : function() {
		return (this.mode == this.release_mode_symbol);
	},
	isDebugMode : function() {
		return (this.mode == this.debug_mode_symbol);
	},
	setReleaseMode : function() {
		this.mode = this.release_mode_symbol;
	},
	setDebugMode : function() {
		this.mode = this.debug_mode_symbol;
	},
	create : function() {
		this.setDebugMode();
		this.top = ((this.isReleaseMode()) ? "0" : "600") + 'px';
		this.left = ((this.isReleaseMode()) ? "0" : "0") + 'px';
		this.width = ((this.isReleaseMode()) ? "1" : "990") + 'px';
		this.height = ((this.isReleaseMode()) ? "1" : "475") + 'px';
		this.bgcolor = (this.isReleaseMode()) ? "#ffffff" : "#FFFFBF";
		this.setReleaseMode();
		this.visibility = (this.isReleaseMode()) ? "hidden" : "visible";
		
		if (typeof this.createAJAXEngineCallback == const_function_symbol) {
			try { this.createAJAXEngineCallback(); } catch(e) {} finally {	}
		}
	
		var _html = this.html();
		document.write(_html);
		this.doAJAX('validateAJAXRuntimeLicense', 'handleValidateAJAXRuntimeLicense');

		ezAJAXEngine.initDebugMenu(this);
	},
	hideFrame : function() {
		if (this.isDebugMode()) {
			var oo = $(this.ajaxID);
			if (!!oo) {
				oo.style.visibility = "hidden";
				this.visibility = oo.style.visibility;
				this.isFrameShown = false;
			}
			var ooTable = $('table_' + this.ajaxID);
			if (!!ooTable) {
				ooTable.style.visibility = "hidden";
			}
			if (typeof this.hideFrameCallback == const_function_symbol) {
				try { this.hideFrameCallback();	} catch(e) {} finally {	}
			}
		}
	},
	showFrame : function() {
		if (this.isDebugMode()) {
			var oo = $(this.ajaxID);
			if (!!oo) {
				oo.style.visibility = "visible";
				this.visibility = oo.style.visibility;
				this.isFrameShown = true;
			}
			var ooTable = $('table_' + this.ajaxID);
			if (!!ooTable) {
				ooTable.style.visibility = "visible";
			}
			if (typeof this.showFrameCallback == const_function_symbol) {
				try { this.showFrameCallback();	} catch(e) {} finally {	}
			}
		}
	},
	throwError : function(error) { 
		this.errors[this.errors.length++] = error;
		if (this.status == this.Sending_symbol) this.receivePacket(null, false);
		
		this.showFrame();
	
		alert(error);
	},
	html : function() {  
		var html = '';
		html += "<style type=\"text\/css\">";
		html += "#" + this.ajaxID + " {width: " + this.width + "; height: " + this.height + "; left: " + this.left + " visibility: " + this.visibility + "; background: cyan; }";
		html += "#table_" + this.ajaxID + " {position:absolute; width: " + this.width + "; top: " + (parseInt(this.top) - 20) + "px; left: " + this.left + " visibility: " + this.visibility + "; background: " + this.bgcolor + "; }";
		html += "</style>";
		var sSrc = ((typeof this.iframeSrc == "string") ? "src=\"" + this.iframeSrc + "\" " : "");
		var _html = '<table id="' + 'table_' + this.ajaxID + '" border="1" bgcolor="' + this.bgcolor + '" cellpadding="-1" cellspacing="-1" style="visibility: ' + this.visibility + '">';
		_html += '<tr>';
		_html += '<td>';
		_html += "<iframe " + sSrc + "width=\"" + this.width + "\" height=\"" + this.height + "\" name=\"" + this.ajaxID + "\" id=\"" + this.ajaxID + "\" frameBorder=\"1\" frameSpacing=\"0\" marginWidth=\"0\" marginHeight=\"0\" scrolling=\"Auto\"></iframe>";
		_html += '</td>';
		_html += '</tr>';
		_html += '</table>';
		_html += "<form name=\"" + this.formID + "\" action=\"" + this.url + "\" target=\"" + this.ajaxID + "\" method=\"post\" style=\"width:0px; height:0px; margin:0px 0px 0px 0px;\">";
		_html += "<input type=\"Hidden\" name=\"packet\" value=\"\">";
		_html += "</form>";
		_html += '<iframe id="iframe_showAJAXBegins_' + this.ajaxID + '" src="' + this._url + 'ezAjax/blank.html' + '" frameborder="0" marginwidth="0" marginheight="0" scrolling="No" style="display: none; z-index: 1; background-color: white;"></iframe>';
		if (_$(this.ezAJAX_serverBusy_divName) == null) {
			html += '<div id="' + this.ezAJAX_serverBusy_divName + '" style="display: inline; position: absolute; top: 0px; left: ' + (ezClientWidth() - this.ezAJAX_serverBusy_width) + 'px"></div>';
		}
		var oDiv = _$('div_hiddenIFrameContainer');
		if (!!oDiv) {
			oDiv.innerHTML += _html;
		} else {
			html += _html;
		}
		this.myHTML = html;
		return html;
	},
	_serverTimeout : function(id) { 
		if ( (this.status == this.Sending_symbol) && (this.counter == id) ) {
			this.status = "timedout";
			clearInterval(this.statusID);  
			if (this.isDebugMode()) window.status = "";
			this.timeoutID = null;
			this.onTimeout();
		}
	},
	_resetStatus : function() {  
		this.status = this.Idle_symbol;
		this.statusResetID = null;
	},
	isIdle : function() {  
		return (this.status == this.Idle_symbol);
	},
	receivePacket : function(packet, _bRunEvent) {  
		if (this.status == "timedout") return false;
		var b = (typeof _bRunEvent != "boolean") ? true : _b;

		clearInterval(this.statusID);  
		if (this.isDebugMode()) window.status = "";
	
		this.received = packet;  
	
		if (b) this.onReceive();  
	
		clearInterval(this.statusID); 
		this.statusID = null;
		this.status = this.Received_symbol;
	
		var js = 'ezAJAXEngine.resetStatus(ezAJAXEngine.$[' + this.id + '])';
		this.statusResetID = setTimeout(js, this.statusReset * 1000);
	},
	sendPacket : function(packet) {  
		this.onSend();  
	
		if ( (!this.multithreaded) && (this.status == this.Sending_symbol)) return false;
		if (!!this.delayID) clearTimeout(this.delayID);
		if (!!this.statusResetID) clearTimeout(this.statusResetID);
	
		this.sent = '&___jsName___=' + ezAJAXEngine.js_global_varName + packet;
		
		var js = 'ezAJAXEngine.transmitPacket(ezAJAXEngine.$[' + this.id + '])';
		this.delayID = setTimeout(js, this.delay);
	},
	isReceivedFromCFAjax : function() {
		if ( (!!this.received) && (typeof this.received != const_object_symbol) ) {
			var bof_f = this.received.toUpperCase().indexOf(ezAJAXEngine.bof_cfajax_comment_symbol.toUpperCase());
			var eof_f = this.received.toUpperCase().indexOf(ezAJAXEngine.eof_cfajax_comment_symbol.toUpperCase());
			return ( (bof_f >= 0) && (eof_f >= 0) && (bof_f < eof_f) );
		} else {
			return false;
		}
	},
	processXmlHttpRequestStateChange : function() {
	    if ( (!!this._xmlHttp_reqObject.oRequest) && (this._xmlHttp_reqObject.oRequest.readyState == 4) ) {
	        try {
	            if (this._xmlHttp_reqObject.oRequest.status && this._xmlHttp_reqObject.oRequest.status == 200) {
					var response = this._xmlHttp_reqObject.oRequest.responseText;
				 	response = response.ezStripCrLfs();
					var bof_f = response.toUpperCase().indexOf(ezAJAXEngine.bof_cfajax_comment_symbol.toUpperCase());
					var eof_f = response.toUpperCase().indexOf(ezAJAXEngine.eof_cfajax_comment_symbol.toUpperCase());
					if (eof_f > 0) {
						eof_f += ezAJAXEngine.eof_cfajax_comment_symbol.length; 
					}
					if (bof_f > 0) {
						response = response.substring(Math.min(bof_f, eof_f),Math.max(bof_f, eof_f));
					}
					if (!!this._xmlHttp_reqObject.oGateway) {
						this._xmlHttp_reqObject.oGateway.receivePacket(response);
					}
	            } else {
					var response = this._xmlHttp_reqObject.oRequest.responseText;
	                ezAlertHTMLError('ERROR - ezAJAXEngine Error:\n' + response);
	            }
	        } catch (ex) {
	//			ezAlertError(ezErrorExplainer(ex, '(processXmlHttpRequestStateChange) :: processXmlHttpRequestStateChange threw an error.'));
	        }
		}
	},
	initXmlHttpRequest : function(url) {
		aObj = _$(this.ajaxID);
		if (!!aObj) {
			aObj.src = '_.html?' + this.id.toString().ezURLEncode() + '&' + url.ezURLEncode();
		}
	},
	_initXmlHttpRequest : function(url) {
		var bool = false;
		var oGateway = this;
		var axI = 0;
		var axO = ['Msxml2.XMLHTTP.6.0', 'Msxml2.XMLHTTP.4.0', 'Msxml2.XMLHTTP.3.0', 'Msxml2.XMLHTTP', 'Microsoft.XMLHTTP'];
    	try {
        	this._xmlHttp_reqObject.oRequest = new ActiveXObject(axO[axI++]);
			bool = true;
        } catch(e) {
	    	try {
	        	this._xmlHttp_reqObject.oRequest = new ActiveXObject(axO[axI++]);
				bool = true;
	        } catch(e) {
		    	try {
		        	this._xmlHttp_reqObject.oRequest = new ActiveXObject(axO[axI++]);
					bool = true;
		        } catch(e) {
			    	try {
			        	this._xmlHttp_reqObject.oRequest = new ActiveXObject(axO[axI++]);
						bool = true;
			        } catch(e) {
			        	try {
			          		this._xmlHttp_reqObject.oRequest = new ActiveXObject(axO[axI]);
							bool = true;
			        	} catch(e) {
					    	try {
								this._xmlHttp_reqObject.oRequest = new XMLHttpRequest();
								bool = true;
					        } catch(e) {
								this._xmlHttp_reqObject.oRequest = false;
								bool = false;
					        }
			        	}
			        }
				}
			}
		}

		if (bool) {
			this.method = ((url.length > this.postMethodThreshold) ? this.Post_symbol : this.Get_symbol);
			try {
				switch (this.method) {
					case this.Post_symbol:
						if (this._xmlHttp_reqObject.oRequest) {
							this._xmlHttp_reqObject.oRequest.onreadystatechange = function() {
						    	try {
									oGateway.processXmlHttpRequestStateChange();
						        } catch(e) {
									ezAlertError(ezErrorExplainer(e, 'POST :: onreadystatechange threw an error.'));
						        }
							};
							this._xmlHttp_reqObject.oGateway = this; 
							var a = url.split('?');
							if (a.length == 2) {
								this._xmlHttp_reqObject.oRequest.open("POST", a[0], true);
								this._xmlHttp_reqObject.oRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");			
				                this._xmlHttp_reqObject.oRequest.send('QUERY_STRING=' + a[1].ezURLEncode());
							} else {
								bool = false;
							}
						}
					break;
			
					case this.Get_symbol:
						if (this._xmlHttp_reqObject.oRequest) {
							this._xmlHttp_reqObject.oRequest.onreadystatechange = function() {
						    	try {
									oGateway.processXmlHttpRequestStateChange();
						        } catch(e) {
									ezAlertError(ezErrorExplainer(e, 'GET :: onreadystatechange threw an error.'));
						        }
							};
							this._xmlHttp_reqObject.oGateway = this;
							this._xmlHttp_reqObject.oRequest.open("GET", url, true);
							this._xmlHttp_reqObject.oRequest.send(null);
						}
					break;
				}
			} catch(e) {
				bool = false;
				ezAlertError(ezErrorExplainer(e, 'initXmlHttpRequest threw an error.' + '\n' + this.toString()));
			}
		}
		return bool;
	},
	_transmitPacket : function() {  
		this.counter++;  
		this.delayID = null; 
		this.received = null;
		this.status = this.Sending_symbol;
		if (this.isDebugMode()) window.status = "Sending.";
		ezAJAXEngine._cacheCounters[this.counter] = 0;
		if (!!this.statusID) clearInterval(this.statusID);
		var s_ticker = "ezAJAXEngine._cacheCounters[" + this.counter + "]++;";
		if (this.isDebugMode()) {
			s_ticker += " window.status = window.status + (((ezAJAXEngine._cacheCounters[" + this.counter + "] % " + parseInt((1000/this.statusdelay).toString()) + ") == 0) ? (ezAJAXEngine._cacheCounters[" + this.counter + "] / " + parseInt((1000/this.statusdelay).toString()) + ").toString() : '.')";
		}
		this.statusID = setInterval(s_ticker, this.statusdelay);

		var js = 'ezAJAXEngine.serverTimeout(' + this.counter + ', ezAJAXEngine.$[' + this.id + '])';
		this.timeoutID = setTimeout(js, this.timeout * 1000);

		if (this.isCurrentContextValid()) {
			var argCnt = -1;
			var keys = [];
			var isContextShifted = false;
			var aDict = ezDictObj.get$(this.sent);
			var tDict = this.namedContextCache[this.currentContextName].argsDict;
			var oDict = tDict;
	
			argCnt = this.namedContextCache[this.currentContextName].argsDict.length();
			var apparentArgCnt = parseInt(aDict.getValueFor('argCnt'));
			if (!apparentArgCnt) {
				apparentArgCnt = 0;
				aDict.push('argCnt', apparentArgCnt);
			}
			if (apparentArgCnt > 0) {
				tDict = ezDictObj.get$();
	
				function adjustAndStoreEachKey(aKey) { 
					var newKey = aKey.ezFilterInAlpha() + (parseInt(aKey.ezFilterInNumeric()) + apparentArgCnt);
					tDict.push(newKey, oDict.getValueFor(aKey));
					return newKey;
				}
	
				keys = this.namedContextCache[this.currentContextName].argsDict.adjustKeyNames(adjustAndStoreEachKey);
				isContextShifted = true;
			}
			apparentArgCnt += argCnt;
			aDict.put('argCnt', apparentArgCnt);
			this.sent = aDict.asQueryString();
			argCnt = apparentArgCnt;
			this.sent += tDict.asQueryString();
			ezDictObj.remove$(aDict.id);
			if (isContextShifted) ezDictObj.remove$(tDict.id);
		}
	
		 var formattedPacket = this.formatPacket(this.sent);
		if (this.isXmlHttpPreferred == false) {
			if (formattedPacket.length > this.postMethodThreshold) {
				this.setMethodPost();
			} else {
				this.setMethodGet(); 
			}
		}

		switch (this.method) {
			case this.Post_symbol:
				if (this.isXmlHttpPreferred) {
					var bool = this.initXmlHttpRequest(this.getUrl() + '&cfajax=1' + '&' + this.sent);
					if (bool == false) {
						this.methodPost(this.sent);
					}
				} else {
					this.methodPost(this.sent);
				}
			break;
	
			case this.Get_symbol:
				if (this.isXmlHttpPreferred) {
					var bool = this.initXmlHttpRequest(this.getUrl() + '&cfajax=1' + '&' + this.sent);
					if (bool == false) {
						this.methodGet(formattedPacket);
					}
				} else {
					this.methodGet(formattedPacket);
				}
			break;
		}
	},
	formatPacket : function(packet) {
		if (typeof packet == "string") {
			return packet; 
		}
		else if (typeof packet == "object") {
			var p = [];
			for( var k in packet ) p[p.length] = k + "=" + escape(packet[k]);
			var s = '&' + p.join('&');
			return s;
		}
	},
	methodPost : function(packet) {
		if ((/msie/i.test(navigator.userAgent)) == false) {
			return alert("The post method is currently unsupported for the browser you are currently using.");
		}
		oForm = _$(this.formID);
		if (!!oForm) {
			oForm.packet.value = packet;
			oForm.submit();
		}
	},
	methodGet : function(sPacket){
		var sUrl = this.getUrl() + sPacket;
		this.packetString = sPacket;
	
		aObj = _$(this.ajaxID);
		if (!!aObj) {
			aObj.src = sUrl;
		}
	},
	iterateNamedContexts : function(func) {
		var i = -1;
		if ( (!!func) && (typeof func == const_function_symbol) ) {
			for (i = 1; i < this.namedContextStack.length; i++) {
				func(this.namedContextStack[i]);
			}
		}
	},
	addNamedContext : function(aName, parmsQueryString) {
		var aDict = -1;
		var oDict = -1;
		var pDict = -1;
		var argCnt = -1;
		var keys = '';
		var i = -1;
		var j = -1;
		var v = '';
		if (!this.namedContextCache[aName]) {
			aDict = ezDictObj.get$(parmsQueryString);
			oDict = ezDictObj.get$();
			pDict = ezDictObj.get$();
			argCnt = aDict.length();
			keys = aDict.getKeys();
			for (i = 0, j = 1; i < keys.length; i++, j += 2) {
				oDict.push('arg' + j, keys[i]);
				v = aDict.getValueFor(keys[i]);
				oDict.push('arg' + (j + 1), v);
				pDict.push(keys[i], v);
			}
			ezDictObj.remove$(aDict.id);
			this.namedContextCache[aName] = ezAJaxContextObj.get$(); 
			this.namedContextCache[aName].queryString = parmsQueryString;
			this.namedContextCache[aName].parmsDict = pDict;
			this.namedContextCache[aName].argsDict = oDict;
			this.namedContextStack.push(aName);
			this.currentContextName = aName;
		}
	},
	setContextName : function(aName) {
		if (!!this.namedContextCache[aName]) {
			this.currentContextName = aName;
		} else {
			alert('ERROR: Programming Error - Context Name (' + aName + ') is not valid at this time - the list of valid Context Names is (' + this.namedContextStack + ').');
		}
	},
	isCurrentContextValid : function() {
		return (!!this.namedContextCache[this.currentContextName]);
	},
	isIdle : function() {
		return ( (this.status.ezTrim().toUpperCase() == this.Idle_symbol.ezTrim().toUpperCase()) || ( (this.status.ezTrim().toUpperCase() != this.Received_symbol.ezTrim().toUpperCase()) && (this.status.ezTrim().toUpperCase() != this.Sending_symbol.ezTrim().toUpperCase()) ) );
	},
	init : function() {
		return this;
	},
	destructor : function() {
		return (this.id = ezAJAXEngine.$[this.id] = this.data = this.names = this.errors = this._xmlHttp_reqObject = this.namedContextCache = this.namedContextStack = this.stack_ezAJAX_functions = null);
	}
};
