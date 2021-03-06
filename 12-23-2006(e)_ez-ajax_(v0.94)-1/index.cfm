<cfparam name="debugJavaScriptPackager" type="boolean" default="false">

<cfparam name="Request.importModules" type="string" default="">

<cfoutput>
	<cfif (IsDefined("Request.DOCTYPE")) AND (Len(Request.DOCTYPE) gt 0)>
		#Request.DOCTYPE#
	<cfelse>
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	</cfif>
	
	<html>
	<head>
		<title>#ezAJAX_title##_copyrightNotice#</title>
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/StyleSheet.css"> 
		#htmlHeader#
		
		<cfset Request.debugCompiler = "">
		<cfif (FileExists(ExpandPath("ezCompiler.cfm")))>
			<cfinclude template="ezCompiler.cfm">
		</cfif>

		<cfset bool_use_getLocation = false>
		<cfif (bool_use_getLocation)>
			<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/ajaxnav.$"></script>
		</cfif>

		<cfset _JavaScriptSignature = URLEncodedFormat(Trim(_asBlowfishEncryptedHex(DateFormat(Now(), "mm/dd/yyyy") & "_" & TimeFormat(Now(), "hh:mm:ss tt"))))>
		<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/#cfJavaScriptSourceCodeFName1#"></script>
		<cfif 0>
			<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/#cfJavaScriptSourceCodeFName2#"></script>
		<cfelseif 1> <!--- +++ --->
			<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/ezAjax/loader.cfm?out=0&modules=#URLEncodedFormat(Request.importModules)#&sig=#Trim(_JavaScriptSignature)#"></script>
		<cfelseif 0>
			<script language="JavaScript1.2" type="text/javascript"><cfinclude template="ezAjax/loader.cfm"></script>
		</cfif>
		<cfinclude template="ezAjax/cfc/cfinclude_GeonosisConstants.cfm">

		<cfscript>
			Request.commonCode.registerCFtoJS_variable('cf_const_Objects_symbol', cf_const_Objects_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_getCLASSES_symbol', cf_const_getCLASSES_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_chgAttrsForObject_symbol', cf_const_chgAttrsForObject_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_chgDataForObject_symbol', cf_const_chgDataForObject_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_getOBJECTS_symbol', cf_const_getOBJECTS_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_addClassDef_symbol', cf_const_addClassDef_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_dropClassDef_symbol', cf_const_dropClassDef_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_addObject_symbol', cf_const_addObject_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_dropObject_symbol', cf_const_dropObject_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_addAttribute_symbol', cf_const_addAttribute_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_dropAttribute_symbol', cf_const_dropAttribute_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_getAttributesForOBJECT_symbol', cf_const_getAttributesForOBJECT_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_getLinkedObjects_symbol', cf_const_getLinkedObjects_symbol);
			Request.commonCode.registerCFtoJS_variable('cf_const_checkLinkedObjects_symbol', cf_const_checkLinkedObjects_symbol);
			Request.commonCode.emitCFtoJS_variables(false);
		</cfscript>
	</head>

	<body onload="window_onload()" onunload="window_onUnload()">
		<cfif (IsDefined("Request.debugCompiler")) AND (Len(Request.debugCompiler) gt 0) AND (Request.commonCode.ezIsBrowserIE())><textarea readonly rows="50" cols="100" class="textClass" style="position: absolute; top: 0px; left: 0px;">#Request.debugCompiler#</textarea></cfif>
<cfif (NOT debugJavaScriptPackager)>
		<cfscript>
			cf_REMOTE_ADDR = CGI.REMOTE_ADDR;
			cf_SERVER_NAME = 'http:' & '/' & '/' & CGI.SERVER_NAME & '/' & CGI.SCRIPT_NAME;
			
			_urlCommunityEditionLicenseAgreement = Request.commonCode.ezClusterizeURL("#ezAJAX_webRoot#/ezAJAX(tm) Community Edition License Agreement.htm");
			_urlCommunityEditionProgrammersGuide = Request.commonCode.ezClusterizeURL("#ezAJAX_webRoot#/ezAJAX_tm_ Community Edition Programmers Guide v0.93.pdf");
	
			cf_isColdFusionMX7 = application.isColdFusionMX7;

			cf_Session_ID = CreateUUID();
		</cfscript>
	
		<cfsavecontent variable="jsCodeStoreB">
			<cfoutput>
			//var _javaScriptLoaderParms = '?out=0&modules=#URLEncodedFormat(Request.importModules)#&sig=#Trim(_JavaScriptSignature)#';

			//var myPathname = ((window.location.pathname == '') ? '/' : window.location.pathname);
			//var myURL = window.location.protocol + '//' + ((window.location.hostname == null) ? window.location.host : window.location.hostname) + myPathname + (((myPathname.charAt(myPathname.length - 1)) == '/') ? '' : '/') + 'ezAjax/loader.cfm' + _javaScriptLoaderParms;
			//alert('myURL = [' + myURL + ']');
			//ezJSON.get$(myURL);

			var js_AUTH_USER = '#Request.AUTH_USER#';
			
			var js_ezAJAX_webRoot = '#ezAJAX_webRoot#';
			
			var js_ezAJAX_webRoot_prefix = '#Request._prefix#';
			
			var cf_Session_ID = '#cf_Session_ID#';

			var js_isDebugMode = (('#Request.ezAJAX_isDebugMode#'.toUpperCase() == 'YES') ? true : false);

			var js_trademarkSymbol = '#cf_trademarkSymbol#';
		
			var cf_cgiReferer = '';
			<cfif (IsDefined("CGI.SERVER_NAME"))>cf_cgiReferer = '#CGI.SERVER_NAME#';</cfif>
			
			var const_div_floating_debug_menu = '#Request.cf_div_floating_debug_menu#';
			var const_div_floating_debug_menu_content = 'div_debugOuterContainer';

			url_sBasePath = '#Request.ezAJAX_functions_cfm#';

			// create the gateway object
			var oAJAXEngine = ezAJAXEngine.get$(url_sBasePath, false);

			var browser_is_op = oAJAXEngine.browser_is_op;
			var browser_is_ns = oAJAXEngine.browser_is_ns;
			var browser_is_ff = oAJAXEngine.browser_is_ff;
			var browser_is_ie = oAJAXEngine.browser_is_ie;
			
			oAJAXEngine.bool_showServerBusyIndicator = true;

			oAJAXEngine.setMethodGet();
			oAJAXEngine.setReleaseMode(); // this overrides the oAJAXEngine.set_isServerLocal() setting...

			// The following line of code sets-up the Production environment for a preference for XmlHttpRequest rather than iFrame...
			oAJAXEngine.isXmlHttpPreferred = (((window.location.href.toUpperCase().indexOf('.CONTENTOPIA.NET') == -1) || (window.location.href.toUpperCase().indexOf('.ez-ajax.com') == -1)) ? false : true);

			ezAJAXEngine.js_global_varName = 'js$';

			oAJAXEngine.timeout = 120;
			oAJAXEngine.hideFrameCallback = function () { };
			oAJAXEngine.showFrameCallback = function () { };
			
			if (typeof ezThoughtBubbleObj == const_object_symbol) {
				try { ezThoughtBubbleObj.loadStyles(); } catch (e) { }; // preinitialization to make the first thought bubble appear a bit faster...
			}

			var js_REMOTE_ADDR = '#cf_REMOTE_ADDR#';
			var js_SERVER_NAME = '#cf_SERVER_NAME#';
			
			var jsBool_isColdFusionMX7 = (('#cf_isColdFusionMX7#'.toUpperCase() == 'YES') ? true : false);
			
			var jsBool_isDebugMode = (('#Request.ezAJAX_isDebugMode#'.toUpperCase() == 'YES') ? true : false);
			var jsBool_isServerLocal = (('#Request.commonCode.isServerLocal()#'.toUpperCase() == 'YES') ? true : false);
			
			var fqServerName = ezFullyQualifiedAppPrefix();
			
			if (!ezAJAXEngine.isBrowserVersionCertified()) {
			}
			</cfoutput>
		</cfsavecontent>
		<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(jsCodeStoreB)#</script>

		<cfset bool_useGeonosis = false>
		<cfif (bool_useGeonosis)>
			<script language="JavaScript1.2" src="_js/20_GeonosisGUI.js" type="text/javascript"></script>
		</cfif>
		
		<noscript>You must enable JavaScript to use this site.<br>Please enable JavaScript for your browser or use a browser that support JavaScript.<br>
		<a href="http://www.ez-ajax.com">ezAJAX&##8482 - AJAX made Easy - Easily Develop your next AJAX Application using this amazing Product !</a>
		</noscript>

		<div id="#Request.cf_div_floating_debug_menu#" style="display: block; height: 25px; background-color: ##80FFFF; border: thin solid Black; z-index: 65535;">
			<button id="btn_fetchDebugMenu" class="buttonClass" onclick="try { this.disabled = true; oAJAXEngine.doAJAX('ezAJAX_PopulateDebugPanel', 'handle_ezAJAXPopulateDebugPanel'); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" title="Click this button to begin using the Debug menu.">[Open ezAJAX Debug Menu]</button>
		</div>

		<cfloop index="_item" list="#Request.cfincludeCFM#" delimiters=",">
			<cfif (FileExists(ExpandPath(_item)))>
				<cfinclude template="#_item#">
			</cfif>
		</cfloop>
		
		<div id="ShoppingCartContainer"></div>
		<div id="ThoughtBubbleContainer"></div>

		<cfsavecontent variable="finaleJavaScriptCode">
			<cfoutput>
				function handle_fetchDebugVariableByName(id) {
					var i = -1;
					var const_more_token = 'more';
					var const_prev_token = 'prev';
					var const_next_token = 'next';
					var const_more_symbol = '_' + const_more_token + '_';
					var const_prev_symbol = '_' + const_prev_token + '_';
					var const_next_symbol = '_' + const_next_token + '_';
					id = (((typeof id) == const_string_symbol) ? id : '');
					var ar = id.split('_');
					var aScopeName = '';
					var iBegin = -1;
					var iEnd = -1;
					if (id.toLowerCase().indexOf(const_more_symbol) > -1) {
						// btn_fetchDebug_Application.resourcebundle.RESOURCEBUNDLE_more_prev_10_147
						// btn_fetchDebug_Application.resourcebundle.RESOURCEBUNDLE_more_next_10_147
						for (i = 0; i < ar.length - 1; i++) {
							if (ar[i].toLowerCase() == const_more_token) {
								aScopeName = ar[i - 1];
								iBegin = parseInt(ar[i + 2]);
								iEnd = parseInt(ar[i + 3]);
								break;
							}
						}
	//					ezAlertHTML('<br><small>' + 'id = [' + id + ']' + ', aScopeName = [' + aScopeName + ']' + ', iBegin = [' + iBegin + ']' + ', iEnd = [' + iEnd + ']' + '</small>');
						try {
							oAJAXEngine.doAJAX('ezAJAX_PopulateDebugScope', 'handle_ezAJAXPopulateDebugPanel', 'scopeName', aScopeName, 'iBegin', iBegin);
						} catch (e) { ezAlertHTMLError(ezErrorExplainer(e)); };
					} else {
						var aName = ar[ar.length - 1];
						var ar2 = aName.split('.');
						aScopeName = ar2[0];
	//					ezAlertHTML('<br><small>' + 'id = [' + id + ']' + ', aScopeName = [' + aScopeName + ']' + ', aName = [' + aName + ']' + '</small>');
						try {
							oAJAXEngine.doAJAX('ezAJAX_PopulateDebugScope', 'handle_ezAJAXPopulateDebugPanel', 'scopeName', aScopeName, 'scopeMember', aName);
						} catch (e) { ezAlertHTMLError(ezErrorExplainer(e)); };
					}
				}
				
				function handle_ezAJAXPopulateDebugPanel(qObj, nRecs, qStats, argsDict, qData1) {
					var _CONTENT = '';
					var _scopeName = '';
					var _scopeMember = '';
					var _iBegin = '';
					var _HASSTYLES = '';
					var cObj = -1;
					var dObj = -1;
					var _html = '';
					var divName = '';
		
					function searchForContentRecs(_ri, _dict, _rowCntName) {
						_CONTENT = _dict.getValueFor('CONTENT');
						_HASSTYLES = _dict.getValueFor('HASSTYLES');
						if (!!_CONTENT) {
							_CONTENT = _CONTENT.ezURLDecode().ezClipCaselessReplace('%[ERROR]', '%');
						}
						_CONTENT = ((_CONTENT == null) ? '' : _CONTENT);
					};
		
					nRecs = ((nRecs != null) ? nRecs : -1);
					if (!!qStats) {
						if (!!argsDict) {
							if (!!qData1) {
								qData1.iterateRecObjs(searchForContentRecs);
								_scopeName = argsDict.getValueFor('scopeName');
								_scopeMember = argsDict.getValueFor('scopeMember');
								_iBegin = argsDict.getValueFor('iBegin');
		//						ezAlertHTML('<br><font color="blue"><small>' + '_scopeName = [' + _scopeName + ']' + ', _scopeMember = [' + _scopeMember + ']' + ', _iBegin = [' + _iBegin + ']' + '</small></font>');
								if ( (_scopeName == null) && (_scopeMember == null) && (_iBegin == null) && (_CONTENT.length > 0) ) {
									var oDiv = _$(const_div_floating_debug_menu);
									if (!!oDiv) {
										oDiv.innerHTML = _CONTENT;
										ezAJAXEngine.initDebugMenu(oAJAXEngine);

										var myURL = ezAJAXEngine.$[0]._url + 'cfdumpStyles.css';
										ezDynamicObjectLoader(myURL);
									}
								} else if (!!_scopeName) {
									var i = -1;
									var bObj = -1;
									var _btns = ['btn_fetchDebugApplication', 'btn_fetchDebugSession', 'btn_fetchDebugCGI', 'btn_fetchDebugRequest'];
									for (i = 0; i < _btns.length; i++) {
										bObj = _$(_btns[i]);
										if (!!bObj) {
											bObj.disabled = false;
										}
									}
			//						ezAlertHTML('<br><font color="red"><small>' + '(1)=[' + (!!_scopeName) + ']' + ', (2)=[' + (_scopeMember == null) + ']' + ', (3)=[' + (!!_iBegin) + ']' + '</small></font>');
									if ( (!!_scopeMember) && (_iBegin == null) ) {
										cObj = _$('btn_fetchDebug_' + _scopeMember);
										if (!!cObj) {
											cObj.disabled = false;
										}
										dObj = _$('div_fetchDebug_' + _scopeMember);
										if (!!dObj) {
											if ( (!!_HASSTYLES) && (_HASSTYLES.toLowerCase() == 'yes') ) {
												divName = 'div_scopeViewer_' + _scopeMember;
												_html = '<div id="' + divName + '" style="display: inline;">';
												_html += ezBeginTable(_scopeMember, '&bool=' + 'includeDismissButton=true'.ezURLEncode() + '&div=' + divName.ezURLEncode() + '&table=' + 'border="1"'.ezURLEncode() + '&tr=' + 'bgcolor="cyan"'.ezURLEncode() + '&td=' + 'align="center"'.ezURLEncode() + '&span=' + 'class="boldPromptTextClass"'.ezURLEncode());
												_html += '<tr><td>';
												_html += ((_CONTENT.length > 0) ? _CONTENT : _scopeMember);
												_html += '</td></tr>';
												_html += ezEndTable();
												_html += '</div>';
												dObj.innerHTML = _html;
											} else {
												dObj.innerHTML = ((_CONTENT.length > 0) ? _CONTENT : _scopeMember);
											}
										}
									} else if ( (!!_scopeName) && (_scopeMember == null) && (!!_iBegin) ) {
										dObj = _$('div_fetchDebug_' + _scopeName);
										if (!!dObj) {
											dObj.innerHTML = _CONTENT;
										}
		//								ezAlertHTML('<br>[' + _CONTENT + ']');
									} else {
										ezAlertHTML(((_CONTENT.length > 0) ? _CONTENT : _scopeName));
		//								ezAlert(_CONTENT);
									}
								} else {
									ezAlert('nRecs = [' + nRecs + ']');
									ezAlert('qStats = [' + qStats + ']');
									ezAlert('argsDict = [' + argsDict + ']');
									ezAlert('qData1 = [' + qData1 + ']');
									ezAlert('qObj = [' + qObj + ']');
								}
							} else {
								ezAlertError('Error - qData1 has an invalid value.');
							}
				
							ezDictObj.remove$(argsDict.id);
						} else {
							ezAlertError('Error - argsDict has an invalid value.');
						}
					} else {
						ezAlertError('Error - qStats has an invalid value.');
					}
				}
				ezAJAXEngine.RuntimeLicenseStatus = '#Request.RuntimeLicenseStatus#'; try { if (ezAJAXEngine.RuntimeLicenseStatus.length > 0) { ezAlertHTMLError(ezAJAXEngine.RuntimeLicenseStatus); ezAJAXEngine.RuntimeLicenseStatus = ''; } } catch(e) { ezAlertError('System Error: Cannot determine Runtime License Status.'); };
			</cfoutput>
		</cfsavecontent>		

		<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(finaleJavaScriptCode)#</script>
</cfif>
	</body>

	</html>
</cfoutput>
