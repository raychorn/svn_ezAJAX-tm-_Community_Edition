<cfparam name="URL.mode" type="string" default="">
<cfparam name="URL.entry" type="string" default="">

<cfparam name="URL.contentID" type="string" default="">

<cfif (URL.contentID is "Whats New")>
	<cfset URL.contentID = "WhatsNew_0">
<cfelseif (URL.contentID is "JSON Support")>
	<cfset URL.contentID = "JSONSupportText_0">
<cfelseif (URL.contentID is "Web20APIall")>
	<cfset URL.contentID = "Web20API_0">
</cfif>

<cfset cf_trademarkSymbol = '&##8482'>

<cfset cf_buttonClass = "buttonClass">
<cfif (Request.commonCode.ezIsBrowserFF() OR Request.commonCode.ezIsBrowserFF())>
	<cfset cf_buttonClass = cf_buttonClass & "FF">
</cfif>

<cfsavecontent variable="ezClusterLink">
	<cfoutput>
		ezCluster&##8482
	</cfoutput>
</cfsavecontent>

<cfsavecontent variable="ezAJAXLink">
	<cfoutput>
		ezAJAX&##8482
	</cfoutput>
</cfsavecontent>

<cfsavecontent variable="_poweredHTML">
	<cfoutput>
		<p align="justify" class="titlex10BlueClass">This Site is powered by&nbsp;#ezClusterLink#&nbsp;Patents Pending and&nbsp;#ezAJAXLink#&nbsp;Enterprise Edition v1.0.&nbsp;
		#ezClusterLink#&nbsp;makes 2 or more web servers into a single coherent web server using simple low-cost techniques that are built into&nbsp;#ezAJAXLink#.&nbsp;
		#ezAJAXLink#&nbsp;shortens time to market for AJAX Apps.&nbsp;Every single&nbsp;#ezAJAXLink#&nbsp;App begins with the same core body of code that is completely reusable and redistributable.&nbsp;&nbsp;Let us do all the work for you.&nbsp;&nbsp;<cfif (NOT Request.commonCode.ezIsBrowserIE())><b><i>This site is best when viewed using IE 7.x (1024x768) resolution.</i></b></cfif>
		The contents of this Site are protected under U.S. and International Copyright Laws. &copy 1990-#Year(Now())#&nbsp;Hierarchical Applications Limited, All Rights Reserved.</p>
	</cfoutput>
</cfsavecontent>
	
<cfsavecontent variable="introContent">
	<cfoutput>
		<table width="90%" cellpadding="-1" cellspacing="-1">
			<tr>
				<td width="100" align="right">
					<div style="margin-left: 20px;"><a href="http://#CGI.SERVER_NAME#" onmouseover="handleOnMouseOverLinkSpan('span_hackerSafe_siteLogoLowerRightTransparent', 'logoImageHoverClass');" onmouseout="handleOnMouseOutLinkSpan('span_hackerSafe_siteLogoLowerRightTransparent');"><span id="span_hackerSafe_siteLogoLowerRightTransparent"><img src="app/images/ezAJAX Logo 08-17-2006a (125x125).jpg" border="0" width="120"></span></a></div>
				</td>
				<td width="*" align="center" valign="top">
					<table width="*">
						<tr>
							<td>
								<h4 align="center"><b>This is the <U>MUST-HAVE</U> Web 2.0 Product of #Year(Now())# !</b>&nbsp;<span id="span_registrationStats"></span></h4>
							</td>
						</tr>
						<tr>
							<td>
								<span class="titlex12BlueClass"><b>Limited-Time Bundle Offer: The first 10 ezAJAX Enterprise Edition Perpetual Runtime License Registrations, <i>every month</i>, will get a FREE ColdFusion MX 7 Server License.  These FREE ColdFusion MX 7 Server Licenses are limited in supply so don't delay. Get YOURS today !</b></span>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" cellpadding="-1" cellspacing="-1">
									<tr>
										<td valign="bottom" width="80%">
											<table width="100%" cellpadding="-1" cellspacing="-1">
												<tr>
													<td valign="top" align="left">
														<cfset divName_optIn = "div_OptInContent_#CreateUUID()#">
														<div id="#divName_optIn#" style="display: none;">#ContactUsFormHTML(true, "performOptInAction", '', divName_optIn)#</div>
														<cfset divName_optOut = "div_OptOutContent_#CreateUUID()#">
														<div id="#divName_optOut#" style="display: none;">#ContactUsFormHTML(true, "performOptOutAction", '', divName_optOut)#</div>
													</td>
												</tr>
												<tr>
													<td valign="top" align="left">
														<table width="100%" cellpadding="-1" cellspacing="-1">
															<tr>
																<td width="60%" align="left" valign="top">
																	<span class="titlex10GreenClass">
																	<a id="anchor_optIn" name="anchor_optIn" href="" title="Click this link to Opt-In to receive our Monthly Newsletters" onmouseover="/*ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, ((ezAJAXEngine.browser_is_ff) ? 240 : 120), ((ezAJAXEngine.browser_is_ff) ? -60 : ((_global_clientWidth < webLayout_fixedWidth) ? 0 : -60)), ((ezAJAXEngine.browser_is_ff) ? -15 : -30), ((_global_clientWidth < webLayout_fixedWidth) ? false : -1));*/ return false;" onclick="var oObj = _$('#divName_optIn#'); if (!!oObj) { oObj.style.display = const_inline_style; }; return false;">Opt-In</a>&nbsp;|&nbsp;
																	<cfscript>
																		Request.commonCode.ezCfDirectory('Request.qNewsletters', ExpandPath('/app/NewsLetters/'), '*');
																		if ( (NOT Request.directoryError) AND (IsQuery(Request.qNewsletters)) AND (Request.qNewsletters.recordCount gt 0) ) {
																			_sql_statement = "SELECT * FROM Request.qNewsletters WHERE (name <> '.svn') ORDER BY dateLastModified, name";
																			Request.commonCode.ezExecSQL('Request.qNewsletters', '', _sql_statement);
																			if (NOT Request.dbError) {
																				_newsletter_symbol = "'Newsletter'";
																				writeOutput('Monthly NewsLetters:&nbsp;<select id="selection_monthlyNewsletters" class="textClass" style="background-color: ##f3f6f9;" onchange="if (this.selectedIndex > 0) { popUpWindowForURL(this.options[this.selectedIndex].value, #_newsletter_symbol# + this.options[this.selectedIndex].text, 660, 550, true); };">');
																				writeOutput('<option value="" selected>Choose...</option>');
																				for (i = 1; i lte Request.qNewsletters.recordCount; i = i + 1) {
																					newsletter_url = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#/app/NewsLetters/#Request.qNewsletters.name[i]#/index.html');
																					jsCode = "popUpWindowForURL('#newsletter_url#', 'Newsletter#Request.qNewsletters.name[i]#', 660, 550, true);";
																					yyyy = Right(Request.qNewsletters.name[i], 4);
																					if (IsNumeric(yyyy)) {
																						mmmm = Left(Request.qNewsletters.name[i], Len(Request.qNewsletters.name[i]) - Len(yyyy));
																						writeOutput('<option value="#newsletter_url#">#mmmm# #yyyy#</option>');
																					}
																				}
																				writeOutput('</select>&nbsp;|&nbsp;');
																			}
																		}
																	</cfscript>
																	<a id="anchor_optOut" name="anchor_optOut" href="" title="Click this link to Opt-Out to stop receiving our Monthly Newsletters" onmouseover="/*ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, ((ezAJAXEngine.browser_is_ff) ? 240 : 215), ((ezAJAXEngine.browser_is_ff) ? -120 : -100), ((ezAJAXEngine.browser_is_ff) ? -15 : -15));*/ return false;" onclick="var oObj = _$('#divName_optOut#'); if (!!oObj) { oObj.style.display = const_inline_style; }; return false;">Opt-Out</a>
																	</span>
																</td>
																<td width="*">
																	<table width="100%" cellpadding="-1" cellspacing="-1">
																		<tr>
																			<td width="80%" align="center">
																				<span class="normalBigStatusBoldClass">
																				<a id="anchor_RegNow_BuyNow" name="anchor_RegNow_BuyNow" href="http://www.regnow.com/softsell/nph-softsell.cgi?item=14605-1" target="_blank" title="Buy Annual Runtime License from RegNow.Com" onmouseover="/*ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, ((ezAJAXEngine.browser_is_ff) ? 230 : 215), ((ezAJAXEngine.browser_is_ff) ? -110 : -110), ((ezAJAXEngine.browser_is_ff) ? -0 : -0));*/ return false;">Buy Now</a>
																				</span>
																			</td>
																			<td width="20%" align="center">
																				&nbsp;
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<div id="div_underLogoContentContainer"></div>
				</td>
				<td>
					#_poweredHTML#
				</td>
			</tr>
		</table>
	</cfoutput>
</cfsavecontent>

<cfset introContent = Replace(Replace(introContent, Chr(10), "", "all"), Chr(13), "", "all")>

<cfset plain = 1>
<cfset mode = "info">
<cfsavecontent variable="_tab2Content">
	<cfoutput>
		<cfinclude template="_siteMenu.cfm">
	</cfoutput>
</cfsavecontent>

<cfset _tab2Content = Replace(Replace(_tab2Content, Chr(10), "", "all"), Chr(13), "", "all")>

<cfset mode = "json">
<cfsavecontent variable="_tab3Content">
	<cfoutput>
		<cfinclude template="_siteMenu.cfm">
	</cfoutput>
</cfsavecontent>

<cfset _tab3Content = Replace(Replace(_tab3Content, Chr(10), "", "all"), Chr(13), "", "all")>

<cfset mode = "web20">
<cfsavecontent variable="_tab4Content">
	<cfoutput>
		<cfinclude template="_siteMenu.cfm">
	</cfoutput>
</cfsavecontent>

<cfset _tab4Content = Replace(Replace(_tab4Content, Chr(10), "", "all"), Chr(13), "", "all")>

<cfset mode = "install">
<cfsavecontent variable="_tab5Content">
	<cfoutput>
		<cfinclude template="_siteMenu.cfm">
	</cfoutput>
</cfsavecontent>

<cfset _tab5Content = Replace(Replace(_tab5Content, Chr(10), "", "all"), Chr(13), "", "all")>

<cfset mode = "samples">
<cfsavecontent variable="_tab6Content">
	<cfoutput>
		<cfinclude template="_siteMenu.cfm">
	</cfoutput>
</cfsavecontent>

<cfset _tab6Content = Replace(Replace(_tab6Content, Chr(10), "", "all"), Chr(13), "", "all")>

<cfset mode = "downloads">
<cfsavecontent variable="_tab7Content">
	<cfoutput>
		<cfinclude template="_siteMenu.cfm">
	</cfoutput>
</cfsavecontent>

<cfset _tab7Content = Replace(Replace(_tab7Content, Chr(10), "", "all"), Chr(13), "", "all")>

<cfset mode = "licenses">
<cfsavecontent variable="_tab8Content">
	<cfoutput>
		<cfinclude template="_siteMenu.cfm">
	</cfoutput>
</cfsavecontent>

<cfset _tab8Content = Replace(Replace(_tab8Content, Chr(10), "", "all"), Chr(13), "", "all")>

<cfset mode = "support">
<cfsavecontent variable="_tab9Content">
	<cfoutput>
		<cfinclude template="_siteMenu.cfm">
	</cfoutput>
</cfsavecontent>

<cfset _tab9Content = Replace(Replace(_tab9Content, Chr(10), "", "all"), Chr(13), "", "all")>

<cffunction name="getUsersContent" access="private" returntype="string">
	<cfargument name="id" type="string" required="Yes">
	<cfscript>
		var err_ajaxCode = false;
		var err_ajaxCodeMsg = '';
		try {
			return CreateObject("component", "ezAjax.cfc.performPopulateContentFor")._userDefinedContent(id, Request.ezAJAX_webRoot, ListDeleteAt(CGI.CF_TEMPLATE_PATH, ListLen(CGI.CF_TEMPLATE_PATH, '\'), '\'), ' ');
		} catch (Any e) {
			err_ajaxCode = true;
		}
		return '*** ERROR ***';
	</cfscript>
</cffunction>

<cffunction name="ContactUsFormHTML" access="public" returntype="string">
	<cfargument name="bool_optInOnly" type="boolean" required="yes">
	<cfargument name="actionID" type="string" required="Yes">
	<cfargument name="toEmailAddrs" type="string" required="Yes">
	<cfargument name="divName" type="string" required="Yes">
	
	<cfset var html_ContactUsForm = "">
	<cfset var _button_dismiss_contactUs_panel = 'button_dismiss_contactUs_panel_' & CreateUUID()>
	<cfset var _dismissAction = "var oObj = _$('#divName#'); if (!!oObj) { oObj.style.display = const_none_style; }">
	<cfset var _input_emailAddress = 'input_emailAddress_' & CreateUUID()>
	<cfset var _button_submit_contactUs_panel = '_button_submit_contactUs_panel' & CreateUUID()>
	<cfset var _textarea_yourMessage = 'textarea_yourMessage_' & CreateUUID()>
	<cfset var bool_optInToggle = (FindNoCase("OptIn", divName) gt 0)>
	<cfset var optInPrompt = "In">

	<cfsavecontent variable="html_ContactUsForm">
		<cfoutput>
			<table width="350px" border="1" bgcolor="##FFFFA8" cellpadding="-1" cellspacing="-1">
			<tr bgcolor="silver">
			<td>
			<table width="100%" cellpadding="-1" cellspacing="-1">
			<tr>
			<td width="90%" align="center" valign="top">
			<cfif (bool_optInOnly)>
				<cfif (NOT bool_optInToggle)>
					<cfset optInPrompt = "Out">
				</cfif>
				<span class="normalBoldBluePrompt">Opt-#optInPrompt# for Monthly Newsletters</span>
			<cfelse>
				<span class="normalBoldBluePrompt">Contact Us at #toEmailAddrs#</span>
			</cfif>
			</td>
			<td width="*" align="center" valign="top">
			<input type="Button" id="#_button_dismiss_contactUs_panel#" class="buttonClass" value="[X]" onclick="#_dismissAction# return false;">
			</td>
			</tr>
			</table>
			</td>
			</tr>
			<tr>
			<td>
			<table width="100%" cellpadding="-1" cellspacing="-1">
			<tr>
			<td width="20%" align="left" valign="top">
			<span class="normalBoldBluePrompt">Your Email Address:</span>
			</td>
			<td width="*" align="left" valign="top">
			<cfif (bool_optInOnly)>
				<input id="#_input_emailAddress#" value="yourEmail@yourDomain.com" size="50" maxlength="255" onfocus="this.value = '';" onblur="var oBtn = _$('#_button_submit_contactUs_panel#'); if (!!oBtn) { ezSetFocus(oBtn); }; return false;" onkeyup="if (!!validateConactUsUserEmailAddrs) { validateConactUsUserEmailAddrs(this, '#_button_submit_contactUs_panel#'); }; simulateEnterKeyForContactUsActions(event, '#_button_submit_contactUs_panel#');">
			<cfelse>
				<input id="#_input_emailAddress#" value="yourEmail@yourDomain.com" size="50" maxlength="255" onfocus="this.value = '';" onblur="var oInput = _$('_textarea_yourMessage'); if (!!oInput) { ezSetFocus(oInput); }; return false;" onkeyup="if (!!validateConactUsUserEmailAddrs) { validateConactUsUserEmailAddrs(this, '#_button_submit_contactUs_panel#'); };">
			</cfif>
			</td>
			</tr>
			<tr>
			<td>
			<span class="normalBoldBluePrompt" style="display: <cfif (NOT bool_optInOnly)>inline<cfelse>none</cfif>">Your Message:</span>
			</td>
			<td>
			<textarea id="#_textarea_yourMessage#" cols="50" rows="3" style="display: <cfif (NOT bool_optInOnly)>inline<cfelse>none</cfif>"></textarea>
			</td>
			</tr>
			<tr>
			<td colspan="2">
			<span class="normalBoldBluePrompt" style="display: <cfif (NOT bool_optInOnly)>inline<cfelse>none</cfif>">Kindly allow 24-48 hours for a response.</span>
			</td>
			</tr>
			<tr>
			<td colspan="2">
			<input type="Button" id="#_button_submit_contactUs_panel#" disabled class="buttonClass" value="[Submit]" onclick="#_dismissAction# performContactUsAJAXAction('#actionID#', _$('#_input_emailAddress#'), _$('#_textarea_yourMessage#'), '#toEmailAddrs#'); return false;">
			</td>
			</tr>
			</table>
			</td>
			</tr>
			</table>
		</cfoutput>
	</cfsavecontent>

	<cfreturn html_ContactUsForm>
</cffunction>

<cfoutput>
	<cfscript>
		bool_useAbsoluteServerBusyPositioning = false; // version 0.93 is now able to handle non-absolute positioning for the activity indicator...
	</cfscript>

	<cfsavecontent variable="jsCodeStore0">
		<cfoutput>
		var js_URL_mode = '#URL.mode#';
		var js_URL_entry = '#URL.entry#';
		
		var js_CF_TEMPLATE_PATH = '#JSStringFormat(ListDeleteAt(CGI.CF_TEMPLATE_PATH, ListLen(CGI.CF_TEMPLATE_PATH, '\'), '\'))#';
		
		var bool_isServerProduction = (('#bool_isServerProduction#' == 'true') ? true : false);
		
		var bool_useAbsoluteServerBusyPositioning = (('#bool_useAbsoluteServerBusyPositioning#'.toUpperCase() == 'TRUE') ? true : false);

		var logoImage_fixedWidth = 600;
		var webLayout_fixedWidth = 800;

		oAJAXEngine = ezAJAXEngine.init('#Request.ezAJAX_functions_cfm#', bool_isServerProduction);

		oAJAXEngine.isServerBusy_divName_populated = false;
		if (bool_useAbsoluteServerBusyPositioning) {
			oAJAXEngine.ezAJAX_serverBusyCallback = function (cObj) { 
				var oPos = ezAnchorPosition.get$('anchor_imageLogoRight'); 
				if (!!oPos) { 
					resizeOuterContentWrapper(ezClientWidth()); 
					cObj.style.top = (oPos.y + parseInt(this.ezAJAX_serverBusy_height.toString())) + 'px'; 
					cObj.style.left = (oPos.x - (parseInt(this.ezAJAX_serverBusy_width.toString()) / 4)) + 'px'; 
					cObj.style.zIndex = 1; 
					ezAnchorPosition.remove$(oPos.id); 
				} 
			};
		} else {
			oAJAXEngine.ezAJAX_serverBusy_divName = 'div_ezajax_activity';
			oAJAXEngine.ezAJAX_serverBusyCallback = function (cObj, resp) { 
				var oO = _$('iframe_showAJAXBegins_' + oAJAXEngine.ajaxID); 
				if ( (!!oO) && (!this.isServerBusy_divName_populated) ) { 
					try { oO.contentWindow.document.writeln(resp); } catch (e) { };
					this.isServerBusy_divName_populated = true; 
				}; 
				if (oO.style.display == const_none_style) { 
					oO.style.display = const_inline_style; 
					var oPos = ezAnchorPosition.get$('anchor_imageLogoRight'); 
					if (!!oPos) { 
						oO.style.position = const_absolute_style;
						oO.style.top = (oPos.y + parseInt(this.ezAJAX_serverBusy_height.toString())) + 'px'; 
						oO.style.left = (oPos.x - (parseInt(this.ezAJAX_serverBusy_width.toString()) / 4)) + 'px'; 
						oO.style.width = parseInt(this.ezAJAX_serverBusy_width.toString()) + 'px'; 
						oO.style.height = parseInt(this.ezAJAX_serverBusy_height.toString()) + 'px'; 
						ezAnchorPosition.remove$(oPos.id); 
					}
					oO.style.zIndex = 1; 
					cObj.style.zIndex = 32767; 
				}; 
				resizeOuterContentWrapper(ezClientWidth()); 
			};
		}
		oAJAXEngine.timeout = 120;
		oAJAXEngine.ezAJAX_serverBusy_bgColor = 'white';
		oAJAXEngine.hideFrameCallback = function () { };
		oAJAXEngine.showFrameCallback = function () { };
		
		function adjustFloatingMenuStyles() {
			var dObj = _$(const_div_floating_debug_menu);
			if (!!dObj) {
				dObj.style.backgroundColor = 'cyan';
				dObj.style.width = '500px';
			}
		}
		
		function replaceFloatingDebugMenu() {
			var dObj = _$(const_div_floating_debug_menu_content);
			if (!!dObj) {
			}
		}
		
		function showFloatingMenu() {
			var dObj = _$(const_div_floating_debug_menu);
			if (!!dObj) {
				dObj.style.display = 'inline';
			}
		}
		
		oAJAXEngine.createAJAXEngineCallback = function () { adjustFloatingMenuStyles(); this.top = '400px'; };
		
		oAJAXEngine.showAJAXBeginsHrefCallback = function (hRef) { return oAJAXEngine._url; };
		
		oAJAXEngine.showAJAXDebugMenuCallback = function () { return true; };
		
		oAJAXEngine.showAJAXScopesMenuCallback = function () { return true; };
		
		oAJAXEngine.showAJAXBrowserDebugCallback = function () { return true; };
			
		oAJAXEngine.create();

		oAJAXEngine.isXmlHttpPreferred = ((bool_isServerProduction) ? true : false);
//		oAJAXEngine.isXmlHttpPreferred = true;

		podLayoutContainerStylesCallBack = -1;
		
		function ezWindowOnLoadCallback() {
			initAJAXEngine(oAJAXEngine);
			resizeOuterContentWrapper();
//			tabSystem_onloadWindow();
		}

		function showAlertMessageCallback() {
			var oDiv = _$('iframe_ezAJAX_LogoPod');
			if (!!oDiv) {
			}
		}
		
		function dismissAlertMessageCallback() {
			var oDiv = _$('iframe_ezAJAX_LogoPod');
			if (!!oDiv) {
			}
		}
		
		function ezWindowOnUnloadCallback() {
		}
		
		function resizeLogoBannerImage(_width) {
			return;
			var oImage = _$('image_logoBanner');
			if (!!oImage) {
				if (_width < logoImage_fixedWidth) {
					oImage.width = _width;
				} else {
					oImage.width = logoImage_fixedWidth;
				}
			}
		}
		
		var bool_isResizeOuterContentWrapper = false;
		
		function resizeOuterContentWrapper(_width) {
			var oObj = _$('table_outerContentWrapper');
			var dObj = _$(const_div_floating_debug_menu);
			if ( (!!oObj) && (!!dObj) && (!bool_isServerProduction) ) {
				var y = parseInt(dObj.style.height) + 30;
				var bObj = _$('basessm');
				if ( (!!bObj) && (!bool_isResizeOuterContentWrapper) ) {
					bObj.style.top = (parseInt(bObj.style.top) + y) + 'px';
					bool_isResizeOuterContentWrapper = true;
				}
				oObj.style.top = y.toString() + 'px';
			}
		}
				
		function ezWindowOnReSizeCallback(_width, _height) {
			resizeOuterContentWrapper(_width);
			resizeLogoBannerImage(_width);
			return webLayout_fixedWidth;
		}
	
		function ezWindowOnscrollCallback(top, left) {
			var dObj = _$(const_div_floating_debug_menu);
			if (!!dObj) {
				dObj.style.display = ((bool_isServerProduction) ? const_none_style : const_inline_style);
				dObj.style.position = const_absolute_style;
				dObj.style.top = document.body.scrollTop + 'px';
				dObj.style.left = 0 + 'px';
			}
			return false;
		}
		
		function handleOnMouseOverLinkSpan(spanID, clsName) {
			var oSpan = _$(spanID);
			clsName = ((clsName != null) ? clsName : 'hackerSafeHoverClass');
			if (!!oSpan) {
				oSpan.className = clsName;
			}
		}

		function handleOnMouseOutLinkSpan(spanID) {
			var oSpan = _$(spanID);
			if (!!oSpan) {
				oSpan.className = '';
			}
		}
		</cfoutput>
	</cfsavecontent>
	
	<cfscript>
		cf_currentBlogName = 'default';
		if (IsDefined("Session.persistData.blogname")) {
			cf_currentBlogName = Session.persistData.blogname;
		}

		_urlCommunityEditionLicenseAgreement = _urlParentPrefix & '/ezAJAX(tm) Community Edition License Agreement.htm';
		_urlEnterpriseEditionLicenseAgreement = _urlParentPrefix & '/ezAJAX(tm) Enterprise Edition License Agreement.htm';
		_urlCommunityEditionProgrammersGuide = _urlParentPrefix & "/downloads_433611211010024813/ezAJAX_tm_ Community Edition Programmers Guide v0.93.pdf";

		_waferAnalysisServer = 'laptop.halsmalltalker.com';
		if (bool_isServerProduction) {
			_waferAnalysisServer = 'rabid.contentopia.net';
		}
		_urlWaferAnalysis = Request.commonCode.ezClusterizeURL('http://#_waferAnalysisServer#/blog/samples/semiconductors/wafer-analysis/index.cfm') & '?sessID=#Session.sessID#';
		cf_CodeDemoWaferAnalysis = "window.open('#_urlWaferAnalysis#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";
	//	cf_CodeDemoWaferAnalysis = "popUpWindowForURL('#_urlWaferAnalysis#', 'samples1', (ezClientWidth() - 50), 550, ((ezAJAXEngine.$[0].browser_is_ie) ? false : true), true);";

		_urlDojoMailSample031 = 'http://#CGI.SERVER_NAME#/dojo-0.3.1-ajax/demos/widget/mail.html';
		cf_urlDojoMailSample031 = "window.open('#_urlDojoMailSample031#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";
	//	cf_urlDojoMailSample031 = "popUpWindowForURL('#_urlDojoMailSample031#', 'samples031', (ezClientWidth() - 50), 550, ((ezAJAXEngine.$[0].browser_is_ie) ? false : true), true);";

		_urlDojoMailSample041 = 'http://#CGI.SERVER_NAME#/dojo-0.4.1-ajax/demos/widget/mail.html';
		cf_urlDojoMailSample041 = "window.open('#_urlDojoMailSample041#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";
	//	cf_urlDojoMailSample041 = "popUpWindowForURL('#_urlDojoMailSample041#', 'samples041', (ezClientWidth() - 50), 550, ((ezAJAXEngine.$[0].browser_is_ie) ? false : true), true);";
	</cfscript>

	<cfsavecontent variable="jsCodeStore1">
		<cfoutput>
		var js_trademarkSymbol = '#cf_trademarkSymbol#';
		
		var _db = '';
		if ( (browser_is_ie != null) && (browser_is_ff != null) && (browser_is_ns != null) && (browser_is_op != null) ) {
		} else {
			if (window.location.href.toUpperCase().indexOf('.CONTENTOPIA.NET') > -1) {
				_db = '';
			}
			alert("ERROR: Unable to determine your browser type - some content may not work as expected. Kindly use IE 6.x, FireFox 1.5.0.6, Netscape 8.1 or Opera 9.x - IE 6.x works best just because IE 6.x is a far more powerful browser than the rest." + '\n' + _db);
		}
		
		var js_buttonClass = '#cf_buttonClass#';
		
		var oGuiActions = ezGUIActsObj.get$();
		
		var js_urlCommunityEditionLicenseAgreement = '#_urlCommunityEditionLicenseAgreement#';
		var js_urlEnterpriseEditionLicenseAgreement = '#_urlEnterpriseEditionLicenseAgreement#';
		var js_urlCommunityEditionProgrammersGuide = "#_urlCommunityEditionProgrammersGuide#";
		
		function popUpWindowForCommunityEditionLicenseAgreement() {
			popUpWindowForURL(js_urlCommunityEditionLicenseAgreement, 'CommunityEditionLicenseAgreement', 800, 550, true);
		}
		
		function popUpWindowForEnterpriseEditionLicenseAgreement() {
			popUpWindowForURL(js_urlEnterpriseEditionLicenseAgreement, 'EnterpriseEditionLicenseAgreement', 800, 550, true);
		}
		
		function popUpWindowForCodeDemoWaferAnalysis() {
			#cf_CodeDemoWaferAnalysis#;
		}
		
		function popUpWindowForDojoMailSample(aVersion) {
			aVersion = (((typeof aVersion) == const_string_symbol) ? aVersion : '031');
			switch (aVersion) {
				case '031':
					#cf_urlDojoMailSample031#;
				break;

				case '041':
					#cf_urlDojoMailSample041#;
				break;
				
				default:
					ezAlertHTMLError('<span class="errorStatusBoldClass">ERROR: Invalid Dojo Version "' + aVersion + '" specified.</span>');
				break;
			}
		}
		
		function clickWindowForDojoMailSample(aVersion) {
			aVersion = (((typeof aVersion) == const_string_symbol) ? aVersion : '031');
			var rbName = 'radio_DojoMailSample' + aVersion;
			var oRb = _$(rbName);
			if (!!oRb) {
				if (typeof oRb.onclick == const_function_symbol) {
					oRb.check = true;
					oRb.onclick();
				}
			}
		}
		
		function prepareWindowForDojoMailSample() {
			var oDiv = _$('div_DojoMailSample');
			var oSpan = _$('span_DojoMailSample_anchor');
			var oAnchor = _$('anchor_DojoMailSample');
			if ( (!!oDiv) && (!!oSpan) && (!!oAnchor) ) {
				oDiv.style.display = const_inline_style;
				oSpan.innerHTML = oAnchor.innerHTML;
			}
		}
		
		function popUpWindowForHackerSafe() {
			popUpWindowForURL(window.location.protocol + '//' + window.location.hostname + '/app/hackerSafe.html', 'hackerSafe', 700, 550, false, true);
		}
		
		function popUpWindowForPayPal() {
			popUpWindowForURL('https://www.paypal.com/us/verified/pal=sales%40ez%2dajax%2ecom', 'paypalVerification', 700, 550, false, true);
		}
		
		function validateManageLicensesUserEmailAddrs() {
			_validateUserAccountName(_$('manageLicenses_emailAddress'),_$('btn_manageLicenses_Submit'));
		}

		function validateManageLicensesEditEmailAddrs() {
			_validateUserAccountName(_$('input_manageLicense_editorEmailAddress'),_$('btn_manageLicense_editorSubmit'));
		}
		
		function popUpContactUsDialog(showPopUp, hidePopUps) {
			showPopUp = (((typeof showPopUp) == const_object_symbol) ? showPopUp[0] : showPopUp);
			var oObj = _$(showPopUp);
			if (!!oObj) { 
				oObj.style.display = const_inline_style; 
			};
			if ((typeof hidePopUps) != const_object_symbol) {
				var ar = [];
				ar.push(hidePopUps);
				hidePopUps = ar;
			}
			var i = -1;
			for (i = 0; i < hidePopUps.length; i++) {
				oObj = _$(hidePopUps[i]);
				if (!!oObj) {
					oObj.style.display = const_none_style;
				};
			}
		}
		
		function filterServerName(val) {
			var i = -1;
			var illegal_symbols = ['HTTP:', '/', ':'];
			for (i = 0; i < illegal_symbols.length; i++) {
				if (val.toUpperCase().indexOf(illegal_symbols[i]) > -1) {
					val = val.ezClipCaselessReplace(illegal_symbols[i], '');
				}
			}
			return val;
		}
		
		function simulateEnterKeyForManageLicensesActions(evt) { 
			var oBtn = _$('btn_manageLicenses_Submit'); 
			if (!!oBtn) { 
				try { 
					if ( (evt != null) && ((typeof evt) == const_object_symbol) && (evt.keyCode == 13) ) { 
						if (typeof oBtn.onclick == const_function_symbol) oBtn.onclick(); 
					} 
				} catch(e) { 
					if (typeof oBtn.onclick == const_function_symbol) oBtn.onclick(); 
				}; 
			} else { 
				alert('ERROR: Programming Error - Unable to fetch the submit button object in "simulateEnterKeyForManageLicensesActions()".'); 
			}; 
		}

		function simulateEnterKeyForEditLicensesActions(evt) {
			var oBtn = _$('btn_manageLicense_editorSubmit'); 
			if (!!oBtn) { 
				try {
					if ( (evt != null) && ((typeof evt) == const_object_symbol) && (evt.keyCode == 13) ) { 
						if (typeof oBtn.onclick == const_function_symbol) oBtn.onclick(); 
					} 
				} catch(e) {
					if (typeof oBtn.onclick == const_function_symbol) oBtn.onclick(); 
				} finally {
				}
			} else { 
				alert('ERROR: Programming Error - Unable to fetch the submit button object in "simulateEnterKeyForEditLicensesActions()".'); 
			};
		}
// +++
		function beginEditorLicenseManager(id, sid, userName) {
			var oDiv = _$('div_manageLicense_editorRuntimeLicense');
			var oInput = _$('input_manageLicense_editorEmailAddress');
			var oBtn = _$('btn_manageLicense_editorSubmit');
			if ( (!!oDiv) && (!!oInput) && (!!oBtn) ) {
				oDiv.style.display = const_inline_style;
				var ar = oBtn.name.split('_');
				var sNum = -1;
				if (ar.length > 3) {
					sNum = ar[ar.length - 2].ezFilterInNumeric();
					if (sNum.length > 0) {
						ar[ar.length - 2] = id;
					}
					sNum = ar[ar.length - 1].ezFilterInNumeric();
					if (sNum.length > 0) {
						ar[ar.length - 1] = sid;
					}
				} else {
					ar.push(id);
					ar.push(sid);
				}
				oBtn.name = ar.join('_');
				oBtn.disabled = true;
				oInput.value = userName;
				ezSetFocus(oInput);
				validateManageLicensesEditEmailAddrs();
			}
		}
		
		function handleResendRuntimeLicense(qObj, nRecs, qStats, argsDict, qData1) {
			var oDiv = _$('div_manageLicense_statusRuntimeLicense');
			var _STATUSMSG = '';

			function searchForStatusRecs(_ri, _dict, _rowCntName) {
				_STATUSMSG = _dict.getValueFor('STATUSMSG');
				_STATUSMSG = ((_STATUSMSG == null) ? '' : _STATUSMSG);
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						qData1.iterateRecObjs(searchForStatusRecs);

						if (_STATUSMSG.length > 0) {
							if (!!oDiv) {
								oDiv.style.display = const_inline_style;
								oDiv.innerHTML = '<span class="onholdStatusBoldClass"><br><center>' + _STATUSMSG + '</center></span>';
								var oBtn = _$('btn_manageLicense_resendRuntimeLicense');
								if (!!oBtn) {
									oBtn.disabled = false;
								}
							}
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
		
		function popUpWindowForURL(aURL, winName, xMax, yMax, isResizable, isStatus) {
			xMax = ((xMax != null) ? xMax : (ezClientWidth() - 450));
			yMax = ((yMax != null) ? yMax : (ezClientHeight() - 100));
			isResizable = ((isResizable == true) ? isResizable : false);
			isStatus = ((isStatus == true) ? isStatus : false);
			winName = winName.split(' ').join('');
			ezDispayHTMLSysMessages('<iframe frameborder="0" scrolling="Auto" src="' + aURL + '" width="' + xMax + '" height="' + yMax + '"></iframe>', 'Powered by ezAJAX Enterprise Edition');
		}

		function populateContentFor(aName, divName) {
			aName = ((typeof aName) == const_string_symbol ? aName : '');
			divName = ((typeof divName) == const_string_symbol ? divName : '');
			oAJAXEngine.doAJAX('performPopulateContentFor', 'handlePopulateContentFor', 'aName', aName, 'divName', divName);
		}
		
		function populateContentForUsing(aName, divName, _fqServerName, _sCommunityEditionDownloadHref) {
			aName = ((typeof aName) == const_string_symbol ? aName : ' ');
			divName = ((typeof divName) == const_string_symbol ? divName : ' ');
			_fqServerName = ((typeof _fqServerName) == const_string_symbol ? _fqServerName : ' ');
			_sCommunityEditionDownloadHref = ((typeof _sCommunityEditionDownloadHref) == const_string_symbol ? _sCommunityEditionDownloadHref : ' ');
			oAJAXEngine.doAJAX('performPopulateContentFor', 'handlePopulateContentFor', 'aName', aName, 'divName', divName, '_fqServerName', _fqServerName, 'sCommunityEditionDownloadHref', _sCommunityEditionDownloadHref);
		}
		
		function populateContentForDownloadsDocs(aName, divName, _fqServerName, _js_CF_TEMPLATE_PATH) {
			aName = ((typeof aName) == const_string_symbol ? aName : ' ');
			divName = ((typeof divName) == const_string_symbol ? divName : ' ');
			_fqServerName = ((typeof _fqServerName) == const_string_symbol ? _fqServerName : ' ');
			_js_CF_TEMPLATE_PATH = ((typeof _js_CF_TEMPLATE_PATH) == const_string_symbol ? _js_CF_TEMPLATE_PATH : ' ');
			oAJAXEngine.doAJAX('performPopulateContentFor', 'handlePopulateContentFor', 'aName', aName, 'divName', divName, '_fqServerName', _fqServerName, 'js_CF_TEMPLATE_PATH', _js_CF_TEMPLATE_PATH);
		}
		
		function setClassForElement(ele, sClass) {
			var oO = _$(ele);
			if (!!oO) {
				oO.className = ((sClass != null) ? sClass : 'installProcessUnSelectedClass');
			}
		}

		function populateSiteContent(cID) {
			_handlePopulateContentFor('', 'p_installationProcessStepDesc');
			return populateContentFor(cID, 'p_installationProcessStepDesc');
		}
		
		function downloadsText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentForUsing('Downloads', 'div_PrimaryContentContainer', ezFullyQualifiedAppUrl(), ' ');
		}
		
		function demosTutorialsText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentForUsing('Demos and Tutorials', 'div_PrimaryContentContainer', ezFullyQualifiedAppUrl(), ' ');
		}
		
		function sampleAppsText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentForUsing('Sample Apps', 'div_PrimaryContentContainer', ezFullyQualifiedAppUrl(), ' ');
		}
		
		function sampleWeb20APIText(pageId) {
			pageId = ((pageId == null) ? 1 : parseInt(pageId.toString()));
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Web20API_' + ((pageId == 0) ? 'all' : pageId), 'div_PrimaryContentContainer');
		}
		
		function AJAXHelpDocsText(pageId) {
			pageId = ((pageId == null) ? 1 : parseInt(pageId.toString()));
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('AJAXHelpDocs_' + ((pageId == 0) ? 'all' : pageId), 'div_PrimaryContentContainer');
		}
		
		function AJAXEnhancedText(pageId) {
			pageId = ((pageId == null) ? 1 : parseInt(pageId.toString()));
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('AJAXEnhanced_' + ((pageId == 0) ? 'all' : pageId), 'div_PrimaryContentContainer');
		}
		
		function supportForumText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Support Forum', 'div_PrimaryContentContainer');
		}
		
		function contactUsText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Contact Us', 'div_PrimaryContentContainer');
		}
		
		function downloadsDocsText() {
			try { _handlePopulateContentFor('', 'div_PrimaryContentContainer'); } catch(e) { ezAlertError('downloadsDocsText() ::\n' + ezErrorExplainer(e)); };
			return populateContentForDownloadsDocs('Download Docs', 'div_PrimaryContentContainer', ezFullyQualifiedAppUrl(), js_CF_TEMPLATE_PATH);
		}

		function runtimeLicensesText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Runtime Licenses', 'div_PrimaryContentContainer');
		}
		
		function installationText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Installation', 'div_PrimaryContentContainer');
		}
		
		function featuresText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Features', 'div_PrimaryContentContainer');
		}
		
		function whatsIsText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Whats Is', 'div_PrimaryContentContainer');
		}

		function jsonSupportText(pageId) {
			pageId = ((pageId == null) ? 1 : parseInt(pageId.toString()));
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('JSONSupportText_' + ((pageId == 0) ? 'all' : pageId), 'div_PrimaryContentContainer');
		}

		function whatsNewText(pageId) {
			pageId = ((pageId == null) ? 1 : parseInt(pageId.toString()));
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('WhatsNew_' + ((pageId == 0) ? 'all' : pageId), 'div_PrimaryContentContainer');
		}
		
		function underLogoText() {
			_handlePopulateContentFor('', 'div_underLogoContentContainer');
			return populateContentFor('Under Logo', 'div_underLogoContentContainer');
		}
		
		function yahooSearchV2Text() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Yahoo Search V2', 'div_PrimaryContentContainer');
		}
		
		function web20Text() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Web 2.0 Sample', 'div_PrimaryContentContainer');
		}
		
		var _beginUpgradeRuntimeLicense_id = -1;
		var _beginUpgradeRuntimeLicense_sid = -1;
		
		function beginUpgradeRuntimeLicense(id, sid, iTerm) {
			var _html = '';
			var oDiv = _$('div_manageLicense_upgradeRuntimeLicense');
			if (!!oDiv) {
				_html += '<table width="100%" cellpadding="1" cellspacing="1">';
				
				_beginUpgradeRuntimeLicense_id = id;
				_beginUpgradeRuntimeLicense_sid = sid;

				switch (iTerm) {
					case 12:
						popUpWindowForURL(window.location.protocol + '//' + window.location.hostname + '/app/upgradeLicense12.html', 'upgradeLicense12', (ezClientWidth() - 50), 550, ((ezAJAXEngine.$[0].browser_is_ie) ? false : true), true);
					break;
					
					default:
						popUpWindowForURL(window.location.protocol + '//' + window.location.hostname + '/app/upgradeLicense.html', 'upgradeLicense', (ezClientWidth() - 50), 550, ((ezAJAXEngine.$[0].browser_is_ie) ? false : true), true);
					break;
				}

				_html += '</table>';

				oDiv.innerHTML = _html;
				oDiv.style.display = const_inline_style;
			}
		}

		function handleRetrieveSourceCodeFromURL(qObj, nRecs, qStats, argsDict, qData1) {
			var _STATUSMSG = '';

			function searchForStatusRecs(_ri, _dict, _rowCntName) {
				_STATUSMSG = _dict.getValueFor('STATUSMSG');
				_STATUSMSG = ((_STATUSMSG == null) ? '' : _STATUSMSG);
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						qData1.iterateRecObjs(searchForStatusRecs);
						
						ezAlertCODE(_STATUSMSG.ezURLDecode())
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
		
		function _handlePopulateContentFor(_divName, someHTML, _aName) {
			someHTML = ((typeof someHTML) == const_string_symbol ? someHTML : '');
			_divName = ((typeof _divName) == const_string_symbol ? _divName : '');
			var oDiv = _$(_divName);
			if (!!oDiv) {
				oDiv.style.border = (( (someHTML.length > 0) && (_divName.toLowerCase().indexOf('logo') == -1) ) ? 'thin solid black' : '');
				oDiv.style.margin = '5px 5px 5px 5px';
				oDiv.innerHTML = someHTML;
			}
			if (_divName.toLowerCase() == 'p_installationProcessStepDesc'.toLowerCase()) {
				var ar = _aName.split('_');
				var i = -1;
				var j = parseInt(ar[ar.length - 1]);
				for (i = 1; i <= 3; i++) {
					if (i > j) {
						setClassForElement('td_container_InstallProcess.' + i, 'installProcessUnSelectedClass');
					} else {
						setClassForElement('td_container_InstallProcess.' + i, 'installProcessSelectedClass');
					}
				}
			}
		}

		function handlePopulateContentFor(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			var _html = '';
			
			function searchForContent(_ri, _dict) {
				var _CONTENT = _dict.getValueFor('CONTENT');
				var _ID = _dict.getValueFor('ID');

				if ( (!!_CONTENT) && (!!_ID) ) {
					_html += _CONTENT;
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {

						qData1.iterateRecObjs(searchForContent);
						
						if (_html.length > 0) {
							html += _html;
						}

						var _divName = argsDict.getValueFor('divName');
						_divName = (((typeof _divName) == const_string_symbol) ? _divName : 'div_PrimaryContentContainer');

						var _aName = argsDict.getValueFor('aName');
						_aName = (((typeof _aName) == const_string_symbol) ? _aName : '');

						_handlePopulateContentFor(_divName, html, _aName);
						
						if (_aName == 'Yahoo Search V2') {
							var oInput = _$('input_YahooSearchV2_criteria');
							if (!!oInput) {
								try { oInput.focus(); } catch (e) { };
							}
						}
						
						if (_aName == 'Runtime Licenses') {
							var oInput = _$('manageLicenses_emailAddress');
							if (!!oInput) {
								try { oInput.focus(); } catch (e) { };
							}
						}

						if (bool_readyForUnderLogoContent) {
							bool_readyForUnderLogoContent = false;
		//					whatsNewText();
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

		var jsonObj = -1;
		
		function handleJSONCallBack(jData) {
		    if (jData == null) {
				alert('There was a problem parsing search results in "handleJSONCallBack".\n' + 'jData = [' + jData + ']');
				return;
		    } 
		
			var oDiv = _$('div_content_YahooSearchV2_Results');
			if (!!oDiv) {
				var _db = '<table width="100%"><tr><td bgcolor="silver"><span class="normalPrompt">There are ' + jData.ResultSet.Result.length + ' results.</span></td></tr>';
				for (var i = 0; i < jData.ResultSet.Result.length; i++) {
					var _title = jData.ResultSet.Result[i].Title;
					var _address = jData.ResultSet.Result[i].Address;
					var _city = jData.ResultSet.Result[i].City;
					var _state = jData.ResultSet.Result[i].State;
					var _phone = jData.ResultSet.Result[i].Phone;
					var _latitude = jData.ResultSet.Result[i].Latitude;
					var _longitude = jData.ResultSet.Result[i].Longitude;
					var _rating_AverageRating = jData.ResultSet.Result[i].Rating.AverageRating;
					var _rating_TotalRatings = jData.ResultSet.Result[i].Rating.TotalRatings;
					var _rating_TotalReviews = jData.ResultSet.Result[i].Rating.TotalReviews;
					var _distance = jData.ResultSet.Result[i].Distance;
					var _businessUrl = jData.ResultSet.Result[i].BusinessUrl;
					var _businessClickUrl = jData.ResultSet.Result[i].BusinessClickUrl;

					_db += '<tr><td align="center"><span class="normalPrompt">';
					_db += '<b>' + _title + '</b>';
					_db += '</span></td></tr>';
		
					_db += '<tr><td align="left"><span class="normalPrompt">';
					_db += _address + ', ' + _city + ', ' + _state + ', ' + _phone;
					_db += '</span></td></tr>';

					_db += '<tr><td>';
					_db += '<table><tr><td><span class="normalPrompt">';
					_db += 'Lat: ' + _latitude;
					_db += '</span></td>';
					_db += '<td><span class="normalPrompt">';
					_db += 'Long: ' + _longitude;
					_db += '</span></td></tr></table>';
					_db += '</td></tr>';

					_db += '<tr><td>';
					_db += '<table><tr><td><span class="normalPrompt">';
					_db += 'AverageRating: ' + _rating_AverageRating;
					_db += '</span></td>';
					_db += '<td><span class="normalPrompt">';
					_db += 'TotalRatings: ' + _rating_TotalRatings;
					_db += '</span></td>';
					_db += '<td><span class="normalPrompt">';
					_db += 'TotalReviews: ' + _rating_TotalReviews;
					_db += '</span></td>';
					_db += '<td><span class="normalPrompt">';
					_db += 'Distance: ' + _distance;
					_db += '</span></td>';
					_db += '</tr></table>';
					_db += '</td></tr>';

					_db += '<tr><td>';
					_db += '<table><tr><td><span class="normalPrompt">';
					_db += 'Site: <a href="' + _businessUrl + '" target="_blank">' + _businessUrl + '</a>';
					_db += '</span></td>';
					_db += '<td><span class="normalPrompt">';
					_db += 'Click: <a href="' + _businessClickUrl + '" target="_blank">' + _businessClickUrl + '</a>';
					_db += '</span></td></tr></table>';
					_db += '</td></tr>';
				}
				_db += '</table>';
	
				oDiv.innerHTML = _db;
				oDiv.style.overflow = 'auto';
				oDiv.style.maxHeight = '50px';
			}
			ezJSON.removeScriptTag();
			ezJSON.remove$(jsonObj.id);
		}

		function performYahooSearchV2Action(_id) {
			var oInput = _$(_id);
			if (!!oInput) {
				jsonObj = ezJSON.get$('http://local.yahooapis.com/LocalSearchService/V2/localSearch?appid=YahooDemo&query=' + oInput.value.ezURLEncode() + '&zip=94306&results=2&output=json&callback=handleJSONCallBack');
			}
		}
		
		function handleServerErrorCallback(jsonData) {
			ezAlertError(ezObjectExplainer(jsonData));
		}

		function handleJSONSampleAPICallback(jsonData) {
			var i = -1;
			var j = -1;
			var cols = jsonData.columnlist.split(',');
			var n = jsonData.recordcount;
			var ele = -1;
			if (jsonData.columnlist.toUpperCase().indexOf('ERRORMSG') > -1) {
				ele = jsonData.data['ERRORMSG'];
				ezAlertHTMLError(ele[0]);
			} else {
				ezAlert(ezObjectExplainer(jsonData));
				ezAlert('jsonData.recordcount = [' + jsonData.recordcount + ']');
				ezAlert('cols = [' + cols + ']');
				ezAlert('============================================================\n');
				for (i = 0; i < n; i++) {
					for (j = 0; j < cols.length; j++) {
						ele = jsonData.data[cols[j]];
						ezAlert(cols[j] + '[' + i + '] = [' + ele[i] + ']');
					}
					ezAlert('============================================================\n');
				}
			}
		}
		
		function handle_registrationStats(jsonData) {
			var num = -1;
			var oDiv = _$('span_registrationStats');
			if (!!oDiv) {
				try {
					num = jsonData.data['CNT'][0];
				} catch (e) { };
				oDiv.className = 'titlex12GreenClass';
				oDiv.innerHTML = '<br><b>' + num + '</b> Registered Runtime Licenses and growing !';
				if (!!jsonObj) jsonObj.removeScriptTag();
			}
		}

		function getWaferAnalysisPrototypeURL() {
			var _waferAnalysisServer = ((window.location.hostname.toLowerCase().indexOf('.ez-ajax.com') == -1) ? 'laptop.halsmalltalker.com' : 'rabid.contentopia.net');
			var _urlWaferAnalysis = 'http://' + _waferAnalysisServer + '/blog/samples/semiconductors/wafer-analysis/index.cfm';
			var jsCodeDemoWaferAnalysis = "window.open('" + _urlWaferAnalysis + "','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";
			eval(jsCodeDemoWaferAnalysis);
		}

		function load_app(id){
			var funcs = [];
			funcs[1] = whatsNewText;
			funcs[2] = jsonSupportText;
			funcs[3] = whatsIsText;
			funcs[4] = installationText;
			funcs[5] = sampleAppsText;
			funcs[6] = downloadsText;
			funcs[7] = getWaferAnalysisPrototypeURL;
			funcs[8] = yahooSearchV2Text;
			funcs[9] = AJAXHelpDocsText;
			funcs[10] = featuresText;
			funcs[11] = downloadsText;
			funcs[12] = downloadsDocsText;
			funcs[13] = runtimeLicensesText;
			funcs[14] = contactUsText;
			funcs[15] = supportForumText;
			funcs[16] = web20Text;
			funcs[17] = demosTutorialsText;
			id = parseInt(id.toString());
			try { funcs[id](); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };
		}

		function getTabbedContent() {
			var iTab = -1;
			var iTabs = [];
			var iContent = -1;
	
			oTabSystem1 = ezTabsObj.get$(-1, -1, 500, 100);
			
	//		ezAlert('oTabSystem1 = [' + oTabSystem1 + ']');
			
	//		oTabSystem1.isHandleBrowserBackForwardBtns = true;
			oTabSystem1.onActivateTabsCallback = function(iTab) { iTab = parseInt(iTab.toString()); if (iTab > 1) {  }; }; // var cDivName = oTabSystem1.contentsCollection[iTab - 1]; var oDiv = _$(cDivName); if ( (!!oDiv) && (oDiv.innerHTML.length == 0) ) { ezAJAXEngine.$[0].doAJAX('performPopulateClickMenuTab', 'handlePerformPopulateClickMenuTab', 'iTab', iTab); } else { oTabSystem1._activateTab(iTab); };

			iTabs = oTabSystem1.addTab('Intro &amp; Offers');
			iTab1 = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(iTab1, '#URLEncodedFormat(introContent)#');
	
			iTabs = oTabSystem1.addTab('Product Info');
			iContent = oTabSystem1.addContentForTab(iTabs.pop(), '#URLEncodedFormat(_tab2Content)#');
	
			iTabs = oTabSystem1.addTab('JSON');
			iContent = oTabSystem1.addContentForTab(iTabs.pop(), '#URLEncodedFormat(_tab3Content)#');
	
			iTabs = oTabSystem1.addTab('Web 2.0');
			iContent = oTabSystem1.addContentForTab(iTabs.pop(), '#URLEncodedFormat(_tab4Content)#');

			iTabs = oTabSystem1.addTab('Installations');
			iContent = oTabSystem1.addContentForTab(iTabs.pop(), '#URLEncodedFormat(_tab5Content)#');
	
			iTabs = oTabSystem1.addTab('Sample Apps');
			iContent = oTabSystem1.addContentForTab(iTabs.pop(), '#URLEncodedFormat(_tab6Content)#');
	
			iTabs = oTabSystem1.addTab('Downloads &amp; Docs');
			iContent = oTabSystem1.addContentForTab(iTabs.pop(), '#URLEncodedFormat(_tab7Content)#');

			iTabs = oTabSystem1.addTab('Runtime Licenses');
			iContent = oTabSystem1.addContentForTab(iTabs.pop(), '#URLEncodedFormat(_tab8Content)#');

			iTabs = oTabSystem1.addTab('Support');
			iContent = oTabSystem1.addContentForTab(iTabs.pop(), '#URLEncodedFormat(_tab9Content)#');

			oTabSystem1.activateTab(iTab1);
		}

		function handlePerformPopulateClickMenuTab(qObj, nRecs, qStats, argsDict, qData1) {
			var nRecs = -1;
			var _argsDict = ezDictObj.get$();
			var _ID = '';
			var _CONTENT = '';
		
			function searchForArgRecs(_ri, _dict) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.ezTrim().toUpperCase().indexOf('ARG') != -1) {
					_argsDict.push(n.ezTrim(), v);
				}
			};
			
			function populateContent(aDict) {
				if ((typeof oTabSystem1) == const_object_symbol) {
					var cDivName = oTabSystem1.contentsCollection[_ID - 1];
					var oDiv = _$(cDivName);
					if (!!oDiv) {
						oDiv.innerHTML = _CONTENT;
					}
				} else {
					alert('Programming Error :: Cannot determine how to access the Tabbed Interface.');
				}
			};
			
			function searchForContent(_ri, _dict) {
				var sID = _dict.getValueFor('ID');
				var sCONTENT = _dict.getValueFor('CONTENT');

				if ( (!!sCONTENT) && (!!sID) ) {
					_CONTENT = sCONTENT;
					_ID = sID;
				}
			};
		
			if (argsDict != null) {
				argsDict.intoNamedArgs();
				qData1.iterateRecObjs(searchForContent);
				populateContent(argsDict);
				ezDictObj.remove$(argsDict.id);
			} else {
				var qStats = qObj.named('qDataNum');
				if (!!qStats) {
					nRecs = qStats.dataRec[1];
				}
				if (nRecs > 0) {
					var qData1 = qObj.named('qData1');
					if (!!qData1) {
						oParms = qObj.named('qParms');
						if (!!oParms) {
							oParms.iterateRecObjs(searchForArgRecs);
							qData1.iterateRecObjs(anyErrorRecords);
		
							if (!bool_isAnyErrorRecords) {
								qData1.iterateRecObjs(searchForContent);
								_argsDict.intoNamedArgs();
								populateContent(_argsDict);
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
				ezDictObj.remove$(_argsDict.id);
			}
		}
		</cfoutput>
	</cfsavecontent>
	
	<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(jsCodeStore0 & jsCodeStore1)#</script>
	
	<div id="table_outerContentWrapper" style="position: absolute; width: 900px; top: 0px; left: 0px;">
		<table width="900" align="center" border="0" cellpadding="1" cellspacing="1" style="background-color: white;">
			<tr>
				<td>
					<table width="100%" border="1" cellpadding="-1" cellspacing="-1">
						<tr>
							<td width="*" bgcolor="silver">
								<cfif 0>
									<div id="TabSystem1" class="content">
										<div class="tabs">
											<cfset _disp_tabNum = 1>
											<cfset _displayableNum = 1>
											<cfset _displaying_tabNum = 1>
											
											<cfset _class = "tab">
											<cfif (_displaying_tabNum eq 1)>
												<cfset _class = "tab tabActive">
											</cfif>
				
											<cfset _display = "inline">
											<cfif (_disp_tabNum gt _num_tabs_max)>
												<cfset _display = "none">
											</cfif>
				
											<cfset _href_data = -1>
											<cfset _title_data = "">
											<cfset _anchor_caption = "">
											
											<div id="cell_tab#_disp_tabNum#" style="display: #_display#;">
												<a href="###_href_data#" accesskey="#_disp_tabNum#" tabindex="#_disp_tabNum#" id="tab#_disp_tabNum#" title="#_title_data#" class="#_class#">
													&nbsp;<font size="1"><small>#_anchor_caption#&nbsp;(#_disp_tabNum#/#_displayableNum#)</small></font>
												</a>
											</div>
										</div>
				
										<div id="content#_disp_tabNum#" class="content" style="display: none;">
											+++
										</div>
								<cfelse>
									<div id="TabSystemContainer" class="TabSystem1"></div>
								</cfif>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="*" align="left" colspan="3">
					<table width="100%" border="0" cellpadding="-1" cellspacing="-1">
						<tr>
							<td width="100%" valign="top">
								<table width="100%" cellpadding="-1" cellspacing="-1" class="bannerWhiteTable">
									<tr>
										<td width="100%" align="left" valign="top">
												<table width="100%" border="0" cellpadding="-1" cellspacing="-1">
													<tr>
														<td width="870" valign="top">
															<cfif 0>
																<iframe id="iframe_siteMenuUsingDojo" width="870" frameborder="0" scrolling="No" src="app/siteMenu.cfm"></iframe>  <!---  style="position: absolute; top: 100px; left: 0px;" --->
															</cfif>
															<div id="div_ezajax_activity"></div>
														</td>
														<td width="30" valign="top">
															<a id="anchor_imageLogoRight" name="anchor_imageLogoRight">&nbsp;</a>
														</td>
													</tr>
												</table>
											<a id="anchor_bottomOfBlogTitle" name="anchor_bottomOfBlogTitle"></a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td valign="top">
								<table width="100%" cellpadding="-1" cellspacing="-1">
									<tr>
										<td width="20">&nbsp;</td>
										<td width="*">
											<div id="div_PrimaryContentContainer" style="width: 95%;"><cfif (Len(CGI.PATH_INFO) gt 0)>#getUsersContent(ListFirst(CGI.PATH_INFO, Left(CGI.PATH_INFO, 1)))#<cfelseif (Len(URL.contentID) gt 0)>[#URL.contentID#]/#getUsersContent(URL.contentID)#</cfif></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

	<form id="form_downloadFile" name="myForm" action="" method="get" target="_blank">
		<input type="Submit" name="btn_submit" value="[Download]" style="display: none;">
	</form>
	
	<div id="div_floatingContent" style="display: none;"></div>
	
	<script language="JavaScript1.2" type="text/javascript">
		var bool_readyForUnderLogoContent = true;
		
		getTabbedContent();
	</script>

	<cfif (Len(CGI.PATH_INFO) eq 0) AND (Len(URL.contentID) eq 0)>
		<script language="JavaScript1.2" type="text/javascript">
			underLogoText();
		</script>
	</cfif>
<cfif 0> <!--- <a id="anchor_TabSystemContainer" name="anchor_TabSystemContainer">&nbsp;</a> --->
	<script language="JavaScript1.2" type="text/javascript">
		var aAnchorImageLogoRight = ezAnchorPosition.get$('anchor_TabSystemContainer'); 
		if (!!aAnchorImageLogoRight) { 
			var oFishEye = ezFishEyeMenuObj.get$(aAnchorImageLogoRight.y, aAnchorImageLogoRight.x, 900, 100);
			oFishEye.addIcon('app/images/icons/32x32/large-icons.gif', whatsNewText, "What's New");
			oFishEye.addIcon('app/images/icons/32x32/network-2.gif', jsonSupportText, 'JSON Support');
			oFishEye.addIcon('app/images/icons/32x32/computer.gif', whatsIsText, 'Product Info');
			oFishEye.addIcon('app/images/icons/32x32/install-software.gif', installationText, 'Installation');
			oFishEye.addIcon('app/images/icons/32x32/test_MoxieThumb.gif', sampleAppsText, 'Sample Apps', 'Sample Apps (using the Dojo Toolkit, etc.)');
			oFishEye.addIcon('app/images/icons/32x32/run-software.gif', downloadsText, 'Demos &amp; Tutorials', 'Demos, Tutorials & Product Info');
			oFishEye.addIcon('app/images/icons/200x200/wafers.gif', getWaferAnalysisPrototypeURL, 'Semiconductor Wafer Analysis Prototype');
			oFishEye.addIcon('app/images/icons/yahoo-logo_200x200.gif', yahooSearchV2Text, 'Yahoo Search', 'Yahoo Search V2 API Sample using JSON');
			oFishEye.addIcon('app/images/icons/32x32/help.gif', sampleWeb20APIText, 'Sample Web 2.0', 'Sample Web 2.0 API using JSON');
			oFishEye.addIcon('app/images/icons/32x32/notes.gif', featuresText, 'Features');
			oFishEye.addIcon('dojo-0.3.1-ajax/demos/widget/images/icon_update.png', downloadsText, 'ezAJAX Downloads');
			oFishEye.addIcon('app/images/icons/32x32/documents.gif', downloadsDocsText, 'Docs & Guides');
			oFishEye.addIcon('app/images/icons/32x32/access-2.gif', runtimeLicensesText, 'Runtime Licenses');
			oFishEye.addIcon('dojo-0.3.1-ajax/demos/widget/images/icon_email.png', contactUsText, 'Contact Us');
			oFishEye.addIcon('dojo-0.3.1-ajax/demos/widget/images/icon_users.png', supportForumText, 'Support Forum');
			oFishEye.horizontal();
			ezAnchorPosition.remove$(aAnchorImageLogoRight.id); 
		} 
//		jsonObj = ezJSON.get$('#ezAJAX_webRoot#/app/web2.0/registrations/registrationStats.cfm?callback=handle_registrationStats');
	</script>
</cfif>
	
</cfoutput>

