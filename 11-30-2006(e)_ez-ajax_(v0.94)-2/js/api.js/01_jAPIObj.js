// jAPIObj.js

jAPIObj = function(id, urlPrefix){
	this.id = id;
	this.timerTickCount = 250;
	this.timerTicks = [];
	this.timerID = [];
	this.init(urlPrefix);
};

jAPIObj.$ = [];

jAPIObj.x$ = [];

jAPIObj.verifyJSLoader = function(id) {
	var oObj = -1;
	var jsCode = -1;
	if (id <= jAPIObj.$.length) {
		oObj = jAPIObj.$[id];
		if (!!oObj) {
			try { oObj.isLoaded[oObj.nameLoading] = (!!eval(oObj.nameLoading)); } catch(e) { oObj.isLoaded[oObj.nameLoading] = false; } finally { };
			if (!!oObj.nameLoading) ezAlert('1.1 (' + oObj.timerTicks[oObj.nameLoading] + ') oObj.isLoaded[' + oObj.nameLoading + '] = [' + oObj.isLoaded[oObj.nameLoading] + ']' + ', jAPIObj.x$.length = [' + jAPIObj.x$.length + ']');
			if (oObj.isLoaded[oObj.nameLoading]) {
				clearInterval(oObj.timerID[oObj.nameLoading]);
				oObj.timerID[oObj.nameLoading] = null;
			}
			oObj.timerTicks[oObj.nameLoading]++;
		}
	}
};

jAPIObj.ezDisableAllButtonsLike = function(aName, bool) {
	try { return _ezDisableAllButtonsLike(aName, bool); } catch(e) { return -1; } finally { }
};

jAPIObj.ezFullyQualifiedAppUrl = function() {
	try { return _ezFullyQualifiedAppUrl(); } catch(e) { return -1; } finally { }
};

jAPIObj.ezFullyQualifiedAppPrefix = function() {
	try { return _ezFullyQualifiedAppPrefix(); } catch(e) { return -1; } finally { }
};

jAPIObj.ezURLPrefixFromHref = function(hRef) {
	try { return _ezURLPrefixFromHref(hRef); } catch(e) { return -1; } finally { }
};

jAPIObj.ezFirstFolderAfterDomainNameFromHref = function(hRef) {
	try { return _ezFirstFolderAfterDomainNameFromHref(hRef); } catch(e) { return -1; } finally { }
};

jAPIObj.ezFilePath2HrefUsingCommonFolder = function(fPath, hRef, commonFolder) {
	try { return _ezFilePath2HrefUsingCommonFolder(fPath, hRef, commonFolder); } catch(e) { return -1; } finally { }
};

jAPIObj.ezGetStyle = function(el, style) {
	try { return _ezGetStyle(el, style); } catch(e) { return -1; } finally { }
};

jAPIObj.ezInsertArrayItem = function(a,newValue,position) {
	try { return _ezInsertArrayItem(a,newValue,position); } catch(e) { return -1; } finally { }
};

jAPIObj.ezLocateArrayItems = function(a, what, start) {
	try { return _ezLocateArrayItems(a, what, start); } catch(e) { return -1; } finally { }
};

jAPIObj.ezHex = function(ch) {
	try { return _ezHex(ch); } catch(e) { return -1; } finally { }
};

jAPIObj.ezColorHex = function(cVal) {
	try { return _ezColorHex(cVal); } catch(e) { return -1; } finally { }
};

jAPIObj.ezObjectExplainer = function(obj) {
	try { return _ezObjectExplainer(obj); } catch(e) { return -1; } finally { }
};

jAPIObj.ezRemoveArrayItem = function(a,i) {
	try { return _ezRemoveArrayItem(a,i); } catch(e) { return -1; } finally { }
};

jAPIObj.ezRemoveEmptyItemsFromArray = function(ar) {
	try { return _ezRemoveEmptyItemsFromArray(ar); } catch(e) { return -1; } finally { }
};

jAPIObj.ezSetFocus = function(pObj) {
	try { return _ezSetFocus(pObj); } catch(e) { return -1; } finally { }
};

jAPIObj.ezSetStyle = function(aStyle, styles) {
	try { return _ezSetStyle(aStyle, styles); } catch(e) { return -1; } finally { }
};

jAPIObj.ezSimulateCheckBoxClick = function(id) {
	try { return _ezSimulateCheckBoxClick(id); } catch(e) { return -1; } finally { }
};

jAPIObj.ez2CamelCase = function(sInput) {
	try { return _ez2CamelCase(sInput); } catch(e) { return -1; } finally { }
};

jAPIObj.getViewportHeight = function() {
	try { return _getViewportHeight(); } catch(e) { return -1; } finally { }
};

jAPIObj.getViewportWidth = function() {
	try { return _getViewportWidth(); } catch(e) { return -1; } finally { }
};

jAPIObj.getScrollLeft = function() {
	try { return _getScrollLeft(); } catch(e) { return -1; } finally { }
};

jAPIObj.getScrollTop = function() {
	try { return _getScrollTop(); } catch(e) { return -1; } finally { }
};

jAPIObj.setCookie = function(name, value, path) {
	try { return _setCookie(name, value, path); } catch(e) { return -1; } finally { }
};

jAPIObj.getCookie = function(name) {
	try { return _getCookie(name); } catch(e) { return -1; } finally { }
};

jAPIObj.deleteCookie = function(name, path) {
	try { return _deleteCookie(name, path); } catch(e) { return -1; } finally { }
};

jAPIObj.getFilename = function() {
	try { return _getFilename(); } catch(e) { return -1; } finally { }
};

jAPIObj.getPath = function() {
	try { return _getPath(); } catch(e) { return -1; } finally { }
};

jAPIObj.ezStyle2String = function(aStyle) {
	try { return _ezStyle2String(aStyle); } catch(e) { return -1; } finally { }
};

jAPIObj.ezURLDecode = function(encoded) {
	try { return _ezURLDecode(encoded); } catch(e) { return -1; } finally { }
};

jAPIObj.ezURLEncode = function(plaintext) {
	try { return _ezURLEncode(plaintext); } catch(e) { return -1; } finally { }
};

jAPIObj.ezFlushCache$ = function(oO) {
	try { return _ezFlushCache$(oO); } catch(e) { return -1; } finally { }
};

jAPIObj.ezButtonLabelByObj = function(btnObj) {
	try { return _ezButtonLabelByObj(btnObj); } catch(e) { return -1; } finally { }
};

jAPIObj.ezLabelButtonByObj = function(bObj, sLabel) {
	try { return _ezLabelButtonByObj(bObj, sLabel); } catch(e) { return -1; } finally { }
};

jAPIObj.ezSetFocusById = function(id) {
	try { return _ezSetFocusById(id); } catch(e) { return -1; } finally { }
};

jAPIObj.handleEzAJAXDebugButtonClick = function(_oAJAXEngine) {
	try { return _handleEzAJAXDebugButtonClick(_oAJAXEngine); } catch(e) { return -1; } finally { }
};

jAPIObj.handle_ajaxHelper2_onClick = function() {
	try { return _handle_ajaxHelper2_onClick(); } catch(e) { return -1; } finally { }
};

jAPIObj.get$ = function(urlPrefix) {
	var instance = jAPIObj.$[jAPIObj.$.length];
	if (instance == null) {
		instance = jAPIObj.$[jAPIObj.$.length] = new jAPIObj(jAPIObj.$.length, urlPrefix);
	}
	return instance;
};

jAPIObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < jAPIObj.$.length) ) {
		var instance = jAPIObj.$[id];
		if (!!instance) {
			jAPIObj.$[id] = ezObjectDestructor(instance);
			ret_val = (jAPIObj.$[id] == null);
		}
	}
	return ret_val;
};

jAPIObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < jAPIObj.$.length; i++) {
		jAPIObj.remove$(i);
	}
	return ret_val;
};

jAPIObj.prototype = {
	id : -1,
	isLoaded : [],
	nameLoading : '',
	toString : function() {
		var s = 'jAPIObj(' + this.id + ') :: (';
		if (this.id != null) {
		}
		s += ')';
		return s;
	},
	sleep : function(msecs) {
		var start = new Date().getTime();
		var cur = start
		msecs = (((typeof msecs) == const_number_symbol) ? msecs : 0);
		while (cur - start < msecs) {
			try { this.isLoaded[this.nameLoading] = (!!eval(this.nameLoading)); } catch(e) { this.isLoaded[this.nameLoading] = false; } finally { };
			cur = new Date().getTime();
			if ( (this.isLoaded[this.nameLoading] != null) && (this.isLoaded[this.nameLoading]) ) {
				break;
			}
		}
		return (cur - start);
	},
	init : function(urlPrefix) {
		var i = -1;
		var _files = [];
		var ar = urlPrefix.split('/');
		ar.pop();
		ar.pop();
		var _urlPrefix = ar.join('/');
//		_files.push('_XnotisoPtnemelEze_00_');
//		_files.push('_notisoPtnemelEze_00_');
//		_files.push('_jbOmorFsnoitceleSteg_00_');
//		_files.push('_nottuBoidaRkcilc_10_');
//		_files.push('_$tHtneilc_10_');
//		_files.push('_$diWtneilc_10_');
//		_files.push('_daolno_wodniw_90_');
//		_files.push('_ekiLsnottuBllAelbasid_10_');
//		_files.push('_stneve_10_');
//		_files.push('_lrUppAdeifilauQylluFze_10_');
//		_files.push('_xiferPppAdeifilauQylluFze_10_');
//		_files.push('_ferHmorFxiferPLRUze_10_');
//		_files.push('_ferHmorFemaNniamoDretfAredloFtsriFze_10_');
//		_files.push('_troppuSretsulCze_10_');
//		_files.push('_elytSteg_10_');
//		_files.push('_metIyarrAtresni_10_');
//		_files.push('_smetIyarrAetacol_10_');
//		_files.push('_xeHze_10_');
//		_files.push('_csim_10_');
//		_files.push('_renialpxEtcejbo_10_');
//		_files.push('_metIyarrAevomer_10_');
//		_files.push('_yarrAmorFsmetIytpmEevomer_10_');
//		_files.push('_ylefaSsucoFtes_10_');
//		_files.push('_elytStes_10_');
//		_files.push('_kcilCxoBkcehCetalumis_10_');
//		_files.push('_esaClemaCot_10_');
//		_files.push('_thgieHtropweiVteg_10_');
//		_files.push('_htdiWtropweiVteg_10_');
//		_files.push('_tfeLllorcSteg_10_');
//		_files.push('_poTllorcSteg_10_');
//		_files.push('_eikooCtes_10_');
//		_files.push('_eikooCteg_10_');
//		_files.push('_eikooCeteled_10_');
//		_files.push('_emaneliFteg_10_');
//		_files.push('_htaPteg_10_');
//		_files.push('_ecalpeRsselesaCpilCepytotorPgnirtS_10_');
//		_files.push('_htdiWroFtamroFepytotorPgnirtS_10_');
//		_files.push('_ahplAsIepytotorPgnirtS_10_');
//		_files.push('_ciremuNsIepytotorPgnirtS_10_');
//		_files.push('_gnirtSbuSecalpeRepytotorPgnirtS_10_');
//		_files.push('_sfLrCpirtSepytotorPgnirtS_10_');
//		_files.push('_LMTHpirtSepytotorPgnirtS_10_');
//		_files.push('_s2yBsecapSpirtSepytotorPgnirtS_10_');
//		_files.push('_sbaTpirtSepytotorPgnirtS_10_');
//		_files.push('_mirTepytotorPgnirtS_10_');
//		_files.push('_gnirtS2elytS_10_');
//		_files.push('_edoceDLRU_10_');
//		_files.push('_edocnELRU_10_');
//		_files.push('_gnirtSfCepytotorPyarrA_20_');
//		_files.push('_ahplAnIretliFepytotorPgnirtS_20_');
//		_files.push('_ciremuNnIretliFepytotorPgnirtS_20_');
//		_files.push('_$ehcaChsulf_20_');
//		_files.push('_jbOyBlebaLnottuBteg_20_');
//		_files.push('_jbOyBnottuBlebal_20_');
//		_files.push('_dIyBylefaSsucoFtes_20_');
//		_files.push('_srahClagellIpirtSepytotorPgnirtS_30_');
//		_files.push('_kcilCnottuBgubeDXAJAzEeldnah_50_');
//		_files.push('_kcilCno_2repleHxaja_eldnah_50_');
//		_files.push('_noitisoProhcnA_20_');
//		_files.push('_jbOsbaT_20__sbat_');
//		_files.push('_jbOstcAIUG_70_');
//		_files.push('_sdroceRrorrEyna_90_');
//		_files.push('_troppuSuneMgubed_01_');
		for (i = 0; i < _files.length; i++) {
			ezDynamicObjectLoader(_urlPrefix + '/j/' + _files[i]);
		}
		return this;
	},
	destructor : function() {
		return (this.id = jAPIObj.$[this.id] = this.isLoaded = this.nameLoading = this.timerTickCount = this.timerTicks = this.timerID = null);
	}
};

jAPIObj.firstUsage = 0;

