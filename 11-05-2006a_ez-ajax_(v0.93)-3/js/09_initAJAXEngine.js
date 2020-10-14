function initAJAXEngine(_oAJAXEngine) {
	// define the function to run when a packet has been sent to the server
	if (_oAJAXEngine == null) {
		return -1;
	}
	try {
		_oAJAXEngine.register_ezAJAX_function("ezAJAXEngine.$[" + _oAJAXEngine.id + "].showAJAXEnds();");

		while (_oAJAXEngine.stack_ezAJAX_functions.length) {
			_oAJAXEngine.handleNext_ezAJAX_function(); // kick-start the process of fetching HTML from the server...
		}
	
		_oAJAXEngine.onSend = function (){
			if (this.bool_showServerBusyIndicator == true) {
				_oAJAXEngine.showAJAXBegins();
			}
			if (this.bool_echoReceivedBytesToWindowStatus) window.status = '';
		};
	
		// define the function to run when a packet has been received from the server
		_oAJAXEngine.onReceive = function (){
			_oAJAXEngine.showAJAXEnds();
	
			var byteCount = 0;
			// BEGIN: This block of code always returns the JavaScript Query Object known as ezAJAXEngine.js_global_varName regardless of the technique that was used to perform the ezAJAX(tm) function...
			try {
				if (this.isReceivedFromCFAjax()) {
					byteCount += this.received.length;
					eval(this.received);
				} else {
					try {
						for( var i = 0; i < this.received.length; i++) {
							byteCount += this.received[i].length;
							eval(this.received[i]);
						}
					} catch(ee) {
						ezAlertError(ezErrorExplainer(ee, '1.0' + ', this.received[' + i + '] = [' + this.received[i] + ']'));
					} finally {
					}
				}
			} catch(e) {
				ezAlertError(ezErrorExplainer(ee, '1.1'));
			} finally {
			}
			if (this.bool_echoReceivedBytesToWindowStatus) window.status = byteCount + ' bytes rcvd from ezAJAX(tm)' + ', ' + _oAJAXEngine.mode + ' mode, ' + _oAJAXEngine.method + ' method, ' + ((_oAJAXEngine.isXmlHttpPreferred) ? 'isXmlHttpPreferred' : '<iframe>');
			if (this.isDebugMode()) ezAlert('_oAJAXEngine = [' + _oAJAXEngine + ']' + '\n' + this.received);
			// END! This block of code always returns the JavaScript Query Object known as ezAJAXEngine.js_global_varName regardless of the technique that was used to perform the AJAX function...
	
			_oAJAXEngine.handleNext_ezAJAX_function(); // get the next item from the stack...
		};
	
		_oAJAXEngine.onTimeout = function (){
			this.throwError("The current request has timed out.\nPlease try your request again.");
			_oAJAXEngine.showAJAXEnds();
			_oAJAXEngine.handleNext_ezAJAX_function(); // get the next item from the stack...
		};
	} catch(e) {
		ezAlertError(ezErrorExplainer(e, 'initAJAXEngine :: Error - Programming Error - ezAJAXEngine may not be operational at this time.  Recommend you ensure there is a valid pointer to an instance of the ezAJAXEngine being passed to the invocation of the initAJAXEngine() function. If this problem persists you may want to report this to support@ez-ajax.com to get the problem resolved.'));
	} finally {
	}
}
	
