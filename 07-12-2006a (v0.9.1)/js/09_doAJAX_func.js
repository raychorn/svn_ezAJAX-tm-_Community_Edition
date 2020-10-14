function ezAJAXCommand(_oAJAXEngine, cmd, callBackFuncName, vararg_params) {
	var j = -1;
	var j2 = -1;
	var ar = [];
	var ar2 = [];
	var ampersand_i = -1;
	var equals_i = -1;
	var _argCnt = 0;
	var anArg = '';
	var iArg = 0;
	var s_argSpec = '';
	var isObject = false;
	cmd = ((cmd != null) ? cmd : '');
	callBackFuncName = ((callBackFuncName != null) ? callBackFuncName : '');
	var _time = new Date();
	var sValue = '&ezCFM=' + cmd + '&ezSessid=' + ((!!cf_Session_ID) ? cf_Session_ID : '') + '&ezReferer=' + ((!!cf_cgiReferer) ? cf_cgiReferer : '') + '&ezAUTHUSER=' + (((!!js_AUTH_USER) && (js_AUTH_USER.length > 0)) ? js_AUTH_USER : '0') + '&ezCallBack=' + callBackFuncName + '&ezTime=' + _time.toLocaleString().ezURLEncode();

	if (_oAJAXEngine != null) {
	    // BEGIN: Make the arguments into a series of URL Parms, as-required, don't worry the ezAJAX(tm) Engine will figure out how to handle all this data...
		// a Parm may be a simple value or a Query String using the standard CGI Query String specification of "&name=value"...
		iArg = 0;
	    for (var i = 0; i < arguments.length - 3; i++) {
			anArg = arguments[i + 3];
			isObject = false;
			if ((typeof anArg).toUpperCase() == const_object_symbol.toUpperCase()) {
				// the arg might be an array or a complex object...
				var k = -1;
				for (k = 0; k < anArg.length; k++) {
					if (anArg[k].ezTrim().length > 0) {
						if ((typeof anArg[k]).toUpperCase() != const_string_symbol.toUpperCase()) {
							try {
								anArg[k] = anArg[k].toString();
							} catch(e) {
								anArg[k] = ''; // default is empty string whenever the thing that is not a string cannot be made into a string...
							} finally {
							}
						}
						s_argSpec += '&arg' + (iArg + 1) + '=' + anArg[k].ezURLEncode();
						_argCnt++;
						iArg++;
					}
				}
				isObject = true;
			} else if ((typeof anArg).toUpperCase() != const_string_symbol.toUpperCase()) {
				try {
					anArg = anArg.toString();
				} catch(e) {
					anArg = ''; // default is empty string whenever the thing that is not a string cannot be made into a string...
				} finally {
				}
			}
			if (isObject == false) {
				ampersand_i = anArg.indexOf('&');
				equals_i = anArg.indexOf('=');
				if ( (ampersand_i != -1) && (equals_i != -1) && (ampersand_i < equals_i) ) {
					s_argSpec += anArg.toString().ezURLEncode();
					_argCnt++;
					iArg++;
				} else if (anArg.indexOf(',') != -1) {
					ar = anArg.split(',');
					for (j = 0; j < ar.length; j++) {
						if (ar[j].indexOf('=') != -1) {
							ar2 = ar[j].split('=');
							j2 = (j * 2);
							s_argSpec += '&arg' + (j2 - 1) + '=' + ar2[0].toString().ezURLEncode();
							_argCnt++;
							iArg++;
							s_argSpec += '&arg' + j2 + '=' + ar2[1].toString().ezURLEncode();
							_argCnt++;
							iArg++;
						} else {
							s_argSpec += '&arg' + (j + 1) + '=' + ar[j].toString().ezURLEncode();
							_argCnt++;
							iArg++;
						}
					}
				} else {
					s_argSpec += '&arg' + (iArg + 1) + '=' + anArg.toString().ezURLEncode();
					_argCnt++;
					iArg++;
				}
			}
	    }
		sValue += '&argCnt=' + _argCnt + s_argSpec;
	    // END! Make the arguments into a series of URL Parms, as-required, don't worry the ezAJAX(tm) Engine will figure out how to handle all this data...

		if (_oAJAXEngine.bool_echoReceivedBytesToWindowStatus) window.status = '';
		try {
			if (_oAJAXEngine.isXmlHttpPreferred == false) {
				_oAJAXEngine.setMethodGet();
			}
			_oAJAXEngine.sendPacket(sValue);
		} catch(e) {
			ezAlertError(ezErrorExplainer(e, 'ezAJAXCommand() :: '));
		} finally {
		}
	} else {
		alert('ERROR :: Programming Error - Missing the first argument for the function known as "ezAJAXCommand()". The first argument must be a pointer to an instance of the AJAXEngine Object.');
	}
}

