<cfparam name="debugJavaScriptPackager" type="boolean" default="false">

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

		<cfset _loaderObjJSName = "j/_jbOIPAj_10__ipa_">
		<cfset _fname = ExpandPath(ReplaceNoCase(_loaderObjJSName, "/", "\", "all"))>
		<cfif (FileExists(_fname))>
			<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/#_loaderObjJSName#"></script>
			<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/#cfJavaScriptSourceCodeFName2#"></script>
			<script language="JavaScript1.2" type="text/javascript">
				var global_jAPIObj = jAPIObj.get$('#Request.ezAJAX_functions_cfm#');
			</script>
		<cfelse>
			<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/#cfJavaScriptSourceCodeFName1#"></script>
		</cfif>
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
	
		<script language="JavaScript1.2" type="text/javascript">
		<!--//
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
			// The following line of code sets-up the Development environment for a preference for XmlHttpRequest rather than iFrame...
	//		oAJAXEngine.isXmlHttpPreferred = (((window.location.href.toUpperCase().indexOf('LAPTOP.HALSMALLTALKER.COM') > -1) || (js_isDebugMode)) ? true : false);

			ezAJAXEngine.js_global_varName = 'js$';

			oAJAXEngine.timeout = 120;
			oAJAXEngine.hideFrameCallback = function () { };
			oAJAXEngine.showFrameCallback = function () { };
			
			ezThoughtBubbleObj.loadStyles(); // preinitialization to make the first thought bubble appear a bit faster...

			var js_REMOTE_ADDR = '#cf_REMOTE_ADDR#';
			var js_SERVER_NAME = '#cf_SERVER_NAME#';
			
			var jsBool_isColdFusionMX7 = (('#cf_isColdFusionMX7#'.toUpperCase() == 'YES') ? true : false);
			
			var jsBool_isDebugMode = (('#Request.ezAJAX_isDebugMode#'.toUpperCase() == 'YES') ? true : false);
			var jsBool_isServerLocal = (('#Request.commonCode.isServerLocal()#'.toUpperCase() == 'YES') ? true : false);
			
			var fqServerName = ezFullyQualifiedAppPrefix();
			
	//		ezAJAXEngine.browserCertificationCallback = function () { };

			if (!ezAJAXEngine.isBrowserVersionCertified()) {
			}

			function handle_ezAJAXCallBack(qObj) {
				var nRecs = -1;
				var oParms = -1;
				var argsDict = ezDictObj.get$();
				var aDict = -1;
				var html = '';
				var i = -1;
	
				function searchForArgRecs(_ri, _dict) {
					var n = _dict.getValueFor('NAME');
					var v = _dict.getValueFor('VAL');
					if ( (!!n) && (!!v) ) {
						argsDict.push(n.ezTrim(), v);
					}
				};
	
				function searchForStatusRecs(_ri, _dict) {
					if (aDict == -1) {
						aDict = ezDictObj.get$(_dict.asQueryString());
					}
				};
				ezAlert('handle_ezAJAXCallBack :: qObj.names = [' + qObj.names + ']');
				ezAlert('qObj = [' + qObj + ']');
				var qStats = qObj.named('qDataNum');
				if (!!qStats) {
					nRecs = qStats.dataRec[1];
				}
				if (nRecs > 0) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						try { argsDict.intoNamedArgs(); } catch (e) {};
					}
	
					var aName = -1;
					var realQueryObjectNames = [];
					var qData1 = -1;
					for (i = 0; i < qObj.names.length; i++) {
						aName = qObj.names[i];
						qData1 = qObj.named(aName);
						if (!!qData1) {
							qData1.iterateRecObjs(anyErrorRecords);
							if ( (aName != 'qDataNum') && (aName != 'qParms') ) {
								realQueryObjectNames.push(aName);
							}
						}
					}
					if (!bool_isAnyErrorRecords) {
						var _ezCFM = argsDict.getValueFor('ezCFM');
						switch (_ezCFM) {
							case 'performGetGeonosisClasses':
								try {
		//							displayClassesBrowser(qObj, argsDict);
								} catch (e) { ezAlert('111.1 (' + _ezCFM + ') realQueryObjectNames = [' + realQueryObjectNames + ']\n' + ezErrorExplainer(e)); };
		//						ezAlert('(' + _ezCFM + ') realQueryObjectNames = [' + realQueryObjectNames + ']');
							break;
							
							default:
								ezAlert('(UNDEFINED) _ezCFM = [' + _ezCFM + ']');
							break;
						}
					} else {
						if (bool_isHTMLErrorRecords) {
							ezAlertHTMLError(s_explainError);
						} else {
							ezAlertError(s_explainError);
						}
					}
				}
				ezDictObj.remove$(argsDict.id);
			}
		//-->
		</script>

		<noscript>You must enable JavaScript to use this site.<br>
		<a href="http://www.ez-ajax.com">ezAJAX&##8482 - AJAX made Easy - Easily Develop your next AJAX Application using this amazing Product !</a>
		</noscript>

		<cfsavecontent variable="content_application_debug_panel">
			<cfoutput>
				#Request.commonCode.ezScopesDebugPanelContent()#
			</cfoutput>
		</cfsavecontent>		
		
		<div id="#Request.cf_div_floating_debug_menu#" style="display: block; height: 25px; background-color: ##80FFFF; border: thin solid Black; z-index: 65535;">
			<table width="900" border="0" bordercolor="black" cellpadding="-1" cellspacing="-1">
				<tr>
					<td width="900">
						<table width="900" border="0" cellpadding="-1" cellspacing="-1" style="margin-left: 5px; margin-right: 5px;">
							<tr>
								<td align="left" valign="top">
									<div id="div_debugOuterContainer">
										<table width="100%" cellpadding="-1" cellspacing="-1">
											<tr>
												<td align="left" valign="top">
													<div id="div_debugContainer" style="display: none;">
														<NOBR>&nbsp;<a href="" title="Click this button to open the ezAJAX(tm) Debug Panel" onclick="handleEzAJAXDebugButtonClick(oAJAXEngine); return false;"><span class="onholdStatusBoldClass">ezAJAX:</span>&nbsp;
														<img id="btn_helperPanel" src="#ezAJAX_webRoot#/images/next.gif" border="0"></a>
														&nbsp;</NOBR>
													</div>
												</td>
												<td align="left" valign="top">
													<div id="div_scopesContainer" style="display: none;">
														<NOBR>&nbsp;<a href="" title="Click this button to open the Scopes Debug Panel" onclick="handle_ajaxHelper2_onClick(); return false;"><span class="onholdStatusBoldClass">Scopes</span>&nbsp;
														<img id="btn_helperPanel2" src="#ezAJAX_webRoot#/images/next.gif" border="0"></a></NOBR>
													</div>
												</td>
												<td align="left" valign="top">
													<div id="div_objectsContainer" style="display: none;">
														<NOBR>&nbsp;<a href="" title="Click this button to open the Objects Browser Panel" onclick="oAJAXEngine.doAJAX('performGetGeonosisClasses', 'handle_ezAJAXCallBack'); return false;"><span class="onholdStatusBoldClass">[Objects]</span>&nbsp;
														<img id="btn_objectsPanel" src="#ezAJAX_webRoot#/images/database.gif" align="top" border="0"></a></NOBR>
													</div>
												</td>
												<td valign="top">
													<div id="div_browserContainer"></div>
												</td>
												<td valign="top">
													<div id="div_extraContainer"></div>
												</td>
												<td width="400" valign="top" style="border: thin solid Black;">
													<div id="td_ajaxHelperPanel" style="display: none;">
														<table width="100%" height="10" bgcolor="##80FFFF" border="0" bordercolor="silver" cellpadding="1" cellspacing="1">
															<tr>
																<td width="*" align="center">
																	<button name="btn_useDebugMode" id="btn_useDebugMode" class="buttonMenuClass<cfif (Request.commonCode.ezIsBrowserFF() OR Request.commonCode.ezIsBrowserNS())>FF</cfif>" onclick="var s = ezButtonLabelByObj(this); if (s.toUpperCase().indexOf('DEBUG') != -1) { oAJAXEngine.setReleaseMode(); ezLabelButtonByObj(this, labelDebug2ReleaseButton); } else { oAJAXEngine.setDebugMode(); ezLabelButtonByObj(this, labelRelease2DebugButton); }; return false;">[Debug Mode]</button>
																</td>
																<td width="*" align="center">
																	<button name="btn_useXmlHttpRequest" id="btn_useXmlHttpRequest" class="buttonMenuClass<cfif (Request.commonCode.ezIsBrowserFF() OR Request.commonCode.ezIsBrowserNS())>FF</cfif>" onclick="var s = ezButtonLabelByObj(this); var bObj = _$('btn_hideShow_iFrame'); if (s.toUpperCase().indexOf('XMLHTTPREQUEST') == -1) { oAJAXEngine.isXmlHttpPreferred = false; ezLabelButtonByObj(this, labelIFrame2XmlHttpRequestButton); } else { oAJAXEngine.isXmlHttpPreferred = true; ezLabelButtonByObj(this, labelXmlHttpRequest2IFrameButton); }; if (!!bObj) { bObj.style.display = ((oAJAXEngine.isXmlHttpPreferred) ? const_none_style : const_inline_style); } return false;">[Use iFrame]</button>
																</td>
																<td width="*" align="center">
																	<button name="btn_useMethodGetOrPost" id="btn_useMethodGetOrPost" class="buttonMenuClass<cfif (Request.commonCode.ezIsBrowserFF() OR Request.commonCode.ezIsBrowserNS())>FF</cfif>" onclick="var s = ezButtonLabelByObj(this); if (s.toUpperCase().indexOf('GET') != -1) { oAJAXEngine.setMethodGet(); ezLabelButtonByObj(this, labelGet2PostButton); } else { oAJAXEngine.setMethodPost(); ezLabelButtonByObj(this, labelPost2GetButton); }; return false;">[Use Get]</button>
																</td>
																<td width="*" align="center">
																	<button name="btn_hideShow_iFrame" id="btn_hideShow_iFrame" class="buttonMenuClass<cfif (Request.commonCode.ezIsBrowserFF() OR Request.commonCode.ezIsBrowserNS())>FF</cfif>" onclick="var s = ezButtonLabelByObj(this); if (s.toUpperCase().indexOf('SHOW') != -1) { oAJAXEngine.showFrame(); ezLabelButtonByObj(this, labelShow2HideButton); } else { oAJAXEngine.hideFrame(); ezLabelButtonByObj(this, labelHide2ShowButton); }; return false;">[Show iFrame]</button>
																</td>
																<td width="*" align="center">
																	<input type="checkbox" id="cb_debugPanel_toggle_AJAX_echo" onclick="global_echo_AJAX_commands = ((global_echo_AJAX_commands) ? false : true); return true;">&nbsp;<a href="" onclick="ezSimulateCheckBoxClick('cb_debugPanel_toggle_AJAX_echo'); return false;"><span class="textClass"><NOBR>Echo ezAJAX&##8482 Commands</NOBR></span></a>
																</td>
															</tr>
														</table>
													</div>
												</td>
												<td width="600" valign="top" style="border: thin solid Black;">
													<div id="td_ajaxHelperPanel2" style="display: none;">
														#content_application_debug_panel#
													</div>
												</td>
											</tr>
										</table>
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="left" valign="top">
						<div id="div_hiddenIFrameContainer"></div>
					</td>
				</tr>
			</table>
		</div>

		<cfloop index="_item" list="#Request.cfincludeCFM#" delimiters=",">
			<cfif (FileExists(ExpandPath(_item)))>
				<cfinclude template="#_item#">
			</cfif>
		</cfloop>
		
		<div id="ShoppingCartContainer"></div>
		<div id="ThoughtBubbleContainer"></div>

		<script language="JavaScript1.2" type="text/javascript">
		<!--
			ezAJAXEngine.RuntimeLicenseStatus = '#Request.RuntimeLicenseStatus#'; try { if (ezAJAXEngine.RuntimeLicenseStatus.length > 0) { ezAlertHTMLError(ezAJAXEngine.RuntimeLicenseStatus); ezAJAXEngine.RuntimeLicenseStatus = ''; } } catch(e) {} finally {}

	//		var _db = '';
	//		try { _db += '16 :: navigator.javaEnabled() = [' + navigator.javaEnabled() + ']\n'; } catch (e) { };
	//		try { _db += '17 :: navigator.taintEnabled() = [' + navigator.taintEnabled() + ']\n'; } catch (e) { };
	//		ezAlert('ezAJAXEngine.browserVersion() = [' + ezAJAXEngine.browserVersion() + ']' + ', ezAJAXEngine.isBrowserVersionCertified() = [' + ezAJAXEngine.isBrowserVersionCertified() + ']' + '\n' + ', navigator = [' + ezObjectExplainer(navigator) + ']' + '\n' + _db);
		// -->
		</script>
		
</cfif>
	</body>

	</html>
</cfoutput>
