<cfparam name="URL.mode" type="string" default="">
<cfparam name="URL.entry" type="string" default="">

<cfparam name="URL.contentID" type="string" default="">

<cfset cf_trademarkSymbol = '&##8482'>

<cfset cf_buttonClass = "buttonClass">
<cfif (Request.commonCode.ezIsBrowserFF() OR Request.commonCode.ezIsBrowserFF())>
	<cfset cf_buttonClass = cf_buttonClass & "FF">
</cfif>

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
		
		cf_productionServerToken = '.ez-ajax.com';
		bool_isServerProduction = (FindNoCase(cf_productionServerToken, CGI.SERVER_NAME) gt 0);
	</cfscript>

	<cfsavecontent variable="jsCodeStore0a">
		<cfoutput>
		function handleEmailNewsletters(qObj, nRecs, qStats, argsDict, qData1) {
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
							ezAlert(_STATUSMSG);
						} else {
							ezAlertCODE(qData1)
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
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="jsCodeStore0">
		<cfoutput>
		var js_URL_mode = '#URL.mode#';
		var js_URL_entry = '#URL.entry#';
		
		var js_CF_TEMPLATE_PATH = '#JSStringFormat(ListDeleteAt(CGI.CF_TEMPLATE_PATH, ListLen(CGI.CF_TEMPLATE_PATH, '\'), '\'))#';
		
		var bool_isServerProduction = ((window.location.href.toUpperCase().indexOf('#cf_productionServerToken#'.toUpperCase()) > -1) ? true : false);
		
		var bool_useAbsoluteServerBusyPositioning = (('#bool_useAbsoluteServerBusyPositioning#'.toUpperCase() == 'TRUE') ? true : false);

		var logoImage_fixedWidth = 600;
		var webLayout_fixedWidth = 800;

		oAJAXEngine = ezAJAXEngine.init('#Request.ezAJAX_functions_cfm#', (((window.location.href.toUpperCase().indexOf('.CONTENTOPIA.NET') == -1) || (window.location.href.toUpperCase().indexOf('.ez-ajax.com') == -1)) ? false : true));

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
			oAJAXEngine.ezAJAX_serverBusy_divName = 'div_ezajax_3d_logo';
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
						ezAnchorPosition.remove$(oPos.id); 
					}
					oO.style.zIndex = 1; 
					cObj.style.zIndex = 65535; 
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
//		oAJAXEngine.isXmlHttpPreferred = true;

		podLayoutContainerStylesCallBack = -1;
		
		function ezWindowOnLoadCallback() {
			initAJAXEngine(oAJAXEngine);
			resizeOuterContentWrapper();
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
		if (FindNoCase(cf_productionServerToken, CGI.SERVER_NAME) gt 0) {
			_waferAnalysisServer = 'rabid.contentopia.net';
		}
		_urlWaferAnalysis = Request.commonCode.ezClusterizeURL('http://#_waferAnalysisServer#/blog/samples/semiconductors/wafer-analysis/index.cfm') & '?sessID=#Session.sessID#';
		cf_CodeDemoWaferAnalysis = "window.open('#_urlWaferAnalysis#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";

		_urlDojoMailSample031 = 'http://#CGI.SERVER_NAME#/dojo-0.3.1-ajax/demos/widget/mail.html';
		cf_urlDojoMailSample031 = "window.open('#_urlDojoMailSample031#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";

		_urlDojoMailSample041 = 'http://#CGI.SERVER_NAME#/dojo-0.4.1-ajax/demos/widget/mail.html';
		cf_urlDojoMailSample041 = "window.open('#_urlDojoMailSample041#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";
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
				} finally {
				}
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

		function resendRuntimeLicense(id) {
			oAJAXEngine.doAJAX('performResendRuntimeLicense', 'handleResendRuntimeLicense', 'id', id);
		}
		
		function performSubmitEditedEmailAddress() {
			var oDiv = _$('div_manageLicense_editorRuntimeLicense');
			var oInput = _$('input_manageLicense_editorEmailAddress');
			var oBtn = _$('btn_manageLicense_editorSubmit');
			if ( (!!oDiv) && (!!oInput) && (!!oBtn) ) {
				oDiv.style.display = const_none_style;
				oBtn.disabled = true;
				var ar = oBtn.name.split('_');
				var sID = ar[ar.length - 2].ezFilterInNumeric();
				var sSID = ar[ar.length - 1].ezFilterInNumeric();
				oAJAXEngine.doAJAX('performSubmitEditedEmailAddress', 'handleSubmitEditedEmailAddress', 'EmailAddress', oInput.value, 'id', sID, 'sid', sSID);
			}
		}
		
		function handleSubmitEditedEmailAddress(qObj, nRecs, qStats, argsDict, qData1) {
			var oDiv = _$('div_manageLicense_statusRuntimeLicense');

			function searchForStatusRecs(_ri, _dict, _rowCntName) {
				_STATUSMSG = _dict.getValueFor('STATUSMSG');
				_STATUSMSG = ((_STATUSMSG == null) ? '' : _STATUSMSG);
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						qData1.iterateRecObjs(searchForStatusRecs);

						var _EmailAddress = argsDict.getValueFor('EmailAddress');
						var oInput = _$('manageLicenses_emailAddress');
						if ( (!!oInput) && (_EmailAddress != null) ) {
							oInput.value = _EmailAddress;
						}
						simulateEnterKeyForManageLicensesActions();

						if (_STATUSMSG.length > 0) {
							if (!!oDiv) {
								oDiv.style.display = const_inline_style;
								oDiv.innerHTML = '<span class="onholdStatusBoldClass"><br><center>' + _STATUSMSG + '</center></span>';
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
		
		function sampleAppsText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentForUsing('Sample Apps', 'div_PrimaryContentContainer', ezFullyQualifiedAppUrl(), ' ');
		}
		
		function sampleWeb20APIText(pageId) {
			pageId = ((pageId == null) ? 1 : parseInt(pageId.toString()));
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Web20API' + ((pageId == 0) ? 'all' : pageId), 'div_PrimaryContentContainer');
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

		function jsonSupportText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('JSON Support', 'div_PrimaryContentContainer');
		}

		function whatsNewText() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Whats New', 'div_PrimaryContentContainer');
		}
		
		function underLogoText() {
			_handlePopulateContentFor('+++', 'div_underLogoContentContainer');
			return populateContentFor('Under Logo', 'div_underLogoContentContainer');
		}
		
		function yahooSearchV2Text() {
			_handlePopulateContentFor('', 'div_PrimaryContentContainer');
			return populateContentFor('Yahoo Search V2', 'div_PrimaryContentContainer');
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
						popUpWindowForURL(window.location.protocol + '//' + window.location.hostname + '/app/upgradeLicense12.html', 'upgradeLicense12', 700, 550, false, true);
					break;
					
					default:
						popUpWindowForURL(window.location.protocol + '//' + window.location.hostname + '/app/upgradeLicense.html', 'upgradeLicense', 700, 550, false, true);
					break;
				}

				_html += '</table>';

				oDiv.innerHTML = _html;
				oDiv.style.display = const_inline_style;
			}
		}
		
		function handleGetRegistrationData(qObj, nRecs, qStats, argsDict, qData1) {
			var _STATUSMSG = '';
			var oDiv = _$('div_manageLicenses_content');
			var _html = '';
			var iRow = 0;
			var _ID = '';
			var _SID = '';
			var _UID = '';
			var _USERNAME = '';
			var _HASLICENSE = '';
			var _SERVERNAME = '';
			var _EXPIRATIONDATE = '';
			var _ISCOMMUNITYEDITION = '';
			
			function searchForStatusRecs(_ri, _dict, _rowCntName) {
				_STATUSMSG = _dict.getValueFor('STATUSMSG');
				_STATUSMSG = ((_STATUSMSG == null) ? '' : _STATUSMSG);
			};

			function searchForLicenseRecs(_ri, _dict, _rowCntName) {
				_ID = _dict.getValueFor('ID');
				_SID = _dict.getValueFor('SID');
				_UID = _dict.getValueFor('UID');
				_USERNAME = _dict.getValueFor('USERNAME');
				_HASLICENSE = _dict.getValueFor('HASLICENSE');
				_SERVERNAME = _dict.getValueFor('SERVERNAME');
				_EXPIRATIONDATE = _dict.getValueFor('EXPIRATIONDATE');
				_ISCOMMUNITYEDITION = _dict.getValueFor('ISCOMMUNITYEDITION');
				
				_ID = ((_ID == null) ? '' : _ID);
				_SID = ((_SID == null) ? '' : _SID);
				_UID = ((_UID == null) ? '' : _UID);
				_USERNAME = ((_USERNAME == null) ? '' : _USERNAME);
				_HASLICENSE = ((_HASLICENSE == null) ? '' : _HASLICENSE);
				_SERVERNAME = ((_SERVERNAME == null) ? '' : _SERVERNAME);
				_EXPIRATIONDATE = ((_EXPIRATIONDATE == null) ? '' : _EXPIRATIONDATE);
				_ISCOMMUNITYEDITION = ((_ISCOMMUNITYEDITION == null) ? '' : _ISCOMMUNITYEDITION);
				
				if (_HASLICENSE.length > 0) {
					iRow++;
					_html += '<span class="normalSmallStatusBoldClass"><center><NOBR>' + _USERNAME + ' / ' + _SERVERNAME + '</NOBR> <NOBR>Has a ' + ((_ISCOMMUNITYEDITION == 1) ? 'Community Edition' : 'Enterprise Edition') + '</NOBR> Runtime License that expires on <NOBR>' + _EXPIRATIONDATE + '</NOBR>.&nbsp;<button id="btn_manageLicense_resendRuntimeLicense" class="' + js_buttonClass + '" onclick="resendRuntimeLicense(\'' + _ID + '\'); return false;">[Resend]</button>&nbsp;<button id="btn_manageLicense_editRuntimeLicense" class="' + js_buttonClass + '" onclick="beginEditorLicenseManager(\'' + _ID + '\', \'' + _SID + '\', \'' + _USERNAME + '\'); return false;">[Edit]</button>' + ((_ISCOMMUNITYEDITION == 1) ? '&nbsp;<button id="btn_manageLicense_upgradeRuntimeLicense" class="' + js_buttonClass + '" onclick="beginUpgradeRuntimeLicense(\'' + _ID + '\', \'' + _SID + '\', 12); return false;">[Upgrade: Annual]</button>&nbsp;<button id="btn_manageLicense_upgradeRuntimeLicense" class="' + js_buttonClass + '" onclick="beginUpgradeRuntimeLicense(\'' + _ID + '\', \'' + _SID + '\', 999); return false;">[Upgrade: Perpetual]</button>' : '') + '</center></span>';
					if (iRow > 1) {
						_html += '<hr width="50%" color="blue">';
					}
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						qData1.iterateRecObjs(searchForStatusRecs);
						qData1.iterateRecObjs(searchForLicenseRecs);

						oGuiActions.popAllButtons();
						
						if (!!oDiv) oDiv.innerHTML = '';
						if (_STATUSMSG.length > 0) {
							if (!!oDiv) oDiv.innerHTML = '<span class="errorStatusBoldClass"><br><center>' + _STATUSMSG + '</center></span>';
						} else {
							if (!!oDiv) {
								_html += '<br><div id="div_manageLicense_editorRuntimeLicense" style="display: none;"><b>Email Address:</b>&nbsp;<input type="text" id="input_manageLicense_editorEmailAddress" class="textClass" size="30" maxlength="255" onkeyup="if (!!validateManageLicensesEditEmailAddrs) { validateManageLicensesEditEmailAddrs() }; simulateEnterKeyForEditLicensesActions(event);"><br><button id="btn_manageLicense_editorSubmit" name="btn_manageLicense_editorSubmit" class="' + js_buttonClass + '" onclick="performSubmitEditedEmailAddress(\'' + this.name + '\'); return false;">[Submit]</button></div>';
								_html += '<br><div id="div_manageLicense_statusRuntimeLicense" style="display: none;"></div>';
								_html += '<br><div id="div_manageLicense_upgradeRuntimeLicense" style="display: none;"></div>';
								oDiv.innerHTML = '<div style="overflow: auto; height: 200px; max-height: 200px; margin-left: 15px;">' + _html + '</div>';
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

		//				ezAlert('handlePopulateContentFor :: argsDict = [' + argsDict + ']');
						_handlePopulateContentFor(_divName, html, _aName);
						
						if (_aName == 'Yahoo Search V2') {
							var oInput = _$('input_YahooSearchV2_criteria');
							if (!!oInput) {
								try { oInput.focus(); } catch (e) { };
							}
						}
						
						if (bool_readyForUnderLogoContent) {
							bool_readyForUnderLogoContent = false;
							handleOnClickSsmItemsByName(const_whatsNew_menu_symbol);whatsNewText();
		//					underLogoText();
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
		</cfoutput>
	</cfsavecontent>
	
	<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(jsCodeStore0 & jsCodeStore1)#</script>
	
	<cfif (bool_isServerProduction)>
		<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(jsCodeStore0a)#</script>
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
			<p align="justify" class="normalPrompt">This Site is powered by #ezClusterLink# Patents Pending and #ezAJAXLink# Enterprise Edition v1.0.&nbsp;
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
								<a id="anchor_siteLogoLowerRightTransparent" name="anchor_siteLogoLowerRightTransparent" href="">&nbsp;</a><a href="http://#CGI.SERVER_NAME#" onmouseover="handleOnMouseOverLinkSpan('span_hackerSafe_siteLogoLowerRightTransparent', 'logoImageHoverClass');" onmouseout="handleOnMouseOutLinkSpan('span_hackerSafe_siteLogoLowerRightTransparent');"><span id="span_hackerSafe_siteLogoLowerRightTransparent"><img src="#Request.ezAJAX_webRoot#/app/images/siteLogoLowerRightTransparent3-smaller2.gif" border="0"></span></a>
							</td>
						</tr>
						<tr>
							<td>
								<div id="div_underLogoContentContainer" style="width: 95%;"></div>
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
															<img id="image_logoBanner" src="http://#CGI.SERVER_NAME#/app/images/ezAJAX-banner_800x90.jpg" width="740" border="0">
														</td>
														<td width="30">
															<a id="anchor_imageLogoRight" name="anchor_imageLogoRight">&nbsp;</a>
															<div id="div_ezajax_3d_logo">
																<cfif (NOT bool_useAbsoluteServerBusyPositioning) AND 0>
																	<iframe src="../ezAjax/blank.html" name="iframe_showAJAXBegins" id="iframe_showAJAXBegins" width="30" height="30" marginwidth="0" marginheight="0" scrolling="no" frameborder="0" style="display: none; z-index: 1;"></iframe>
																</cfif>
															</div>
														</td>
													</tr>
												</table>
											<a id="anchor_bottomOfBlogTitle" name="anchor_bottomOfBlogTitle"></a>
										</td>
									</tr>
									<tr>
										<td align="center">
											<h3 align="center"><b>This is the <U>MUST-HAVE</U> Web 2.0 Product of #Year(Now())# !</b>&nbsp;<span id="span_registrationStats"></span></h3>
										</td>
									</tr>
									<tr>
										<td align="center">
											<span class="titlex12BlueClass"><b>Limited Time Bundle Offer: The first 10 ezAJAX Enterprise Edition Perpetual Runtime License Registrations, <i>every month</i>, will get a FREE License for ColdFusion MX 7 Server.</b></span>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<cfif 0>
							<tr>
								<td valign="center">
									<cfdump var="#CGI#" label="CGI Scope" expand="No">
									<cfdump var="#URL#" label="URL Scope" expand="No">
								</td>
							</tr>
						</cfif>
						<tr>
							<td valign="center">
								<script type="text/javascript" language="JavaScript1.2" src="/app/js/myMenu.js"></script>
							</td>
						</tr>
						<tr>
							<td valign="top">
								<div id="div_PrimaryContentContainer" style="width: 95%;"><cfif (Len(CGI.PATH_INFO) gt 0)>#getUsersContent(ListFirst(CGI.PATH_INFO, Left(CGI.PATH_INFO, 1)))#<cfelseif (Len(URL.contentID) gt 0)>#getUsersContent(URL.contentID)#</cfif></div>
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
		var bool_readyForUnderLogoContent = true;
	</script>

	<cfif (Len(CGI.PATH_INFO) eq 0) AND (Len(URL.contentID) eq 0)>
		<script language="JavaScript1.2" type="text/javascript">
			underLogoText();
		</script>
	</cfif>

	<script language="JavaScript1.2" type="text/javascript">
//		jsonObj = ezJSON.get$('#ezAJAX_webRoot#/app/web2.0/registrations/registrationStats.cfm?callback=handle_registrationStats');
	</script>
	
</cfoutput>

