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
		
		<cfif (FileExists(ExpandPath("ezCompiler.cfm")))>
			<cfinclude template="ezCompiler.cfm">
		</cfif>

		<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/#cfJavaScriptSourceCodeFName#"></script>
	</head>

	<body onload="window_onload()" onunload="window_onUnload()">
<cfif (NOT debugJavaScriptPackager)>
		<cfscript>
			cf_REMOTE_ADDR = CGI.REMOTE_ADDR;
			cf_SERVER_NAME = 'http:' & '/' & '/' & CGI.SERVER_NAME & '/' & CGI.SCRIPT_NAME;
			
			_urlCommunityEditionLicenseAgreement = Request.commonCode.clusterizeURL('#ezAJAX_webRoot#/ezAJAX(tm) Community Edition License Agreement.htm');
	
			cf_isColdFusionMX7 = application.isColdFusionMX7;

			cf_Session_ID = CreateUUID();
		</cfscript>
	
		<script language="JavaScript1.2" type="text/javascript">
		<!--//
			var const_cf_html_container_symbol = '#Request.cf_html_container_symbol#';
			var const_loading_data_message_symbol = '<span class="ajaxLoadingStatusClass"><NOBR>&nbsp;Server Busy !</NOBR></span>';
			var const_system_ready_message_symbol = '<span class="normalStatusClass">&nbsp;Ready !</span>';
			var const_jsapi_loading_image = '#Request.const_jsapi_loading_image#';
			var const_busy_loading_image = '#Request.const_busy_loading_image#';
			var const_system_busy_message_symbol = '<span class="ajaxLoadingStatusClass"><NOBR>&nbsp;Busy !</NOBR></span>';
			
			var js_AUTH_USER = '#Request.AUTH_USER#';
			
			var cf_Session_ID = '#cf_Session_ID#';

			var js_isDebugMode = (('#Request.ezAJAX_isDebugMode#'.toUpperCase() == 'YES') ? true : false);

			var js_trademarkSymbol = '#cf_trademarkSymbol#';
		
			var cf_cgiReferer = '';
			<cfif (IsDefined("CGI.SERVER_NAME"))>cf_cgiReferer = '#CGI.SERVER_NAME#';</cfif>
			
			var const_div_floating_debug_menu = '#Request.cf_div_floating_debug_menu#';

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
			oAJAXEngine.isXmlHttpPreferred = ((window.location.href.toUpperCase().indexOf('.CONTENTOPIA.NET') == -1) ? false : true);
			// The following line of code sets-up the Development environment for a preference for XmlHttpRequest rather than iFrame...
	//		oAJAXEngine.isXmlHttpPreferred = (((window.location.href.toUpperCase().indexOf('LAPTOP.HALSMALLTALKER.COM') > -1) || (js_isDebugMode)) ? true : false);

			oAJAXEngine.js_global_varName = 'js$';

			oAJAXEngine.timeout = 120;
			oAJAXEngine.hideFrameCallback = function () { };
			oAJAXEngine.showFrameCallback = function () { };
			
			var js_REMOTE_ADDR = '#cf_REMOTE_ADDR#';
			var js_SERVER_NAME = '#cf_SERVER_NAME#';
			
			var js_urlCommunityEditionLicenseAgreement = '#_urlCommunityEditionLicenseAgreement#';
			
			var jsBool_isColdFusionMX7 = (('#cf_isColdFusionMX7#'.toUpperCase() == 'YES') ? true : false);
			
			var jsBool_isDebugMode = (('#Request.ezAJAX_isDebugMode#'.toUpperCase() == 'YES') ? true : false);
			var jsBool_isServerLocal = (('#Request.commonCode.isServerLocal()#'.toUpperCase() == 'YES') ? true : false);
			
			var fqServerName = fullyQualifiedAppPrefix();
		//-->
		</script>

		<script language="JavaScript1.2" type="text/javascript">
		<!--
			document.write('<div id="#Request.cf_html_container_symbol#" style="display: inline; position: absolute; top: 0px; left: ' + (clientWid$() - const_jsapi_width_value) + 'px">');
			document.write('</div>');
		// -->
		</script>
		
		<cfif (1)>
				<div id="#Request.cf_div_floating_debug_menu#" style="display: inline; height: 20px; background-color: ##80FFFF; border: thin solid Black;">
					<table width="*" border="0" cellpadding="-1" cellspacing="-1" style="margin-left: 5px; margin-right: 5px;">
						<tr>
							<td align="left" valign="top">
								<table width="100%" cellpadding="-1" cellspacing="-1">
									<tr>
			<cfif (Request.commonCode.isServerLocal()) OR (Request.ezAJAX_isDebugMode)>
										<td align="left">
											<span class="onholdStatusBoldClass">AJAX:</span>&nbsp;<button name="btn_helperPanel" id="btn_helperPanel" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" title="Click this button to open the ezAJAX(tm) Debug Panel" onclick="var cObj = $('td_ajaxHelperPanel'); var bObj = $('btn_helperPanel'); var tbObj = $('table_ajaxHelperPanel'); if ( (!!cObj) && (!!bObj) && (!!tbObj) ) { cObj.style.display = ((cObj.style.display == const_none_style) ? const_inline_style : const_none_style); labelButtonByObj(bObj, ((cObj.style.display == const_inline_style) ? '[<<]' : '[>>]')); if (cObj.style.display == const_inline_style) { tbObj.style.width = _global_clientWidth; repositionBasedOnFloatingDebugPanel(tbObj); oAJAXEngine.setDebugMode(); } else { oAJAXEngine.setReleaseMode(); }; }; return false;">[>>]</button>&nbsp;
										</td>
										<td align="left">
											<span class="onholdStatusBoldClass">Scopes:</span>&nbsp;<button name="btn_helperPanel2" id="btn_helperPanel2" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" title="Click this button to open the Scopes Debug Panel" onclick="handle_ajaxHelper2_onClick(); return false;">[>>]</button>  <!--- var oO = _$(const_div_floating_debug_menu); if (!!oO) { _alert(oO.innerHTML); }; --->
										</td>
			</cfif>
				<cfif (Request.commonCode.isServerLocal())>
											<td>
												<NOBR>
												&nbsp;|&nbsp;
												<span class="normalx9TextClass">isIE = [#Request.commonCode.isBrowserIE()#]</span>
												&nbsp;|&nbsp;
												<span class="normalx9TextClass">isFF = [#Request.commonCode.isBrowserFF()#]</span>
												&nbsp;|&nbsp;
												<span class="normalx9TextClass">isNS = [#Request.commonCode.isBrowserNS()#]</span>
												&nbsp;|&nbsp;
												<span class="normalx9TextClass">isOP = [#Request.commonCode.isBrowserOP()#]</span>
												</NOBR>
											</td>
				</cfif>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
				
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td align="center" id="td_ajaxHelperPanel" style="display: none;">
							<table width="100%" bgcolor="##80FFFF" border="1" bordercolor="silver" cellspacing="-1" cellpadding="-1" id="table_ajaxHelperPanel" style="width: 800px;">
								<tr>
									<td>
										<table width="100%" cellpadding="-1" cellspacing="-1">
											<tr>
												<td width="16%" align="center">
													<button name="btn_useDebugMode" id="btn_useDebugMode" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="var s = getButtonLabelByObj(this); if (s.toUpperCase().indexOf('DEBUG') != -1) { oAJAXEngine.setReleaseMode(); labelButtonByObj(this, labelDebug2ReleaseButton); } else { oAJAXEngine.setDebugMode(); labelButtonByObj(this, labelRelease2DebugButton); }; return false;">[Debug Mode]</button>
												</td>
												<td width="17%" align="center">
													<button name="btn_useXmlHttpRequest" id="btn_useXmlHttpRequest" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="var s = getButtonLabelByObj(this); var bObj = _$('btn_hideShow_iFrame'); if (s.toUpperCase().indexOf('XMLHTTPREQUEST') == -1) { oAJAXEngine.isXmlHttpPreferred = false; labelButtonByObj(this, labelIFrame2XmlHttpRequestButton); } else { oAJAXEngine.isXmlHttpPreferred = true; labelButtonByObj(this, labelXmlHttpRequest2IFrameButton); }; if (!!bObj) { bObj.style.display = ((oAJAXEngine.isXmlHttpPreferred) ? const_none_style : const_inline_style); } return false;">[Use iFrame]</button>
												</td>
												<td width="16%" align="center">
													<button name="btn_useMethodGetOrPost" id="btn_useMethodGetOrPost" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="var s = getButtonLabelByObj(this); if (s.toUpperCase().indexOf('GET') != -1) { oAJAXEngine.setMethodGet(); labelButtonByObj(this, labelGet2PostButton); } else { oAJAXEngine.setMethodPost(); labelButtonByObj(this, labelPost2GetButton); }; return false;">[Use Get]</button>
												</td>
												<td width="17%" align="center">
													<button name="btn_hideShow_iFrame" id="btn_hideShow_iFrame" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="var s = getButtonLabelByObj(this); if (s.toUpperCase().indexOf('SHOW') != -1) { oAJAXEngine.showFrame(); labelButtonByObj(this, labelShow2HideButton); } else { oAJAXEngine.hideFrame(); labelButtonByObj(this, labelHide2ShowButton); }; return false;">[Show iFrame]</button>
												</td>
												<td width="17%" align="center">
													<input type="checkbox" id="cb_debugPanel_toggle_AJAX_echo" onclick="global_echo_AJAX_commands = ((global_echo_AJAX_commands) ? false : true); return true;">&nbsp;<a href="" onclick="simulateCheckBoxClick('cb_debugPanel_toggle_AJAX_echo'); return false;"><span class="textClass"><NOBR>Echo ezAJAX&##8482 Commands</NOBR></span></a>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				
			<cfif (Request.commonCode.isServerLocal())>
				<cfsavecontent variable="content_application_debug_panel">
					<cfoutput>
						#Request.commonCode.scopesDebugPanelContentLayout()#
					</cfoutput>
				</cfsavecontent>		
				
				<table id="table_ajaxHelperPanel2" style="width: 800px;" cellpadding="-1" cellspacing="-1">
					<tr>
						<td id="td_ajaxHelperPanel2" align="center" style="display: none;">
							<table border="1" cellspacing="-1" cellpadding="-1">
								<tr>
									<td align="center">
										#content_application_debug_panel#
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</cfif>
		</cfif>
		
		<div id="div_sysMessages" style="display: none;">
			<table width="*" border="1" cellspacing="-1" cellpadding="-1" bgcolor="##FFFF80">
				<tr>
					<td>
						<table width="*" cellspacing="-1" cellpadding="-1">
							<tr id="div_sysMessages_titleBar_tr" bgcolor="silver">
								<td align="center">
									<span id="span_sysMessages_title" class="boldPromptTextClass"></span>
								</td>
								<td align="right">
									<button class="buttonClass" title="Click this button to dismiss this pop-up." onclick="dismissSysMessages(); return false;">[X]</button>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<span id="span_sysMessages_body" class="textClass"></span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>

		<cfloop index="_item" list="#Request.cfincludeCFM#" delimiters=",">
			<cfif (FileExists(ExpandPath(_item)))>
				<cfinclude template="#_item#">
			</cfif>
		</cfloop>
		
		<script language="JavaScript1.2" type="text/javascript">
		<!--
			function labelShow2HideButton(x) { if (!!x) return x.clipCaselessReplace('show', 'Hide'); };
			function labelHide2ShowButton(x) { if (!!x) return x.clipCaselessReplace('hide', 'Show'); };
			
			oAJAXEngine.hideFrame();
			var cObj = $('btn_hideShow_iFrame');
			if (!!cObj) {
				if (oAJAXEngine.visibility == 'visible') {
					labelButtonByObj(cObj, labelShow2HideButton);
				}
			}

			function labelIFrame2XmlHttpRequestButton(x) { if (!!x) return x.clipCaselessReplace('iFRAME', 'XmlHttpRequest'); };
			function labelXmlHttpRequest2IFrameButton(x) { if (!!x) return x.clipCaselessReplace('XMLHTTPREQUEST', 'iFRAME'); };
			
			var cObj = $('btn_useXmlHttpRequest');
			if (!!cObj) {
				if (oAJAXEngine.isXmlHttpPreferred == false) {
					labelButtonByObj(cObj, labelIFrame2XmlHttpRequestButton);
				} else  {
					var bObj = _$('btn_hideShow_iFrame');
					if (!!bObj) {
						bObj.style.display = const_none_style;
					}
				}
			}

			function labelGet2PostButton(x) { if (!!x) return x.clipCaselessReplace('GET', 'Post'); };
			function labelPost2GetButton(x) { if (!!x) return x.clipCaselessReplace('POST', 'Get'); };
			
			var cObj = $('btn_useMethodGetOrPost');
			if (!!cObj) {
				if (oAJAXEngine.isMethodGet()) {
					labelButtonByObj(cObj, labelGet2PostButton);
				}
			}

			function labelDebug2ReleaseButton(x) { if (!!x) return x.clipCaselessReplace('Debug', 'Release'); };
			function labelRelease2DebugButton(x) { if (!!x) return x.clipCaselessReplace('Release', 'Debug'); };

			var cObj = $('btn_useDebugMode');
			if (!!cObj) {
				if (oAJAXEngine.isReleaseMode() == true) {
					labelButtonByObj(cObj, labelDebug2ReleaseButton);
				}
			}

			var cObj = $(const_cf_html_container_symbol);
			var dObj = $(const_div_floating_debug_menu);
			if ( (!!cObj) && (!!dObj) ) {
				if (dObj.style.display == const_none_style) {
					dObj.style.position = cObj.style.position;
					dObj.style.top = parseInt(cObj.style.top) + 25 + 'px';
					dObj.style.left = (clientWid$() - 75) + 'px';
					dObj.style.display = const_inline_style;
				}
			}

			var _msg = '#Request.RuntimeLicenseStatus#';
			if (_msg.length > 0) {
				_alertHTMLError(_msg);
			}
			
			window.onscroll();			
		// -->
		</script>
		
</cfif>
	</body>

	</html>
</cfoutput>
