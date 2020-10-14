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

ezAJAXEngine.$ = [];

ezAJAXEngine.get$ = function(_url, _debugFlag) {
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
			ezAJAXEngine.$[id] = object_destructor(instance);
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

ezAJAXEngine.transmitPacket = function(ajaxObj) {
	return ( (!!ajaxObj) ? ajaxObj._transmitPacket() : alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.transmitPacket().'));
};

ezAJAXEngine.serverTimeout = function(id, ajaxObj) {
	return ( (!!ajaxObj) ? ajaxObj._serverTimeout(id) : alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.serverTimeout().'));
};

ezAJAXEngine.resetStatus = function(ajaxObj) {
	return ( (!!ajaxObj) ? ajaxObj._resetStatus() : alert('ERROR: Programming Error - Undefined Objects ajaxObj is (' + ajaxObj + ') in function known as ezAJAXEngine.resetStatus().'));
};

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
	js_global_varName : 'qObj',
	myHTML : '',
	bool_showServerBusyIndicator : false,
	_xmlHttp_reqObject : ezAJAXEngine.xmlHttp_reqObject(),
	browser_is_ie : ezAJAXEngine.browser_is_ie,
	browser_is_ff : ezAJAXEngine.browser_is_ff,
	browser_is_ns : ezAJAXEngine.browser_is_ns,
	browser_is_op : ezAJAXEngine.browser_is_op,
	currentContextName : '',
	namedContextCache : [],
	namedContextStack : [],
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
			args += arguments[i].toString().URLEncode();
			if (i < (n - 1)) {
				args += ',';
			}
		}
		doAJAX_func(this, cmd, callBackFuncName, args.toString());
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
		return this.url + ((this.url.indexOf("?") == -1) ? "?" : "&") + "uuid=" + uuid$();
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
		html += "<style type=\"text\/css\">\n";
		html += "#" + this.ajaxID + " {width: " + this.width + "; height: " + this.height + "; left: " + this.left + " visibility: " + this.visibility + "; background: cyan; }\n";
		html += "#table_" + this.ajaxID + " {position:absolute; width: " + this.width + "; top: " + (parseInt(this.top) - 20) + "px; left: " + this.left + " visibility: " + this.visibility + "; background: " + this.bgcolor + "; }\n";
		html += "</style>\n";
		var sSrc = ((typeof this.iframeSrc == "string") ? "src=\"" + this.iframeSrc + "\" " : "");
		html += '<table id="' + 'table_' + this.ajaxID + '" border="1" bgcolor="' + this.bgcolor + '" cellpadding="-1" cellspacing="-1" style="visibility: ' + this.visibility + '">';
		html += '<tr>';
		html += '<td>';
		html += "<iframe " + sSrc + "width=\"" + this.width + "\" height=\"" + this.height + "\" name=\"" + this.ajaxID + "\" id=\"" + this.ajaxID + "\" frameBorder=\"1\" frameSpacing=\"0\" marginWidth=\"0\" marginHeight=\"0\" scrolling=\"Auto\" src=\"/ezAjax/ezAJAX_functions.cfm\"></iframe>\n";
		html += '</td>';
		html += '</tr>';
		html += '</table>';
		html += "<form name=\"" + this.formID + "\" action=\"" + this.url + "\" target=\"" + this.ajaxID + "\" method=\"post\" style=\"width:0px; height:0px; margin:0px 0px 0px 0px;\">\n";
		html += "<input type=\"Hidden\" name=\"packet\" value=\"\">";
		html += "</form>\n";
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
	
		this.sent = '&___jsName___=' + this.js_global_varName + packet;
		
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
				 	response = response.stripCrLfs();
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
	                _alertHTMLError('ERROR - ezAJAXEngine Error:\n' + response); // .stripHTML().stripCrLfs()
	            }
	        } catch (ex) {
				_alertError(jsErrorExplainer(ex, '(processXmlHttpRequestStateChange) :: processXmlHttpRequestStateChange threw an error.'));
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
									_alertError(jsErrorExplainer(e, 'POST :: onreadystatechange threw an error.'));
						        }
							};
							this._xmlHttp_reqObject.oGateway = this; 
							var a = url.split('?');
							if (a.length == 2) {
								this._xmlHttp_reqObject.oRequest.open("POST", a[0], true);
								this._xmlHttp_reqObject.oRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");			
				                this._xmlHttp_reqObject.oRequest.send('QUERY_STRING=' + a[1].URLEncode());
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
									_alertError(jsErrorExplainer(e, 'GET :: onreadystatechange threw an error.'));
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
				_alertError(jsErrorExplainer(e, 'initXmlHttpRequest threw an error.' + '\n' + this.toString()));
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
			var aDict = DictObj.get$(this.sent);
			var tDict = this.namedContextCache[this.currentContextName].argsDict;
			var oDict = tDict;
	
			argCnt = this.namedContextCache[this.currentContextName].argsDict.length();
			var apparentArgCnt = parseInt(aDict.getValueFor('argCnt'));
			if (!apparentArgCnt) {
				apparentArgCnt = 0;
				aDict.push('argCnt', apparentArgCnt);
			}
			if (apparentArgCnt > 0) {
				tDict = DictObj.get$();
	
				function adjustAndStoreEachKey(aKey) { 
					var newKey = aKey.filterInAlpha() + (parseInt(aKey.filterInNumeric()) + apparentArgCnt);
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
			DictObj.remove$(aDict.id);
			if (isContextShifted) DictObj.remove$(tDict.id);
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
			aDict = DictObj.get$(parmsQueryString);
			oDict = DictObj.get$();
			pDict = DictObj.get$();
			argCnt = aDict.length();
			keys = aDict.getKeys();
			for (i = 0, j = 1; i < keys.length; i++, j += 2) {
				oDict.push('arg' + j, keys[i]);
				v = aDict.getValueFor(keys[i]);
				oDict.push('arg' + (j + 1), v);
				pDict.push(keys[i], v);
			}
			DictObj.remove$(aDict.id);
			this.namedContextCache[aName] = AJaxContextObj.get$(); 
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
		return ( (this.status.trim().toUpperCase() == this.Idle_symbol.trim().toUpperCase()) || ( (this.status.trim().toUpperCase() != this.Received_symbol.trim().toUpperCase()) && (this.status.trim().toUpperCase() != this.Sending_symbol.trim().toUpperCase()) ) );
	},
	init : function() {
		return this;
	},
	destructor : function() {
		return (this.id = ezAJAXEngine.$[this.id] = this.data = this.names = this.errors = this._xmlHttp_reqObject = this.namedContextCache = this.namedContextStack = null);
	}
};
