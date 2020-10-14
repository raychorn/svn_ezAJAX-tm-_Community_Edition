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

