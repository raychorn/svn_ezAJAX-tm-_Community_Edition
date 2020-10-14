<cfparam name="URL.mode" type="string" default="">
<cfparam name="URL.entry" type="string" default="">

<cfset cf_trademarkSymbol = '&##8482'>

<cfset cf_buttonClass = "buttonClass">
<cfif (Request.commonCode.ezIsBrowserFF() OR Request.commonCode.ezIsBrowserFF())>
	<cfset cf_buttonClass = cf_buttonClass & "FF">
</cfif>

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
	//	bool_useAbsoluteServerBusyPositioning = (Request.commonCode.ezIsBrowserIE());
		bool_useAbsoluteServerBusyPositioning = false; // version 0.93 is now able to handle non-absolute positioning for the activity indicator...

//		fName = ezFilePathFromUrlUsingCommonFolder(qryStruct.namedArgs.filename, CGI.CF_TEMPLATE_PATH, CGI.SERVER_NAME);
	</cfscript>

	<script language="JavaScript1.2" type="text/javascript">
	<!--
		var js_URL_mode = '#URL.mode#';
		var js_URL_entry = '#URL.entry#';
		
		var js_CF_TEMPLATE_PATH = '#JSStringFormat(ListDeleteAt(CGI.CF_TEMPLATE_PATH, ListLen(CGI.CF_TEMPLATE_PATH, '\'), '\'))#';
		
		var bool_isServerProduction = ((window.location.href.toUpperCase().indexOf('.ez-ajax.com'.toUpperCase()) > -1) ? true : false);
		
		var bool_useAbsoluteServerBusyPositioning = (('#bool_useAbsoluteServerBusyPositioning#'.toUpperCase() == 'TRUE') ? true : false);

		var logoImage_fixedWidth = 600;
		var webLayout_fixedWidth = 800;

		if (bool_useAbsoluteServerBusyPositioning) {
			oAJAXEngine.ezAJAX_serverBusyCallback = function (cObj) { var oPos = ezAnchorPosition.get$('anchor_imageLogoRight'); if (!!oPos) { resizeOuterContentWrapper(ezClientWidth()); cObj.style.top = (oPos.y + parseInt(this.ezAJAX_serverBusy_height.toString())) + 'px'; cObj.style.left = (oPos.x - (parseInt(this.ezAJAX_serverBusy_width.toString()) / 4)) + 'px'; cObj.style.zIndex = 1; ezAnchorPosition.remove$(oPos.id); } };
		} else {
			oAJAXEngine.ezAJAX_serverBusy_divName = 'div_ezajax_3d_logo';
			oAJAXEngine.ezAJAX_serverBusyCallback = function (cObj, resp) { var oO = _$('iframe_showAJAXBegins'); if (!!oO) { oO.contentWindow.document.writeln(resp); if (oO.style.display == const_none_style) { oO.style.display = const_inline_style; }; }; resizeOuterContentWrapper(ezClientWidth()); };
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
	//			dObj.innerHTML = '<b>New Menu Content</b>';
			}
		}
		
		function populateExtraMenuContainer() {
			var dObj = _$('div_extraContainer');
			if (!!dObj) {
				var btnText = '[Send Newsletters]';
				dObj.style.width = '200px';
				dObj.innerHTML = '&nbsp;|' + ((!bool_isServerProduction) ? '<button id="btn_sendNewsletters" class="buttonClass' + ((browser_is_ff) ? 'FF' : '') + '" style="width: ' + (btnText.length * (((browser_is_ff) || (browser_is_op)) ? 8 : 6)) + 'px;" onclick="oAJAXEngine.doAJAX(\'performEmailNewsletters\', \'handleEmailNewsletters\'); return false;">' + btnText + '</button>' : '');
			}
		}
		
		function showFloatingMenu() {
			var dObj = _$(const_div_floating_debug_menu);
			if (!!dObj) {
				dObj.style.display = 'inline';
			}
		}
		
		oAJAXEngine.createAJAXEngineCallback = function () { adjustFloatingMenuStyles(); populateExtraMenuContainer(); /*replaceFloatingDebugMenu();*/ this.top = '400px'; };
		
		oAJAXEngine.showAJAXBeginsHrefCallback = function (hRef) { return oAJAXEngine._url; };
		
		oAJAXEngine.showAJAXDebugMenuCallback = function () { return true; };
		
		oAJAXEngine.showAJAXScopesMenuCallback = function () { return true; };
		
		oAJAXEngine.showAJAXBrowserDebugCallback = function () { return true; };
			
		oAJAXEngine.create();

		oAJAXEngine.isXmlHttpPreferred = ((bool_isServerProduction) ? true : false);

		podLayoutContainerStylesCallBack = -1;
		
//		ezAlert(oAJAXEngine);
		
		function ezWindowOnLoadCallback() {
			initAJAXEngine(oAJAXEngine);
			resizeOuterContentWrapper();
		}

		function showAlertMessageCallback() {
			var oDiv = _$('iframe_ezAJAX_LogoPod');
			if (!!oDiv) {
	//			oDiv.src = js_logoImage;
			}
		}
		
		function dismissAlertMessageCallback() {
			var oDiv = _$('iframe_ezAJAX_LogoPod');
			if (!!oDiv) {
	//			oDiv.src = js_ezAJAX_LogoImage;
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
				var y = parseInt(dObj.style.height) + 6;
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
			var bool_isDebugPanelRepositionable = false;
			var oTD = _$('td_loginRegisterFrame'); 
			var oAnchorPosTop = ezAnchorPosition.get$('anchor_articleContentTop');
			if ( (!!oTD) && (oTD.style.display == const_inline_style) ) {
				repositionArticleContent();
			}
			if (bool_isDebugPanelRepositionable) {
				var dObj = $(const_div_floating_debug_menu);
				if ( (!!dObj) && (!!oAnchorPosTop) ) {
					if (jsBool_isCurrentBlogDefault) {
						dObj.style.top = document.body.scrollTop + ((bool_isScrollLocked) ? (oAnchorPosTop.y - 20) : 0) + 'px';
					} else {
						dObj.style.top = document.body.scrollTop + (oAnchorPosTop.y - 20) + 'px';
					}
					dObj.style.left = 0 + 'px';
					dObj.style.display = const_none_style;
				}
			} else {
				var dObj = $(const_div_floating_debug_menu);
				if (!!dObj) {
					dObj.style.display = ((bool_isServerProduction) ? const_none_style : const_inline_style);
				}
			}
			if (!!oAnchorPosTop) ezAnchorPosition.remove$(oAnchorPosTop.id);
			return bool_isDebugPanelRepositionable;
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
	// -->
	</script>
	
<cfif 0>
	<cfdump var="#Session#" label="Session" expand="No">
	<cfdump var="#CGI#" label="CGI Scope" expand="No">
	<cfdump var="#URL#" label="URL Scope" expand="No">
</cfif>

	<cfscript>
		cf_currentBlogName = 'default';
		if (IsDefined("Session.persistData.blogname")) {
			cf_currentBlogName = Session.persistData.blogname;
		}
	</cfscript>

	<script language="JavaScript1.2" type="text/javascript">
	<!--
		var js_trademarkSymbol = '#cf_trademarkSymbol#';
		
		var _db = ''; // 'browser_is_ie = [' + browser_is_ie + ']' + ', browser_is_ff = [' + browser_is_ff + ']' + ', browser_is_ns = [' + browser_is_ns + ']' + ', browser_is_op = [' + browser_is_op + ']';
		if ( (browser_is_ie != null) && (browser_is_ff != null) && (browser_is_ns != null) && (browser_is_op != null) ) {
	//		ezAlert('browser_is_ie = [' + browser_is_ie + ']' + ', browser_is_ff = [' + browser_is_ff + ']' + ', browser_is_ns = [' + browser_is_ns + ']'); 
		} else {
			if (window.location.href.toUpperCase().indexOf('.CONTENTOPIA.NET') > -1) {
				_db = '';
			}
			alert("ERROR: Unable to determine your browser type - some content may not work as expected. Kindly use IE 6.x, FireFox 1.5.0.6, Netscape 8.1 or Opera 9.x - IE 6.x works best just because IE 6.x is a far more powerful browser than the rest." + '\n' + _db);
		}
		
		function popUpWindowForURL(aURL, winName, xMax, yMax, isResizable, isStatus) {
			xMax = ((xMax != null) ? xMax : (ezClientWidth() - 450));
			yMax = ((yMax != null) ? yMax : (ezClientHeight() - 100));
			isResizable = ((isResizable == true) ? isResizable : false);
			isStatus = ((isStatus == true) ? isStatus : false);
			winName = winName.split(' ').join('');
			var oWin = window.open(aURL,winName,'width=' + xMax + ',height=' + yMax + ',resizable=' + ((isResizable) ? 'yes' : 'no') + ',scrollbars=1,status=' + ((isStatus) ? 'yes' : 'no'));
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
		
		function downloadsDocsText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
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

		function whatsNewText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Whats New', 'div_PrimaryContentContainer');
		}
		
		function _handlePopulateContentFor(_divName, someHTML, _aName) {
			someHTML = ((typeof someHTML) == const_string_symbol ? someHTML : '');
			_divName = ((typeof _divName) == const_string_symbol ? _divName : '');
			var oDiv = _$(_divName);
			if (!!oDiv) {
				oDiv.style.border = ((someHTML.length > 0) ? 'thin solid black' : '');
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

						qData1[0].iterateRecObjs(searchForContent);
						
						if (_html.length > 0) {
							html += _html;
						}

						var _divName = argsDict.getValueFor('divName');
						_divName = (((typeof _divName) == const_string_symbol) ? _divName : 'div_PrimaryContentContainer');

						var _aName = argsDict.getValueFor('aName');
						_aName = (((typeof _aName) == const_string_symbol) ? _aName : '');

	//					ezAlert('argsDict = [' + argsDict + ']');
						_handlePopulateContentFor(_divName, html, _aName);
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
	// -->
	</script>

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
			<p align="justify" class="normalPrompt">This Site is powered by #ezClusterLink# Patents Pending and #ezAJAXLink# Enterprise Edition v0.93.&nbsp;
			#ezClusterLink# makes 2 or more web servers into a single coherent web server using low-cost techniques.&nbsp;
			#ezAJAXLink# shortens time to market for AJAX Apps.&nbsp;&nbsp;Let us do all the work for you.&nbsp;&nbsp;<cfif (NOT Request.commonCode.ezIsBrowserIE())><b><i>This site is best when viewed using IE 6.x (1024x768) resolution.</i></b></cfif>
			<br>
			The contents of this Site are protected under U.S. and International Copyright Laws. &copy 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.</p>
		</cfoutput>
	</cfsavecontent>
	
	<div id="table_outerContentWrapper" style="position: absolute; width: 800px; top: 0px; left: 0px;">
		<table width="100%" align="center" border="0" cellpadding="1" cellspacing="1" style="background-color: white;">
			<tr>
				<td valign="top" align="left">
					<table border="0" cellpadding="-1" cellspacing="-1">
						<tr>
							<td>
								<a id="anchor_siteLogoLowerRightTransparent" name="anchor_siteLogoLowerRightTransparent" href="">&nbsp;</a><a href="http://#CGI.SERVER_NAME#" onmouseover="handleOnMouseOverLinkSpan('span_hackerSafe_siteLogoLowerRightTransparent', 'logoImageHoverClass');" onmouseout="handleOnMouseOutLinkSpan('span_hackerSafe_siteLogoLowerRightTransparent');"><span id="span_hackerSafe_siteLogoLowerRightTransparent"><img src="app/images/siteLogoLowerRightTransparent3-smaller2.gif" border="0"></span></a>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp; <!--- Menu goes here... --->
							</td>
						</tr>
					</table>
				</td>
				<td width="*" align="left">
					<table width="100%" border="0" cellpadding="-1" cellspacing="-1">
						<tr>
							<td width="100%" valign="top">
								<table width="100%" cellpadding="-1" cellspacing="-1" class="bannerWhiteTable">
									<tr>
										<td width="100%" align="left" valign="top">
												<table width="100%" border="0" cellpadding="-1" cellspacing="-1">
													<tr>
														<td width="740">
															<a href="http://www.ez-ajax.com"><img id="image_logoBanner" src="#Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#/app/images/ezAJAX-banner_800x90.jpg')#" width="740" border="0"></a>
														</td>
														<td width="30">
															<a id="anchor_imageLogoRight" name="anchor_imageLogoRight">&nbsp;</a>
															<cfif (NOT bool_useAbsoluteServerBusyPositioning)>
																<div id="div_ezajax_3d_logo">
																	<iframe src="../ezAjax/blank.html" name="iframe_showAJAXBegins" id="iframe_showAJAXBegins" width="30" height="30" marginwidth="0" marginheight="0" scrolling="no" frameborder="0" style="display: none; z-index: 1;"></iframe>
																</div>
															</cfif>
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
								<div id="div_PrimaryContentContainer" style="width: 95%;"></div>
							</td>
						</tr>
						<tr>
							<td valign="top">
								<table width="100%" cellpadding="-1" cellspacing="-1">
									<tr>
										<td id="td_articleContent" width="100%" valign="top" align="left">
											<table width="100%" cellpadding="-1" cellspacing="-1">
												<tr>
													<td width="10" align="left" valign="top">
														&nbsp;
													</td>
													<td width="*" align="left" valign="top">
														<a id="anchor_articleContentTop" name="anchor_articleContentTop"></a>
														<div id="div_articleContent" style="overflow: auto;"></div>
													</td>
												</tr>
												<tr>
													<td id="td_podContent" width="30%" valign="top" align="left" style="border-left: thin dotted Silver;">
														<div id="div_podContent"></div>
													</td>
												</tr>
												<tr>
													<td id="td_podContent2" width="25%" valign="top" align="left" style="display: none; border-left: thin dotted Silver;">
														<div id="div_podContent2"></div>
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
																<td width="50%" align="left" valign="top">
																	<span class="normalPrompt">
																	<a id="anchor_optIn" name="anchor_optIn" href="" title="Click this link to Opt-In to receive our Monthly Newsletters" onmouseover="ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, ((ezAJAXEngine.browser_is_ff) ? 240 : 120), ((ezAJAXEngine.browser_is_ff) ? -60 : ((_global_clientWidth < webLayout_fixedWidth) ? 0 : -60)), ((ezAJAXEngine.browser_is_ff) ? -15 : -30), ((_global_clientWidth < webLayout_fixedWidth) ? false : -1)); return false;" onmouseout="ezThoughtBubbleObj.dismissThoughtBubbleForAnchor(this.id); return false;" onclick="var oObj = _$('#divName_optIn#'); if (!!oObj) { oObj.style.display = const_inline_style; }; return false;">Opt-In</a>&nbsp;|&nbsp;
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
																	<a id="anchor_optOut" name="anchor_optOut" href="" title="Click this link to Opt-Out to stop receiving our Monthly Newsletters" onmouseover="ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, ((ezAJAXEngine.browser_is_ff) ? 240 : 215), ((ezAJAXEngine.browser_is_ff) ? -120 : -100), ((ezAJAXEngine.browser_is_ff) ? -15 : -15)); return false;" onmouseout="ezThoughtBubbleObj.dismissThoughtBubbleForAnchor(this.id); return false;" onclick="var oObj = _$('#divName_optOut#'); if (!!oObj) { oObj.style.display = const_inline_style; }; return false;">Opt-Out</a>
																	</span>
																</td>
																<td width="50%">
																	<table width="100%" cellpadding="-1" cellspacing="-1">
																		<tr>
																			<td width="80%" align="center">
																				<span class="normalPrompt">
																				<a id="anchor_RegNow_BuyNow" name="anchor_RegNow_BuyNow" href="http://www.regnow.com/softsell/nph-softsell.cgi?item=14605-1" target="_blank" title="Buy Annual Runtime License from RegNow.Com" onmouseover="ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, ((ezAJAXEngine.browser_is_ff) ? 230 : 215), ((ezAJAXEngine.browser_is_ff) ? -110 : -110), ((ezAJAXEngine.browser_is_ff) ? -0 : -0)); return false;" onmouseout="ezThoughtBubbleObj.dismissThoughtBubbleForAnchor(this.id); return false;">Buy Now</a>
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
										<td width="20%">
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td valign="top" align="left">
								#_poweredHTML#
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
//		showFloatingMenu();
	</script>

</cfoutput>

