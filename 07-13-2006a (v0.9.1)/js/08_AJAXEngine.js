ezAJAXEngine = function(id, u, _d) {
	this.id = id;		

	if (!u) this.throwError("No server-side ezAJAX(tm) Event Handler was specified.", true);
	if (!(!!document.getElementById)) this.throwError("Your browser does not meet the minimum requirements. \nPortions of the page have been disabled and therefore \nthe page may not work as expected.", true);

	this.url = u;

	this.mode = ((!!_d && _d == true) ? this.debug_mode_symbol : this.release_mode_symbol);

	this.ajaxID = 'id_' + ezAJAXEngine.releaseNumber + '_ezAJAX_' + ezAJAXEngine.items.length;
	this.formID = 'id_' + ezAJAXEngine.releaseNumber + '_ezAJAX_Form_' + ezAJAXEngine.items.length;
};

ezAJAXEngine.releaseNumber = 'ezAJAXEngine';

ezAJAXEngine.isCommunityEdition = true;

ezAJAXEngine.$ = [];

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

ezAJAXEngine._cacheCounters = [];

ezAJAXEngine.xmlHttp_reqObject = function() {
	var oXmlHttpReqObj = new Object();
	
	if (!!oXmlHttpReqObj) {
		oXmlHttpReqObj.oRequest = false;
		oXmlHttpReqObj.oGateway = -1;
	}
	return oXmlHttpReqObj;
};

ezAJAXEngine.browser_is_ff = ((!/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent) && !/Netscape/i.test(navigator.userAgent)) || /Gecko/i.test(navigator.userAgent) || /Firefox/i.test(navigator.userAgent));
ezAJAXEngine.browser_is_ie = (/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent) && !/Gecko/i.test(navigator.userAgent) && !/Netscape/i.test(navigator.userAgent) && !/Firefox/i.test(navigator.userAgent) );
ezAJAXEngine.browser_is_ns = ((!/msie/i.test(navigator.userAgent) && !/opera/i.test(navigator.userAgent) && !/Firefox/i.test(navigator.userAgent)) || /Gecko/i.test(navigator.userAgent) || /Netscape/i.test(navigator.userAgent));
ezAJAXEngine.browser_is_op = ((!/msie/i.test(navigator.userAgent) && /opera/i.test(navigator.userAgent) && !/Firefox/i.test(navigator.userAgent)) || !/Gecko/i.test(navigator.userAgent) || !/Netscape/i.test(navigator.userAgent));

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
			var aDict = -1;
			var html = '';
	
			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.ezTrim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.ezTrim(), v);
				}
			};
			try {
				var qStats = qObj.named('qDataNum');
				if (!!qStats) {
					nRecs = qStats.dataRec[1];
				}
			} catch(e) {
				nRecs = -1;
				ezAlertError(ezErrorExplainer(e, 'Error in abstract code handler upon return from ezAJAX(tm) Server Command. Reason: Unable to process the returned data structure due to a possible system error.'));
			} finally {
			}
			if (nRecs > 0) {
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);

						ezAJAXEngine.isCommunityEdition = ((argsDict.getValueFor('NAME') != null) ? false : true);
						ezAlert('ezAJAXEngine.isCommunityEdition = [' + ezAJAXEngine.isCommunityEdition + ']');
						for (var i = 0; i < ezAJAXEngine.$.length; i++) {
							if (!!ezAJAXEngine.$[i]) ezAJAXEngine.$[i].isCommunityEdition = ezAJAXEngine.isCommunityEdition;
						}

						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();

							if (callBackJSOrFunc != null) {
								if (bool_isSimplerMethod) {
									try {
										if ((typeof callBackJSOrFunc) == const_function_symbol) {
											callBackJSOrFunc(qObj, nRecs, qStats, argsDict, qData1); // Enterprise Edition would pass the last parm as an array of qData objects...
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

ezAJAXEngine.transmitPacket = function(ajaxObj) {
	return ( (!!ajaxObj) ? ajaxObj._transmitPacket() : alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.transmitPacket().'));
};

ezAJAXEngine.serverTimeout = function(id, ajaxObj) {
	return ( (!!ajaxObj) ? ajaxObj._serverTimeout(id) : alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.serverTimeout().'));
};

ezAJAXEngine.resetStatus = function(ajaxObj) {
	return ( (!!ajaxObj) ? ajaxObj._resetStatus() : alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.resetStatus().'));
};

ezAJAXEngine.js_global_varName = 'qObj';
ezAJAXEngine.bof_cfajax_comment_symbol = '\/* BOF CFAJAX *\/';
ezAJAXEngine.eof_cfajax_comment_symbol = '\/* EOF CFAJAX *\/';

ezAJAXEngine.items = [];

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
	isXmlHttpPreferred : false,
	isCommunityEdition : true,
	ezAJAX_serverBusy_bgColor : '#FFFFBF',
	ezAJAX_serverBusy_divName : 'ezajax_html_container',
	ezAJAX_serverBusy_width : 200,
	ezAJAX_serverBusy_loadingImage : 'images/loading.gif',
	ezAJAX_serverBusy_HTML : '<span class="ajaxLoadingStatusClass"><NOBR>&nbsp;Server Busy !</NOBR></span>',
	ezAJAX_serverReady_HTML : '<span class="normalStatusClass">&nbsp;Ready !</span>',
	ezAJAX_http_colon_slash_slash_symbol : 'http:' + '/' + '/',
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
		resp = '<table width="' + parseInt(width) + 'px" bgcolor="' + this.ezAJAX_serverBusy_bgColor + '" border="1" cellpadding="-1" cellspacing="-1">';
		resp += '<tr>';
		resp += '<td height="25px">';
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
		var frameCode = '';
		var divName = this.ezAJAX_serverBusy_divName;
		var cObj = $(divName);
	
		if (!!cObj) {
			imageHeight = ((!!imageHeight) ? imageHeight : '55%');
	
			var ar_docHref = document.location.href.split('?');
			if (ar_docHref.length > 1) {
				ar_docHref.pop();
			}
			docHref = ar_docHref.join('');
			ar_docHref = docHref.split('/');
			if ( (ar_docHref.length > 1) && (ar_docHref[ar_docHref.length - 1].toLowerCase().indexOf('.cfm') > -1) ) {
				ar_docHref.pop();
			}
			docHref = ar_docHref.join('/');
			docHref = docHref + ((docHref.charAt(docHref.length - 1) != '/') ? '/' : '');
			
			sImage = ((!!sImage) ? sImage : this.ezAJAX_serverBusy_loadingImage);
			if (sImage.toUpperCase().indexOf(this.ezAJAX_http_colon_slash_slash_symbol) == -1) {
				sImage = docHref + sImage;
			}
			
			resp = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';
			resp += '<html><head><title>System Activity Display</title>';
			resp += '<link rel=stylesheet type="text/css" href="' + docHref + 'ezAjax/ezAjaxStyles.css">';
			resp += '</head>';
			resp += '<body>';
			resp += this.ajaxBegins();
			resp += '<b>' + ((!!sMsg) ? sMsg : this.ezAJAX_serverBusy_HTML) + '</b>';
			resp += '&nbsp;&nbsp;<img height="' + imageHeight + '" src="' + sImage + '" border="0">';
			resp += this.ajaxEnds();
			resp += '</body></html>';
	
			frameCode = '<iframe id="iframe_showAJAXBegins" frameborder="0" marginwidth="0" marginheight="0" scrolling="No" style="display: none;"></iframe>';
			if (cObj.innerHTML.length > 0) {
				ezFlushCache$(cObj); 
			}
			cObj.innerHTML = frameCode;
			var frObj = _$('iframe_showAJAXBegins');
			if (!!frObj) {
				frObj.contentWindow.document.writeln(resp);
				frObj.style.display = const_inline_style;
				cObj.style.position = const_absolute_style;
				cObj.style.top = '0px';
				cObj.style.left = (ezClientWidth() - this.ezAJAX_serverBusy_width - 1) + 'px';
				cObj.style.height = '30px';
				cObj.style.width = this.ezAJAX_serverBusy_width + 'px';
				frObj.style.position = const_absolute_style;
				frObj.style.top = document.body.scrollTop + 'px';
				frObj.style.left = '0px';
				frObj.style.height = '30px';
				frObj.style.width = this.ezAJAX_serverBusy_width + 'px';
			//	alert('(' + frObj.style.top + ',' + frObj.style.left + ')' + ', (' + frObj.style.height + ',' + frObj.style.width + ')');
			}
	
			var dObj = $(const_div_floating_debug_menu);
			if (!!dObj) {
				dObj.style.position = cObj.style.position;
			}
		}
	},
	showAJAXEnds : function() {
		var frObj = $('iframe_showAJAXBegins');
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
	
		if (!!cObj) {
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
			this.createAJAXEngineCallback();
		}
	
		document.write(this.html());
		this.doAJAX('validateAJAXRuntimeLicense', 'handleValidateAJAXRuntimeLicense');
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
				this.hideFrameCallback();
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
				this.showFrameCallback();
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
		html += '<table id="' + 'table_' + this.ajaxID + '" border="1" bgcolor="' + this.bgcolor + '" cellpadding="-1" cellspacing="-1" style="visibility: ' + this.visibility + '">';
		html += '<tr>';
		html += '<td>';
		html += "<iframe " + sSrc + "width=\"" + this.width + "\" height=\"" + this.height + "\" name=\"" + this.ajaxID + "\" id=\"" + this.ajaxID + "\" frameBorder=\"1\" frameSpacing=\"0\" marginWidth=\"0\" marginHeight=\"0\" scrolling=\"Auto\" src=\"/ezAjax/ezAJAX_functions.cfm\"></iframe>";
		html += '</td>';
		html += '</tr>';
		html += '</table>';
		html += "<form name=\"" + this.formID + "\" action=\"" + this.url + "\" target=\"" + this.ajaxID + "\" method=\"post\" style=\"width:0px; height:0px; margin:0px 0px 0px 0px;\">";
		html += "<input type=\"Hidden\" name=\"packet\" value=\"\">";
		html += "</form>";
		if (_$(this.ezAJAX_serverBusy_divName) == null) {
			html += '<div id="' + this.ezAJAX_serverBusy_divName + '" style="display: inline; position: absolute; top: 0px; left: ' + (ezClientWidth() - this.ezAJAX_serverBusy_width) + 'px"></div>';
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
				ezAlertError(ezErrorExplainer(ex, '(processXmlHttpRequestStateChange) :: processXmlHttpRequestStateChange threw an error.'));
	        }
		}
	},
	initXmlHttpRequest : function(url) {
		var bool = false;
		var oGateway = this;
    	try {
        	this._xmlHttp_reqObject.oRequest = new ActiveXObject("Msxml2.XMLHTTP");
			bool = true;
        } catch(e) {
        	try {
          		this._xmlHttp_reqObject.oRequest = new ActiveXObject("Microsoft.XMLHTTP");
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
			return "&" + p.join("&");
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
