<cfparam name="URL.mode" type="string" default="">
<cfparam name="URL.entry" type="string" default="">

<cfset cf_trademarkSymbol = '&##8482'>

<cfsavecontent variable="content_111_1"> <!--- 111.1 --->
	<cfoutput>
		<p class="normalSiteContentTextClass">ezAJAX#cf_trademarkSymbol# is the EASY way to create high-powered AJAX Applications with very little effort.</p>
		<p class="normalSiteContentTextClass">What makes ezAJAX#cf_trademarkSymbol# so EASY?</p>
		<p class="normalSiteContentTextClass">We give you more than 10,000 lines of code that is already debugged and ready to use.  All you need to do after installing ezAJAX#cf_trademarkSymbol# is begin coding your application logic.</p>
		<p class="normalSiteContentTextClass">Let us do all the work for you!</p>
	</cfoutput>
</cfsavecontent>

<cfsavecontent variable="content_112_1"> <!--- 112.1 --->
	<cfoutput>
		<table width="100%" cellpadding="-1" cellspacing="-1">
		<tr>
		<td align="left" valign="top" style="border-top: thin solid Blue;">
		<span class="titlex14BoldClass">Contact Us</span>
		<br>
		<span class="normalx12StatusBoldClass"><a href="" onclick="displayContactUsContentIn('div_contactUsContent', 'performContactUsAction', '#Request.salesEmailAddress#'); return false;">#Request.salesEmailAddress#</a></span>
		<div id="div_contactUsContent"></div>
		</td>
		<td align="left" valign="top" style="border-top: thin solid Blue;">
		<span class="titlex14BoldClass">Investors, Contact Us.</span>
		<br>
		<span class="normalx12StatusBoldClass"><a href="" onclick="displayContactUsContentIn('div_contactUsContent', 'performContactUsAction', '#Request.investorRelationsEmailAddress#'); return false;">#Request.investorRelationsEmailAddress#</a></span>
		</td>
		<td align="left" valign="top" style="border-top: thin solid Blue;">
		<span class="titlex14BoldClass">Affiliates, Contact Us. (10%-60% Comissions Paid)</span>
		<br>
		<span class="normalx12StatusBoldClass"><a href="" onclick="displayContactUsContentIn('div_contactUsContent', 'performContactUsAction', '#Request.affiliateRelationsEmailAddress#'); return false;">#Request.affiliateRelationsEmailAddress#</a></span>
		</td>
		</tr>
		</table>
	</cfoutput>
</cfsavecontent>

<cfoutput>
	<script language="JavaScript1.2" type="text/javascript">
	<!--
		var js_URL_mode = '#URL.mode#';
		var js_URL_entry = '#URL.entry#';
		
		var bool_isServerProduction = ((window.location.href.toUpperCase().indexOf('.ez-ajax.com'.toUpperCase()) > -1) ? true : false);

		oAJAXEngine.timeout = 120;
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
				dObj.innerHTML = '<b>New Menu Content</b>';
			}
		}
		
		function populateExtraMenuContainer() {
			var dObj = _$('div_extraContainer');
			if (!!dObj) {
	//			dObj.innerHTML = '&nbsp;<b>Extra Menu Content</b>';
			}
		}
		
		oAJAXEngine.createAJAXEngineCallback = function () { adjustFloatingMenuStyles(); populateExtraMenuContainer(); /*replaceFloatingDebugMenu();*/ this.top = '400px'; };
		
		oAJAXEngine.showAJAXBeginsHrefCallback = function (hRef) { return ezURLPrefixFromHref(js_SERVER_NAME); };
		
		oAJAXEngine.showAJAXDebugMenuCallback = function () { return true; };
		
		oAJAXEngine.showAJAXScopesMenuCallback = function () { return true; };
		
		oAJAXEngine.showAJAXBrowserDebugCallback = function () { return true; };
			
		oAJAXEngine.create();

		oAJAXEngine.isXmlHttpPreferred = ((bool_isServerProduction) ? true : false);

		podLayoutContainerStylesCallBack = -1;
		
		function ezWindowOnLoadCallback() {
			initAJAXEngine(oAJAXEngine);
		}

		function ezWindowOnUnloadCallback() {
		}
				
		function ezWindowOnReSizeCallback(_width, _height) {
			var oObj = _$('table_outerContentWrapper');
			if (!!oObj) {
				oObj.width = _width;
			}
			var tdObj = _$('td_articleContent');
			var dObj = _$('div_articleContent');
			if ( (!!dObj) && (!!tdObj) ) {
				var bool_isPercent = ((tdObj.width.toString().indexOf('%') > -1) ? true : false);
				if (bool_isPercent) {
					dObj.style.width = (_width * (parseInt(tdObj.width.toString()) / 100)) - 0;
				}
			}
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
			var oDiv = _$('iframe_ezAJAX_LogoPod');
			if (!!oDiv) {
				oDiv.src = js_ezAJAX_LogoImage;
			}
			return bool_isDebugPanelRepositionable;
		}
	// -->
	</script>
	
	<cfscript>
		if ( (Len(URL.mode) eq 0) AND (Len(URL.entry) eq 0) ) {
			URL.mode = 'BLOGNAME';
			URL.entry = 'ezajax';
		}
		if ( (URL.mode IS 'BLOGNAME') AND (Len(URL.entry) gt 0) ) {
			errorMsg = '';
			bool_isError = false;
			try {
				application.blog = application.blog.init(URL.entry);
			} catch (Any e) {
				bool_isError = true;
				errorMsg = Request.commonCode.ezExplainError(e, false);
			}
			if (NOT bool_isError) {
				Session.persistData.blogname = URL.entry;
				Request.primitiveCode.commitSessionToDb();
			}
		}

		cf_REMOTE_ADDR = CGI.REMOTE_ADDR;
		cf_SERVER_NAME = 'http:' & '/' & '/' & CGI.SERVER_NAME & CGI.SCRIPT_NAME;
		
		logoImage = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#/' & Request.scriptFirst & 'app/includes/cfcontent_img.cfm?imageName=../images/Yes02b1a187x171.jpg');
		_waferAnalysisServer = 'laptop.halsmalltalker.com';
		if (FindNoCase('.ez-ajax.com', CGI.SERVER_NAME) gt 0) {
			_waferAnalysisServer = 'rabid.contentopia.net';
		}
		_urlWaferAnalysis = Request.commonCode.ezClusterizeURL('http://#_waferAnalysisServer#/blog/samples/semiconductors/wafer-analysis/index.cfm') & '?sessID=#Session.sessID#';

		_urlCommunityEditionLicenseAgreement = Request.commonCode.ezClusterizeURL('#_urlParentPrefix#/ezAJAX(tm) Community Edition License Agreement.htm');
		_urlCommunityEditionProgrammersGuide = Request.commonCode.ezClusterizeURL("#_urlParentPrefix#/downloads_433611211010024813/ezAJAX(tm) Community Edition Programmer's Guide.htm");
		
		_urlDefaultBlogSite = Request.commonCode.ezClusterizeURL("#_urlParentPrefix#") & '/name/default/';

		ezAJAX_LogoImage = Request.commonCode.ezClusterizeURL('#_urlParentPrefix#/app/ezAJAXLogo.cfm');

		print_ActionImage = Request.commonCode.ezClusterizeURL('#_urlParentPrefix#/app/images/print.gif');
		pdf_ActionImage = Request.commonCode.ezClusterizeURL('#_urlParentPrefix#/app/images/pdf.gif');

		delete_ActionImage = Request.commonCode.ezClusterizeURL('#_urlParentPrefix#/app/images/broken.gif');
		edit_ActionImage = Request.commonCode.ezClusterizeURL('#_urlParentPrefix#/app/images/editimage.gif');
		save_ActionImage = Request.commonCode.ezClusterizeURL('#_urlParentPrefix#/app/images/app_data.gif');

		ezAJAX_productLink = 'http://www.ez-ajax.com';

		ezAJAX_ProductContent = Request.commonCode.ezClusterizeURL('#_urlParentPrefix#/ezAJAX/app/ezAJAXProductContent.cfm');

		cf_maxEntries = 10;
		
		cf_blogBgColor = '##027FFF';

		cf_const_expandButtonFace = '&nbsp;&lt;&lt;&nbsp;';
		cf_const_contractButtonFace = '&nbsp;&gt;&gt;&nbsp;';

		if (Request.commonCode.ezIsBrowserFF()) {
			cf_const_expandButtonFace = ' << ';
			cf_const_contractButtonFace = ' >> ';
		}

		cf_const_div_podContent = 'div_podContent';
		
		searchTitle = application.resourceBundle.getResource("search");
		noRecentEntries = application.resourceBundle.getResource("norecententries");
		recentEntries = application.resourceBundle.getResource("recententries");
		downloadsTitle = application.resourceBundle.getResource("downloads");
		calendarTitle = application.resourceBundle.getResource("calendar");
		archivesBySubjectTitle = application.resourceBundle.getResource("archivesbysubject");
		subscribeTitle = application.resourceBundle.getResource("subscribe");
		subscribeBlog = application.resourceBundle.getResource("subscribeblog");
		commentsText = application.resourceBundle.getResource("comments");
		trackedbyText = application.resourceBundle.getResource("trackedby");
		trackedonText = application.resourceBundle.getResource("trackedon");
		trackbackurlText = application.resourceBundle.getResource("trackbackurl");
		notrackbacksText = application.resourceBundle.getResource("notrackbacks");
		postedbyText = application.resourceBundle.getResource("postedby");
		postedatText = application.resourceBundle.getResource("postedat");
		nocommentsText = application.resourceBundle.getResource("nocomments");
		searchedforText = application.resourceBundle.getResource("searchedfor");
		mainText = application.resourceBundle.getResource("main");
		viewingByEntryText = application.resourceBundle.getResource("viewingbyentry");
		viewingbydayText = application.resourceBundle.getResource("viewingbyday");
		viewingbymonthText = application.resourceBundle.getResource("viewingbymonth");
		viewingbycategoryText = application.resourceBundle.getResource("viewingbycategory");
		printText = application.resourceBundle.getResource("print");
		entryTitleText = application.resourceBundle.getResource("title");
		entryBodyText = application.resourceBundle.getResource("body");
		categoriesText = application.resourceBundle.getResource("categories");
		newcategoryText = application.resourceBundle.getResource("newcategory");
		aliasText = application.resourceBundle.getResource("alias");
		allowcommentsText = application.resourceBundle.getResource("allowcomments");
		saveText = application.resourceBundle.getResource("save");
		cancelText = application.resourceBundle.getResource("cancel");
		usernameText = application.resourceBundle.getResource("username");
		passwordText = application.resourceBundle.getResource("password");
		loginText = application.resourceBundle.getResource("login");
		forgotPasswordText = application.resourceBundle.getResource("forgotpassword");
		yournameText = application.resourceBundle.getResource("yourname");
		confirmPasswordText = application.resourceBundle.getResource("confirmpassword");
		registerText = application.resourceBundle.getResource("register");

		premium_actionURL = "https://www.paypal.com/cgi-bin/webscr";
		premium_businessEmail = "payments@contentopia.net";
		premium_imgHost = "https://www.paypal.com";
		if ( (isDebugMode()) OR (Request.commonCode.isServerLocal()) ) {
			premium_actionURL = "https://www.sandbox.paypal.com/cgi-bin/webscr";
			premium_businessEmail = "raychorn@contentopia.net";
			premium_imgHost = "https://www.sandbox.paypal.com";
		}
		
		bool_sessionLoggedin = ( (IsDefined("session.persistData.loggedin")) AND (session.persistData.loggedin) AND (IsDefined("Session.persistdata.QAUTHUSER")) AND (IsQuery(Session.persistdata.QAUTHUSER)) );
		cf_CodeDemoWaferAnalysis = "window.open('#_urlWaferAnalysis#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";
		if (bool_sessionLoggedin) {
			cfBool_sessionLoggedin = 1;
			cf_CodeWaferAnalysis = cf_CodeDemoWaferAnalysis;
		} else {
			cfBool_sessionLoggedin = 0;
			cf_CodeWaferAnalysis = "try { sampleAppsRequiresLoginBlock(); } catch(e) { ezAlertError(ezErrorExplainer(e, 'Programming Error P101.'));} finally {}";
		}
		cfBool_isUserAdmin = Request.primitiveCode.isUserAdmin();
		cfBool_isUserPremium = Request.primitiveCode.isUserPremium();
		cfBool_isUserNormalUser = Request.primitiveCode.isUserNormalUser();
		
		cf_currentBlogName = 'default';
		if (IsDefined("Session.persistData.blogname")) {
			cf_currentBlogName = Session.persistData.blogname;
		}
		
		cf_isColdFusionMX7 = application.isColdFusionMX7;

		cf_Session_sessid = -1;
		if (IsDefined("Session.sessid")) {
			cf_Session_sessid = Session.sessid;
		}
		if ( (cf_Session_sessid eq -1) AND (IsDefined("URL.sessid")) ) {
			cf_Session_sessid = URL.sessid;
		}

		cf_Session_sessionid = -1;
		if (IsDefined("Session.sessionid")) {
			cf_Session_sessionid = Session.sessionid;
		}

		printFlashPaperURL_template = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#') & '/' & Request.scriptFirst & 'print.cfm?id=+++' & '&media=flashpaper';
		printPdfURL_template = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#') & '/' & Request.scriptFirst & 'print.cfm?id=+++' & '&media=pdf';
		
		premium_paypal_returnURL = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#') & '/blog/i/validateMonthlyPremiumUserAccount/#Session.sessID#/';
		premium_paypal_cancelReturnURL = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#') & '/blog/i/cancelPremiumUserAccountPurchase/#Session.sessID#/';
		
		premium_paypal_returnURL6 = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#') & '/blog/i/validateSixMonthsPremiumUserAccount/#Session.sessID#/';
		premium_paypal_cancelReturnURL6 = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#') & '/blog/i/cancelPremiumUserAccountPurchase/#Session.sessID#/';
		
		premium_paypal_returnURL12 = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#') & '/blog/i/validateYearlyPremiumUserAccount/#Session.sessID#/';
		premium_paypal_cancelReturnURL12 = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#') & '/blog/i/cancelPremiumUserAccountPurchase/#Session.sessID#/';
	</cfscript>
	
<cfif 0>
	<cfdump var="#Session#" label="Session" expand="No">
	<cfdump var="#CGI#" label="CGI Scope" expand="No">
	<cfdump var="#URL#" label="URL Scope" expand="No">
</cfif>

	<script language="JavaScript1.2" type="text/javascript">
	<!--
		var _db = 'browser_is_ie = [' + browser_is_ie + ']' + ', browser_is_ff = [' + browser_is_ff + ']' + ', browser_is_ns = [' + browser_is_ns + ']' + ', browser_is_op = [' + browser_is_op + ']';
		if ( (browser_is_ie != null) && (browser_is_ff != null) && (browser_is_ns != null) && (browser_is_op != null) ) {
	//		ezAlert('browser_is_ie = [' + browser_is_ie + ']' + ', browser_is_ff = [' + browser_is_ff + ']' + ', browser_is_ns = [' + browser_is_ns + ']'); 
		} else {
			if (window.location.href.toUpperCase().indexOf('.CONTENTOPIA.NET') > -1) {
				_db = '';
			}
			alert("ERROR: Unable to determine your browser type - some content may not work as expected. Kindly return using IE 6.x, FireFox 1.5.0.4, Netscape 8.1 or Opera 9 - IE 6.x works best but that's life now isn't it." + '/n' + _db);
		}
		
	//	ezAlert('ezObjectExplainer(window.location) = [' + ezObjectExplainer(window.location) + ']');

		var js_CGI_SERVER_NAME = '#CGI.SERVER_NAME#';
		
		var js_salesEmailAddress = '#Request.salesEmailAddress#';
		var js_investorRelationsEmailAddress = '#Request.investorRelationsEmailAddress#';
		var js_affiliateRelationsEmailAddress = '#Request.affiliateRelationsEmailAddress#';
		
		var js_copyrightNotice = '#_copyrightNotice#';
		
		var js_urlParentPrefix = '#_urlParentPrefix#';
		
		var js_REMOTE_ADDR = '#cf_REMOTE_ADDR#';
		var js_SERVER_NAME = '#cf_SERVER_NAME#';
		
		var js_ezAJAX_LogoImage = '#ezAJAX_LogoImage#';
		
		var js_print_ActionImage = '#print_ActionImage#';
		var js_pdf_ActionImage = '#pdf_ActionImage#';
		
		var js_delete_ActionImage = '#delete_ActionImage#';
		var js_edit_ActionImage = '#edit_ActionImage#';
		var js_save_ActionImage = '#save_ActionImage#';
		
		var js_urlCommunityEditionLicenseAgreement = '#_urlCommunityEditionLicenseAgreement#';
		var js_urlCommunityEditionProgrammersGuide = "#_urlCommunityEditionProgrammersGuide#";
		
		var js_urlDefaultBlogSite = '#_urlDefaultBlogSite#';
		
		var js_maxEntries = parseInt('#cf_maxEntries#');
		
		var js_ezAJAX_productLink = '#ezAJAX_productLink#';
		
		var jsSessID = '#cf_Session_sessid#';
		var jsSessionid = '#cf_Session_sessionid#';

		var jsBool_sessionLoggedin = ((#cfBool_sessionLoggedin#) ? true : false);
		
		var jsBool_isColdFusionMX7 = (('#cf_isColdFusionMX7#'.toUpperCase() == 'YES') ? true : false);
		
		var jsBool_isDebugMode = (('#isDebugMode()#'.toUpperCase() == 'YES') ? true : false);
		var jsBool_isServerLocal = ((('#Request.commonCode.isServerLocal()#'.toUpperCase() == 'YES') || ('#CGI.REMOTE_ADDR#'.indexOf('192.168.1.') > -1)) ? true : false);
		
		var jsCurrentBlogName = '#cf_currentBlogName#';
		var jsBool_isCurrentBlogDefault = ((jsCurrentBlogName.toUpperCase() == 'DEFAULT') ? true : false);

		var jsBool_isUserAdmin = (('#cfBool_isUserAdmin#'.toUpperCase() == 'NO') ? false : true);
		var jsBool_isUserPremium = (('#cfBool_isUserPremium#'.toUpperCase() == 'NO') ? false : true);
		var jsBool_isUserNormalUser = (('#cfBool_isUserNormalUser#'.toUpperCase() == 'NO') ? false : true);

		var js_searchTitle = '#searchTitle#';
		var js_noRecentEntries = '#noRecentEntries#';
		var js_recentEntries = '#recentEntries#';
		var js_downloadsTitle = '#downloadsTitle#';
		var js_calendarTitle = '#calendarTitle#';
		var js_archivesBySubjectTitle = '#archivesBySubjectTitle#';
		var js_subscribeTitle = '#subscribeTitle#';
		var js_subscribeBlog = '#subscribeBlog#';
		var js_commentsText = '#commentsText#';
		var js_trackedbyText = '#trackedbyText#';
		var js_trackedonText = '#trackedonText#';
		var js_trackbackurlText = '#trackbackurlText#';
		var js_notrackbacksText = '#notrackbacksText#';
		var js_commentsText = '#commentsText#';
		var js_postedbyText = '#postedbyText#';
		var js_postedatText = '#postedatText#';
		var js_nocommentsText = '#nocommentsText#';
		var js_searchedforText = '#searchedforText#';
		var js_mainText = '#mainText#';
		var js_viewingByEntryText = '#viewingByEntryText#';
		var js_viewingbydayText = '#viewingbydayText#';
		var js_viewingbymonthText = '#viewingbymonthText#';
		var js_viewingbycategoryText = '#viewingbycategoryText#';
		var js_printText = '#printText#';
		var js_entryTitleText = '#entryTitleText#';
		var js_entryBodyText = '#entryBodyText#';
		var js_categoriesText = '#categoriesText#';
		var js_newcategoryText = '#newcategoryText#';
		var js_aliasText = '#aliasText#';
		var js_allowcommentsText = '#allowcommentsText#';
		var js_saveText = '#saveText#';
		var js_cancelText = '#cancelText#';
		var js_usernameText = '#usernameText#';
		var js_passwordText = '#passwordText#';
		var js_loginText = '#loginText#';
		var js_forgotPasswordText = '#forgotPasswordText#';
		var js_yournameText = '#yournameText#';
		var js_confirmPasswordText = '#confirmPasswordText#';
		var js_registerText = '#registerText#';

		var js_premium_actionURL = '#premium_actionURL#';
		var js_premium_businessEmail = '#premium_businessEmail#';
		var js_premium_imgHost = '#premium_imgHost#';
		
		var js_premium_paypal_returnURL = '#premium_paypal_returnURL#';
		var js_premium_paypal_cancelReturnURL = '#premium_paypal_cancelReturnURL#';
		
		var js_premium_paypal_returnURL6 = '#premium_paypal_returnURL6#';
		var js_premium_paypal_cancelReturnURL6 = '#premium_paypal_cancelReturnURL6#';
		
		var js_premium_paypal_returnURL12 = '#premium_paypal_returnURL12#';
		var js_premium_paypal_cancelReturnURL12 = '#premium_paypal_cancelReturnURL12#';
		
		var js_printFlashPaperURL_template = '#printFlashPaperURL_template#';
		var js_printPdfURL_template = '#printPdfURL_template#';
		
		var js_invalidEmailDomains = '#Request.invalidEmailDomains#';

		var jsCodeWaferAnalysis = "#cf_CodeWaferAnalysis#";
		var jsCodeDemoWaferAnalysis = "#cf_CodeDemoWaferAnalysis#";

		var js_ApplicationRootURL = '#application.rooturl#';
		
		var js_blogBgColor = '#cf_blogBgColor#';

		var js_trademarkSymbol = '#cf_trademarkSymbol#';
		
		var js_const_expandButtonFace = '#cf_const_expandButtonFace#';
		var js_const_contractButtonFace = '#cf_const_contractButtonFace#';
		
		var js_const_div_podContent = '#cf_const_div_podContent#';

		var fqServerName = ezFullyQualifiedAppPrefix();
		var _fqServerName = ezFullyQualifiedAppUrl();
		
		if (_fqServerName.toLowerCase().indexOf('/name/default'.toLowerCase()) > -1) {
			_fqServerName = _fqServerName.ezClipCaselessReplace('/name/default', '');
		} else if (_fqServerName.toLowerCase().indexOf('/name/ezajax'.toLowerCase()) > -1) {
			_fqServerName = _fqServerName.ezClipCaselessReplace('/name/ezajax', '/ezAJAX');
		} else if (_fqServerName.toLowerCase().indexOf('/index.cfm?mode=blogname&entry=ezajax'.toLowerCase()) > -1) {
			_fqServerName = _fqServerName.ezClipCaselessReplace('/index.cfm?mode=blogname&entry=ezajax', '');
		} else if (_fqServerName.toLowerCase().indexOf('/index.cfm?mode=blogname&entry=default'.toLowerCase()) > -1) {
			_fqServerName = _fqServerName.ezClipCaselessReplace('/index.cfm?mode=blogname&entry=default', '');
		}

		var registerFormAlreadyPopulated = [];
		
		var bool_isKeywordSearch = false;
		var bool_isEntryMode = false;
		var bool_isByDayMode = false;
		var bool_isByMonthMode = false;
		var bool_isByCategoryMode = false;
		var bool_isByCategoryNameMode = false;
		
		var bool_isScrollLocked = true;
		
		var archivesByCategoryQObj = -1;
		
		function performAllowArticleBrowserScroll(bool) {
			bool = ((bool == true) ? bool : false);
			bool_isScrollLocked = bool;
		}
		
		var extraLoginRegisterHeight = 0;
		var extraLoginRegisterHeightIncrement = 0;
		var stackArticleContentTop = [];
		
		function repositionArticleContent(bool) {
			var dObj = $('div_articleContent');
			bool = ((bool == true) ? bool : false);
			var oAnchorPosTop = ezAnchorPosition.get$('anchor_articleContentTop');
			if ( (!!dObj) && (!!oAnchorPosTop) ) {
				dObj.style.position = const_absolute_style;
				dObj.style.top = ((bool) ? oAnchorPosTop.y : (document.body.scrollTop + oAnchorPosTop.y + extraLoginRegisterHeight)) + 'px';
				if ( (extraLoginRegisterHeightIncrement == 0) && (stackArticleContentTop.length > 0) ) {
					popArticleContentTop();
				}
				dObj.style.left = 0 + 'px';
				if (!jsBool_isCurrentBlogDefault) {
					var oTD_articleContent = $('td_articleContent');
					var oTD_podContent = $('td_podContent');

					if ( (!!oTD_articleContent) && (!!oTD_podContent) ) {
						var acWidth = parseInt(oTD_articleContent.width);
						var pcWidth = parseInt(oTD_podContent.width);
						if ((acWidth + pcWidth) == 100) {
							dObj.style.width = ((ezClientWidth() * (acWidth / 100)) - 40) + 'px';
						}
					}
				} else {
					dObj.style.left = 20 + 'px';
				}
			}
			if (!!oAnchorPosTop) ezAnchorPosition.remove$(oAnchorPosTop.id);
		}
		
		function performForgotFormSubmitAction() {
			var iObj1 = _$('input_forgot_username');
			if ( (!!performSubmitForgotPasswordForm) && (!!iObj1) ) {
				performSubmitForgotPasswordForm(iObj1.value);
			} else { 
				alert('Cannot submit the Forgot Password dialog due to a technical issue that will be resolved soon.');
			} 
		}
		
		function performLoginFormSubmitAction() {
			var iObj1 = _$('login_input_username');
			var iObj2 = _$('login_input_password');
			if ( (!!performSubmitLoginForm) && (!!iObj1) && (!!iObj2) ) {
				performSubmitLoginForm(iObj1.value, iObj2.value);
			} else { 
				alert('Cannot submit the Login dialog due to a technical issue that will be resolved soon.');
			}
		}
		
		function performRegisterFormSubmitAction() {
			var iObj1 = _$('register_input_username'); 
			var iObj2 = _$('register_input_yourname'); 
			var iObj3 = _$('register_input_password'); 
			var iObj4 = _$('register_input_confirmpassword'); 
			if ( (!!performSubmitRegisterForm) && (!!iObj1) && (!!iObj2) && (!!iObj3) && (!!iObj4) ) { 
				performSubmitRegisterForm(iObj1.value, iObj2.value, iObj3.value, iObj4.value); 
			} else { 
				alert('Cannot submit this Register dialog due to a technical issue that will be resolved soon.'); 
			};
		}
		
		function pushArticleContentTop() {
			var dObj = $('div_articleContent');
			if (!!dObj) {
				stackArticleContentTop.push(dObj.style.top);
			}
		}
		
		function popArticleContentTop() {
			var dObj = $('div_articleContent');
			if (!!dObj) {
				dObj.style.top = stackArticleContentTop.pop();
			}
		}

		function performOpenLoginRegisterWindow2(id) {
			var oTD = _$('td_loginRegisterFrame'); 
			var oODiv = _$('div_loginRegisterOuterWrapper');
			var bool_isLoginForm = ((id.toUpperCase() == 'btn_loginButton'.toUpperCase()) ? true : false);
			var bool_isForgotForm = ((id.toUpperCase() == 'btn_forgotPasswordButton'.toUpperCase()) ? true : false);
			var bool_isRegisterForm = ((id.toUpperCase() == 'btn_registerButton'.toUpperCase()) ? true : false);
			var bool_isPremiumForm = ((id.toUpperCase() == 'btn_purchasePremiumButton'.toUpperCase()) ? true : false);
			var oDiv = _$(((bool_isLoginForm) ? 'div_loginRegisterForm' : ((bool_isForgotForm) ? 'div_forgotPasswordForm' : ((bool_isRegisterForm) ? 'div_registerForm' : ((bool_isPremiumForm) ? 'div_premiumForm' : '')))));
			var oBtn1 = _$('btn_registerButton');
			var oBtn2 = _$('btn_loginButton');
			var oBtn3 = _$('btn_forgotPasswordButton');
			var oBtn4 = _$('btn_purchasePremiumButton');

			function getPremiumContent(id) {
				var html = '';

				html += '<table width="100%">';
				html += '<tr>';

				html += '<td>';
				if ( (jsBool_isDebugMode) || (jsBool_isServerLocal) ) {
					html += '<small><b>[SandBox Mode]</b></small><br>';
				}
				html += '<table width="100%" cellpadding="-1" cellspacing="-1">';

				if (jsBool_isUserPremium) {
					html += '<tr>';
					html += '<td align="left" valign="top">';
					html += '<A HREF="https://www.paypal.com/cgi-bin/webscr?cmd=_subscr-find&alias=payments%40contentopia%2enet">';
					html += '<IMG SRC="https://www.paypal.com/en_US/i/btn/cancel_subscribe_gen.gif" BORDER="0">';
					html += '</A>';
					html += '</td>';
					html += '</tr>';
				} else {
					html += '<tr>';
					html += '<td align="right" valign="top">';
					html += '<form action="' + js_premium_actionURL + '" method="post" target="_blank">';
					html += '<input type="image" src="' + js_premium_imgHost + '/en_US/i/btn/x-click-butcc-subscribe.gif" border="0" name="submit" alt="Make payments with PayPal - it\'s fast, free and secure!">';
					html += '<img alt="" border="0" src="' + js_premium_imgHost + '/en_US/i/scr/pixel.gif" width="1" height="1">';
					html += '<input type="hidden" name="cmd" value="_xclick-subscriptions">';
					html += '<input type="hidden" name="business" value="' + js_premium_businessEmail + '">';
					html += '<input type="hidden" name="item_name" value="Premium Monthly Subscription ColdFusion, JavaScript and AJAX Social Networking Site">';
					html += '<input type="hidden" name="item_number" value="Premium_Subscription_1_Per_Month">';
					html += '<input type="hidden" name="no_shipping" value="1">';
					html += '<input type="hidden" name="return" value="' + js_premium_paypal_returnURL + '">';
					html += '<input type="hidden" name="cancel_return" value="' + js_premium_paypal_cancelReturnURL + '">';
					html += '<input type="hidden" name="no_note" value="1">';
					html += '<input type="hidden" name="currency_code" value="USD">';
					html += '<input type="hidden" name="bn" value="PP-SubscriptionsBF">';
					html += '<input type="hidden" name="a3" value="1.00">';
					html += '<input type="hidden" name="p3" value="1">';
					html += '<input type="hidden" name="t3" value="M">';
					html += '<input type="hidden" name="src" value="1">';
					html += '<input type="hidden" name="sra" value="1">';
					html += '</form>';
					html += '</td>';
					html += '<td align="left" valign="middle">';
					html += '<span class="normalBoldPrompt">Option A. Monthly Premium Access for only $1.00.</span>';
					html += '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td align="right" valign="top">';
					html += '<form action="' + js_premium_actionURL + '" method="post" target="_blank">';
					html += '<input type="image" src="' + js_premium_imgHost + '/en_US/i/btn/x-click-butcc-subscribe.gif" border="0" name="submit" alt="Make payments with PayPal - it\'s fast, free and secure!">';
					html += '<img alt="" border="0" src="' + js_premium_imgHost + '/en_US/i/scr/pixel.gif" width="1" height="1">';
					html += '<input type="hidden" name="cmd" value="_xclick-subscriptions">';
					html += '<input type="hidden" name="business" value="' + js_premium_businessEmail + '">';
					html += '<input type="hidden" name="item_name" value="Premium 6 Months Subscription ColdFusion, JavaScript and AJAX Social Networking Site">';
					html += '<input type="hidden" name="item_number" value="Premium_Subscription_4_Per_6_Months">';
					html += '<input type="hidden" name="no_shipping" value="1">';
					html += '<input type="hidden" name="return" value="' + js_premium_paypal_returnURL6 + '">';
					html += '<input type="hidden" name="cancel_return" value="' + js_premium_paypal_cancelReturnURL6 + '">';
					html += '<input type="hidden" name="no_note" value="1">';
					html += '<input type="hidden" name="currency_code" value="USD">';
					html += '<input type="hidden" name="bn" value="PP-SubscriptionsBF">';
					html += '<input type="hidden" name="a3" value="4.00">';
					html += '<input type="hidden" name="p3" value="6">';
					html += '<input type="hidden" name="t3" value="M">';
					html += '<input type="hidden" name="src" value="1">';
					html += '<input type="hidden" name="sra" value="1">';
					html += '</form>';
					html += '</td>';
					html += '<td align="left" valign="middle">';
					html += '<span class="normalBoldPrompt">Option B. 6 Months Premium Access for only $4.00.</span>';
					html += '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td align="right" valign="top">';
					html += '<form action="' + js_premium_actionURL + '" method="post" target="_blank">';
					html += '<input type="image" src="' + js_premium_imgHost + '/en_US/i/btn/x-click-butcc-subscribe.gif" border="0" name="submit" alt="Make payments with PayPal - it\'s fast, free and secure!">';
					html += '<img alt="" border="0" src="' + js_premium_imgHost + '/en_US/i/scr/pixel.gif" width="1" height="1">';
					html += '<input type="hidden" name="cmd" value="_xclick-subscriptions">';
					html += '<input type="hidden" name="business" value="' + js_premium_businessEmail + '">';
					html += '<input type="hidden" name="item_name" value="Premium 12 Months Subscription ColdFusion, JavaScript and AJAX Social Networking Site">';
					html += '<input type="hidden" name="item_number" value="Premium_Subscription_6_Per_Year">';
					html += '<input type="hidden" name="no_shipping" value="1">';
					html += '<input type="hidden" name="return" value="' + js_premium_paypal_returnURL12 + '">';
					html += '<input type="hidden" name="cancel_return" value="' + js_premium_paypal_cancelReturnURL12 + '">';
					html += '<input type="hidden" name="no_note" value="1">';
					html += '<input type="hidden" name="currency_code" value="USD">';
					html += '<input type="hidden" name="bn" value="PP-SubscriptionsBF">';
					html += '<input type="hidden" name="a3" value="6.00">';
					html += '<input type="hidden" name="p3" value="12">';
					html += '<input type="hidden" name="t3" value="M">';
					html += '<input type="hidden" name="src" value="1">';
					html += '<input type="hidden" name="sra" value="1">';
					html += '</form>';
					html += '</td>';
					html += '<td align="left" valign="middle">';
					html += '<span class="normalBoldPrompt">Option C. 12 Months Premium Access for only $6.00.</span>';
					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</td>';
					html += '</tr>';
				}
				html += '<tr>';
				html += '<td align="left" valign="top">';
				html += '<span class="normalBoldPrompt">';
				html += 'HAL Smalltalker, Inc. is wholly owned by Hierarchical Applications Limited and is responsible for processing our Subscriptions.';
				html += '</span>';
				html += '</td>';
				html += '</tr>';
				
				html += '</table>';

				return html;
			};
			
			function getRegisterLoginForgotFormContent(id) {
				var html = '';
				html += '<table width="80%">';
				html += '<tr>';
				html += '<td><b>' + js_usernameText + '</b></td>';

				html += '<td>';
				html += '<table width="80%" cellpadding="1" cellspacing="1">';
				html += '<tr>';
				html += '<td width="20%">';
				html += '<input type="text" id="' + ((bool_isForgotForm) ? 'input_forgot_username' : ((bool_isLoginForm) ? 'login_input_username' : 'register_input_username')) + '" size="50" maxlength="255">';
				html += '</td>';
				html += '<td width="*">';
				html += '<span class="redBoldPrompt">(Required - Your Real Internet Email Address for a real domain, one that does NOT provide anonymous email services. Your Email Domain MUST be easily verified as an established domain with a functional web presence.)</span>';
				html += '</td>';
				html += '</tr>';
				html += '</table>';
				html += '</td>';

				html += '</tr>';
				if (bool_isLoginForm) {
					html += '<tr>';
					html += '<td><b>' + js_passwordText + '</b></td>';
					html += '<td><input type="password" id="login_input_password" size="30" maxlength="50"></td>';
					html += '</tr>';
				} else if (bool_isRegisterForm) {
					html += '<tr>';
					html += '<td><b>' + js_yournameText + '</b></td>';
					html += '<td><input type="text" id="register_input_yourname" value="" size="30" maxlength="50">&nbsp;<span class="redBoldPrompt">(Required - Your Real Name, first name and last name with a space between.)</span></td>';
					html += '</tr>';

					html += '<tr>';
					html += '<td width="15%"><b>' + js_passwordText + '</b></td>';
					html += '<td width="*">';
					html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
					html += '<tr>';
					html += '<td width="42%" align="left">';
					html += '<input type="password" id="register_input_password" value="" size="30" maxlength="50">&nbsp;<span class="redBoldPrompt">(Required)</span>';
					html += '</td>';
					html += '<td id="td_password_rating" width="20%" align="center" style="border: thin solid silver;">';
					html += '<div id="div_password_rating"></div>';
					html += '</td>';
					html += '<td width="*">';
					html += '&nbsp;';
					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</td>';
					html += '</tr>';

					html += '<tr>';
					html += '<td width="15%"><b>' + js_confirmPasswordText + '</b></td>';
					html += '<td width="*">';
					html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
					html += '<tr>';
					html += '<td width="42%" align="left">';
					html += '<input type="password" id="register_input_confirmpassword" value="" size="30" maxlength="50">&nbsp;<span class="redBoldPrompt">(Required)</span>';
					html += '</td>';
					html += '<td id="td_password_matches" width="20%" align="center" style="border: thin solid silver;">';
					html += '<div id="div_password_matches"></div>';
					html += '</td>';
					html += '<td width="*">';
					html += '&nbsp;';
					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</td>';
					html += '</tr>';
				}
				html += '<tr>';
				html += '<td>';
				html += '<input type="submit" disabled class="buttonClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" id="' + ((bool_isForgotForm) ? 'button_forgotPwdSubmit' : ((bool_isLoginForm) ? 'button_loginSubmit' : 'button_registerSubmit')) + '" value="' + ((bool_isForgotForm) ? js_forgotPasswordText : ((bool_isLoginForm) ? js_loginText : js_registerText)) + '" onclick="this.disabled = true; ((' + bool_isForgotForm + ') ? performForgotFormSubmitAction() : ((' + bool_isLoginForm + ') ? performLoginFormSubmitAction() : performRegisterFormSubmitAction())); return false;">';
				html += '</td>';
				html += '<td>';
				html += '<input type="Button" class="buttonClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" value="' + js_cancelText + '" onclick="if (!!performCloseLoginRegisterWindow) { performCloseLoginRegisterWindow(); } else { alert(\'Cannot dismiss this dialog due to a technical issue that will be resolved soon.\'); }; return false;">';
				html += '</td>';
				html += '</tr>';

				html += '<tr>';
				html += '<td colspan="2">';
				html += '<span id="span_register_newUser_status_message" class="onholdStatusBoldClass"></span>';
				html += '</td>';
				html += '</tr>';

				html += '</table>';
	
				return html;
			};
			
			if ( (!!oTD) && (!!oDiv) && (!!oODiv) ) {
				oTD.style.display = const_inline_style;
				if ( (1) || (registerFormAlreadyPopulated[id] == null) || (registerFormAlreadyPopulated[id] == false) ) {
					if (!!oBtn1) oBtn1.disabled = true;
					if (!!oBtn2) oBtn2.disabled = true;
					if (!!oBtn3) oBtn3.disabled = true;
					if (!!oBtn4) oBtn4.disabled = true;
					var childNodes = oODiv.getElementsByTagName("DIV");
					for (var i = 0; i < childNodes.length; i++) {
						childNodes[i].style.display = ((childNodes[i].id == oDiv.id) ? const_inline_style : const_none_style);
					}
					if (!!oBtn3) oBtn3.disabled = true;
					if (oDiv.innerHTML.length == 0) {
						var sHTML = (((bool_isLoginForm) || (bool_isForgotForm) || (bool_isRegisterForm)) ? getRegisterLoginForgotFormContent(id) : ((bool_isPremiumForm) ? getPremiumContent(id) : 'UNDEFINED OPERATION'));
						oDiv.innerHTML = sHTML;
					}
					registerFormAlreadyPopulated[id] = true;
					if (bool_isRegisterForm) {
						var oInput = _$('register_input_username');
						if (!!oInput) {
							try { oInput.focus(); } catch(e) {};
							oInput.value = '';
							oInput.style.border = 'thin solid black';
							oInput.onkeyup = function registerFormOnKeyUpEventHandler() {
								var obj = $('register_input_password');
								var thisValue = ''; 
								var obj2 = $('register_input_confirmpassword'); 
								var otherValue = ''; 
								if (obj != null) { 
									thisValue = obj.value;
								}; 
								if (obj2 != null) { 
									otherValue = obj2.value; 
								}; 
								return (isValidatedRegisterUserName() || validatePassword(thisValue, otherValue));
							};
						}
						var oDivPwdRating = _$('div_password_rating');
						if (!!oDivPwdRating) {
							oDivPwdRating.innerHTML = '<span id="span_password_rating" class="normalBoldBluePrompt">(Not Rated)</span>';
							oDivPwdRating.style.background = '';
						} else {
							alert('ERROR : Programming Error - Missing the element named "div_password_rating".');
						}
						var oDivPwdMatch = _$('div_password_matches');
						if (!!oDivPwdMatch) {
							oDivPwdMatch.innerHTML = '<span id="span_password_matches" class="redBoldPrompt">&nbsp;(Does Not Match)</span>';
							oDivPwdMatch.style.background = '';
						} else {
							alert('ERROR : Programming Error - Missing the element named "div_password_matches".');
						}
						var oInputYourName = _$('register_input_yourname');
						if (!!oInputYourName) {
							oInputYourName.value = '';
							oInputYourName.style.border = 'thin solid silver';
							oInputYourName.onkeyup = function registerFormOnKeyUpEventHandler() {
								try { return isValidatedRegisterUsersName(); } catch(e) { ezAlertError(ezErrorExplainer(e, 'Programming Error 101 in function named "getRegisterLoginForgotFormContent".'));} finally {}
							};
						}
						var oInputPwd = _$('register_input_password');
						if (!!oInputPwd) {
							oInputPwd.value = '';
							oInputPwd.style.border = 'thin solid silver';
							oInputPwd.onkeyup = function registerFormPwdOnKeyUpEventHandler() {
								try { return validatePassword(this.value); } catch(e) { ezAlertError(ezErrorExplainer(e, 'Programming Error 102 in function named "getRegisterLoginForgotFormContent".'));} finally {}
							};
						}
						var oInputConfirmPwd = _$('register_input_confirmpassword');
						if (!!oInputConfirmPwd) {
							oInputConfirmPwd.value = '';
							oInputConfirmPwd.style.border = 'thin solid silver';
							oInputConfirmPwd.onkeyup = function registerFormConfirmPwdOnKeyUpEventHandler() {
								var obj = $('register_input_password'); 
								otherValue = ''; 
								if (!!obj) { 
									otherValue = obj.value; 
								}; 
								try { return validatePassword(this.value, otherValue); } catch(e) { ezAlertError(ezErrorExplainer(e, 'Programming Error 103 in function named "getRegisterLoginForgotFormContent".'));} finally {}
							};
						}
					} else if (!bool_isPremiumForm) {
						var oInputName = ((bool_isForgotForm) ? 'input_forgot_username' : 'login_input_username');
						var oInput = _$(oInputName);
						if (!!oInput) {
							try { oInput.focus(); } catch(e) {};
							oInput.value = '';
							oInput.style.border = 'thin solid black';
							oInput.onkeyup = function loginForgotFormOnKeyUpEventHandler() {
								if (bool_isLoginForm) {
									if (!!validateLoginUserName) { validateLoginUserName(); };
								} else if (bool_isForgotForm) {
									if (!!validateForgotPasswordUserName) { validateForgotPasswordUserName(); };
								}
							};
							if (bool_isLoginForm) {
								var oInputPwd = _$('login_input_password');
								if (!!oInputPwd) {
									oInputPwd.value = '';
								}
							}
						} else {
							alert('ERROR : Programming Error - Cannot find the element named "' + oInputName + '".');
						}
					}
				}
				pushArticleContentTop();
				extraLoginRegisterHeightIncrement = 120 + ((bool_isRegisterForm) ? 50 : ((bool_isPremiumForm) ? 160 : 0));
				extraLoginRegisterHeight += extraLoginRegisterHeightIncrement;
				repositionArticleContent();
			} else {
				alert('ERROR : Programming Error - Missing oTD [' + oTD + ']' + ', oDiv [' + oDiv + ']' + ', oODiv [' + oODiv + ']');
			}
		}

		function performCloseLoginRegisterWindow() {
			var oTD = _$('td_loginRegisterFrame'); 
			var oBtn = _$('btn_registerButton');
			var oBtn2 = _$('btn_loginButton');
			var oBtn3 = _$('btn_forgotPasswordButton');
			var oBtn4 = _$('btn_closeLoginRegisterFrame');
			var oBtn5 = _$('btn_purchasePremiumButton');
			if (!!oTD) {
				oTD.style.display = const_none_style;
				extraLoginRegisterHeight -= extraLoginRegisterHeightIncrement;
				extraLoginRegisterHeightIncrement = 0;
				repositionArticleContent();
				if (!!oBtn) oBtn.disabled = false;
				if (!!oBtn2) oBtn2.disabled = false;
				if (!!oBtn3) oBtn3.disabled = false;
				if (!!oBtn4) oBtn4.disabled = false;
				if (!!oBtn5) oBtn5.disabled = false;
				repositionArticleContent(true);
			} else {
				alert('ERROR : Programming Error - Missing oTD [' + oTD + ']' + ', oBtn [' + oBtn + ']' + ', oBtn2 [' + oBtn2 + ']' + ', oBtn3 [' + oBtn3 + ']' + ', oBtn4 [' + oBtn4 + ']' + ', oBtn5 [' + oBtn5 + ']');
			}
		}
		
		function injectParmsFrom(d, aKey) {
			var _content = '';
			var _ar = d.getValueFor(aKey);
			if ( (!!_ar) && (typeof _ar == const_object_symbol) ) {
				for (var i = 0; i < _ar.length; i++) {
					if ( (!!_ar[i]) && (typeof _ar[i] == const_string_symbol) ) {
						var _ar2 = _ar[i].split(',');
						if ( (!!_ar2) && (typeof _ar2 == const_object_symbol) ) {
							for (var k = 0; k < _ar2.length; k++) {
								_content += ' ' + _ar2[k];
							}
						}
					}
				}
			}
			return _content;
		}

		function podLayoutHTML(contentHTML, title, podName, vararg_params) {
			var _html = '';
			var aDict = -1;

			try {
				aDict = ezDictObj.get$();
			} catch(ee) {
				ezAlertError(ezErrorExplainer(ee, 'podLayoutHTML() :: Error Handler 1.'));
			} finally {
			}

			try {
				aDict.bool_returnArray = true;
			
				if (arguments.length > 1) {
				    for (var i = 1; i < arguments.length; i++) {
						aDict.fromSpec(arguments[i]);
					}
				}
			} catch(ee) {
				ezAlertError(ezErrorExplainer(ee, 'podLayoutHTML() :: Error Handler 2.'));
			} finally {
			}

			try {
				podName = ((!!podName) ? podName : 'undefined');
			} catch(ee) {
				ezAlertError(ezErrorExplainer(ee, 'podLayoutHTML() :: Error Handler 3.'));
			} finally {
			}

			var bool_doesContainerExist = ((_$('div_podLayoutContainer_' + podName) == null) ? false : true);
			try {
				var _styles = '';
				try { if ((typeof podLayoutContainerStylesCallBack) == const_function_symbol) { _styles = podLayoutContainerStylesCallBack() } } catch(e) { } finally { }
				_html += ((bool_doesContainerExist) ? '' : '<div id="div_podLayoutContainer_' + podName + '" style="width: 400px; overflow: auto;' + _styles + '">');
				_html += '<table width="100%" cellpadding="-1" cellspacing="-1" style="border-left: thin solid Blue; border-right: thin solid Blue;">';
				_html += '<tr>';
				_html += ((!!title) ? '<td align="center" valign="top" class="menuTitle"><span class="menuTitle">' + title + '</span></td>' : '');
				_html += '</tr>';
				_html += '<tr>';
				_html += '<td ' + injectParmsFrom(aDict, 'td') + ' valign="middle">';
				_html += contentHTML;
				_html += '</td>';
				_html += '</tr>';
				_html += '</table>';
				_html += ((bool_doesContainerExist) ? '' : '</div>');
			} catch(ee) {
				ezAlertError(ezErrorExplainer(ee, 'podLayoutHTML() :: Error Handler 4.'));
			} finally {
			}

			return _html;
		}
		
		function logoPod() {
			var parms = '&td=' + 'align="center"'.ezURLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').ezURLEncode();
			var _html = podLayoutHTML('<img src="#logoImage#" width="187" height="171" border="0">', '', 'logoPod', parms);
			return _html;
		}
		
		function ezAJAX_LogoPod() {
			var parms = '&td=' + 'align="center"'.ezURLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').ezURLEncode();
			var html = '<iframe id="iframe_ezAJAX_LogoPod" frameborder="0" width="100%" height="200" scrolling="No" src="#ezAJAX_LogoImage#"></iframe>';
			var _html = podLayoutHTML(html, '', 'logoPod', parms);
			return _html;
		}
		
		function clearBlogArticlesContent() {
			var dObj = $('div_articleContent');
			if (!!dObj) {
				dObj.innerHTML = '';
			} else {
				alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
			}
		}

		function performGetArticleByEntry(id) {
			if (!!id) {
				oAJAXEngine.doAJAX('performGetArticleByEntry', 'handleGetDefaultBlogArticles', 'id', id);
			} else {
				alert('ERROR: Programming Error - Missing the id parm from performGetArticleByEntry().');
			}
		}
		
		function _performSearchPodAction(sKeyword) {
			if (!!sKeyword) {
				sKeyword = ((!!sKeyword) ? sKeyword : '');
				oAJAXEngine.doAJAX('performSearchPodAction', 'handleGetDefaultBlogArticles', 'keyword', sKeyword);
			} else {
				performDefaultBlogSearch();
			}
		}

		function performSearchPodAction(oObj) {
			var oBtn = _$('btn_searchBlog');
			if ( (!!oObj) && (!!oBtn) && (!!oObj.value) && (oObj.value.length > 0) ) {
				oObj.disabled = true;
				oBtn.disabled = true;
				_performSearchPodAction(oObj.value);
			}
		}
		
		function _performSubscribePodAction(sEmailAddress) {
			if (!!sEmailAddress) {
				sEmailAddress = ((!!sEmailAddress) ? sEmailAddress : '');
				oAJAXEngine.doAJAX('performSubscribePodAction', 'handleSubmitRegisterForm', 'emailAddress', sEmailAddress);
			}
		}

		function performSubscribePodAction(oObj) {
			var oBtn = _$('btn_subscribeToBlog');
			if ( (!!oObj) && (!!oBtn) && (!!oObj.value) && (oObj.value.length > 0) ) {
				oObj.disabled = true;
				oBtn.disabled = true;
				_performSubscribePodAction(oObj.value);
			}
		}

		function searchPod() {
			var _html = '';
			_html += '<p align="center">';
			_html += '<input type="text" id="input_searchPod_searchKeyword" name="search" size="40" maxlength="255" onkeydown="if (event.keyCode == 13) { performSearchPodAction(this); }; return true;">';
			_html += '&nbsp;';
			_html += '<button id="btn_searchBlog" class="buttonClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="var oObj = _$(\'input_searchPod_searchKeyword\'); performSearchPodAction(oObj); return false;">Search</button>';
			_html += '</p>';
			return podLayoutHTML(_html, ((jsBool_isCurrentBlogDefault) ? js_searchTitle : 'SEARCH PRODUCT DATABASE'), 'searchPod', '&td=' + 'align="center"'.ezURLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').ezURLEncode());
		}

		function subscribePod() {
			var _html = '';
			_html += js_subscribeBlog;
			_html += '<p align="center">';
			_html += '<input type="text" id="subscribe_user_name" name="email" size="40" maxlength="255" ' + ((jsBool_sessionLoggedin) ? '' : 'disabled title="You may only Subscribe to this Site when you are a Registered User of this Site and you have activated your User Account."') + ' onkeyup="if (!!_validateUserAccountName) { _validateUserAccountName($(\'subscribe_user_name\')); }; if (event.keyCode == 13) { performSubscribePodAction(this); };" onkeydown="var sRed = this.style.border; var iRed = sRed.indexOf(\' red\'); iRed = ((iRed == -1) ? sRed.indexOf(\'red \') : iRed); var boolRed = (iRed != -1); var bool = ( (event.keyCode != 13) || ( (event.keyCode == 13) && (boolRed == false) ) ); if ( (boolRed) && (event.keyCode == 13) ) { alert(this.title); }; return bool;">';
			_html += '&nbsp;';
			_html += '<button id="btn_subscribeToBlog" class="buttonClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="var oObj = _$(\'subscribe_user_name\'); performSubscribePodAction(oObj); return false;">Search</button>';
			_html += '</p>';
			_html += ((jsBool_sessionLoggedin) ? '' : '<span class="redBlogArticleAccessBoldPrompt">You may only Subscribe to this Blog when you are a Registered User of this Site and you have activated your User Account.</span>');
			return podLayoutHTML(_html, js_subscribeTitle, 'subscribePod', '&td=' + 'align="center"'.ezURLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').ezURLEncode());
		}

		function recentArticlesPod(content) {
			return podLayoutHTML(content, js_recentEntries, 'recentArticlesPod');
		}

		function paypalPod() {
			var _html = '';
			_html += '<br><form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">';
			_html += '<input type="hidden" name="cmd" value="_s-xclick">';
			_html += '<input type="image" src="https://www.paypal.com/en_US/i/btn/x-click-but21.gif" border="0" name="submit" alt="Make payments with PayPal - it\'s fast, free and secure!">';
			_html += '<img alt="" border="0" src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">';
			_html += '<input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----MIIHVwYJKoZIhvcNAQcEoIIHSDCCB0QCAQExggEwMIIBLAIBADCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwDQYJKoZIhvcNAQEBBQAEgYBF/FHRK4ERpBG3ZATc9w1YuWD5iF2XU/SkVCYqXX9SZwsGZlVNQpP3kE3iG5Faplikr9VyAwXkpnEkqntC1XiNmphnZjmg7f0g7uAAfcbe5iHk3SJiP2S7V9KPqguTrtSk7KvVOwwcUhV6nYe/oBs5lsrjk8PN+9Wl5NgWym9AWTELMAkGBSsOAwIaBQAwgdQGCSqGSIb3DQEHATAUBggqhkiG9w0DBwQIJBGw+9zS+haAgbAN0ljt+/dLwA9mTU1ZgM3ZRt4jbaAMg68dP7cSwBVURtRjNAzQ8mrcfARmSRYgnIwh+cr93t3iUNlWIm829HiLEgO9VTsGiNvioo3E5g0QmyhPrpzc+//vt2S13xp3I5EOHgnQww6w1RLGLYoZASFGMB7pTLAjVe7VQP0QlkNa1K6gjxTth5hNebZLaXd/qNCuLZKbIjRUdd03NG5tb/xVVfxoP029dUtxAi33+geXz6CCA4cwggODMIIC7KADAgECAgEAMA0GCSqGSIb3DQEBBQUAMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbTAeFw0wNDAyMTMxMDEzMTVaFw0zNTAyMTMxMDEzMTVaMIGOMQswCQYDVQQGEwJVUzELMAkGA1UECBMCQ0ExFjAUBgNVBAcTDU1vdW50YWluIFZpZXcxFDASBgNVBAoTC1BheVBhbCBJbmMuMRMwEQYDVQQLFApsaXZlX2NlcnRzMREwDwYDVQQDFAhsaXZlX2FwaTEcMBoGCSqGSIb3DQEJARYNcmVAcGF5cGFsLmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAwUdO3fxEzEtcnI7ZKZL412XvZPugoni7i7D7prCe0AtaHTc97CYgm7NsAtJyxNLixmhLV8pyIEaiHXWAh8fPKW+R017+EmXrr9EaquPmsVvTywAAE1PMNOKqo2kl4Gxiz9zZqIajOm1fZGWcGS0f5JQ2kBqNbvbg2/Za+GJ/qwUCAwEAAaOB7jCB6zAdBgNVHQ4EFgQUlp98u8ZvF71ZP1LXChvsENZklGswgbsGA1UdIwSBszCBsIAUlp98u8ZvF71ZP1LXChvsENZklGuhgZSkgZEwgY4xCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEWMBQGA1UEBxMNTW91bnRhaW4gVmlldzEUMBIGA1UEChMLUGF5UGFsIEluYy4xEzARBgNVBAsUCmxpdmVfY2VydHMxETAPBgNVBAMUCGxpdmVfYXBpMRwwGgYJKoZIhvcNAQkBFg1yZUBwYXlwYWwuY29tggEAMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADgYEAgV86VpqAWuXvX6Oro4qJ1tYVIT5DgWpE692Ag422H7yRIr/9j/iKG4Thia/Oflx4TdL+IFJBAyPK9v6zZNZtBgPBynXb048hsP16l2vi0k5Q2JKiPDsEfBhGI+HnxLXEaUWAcVfCsQFvd2A1sxRr67ip5y2wwBelUecP3AjJ+YcxggGaMIIBlgIBATCBlDCBjjELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAkNBMRYwFAYDVQQHEw1Nb3VudGFpbiBWaWV3MRQwEgYDVQQKEwtQYXlQYWwgSW5jLjETMBEGA1UECxQKbGl2ZV9jZXJ0czERMA8GA1UEAxQIbGl2ZV9hcGkxHDAaBgkqhkiG9w0BCQEWDXJlQHBheXBhbC5jb20CAQAwCQYFKw4DAhoFAKBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MDMzMTIyNDkyMlowIwYJKoZIhvcNAQkEMRYEFD6b4rgJBzwj5eJNAPmf7l4G39Q5MA0GCSqGSIb3DQEBAQUABIGAt8Ejk3cERePtfvoPQzq+ANQn2VUVC2YyqlU8qdTXkIufg66uHovUkY6wW6KhbI1/TU5bw3nD+rXIOyZtHQKKtlhEi0rjfn/M1mSbSh8O2uv21Q5EyniN/hKsQTkoF7rHrAUjVzZz+QApptdFQRawZDZFU+K8LHwPQg+YhzUUQ84=-----END PKCS7-----">';
			_html += '</form>';
			return podLayoutHTML(_html, 'Support this Blog', 'paypalPod', '&td=' + 'align="center"'.ezURLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').ezURLEncode());
		}
		
		function sampleAJAXAppsPod() {
			var _html = '';
			_html += '<a href="" onclick="' + jsCodeDemoWaferAnalysis + '; return false;">Semiconductor Wafer Analysis</a>';
			return podLayoutHTML(_html, 'Sample ezAJAX' + js_trademarkSymbol + ' Apps', 'sampleAJAXAppsPod', '&td=' + 'align="center"'.ezURLEncode());
		}
		
		function projectsPod_ezAJAX_action() {
			oAJAXEngine.doAJAX('changeBlogDesignation', 'handleSubmitRegisterForm', 'blogname', 'ezajax');
		}
		
		function projectsPod() {
			var _html = '';
			_html += '<a href="' + js_ezAJAX_productLink + '" target="_top">ezAJAX' + js_trademarkSymbol + '</a>';
			return podLayoutHTML(_html, 'Projects', 'projectsPod', '&td=' + 'align="center"'.ezURLEncode());
		}
		
		function _gamesPod_onClick_action(gamePath, gameName, width, height) {
			gamePath = ((gamePath != null) ? gamePath : '');
			gameName = ((gameName != null) ? gameName : '');
			width = ((width != null) ? width : 800);
			height = ((height != null) ? height : 600);
			if (jsBool_sessionLoggedin) {
				var _pURL = ezFullyQualifiedAppUrl();
				var pURL = _pURL + gamePath;
				window.open(pURL,gameName,'width=' + width + ',height=' + height + ',resizeable=yes,scrollbars=1');
			} else {
				try {
					gamesRequiresUserAccountBlock();
				} catch(e) {
					ezAlertError(ezErrorExplainer(e, 'Programming Error in function named "_gamesPod_onClick_action".'));
				} finally {
				}
			}
		}
		
		function gamesPod_asteroids_action() {
			return _gamesPod_onClick_action('/games/asteroids/asteroids' + (( (jsBool_sessionLoggedin) && (jsBool_isUserPremium) ) ? 'P' : '') + '.html', 'asteroidsGame', 700, 600);
		}
		
		function gamesPod_crusader_action() {
			return _gamesPod_onClick_action('/games/crusader/crusader' + (( (jsBool_sessionLoggedin) && (jsBool_isUserPremium) ) ? 'P' : '') + '.html', 'crusaderGame', 850, 450);
		}
		
		function gamesPod_roadSafety_action() {
			return _gamesPod_onClick_action('/games/roadSafety/car_game' + (( (jsBool_sessionLoggedin) && (jsBool_isUserPremium) ) ? 'P' : '') + '.html', 'roadSafetyGame', 600, 600);
		}
		
		function gamesPod_pacman_action() {
			return _gamesPod_onClick_action('/games/pacman/pacman' + (( (jsBool_sessionLoggedin) && (jsBool_isUserPremium) ) ? 'P' : '') + '.html', 'pacmanGame', 525, 550);
		}
		
		function gamesPod() {
			var _html = '';
			_html += '<a href="" onclick="gamesPod_asteroids_action(); return false;">Asteroids (Flash Game)</a><br>';
			_html += '<a href="" onclick="gamesPod_crusader_action(); return false;">Crusader (Flash Game)</a><br>';
			_html += '<a href="" onclick="gamesPod_roadSafety_action(); return false;">Road Safety (Flash Game)</a><br>';
			_html += '<a href="" onclick="gamesPod_pacman_action(); return false;">Pacman (Flash Game)</a>';
			return podLayoutHTML(_html, 'Games People Play', 'gamesPod', '&td=' + 'align="center"'.ezURLEncode());
		}
		
		function defaultBlogPod_ezAJAX_action() {
			oAJAXEngine.doAJAX('changeBlogDesignation', 'handleSubmitRegisterForm', 'blogname', 'default');
		}
		
		function defaultBlogPod() {
			var _html = '';
			_html += '<a href="' + js_urlDefaultBlogSite + '" target="_top">ColdFusion/AJAX/JavaScript Blog</a>';
			return podLayoutHTML(_html, 'Sponsors', 'defaultBlogPod', '&td=' + 'align="center"'.ezURLEncode());
		}
		
		function populatePodContent() {
			var html = '';
			var dObj = $(js_const_div_podContent);
			if (!!dObj) {
				try {
					html = ((jsBool_isCurrentBlogDefault) ? logoPod() : ezAJAX_LogoPod());
				} catch(ee) {
					ezAlertError(ezErrorExplainer(ee, 'populatePodContent() :: Error Handler 1.' + ' jsBool_isCurrentBlogDefault = [' + jsBool_isCurrentBlogDefault + ']'));
				} finally {
				}

				try {
		//			html += ((jsBool_isCurrentBlogDefault) ? projectsPod() + gamesPod() : defaultBlogPod()) + searchPod();
				} catch(ee) {
					ezAlertError(ezErrorExplainer(ee, 'populatePodContent() :: Error Handler 1.1' + ' jsBool_isCurrentBlogDefault = [' + jsBool_isCurrentBlogDefault + ']'));
				} finally {
				}

				try {
					oAJAXEngine.doAJAX('getRecentArticles', 'handleGetRecentArticles');
				} catch(ee) {
					ezAlertError(ezErrorExplainer(ee, 'populatePodContent() :: Error Handler 2.'));
				} finally {
				}

				try {
					dObj.innerHTML = html;
				} catch(ee) {
					ezAlertError(ezErrorExplainer(ee, 'populatePodContent() :: Error Handler 3.'));
				} finally {
				}
			}
		}
		
		function queueUpAJAX() {
			populatePodContent();
		}

		function windowOnUnloadCallback() {
			clearInterval(tid_ajax_updateBlogStatsDateTime);
			tid_ajax_updateBlogStatsDateTime = -1;

			clearInterval(tid_updateBlogStatsDateTime);
			tid_updateBlogStatsDateTime = -1;
		}
				
		function populateActualUsersOnline() {
			oAJAXEngine.doAJAX('getActualUsersOnline', 'handleSubmitRegisterForm');
		}
		
		oAJAXEngine.register_ezAJAX_function("queueUpAJAX();");

		function updateBlogStatsDateTime() {
			try {
				var tObj = _$('div_actualUsersOnlineStats0');
				if (!!tObj) {
					var i = -1;
					var ar = tObj.innerHTML.split(',');
					for (i = 0; i < ar.length; i++) {
						ar[i] = ar[i].split(' ');
					}
					var dt = new Date(tObj.innerHTML);
					if (!isNaN(dt)) {
						dt.setSeconds(dt.getSeconds() + 1);
						tObj.innerHTML = dt.toLocaleString() + ' ' + ar[2][ar[2].length - 1];
					} else {
					}
				}
			} catch(e) {
	//			ezErrorExplainer(e, '111', true);
			} finally {
			}
		}
	
		function ajax_updateBlogStatsDateTime() {
			if (oAJAXEngine.isIdle()) {
				populateActualUsersOnline();
			}
		}

		var tid_updateBlogStatsDateTime = ((js_isDebugMode) ? -1 : setInterval("updateBlogStatsDateTime()", 1000));
		var tid_ajax_updateBlogStatsDateTime = ((js_isDebugMode) ? -1 : setInterval("ajax_updateBlogStatsDateTime()", 1000 * 30));
		
		function handleSubmitRegisterForm(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var argsDict = ezDictObj.get$();
			var aDict = -1;
			var html = '';
			
			function searchForStatusRecs(_ri, _dict, _rowCntName) {
				var _ISVALID = _dict.getValueFor('ISVALID');
				var _LOGGEDIN = _dict.getValueFor('LOGGEDIN');
				var _ISFORGOTPASSWORD = _dict.getValueFor('ISFORGOTPASSWORD');
				var _ISBLOGSUBSCRIBED = _dict.getValueFor('ISBLOGSUBSCRIBED');
				var _ACTUALUSERSONLINE = _dict.getValueFor('ACTUALUSERSONLINE');
				var _BLOGNAME = _dict.getValueFor('BLOGNAME');
				var _STATUSMSG = _dict.getValueFor('STATUSMSG');
				if ( (aDict == -1) && ( ( (!!_ISVALID) && (!!_LOGGEDIN) ) || (!!_ISFORGOTPASSWORD) || (!!_ISBLOGSUBSCRIBED) || (!!_ACTUALUSERSONLINE) || (!!_BLOGNAME) || (!!_STATUSMSG) ) ) {
					aDict = ezDictObj.get$(_dict.asQueryString(','));
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						qData1[0].iterateRecObjs(searchForStatusRecs);

						if (aDict != -1) {
							var _ISVALID = aDict.getValueFor('ISVALID');
							var _LOGGEDIN = aDict.getValueFor('LOGGEDIN');
							var _ISFORGOTPASSWORD = aDict.getValueFor('ISFORGOTPASSWORD');
							var _ISBLOGSUBSCRIBED = aDict.getValueFor('ISBLOGSUBSCRIBED');
							var _ACTUALUSERSONLINE = aDict.getValueFor('ACTUALUSERSONLINE');
							var _BLOGNAME = aDict.getValueFor('BLOGNAME');
							var _STATUSMSG = aDict.getValueFor('STATUSMSG');

							if ( (_ACTUALUSERSONLINE == null) || (!!_STATUSMSG) ) {
								performCloseLoginRegisterWindow();
							}

							if ( (!!_ISVALID) && (!!_LOGGEDIN) ) {
								_ISVALID = parseInt(_ISVALID);
								_LOGGEDIN = parseInt(_LOGGEDIN);
								if ( (_ISVALID == 1) && (_LOGGEDIN == 1) ) {
									alert('Your Login Request was Successful.');
									window.location.href = window.location.href;
								} else if ( (_ISVALID == 0) && (_LOGGEDIN == 0) ) {
									alert('Your Logoff Request was Successful.');
									window.location.href = window.location.href;
								} else if ( (_ISVALID < 0) && (_LOGGEDIN == 0) ) {
									alert('Your Login Request was unSuccessful.\n\nBecause you are already logged-in from a different workstation than the one you are using now OR your previous login session has not yet timed-out which means you may wish to return later-on and try again. Keep in mind, you may not share your user account with anyone other than yourself.');
									var oBtnFP = _$('btn_forgotPasswordButton');
									if (!!oBtnFP) {
										oBtnFP.onclick();
									}
								}
							} else if (!!_ISFORGOTPASSWORD) {
								alert('An Email was sent to you with your password with a status of "' + _ISFORGOTPASSWORD + '".');
							} else if (!!_ISBLOGSUBSCRIBED) {
								var oInput = _$('subscribe_user_name');
								if (!!oInput) {
									oInput.disabled = false;
									oInput.value = '';
								}
								var oBtn = _$('btn_subscribeToBlog');
								if (!!oBtn) {
									oBtn.disabled = false;
								}
								alert('You are now a subscriber to this Blog.');
							} else if (!!_ACTUALUSERSONLINE) {
								var oDiv = _$('div_actualUsersOnlineStats');
								if (!!oDiv) {
									oDiv.innerHTML = _ACTUALUSERSONLINE;
								}
							} else if (!!_BLOGNAME) {
								var sMsg = ((_BLOGNAME.toUpperCase() == 'DEFAULT') ? 'ColdFusion/AJAX/JavaScript Blog' : 'ezAJAX(tm) Commercial Product Site');
								var ar = window.location.href.split('?');
								if (ar.length > 1) {
									var pDict = ezDictObj.get$(ar[1]);
									var _mode = pDict.getValueFor('mode');
									if (_mode != null) {
										pDict.drop('mode');
									}
									var _entry = pDict.getValueFor('entry');
									if (_entry != null) {
										pDict.drop('entry');
									}
									ar[1] = pDict.asQueryString();
								}
								if (window.location.href.toLowerCase().indexOf('/name/ezajax/') > -1) {
									window.location.href = fqServerName + '/name/default/';
								} else {
									window.location.href = fqServerName + '/name/ezajax/';
								}
							} else if (!!_STATUSMSG) {
								alert(_STATUSMSG);
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

		function handleSearchPodActionResponse(qObj, nRecs, qStats, argsDict, qData1) {
			var aDict = -1;
			
			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						var oObj = _$('input_searchPod_searchKeyword');
						if (!!oObj) {
							oObj.disabled = false;
						}

						var oObj = _$('btn_searchBlog');
						if (!!oObj) {
							oObj.disabled = false;
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

		function handleGetRecentArticles(qObj, nRecs, qStats, argsDict, qData1) {
			var aDict = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			var articleNum = 0;
			
			function searchForRecentArticles(_ri, _dict, _rowCntName) {
				var _ID = _dict.getValueFor('ID');
				var _TITLE = _dict.getValueFor('TITLE');
				var _URL = _dict.getValueFor('URL');
				if ( (!!_ID) && (!!_TITLE) ) {
					bgColor = (((articleNum % 2) == 0) ? "##FFFFA8" : "##BFFFFF");
					html += '<tr>';
					html += '<td bgcolor="' + bgColor + '">';
					html += '&nbsp;&nbsp;<small><NOBR><a href="" name="' + _ID + '" onclick="performGetArticleByEntry(this.name); return false;">' + _TITLE + '</a></NOBR></small>';
					html += '</td>';
					html += '</tr>';
					articleNum++;
				}
			};

			function handleRecentPodContainerStylesCallback() {
				var yInc = articleNum * 20;
				return ' height: ' + yInc + 'px;';
			};
			
			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						var _boolUpdate = argsDict.getValueFor('boolUpdate');
						var isBoolUpdate = ((_boolUpdate != null) ? true : false);
						
						qData1[0].iterateRecObjs(searchForRecentArticles);
						
						var _html = '';
						_html += '<table width="100%" height="100%" cellpadding="-1" cellspacing="-1">';
						_html += html;
						_html += '</table>';

						if (!isBoolUpdate) {
							var dObj = $(js_const_div_podContent);
							if (!!dObj) {
								podLayoutContainerStylesCallBack = handleRecentPodContainerStylesCallback;
								var rapContent = recentArticlesPod(_html);
								podLayoutContainerStylesCallBack = -1;
								dObj.innerHTML += ((jsBool_isCurrentBlogDefault) ? rapContent : '') + ((jsBool_isCurrentBlogDefault) ? paypalPod() : '') + sampleAJAXAppsPod();
								oAJAXEngine.doAJAX('getDownloadsMetaData', 'handleGetDownloadsMetaData');
							}
						} else {
							var dObj = _$('div_podLayoutContainer_recentArticlesPod');
							if (!!dObj) {
								dObj.innerHTML = recentArticlesPod(_html);
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

		function handleGetDownloadsMetaData(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var dirDict = -1;
			var html = '';
			
			function searchForDirData(_ri, _dict, _rowCntName) {
				var _NAME = _dict.getValueFor('NAME');
				var _DIRECTORY = _dict.getValueFor('DIRECTORY');
				if ( (dirDict == -1) && (!!_NAME) && (!!_DIRECTORY) ) {
					dirDict = ezDictObj.get$(_dict.asQueryString());
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						qData1[0].iterateRecObjs(searchForDirData);

						var fName = '';
						try {
							fName = dirDict.getValueFor('DIRECTORY') + '\\' + dirDict.getValueFor('NAME');
						} catch(e) {
							ezAlert(ezErrorExplainer(e, '111. Error in function named "handleGetDownloadsMetaData".'));
						} finally {
						}
		//				ezAlert('fName = [' + fName + ']');
						oAJAXEngine.doAJAX('getDownloadsFolder', 'handleGetDownloadsFolder', 'folderName', fName);
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

		function performOpenDownloadsFile(oBtn) {
			var hRef = window.location.href;
			if (!!oBtn) {
				var cFolder = ezFirstFolderAfterDomainNameFromHref(hRef);
				var _hRef = ezFilePath2HrefUsingCommonFolder(oBtn.name, hRef, cFolder) + '?sessid=' + jsSessID;
				if ( (!jsBool_isCurrentBlogDefault) || ( (jsBool_isCurrentBlogDefault) && (jsBool_sessionLoggedin) && (jsBool_isUserPremium) ) ) {
					if (_hRef.toUpperCase().indexOf('.ZIP') > -1) {
						var oForm = _$('form_downloadFile');
						if (!!oForm) {
							oForm.action = _hRef;
							oForm.submit();
						}
					} else if (_hRef.toUpperCase().indexOf('.HTML') > -1) {
						var _pURL = ezFullyQualifiedAppUrl();
						var pURL = _pURL + '/blog/cfcontent_html.cfm?sessid=' + jsSessID + '&_sessionid=' + jsSessionid + '&href=' + _hRef.ezURLEncode();
						window.open(pURL,'downloadFile','width=800,height=600,resizeable=yes,scrollbars=1');
					} else {
						var _pURL = ezFullyQualifiedAppUrl();
						var pURL = _pURL + '/blog/cfcontent_html.cfm?sessid=' + jsSessID + '&href=' + _hRef.ezURLEncode();
						window.open(pURL,'downloadFile','width=800,height=600,resizeable=yes,scrollbars=1');
					}
				} else {
					try {
						downloadsRequiresPremiumBlock();
					} catch(e) {
						ezAlertError(ezErrorExplainer(e, 'Programming Error in function named "performOpenDownloadsFile".'));
					} finally {
					}
				}
			}
		}
		
		function performOpenDownloadsObject(oBtn) {
			var ar = -1;
			var imgAR = -1;
			var sName = '';
			var iLevel = -1;
			if (!!oBtn) {
				var ar = oBtn.id.split('|');
				if (ar.length == 3) {
					iLevel = ar[1];
					sName = ar[ar.length - 1];
				}
				var boolFireButtonAction = false;
				var dName = 'div_downloadsChild_' + iLevel + '_' + sName;
				var oDiv = _$(dName);
				if (!!oDiv) {
					boolFireButtonAction = (oDiv.innerHTML.length == 0);
					var oBtnImg = _$('img_downloadsButton_' + iLevel + '_' + sName);
					if (!boolFireButtonAction) {
						var oDiv2 = _$('div_downloadsChildContainer_' + iLevel + '_' + sName);
						if (!!oDiv2) {
							oDiv2.style.display = const_none_style
						}
						oDiv.innerHTML = '';
					}
					if (!!oBtnImg) {
						imgAR = oBtnImg.src.split('/');
						imgAR[imgAR.length - 1] = ((boolFireButtonAction) ? 'FolderOpen.gif' : 'FolderClosed.gif');
						oBtnImg.src = imgAR.join('/');
					}
				}
				if (boolFireButtonAction) {
					oBtn.disabled = true;
					oAJAXEngine.doAJAX('getDirectoryContents', 'handleGetDownloadsFolder', 'levelNum', iLevel, 'buttonID', oBtn.id, 'folderName', oBtn.name);
				}
			}
		}
		
		var sCommunityEditionDownloadHref = '';
		
		function handleGetDownloadsFolder(qObj, nRecs, qStats, argsDict, qData1) {
			var aDict = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			var _indentLevel = 1;
			var iLevel = -1;
			var sBtnID = '';
			var isLevelZero = false;
			
			function searchForDirData(_ri, _dict, _rowCntName) {
				var isTypeDir = false;
				var _NAME = _dict.getValueFor('NAME');
				var _DIRECTORY = _dict.getValueFor('DIRECTORY');
				var _TYPE = _dict.getValueFor('TYPE');
				if ( (!!_NAME) && (!!_DIRECTORY) && (!!_TYPE) ) {
					isTypeDir =  (_TYPE.toUpperCase() == 'Dir'.toUpperCase());
					html += '<tr>';
					html += '<td>';
					html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
					html += '<tr>';
					html += '<td valign="top" align="left">';

					var hRef = ezFullyQualifiedAppUrl();
					var cFolder = ezFirstFolderAfterDomainNameFromHref(hRef);
					if (cFolder.length == 0) {
						cFolder = hRef.split('/').pop();
					}
					var bName = _DIRECTORY + '\\' + _NAME;
			//		var _hRef = ezFilePath2HrefUsingCommonFolder(bName, hRef, cFolder);
					var _hRef = hRef + _DIRECTORY.substr(_DIRECTORY.indexOf(js_CGI_SERVER_NAME) + js_CGI_SERVER_NAME.length, _DIRECTORY.length) + '/' + _NAME;
					if (!jsBool_isCurrentBlogDefault) {
						if (_hRef.toUpperCase().indexOf('.EXE') > -1) {
							sCommunityEditionDownloadHref = _hRef;
						}
						html += '<a href="' + _hRef + '" target="_blank">' + ((isTypeDir) ? '&nbsp;<img id="img_downloadsButton_' + _indentLevel + '_' + _NAME + '" src="' + _fqServerName + '/app/images/FolderClosed.gif" width="16" height="16" border="0">&nbsp;' : '&nbsp;<img src="' + _fqServerName + '/app/images/Link.gif" width="18" height="18" border="0">&nbsp;') + _NAME + '</a>';
					} else {
						html += '<button type="button" id="btn_downloads|' + _indentLevel + '|' + _NAME + '" name="' + _DIRECTORY + '\\' + _NAME + '" class="buttonDirectoryClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="' + ((isTypeDir) ? 'performOpenDownloadsObject(this)' : 'performOpenDownloadsFile(this)') + '; return false;">' + ((isTypeDir) ? '&nbsp;<img id="img_downloadsButton_' + _indentLevel + '_' + _NAME + '" src="' + _fqServerName + '/app/images/FolderClosed.gif" width="16" height="16" border="0">&nbsp;' : '&nbsp;<img src="' + _fqServerName + '/app/images/Link.gif" width="18" height="18" border="0">&nbsp;') + _NAME + '</button>';
					}

					html += '</td>';
					html += '</tr>';
					html += '<tr>';
					html += '<td>';

					html += '<div id="div_downloadsChildContainer_' + _indentLevel + '_' + _NAME + '" style="display: none;">';
					html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
					html += '<tr>';
					html += '<td width="' + (_indentLevel * 20) + '">&nbsp;</td>';
					html += '<td width="*">';
					html += '<div id="div_downloadsChild_' + _indentLevel + '_' + _NAME + '"></div>';
					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</div>';

					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</td>';
					html += '</tr>';
				}
			};
//	ezAlert('qObj = [' + qObj + ']');
			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						iLevel = argsDict.getValueFor('levelNum');
						sBtnID = argsDict.getValueFor('buttonID');
						isLevelZero = ( (iLevel == null) && (sBtnID == null) );
						
						if ( (!isLevelZero) && (iLevel != null) ) {
							iLevel = parseInt(iLevel);
							_indentLevel = iLevel + 1;
						}
						
						html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
						qData1[0].iterateRecObjs(searchForDirData);
						html += '</table>';

						var dObj = $(js_const_div_podContent);
						if (!!dObj) {
							var oBtn = _$(sBtnID);
							if (!!oBtn) {
								oBtn.disabled = false;
							}
							if (isLevelZero) {
								dObj.innerHTML += podLayoutHTML(html, js_downloadsTitle, 'downloadsPod', '&td=' + 'align="center"'.ezURLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').ezURLEncode());
							} else {
								var ar = sBtnID.split('|');
								var _name = ar[ar.length - 1];
								var dObj2 = _$('div_downloadsChild_' + iLevel + '_' + _name);
								if (!!dObj2) {
									dObj2.innerHTML = html;
								}
								var dObj2a = _$('div_downloadsChildContainer_' + iLevel + '_' + _name);
								if (!!dObj2a) {
									dObj2a.style.display = const_inline_style;
								}
							}
						}
						if (isLevelZero) {
							oAJAXEngine.doAJAX('getCalendarMetaData', 'handleGetCalendarMetaData');
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

		function performCalendarPrevMonth(qStr) {
			var dict = ezDictObj.get$(qStr);
			dict.URLDecode();
			var lastMonth = dict.getValueFor('LASTMONTH');
			if (!!lastMonth) {
				_dt = new Date(lastMonth);
			}
			oAJAXEngine.doAJAX('getCalendarMetaData', 'handleGetCalendarMetaData', 'month', _dt.getMonth(), 'year', _dt.getFullYear());
		}
		
		function performCalendarNextMonth(qStr) {
			var dict = ezDictObj.get$(qStr);
			dict.URLDecode();
			var nextMonth = dict.getValueFor('NEXTMONTH');
			if (!!nextMonth) {
				_dt = new Date(nextMonth);
			}
			oAJAXEngine.doAJAX('getCalendarMetaData', 'handleGetCalendarMetaData', 'month', _dt.getMonth(), 'year', _dt.getFullYear());
		}
		
		function performViewingArticlesByDay(id) {
			if (!!id) {
				var ar = id.split('_');
				if (ar.length > 3) {
					oAJAXEngine.doAJAX('getBlogArticlesByDay', 'handleGetDefaultBlogArticles', 'month', parseInt(ar[ar.length - 3]) - 1, 'day', ar[ar.length - 2], 'year', ar[ar.length - 1]);
				}
			}
		}
		
		var currentCategoryName = '';
		var currentCategoryID = '';
		
		function performViewingArticlesByCategoryName(catName) {
			if (!!catName) {
				currentCategoryName = catName;
				currentCategoryID = '';
				oAJAXEngine.doAJAX('getBlogArticlesByCategory', 'handleGetDefaultBlogArticles', 'catName', catName);
			}
		}
		
		function performViewingArticlesByCategoryID(catID, catName) {
			if (!!catID) {
				currentCategoryID = catID;
				currentCategoryName = catName;
				oAJAXEngine.doAJAX('getBlogArticlesByCategory', 'handleGetDefaultBlogArticles', 'catid', catID);
			}
		}
		
		function performViewingArticlesByCategory(oBtn, catID, catName) {
			if ( (!!oBtn) && (!!catID) ) {
				var ar = oBtn.id.toString().split('_');
				currentCategoryName = catName;
				oAJAXEngine.doAJAX('getBlogArticlesByCategory', 'handleGetDefaultBlogArticles', 'catid', catID);
			}
		}
		
		function performViewingArticlesByMonth(qStr) {
			var dict = ezDictObj.get$(qStr);
			dict.URLDecode();
			var firstDay = dict.getValueFor('FIRSTDAY');
			if (!!firstDay) {
				_dt = new Date(firstDay);
			}
			oAJAXEngine.doAJAX('getBlogArticlesByDay', 'handleGetDefaultBlogArticles', 'month', _dt.getMonth(), 'year', _dt.getFullYear());
		}
		
		function handleGetCalendarMetaData(qObj, nRecs, qStats, argsDict, qData1) {
			var aDict = -1;
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			
			function searchForCalendarMetaData(_ri, _dict, _rowCntName) {
				var _DAYSINMONTH = _dict.getValueFor('DAYSINMONTH');
				if ( (aDict == -1) && (!!_DAYSINMONTH) ) {
					aDict = ezDictObj.get$(_dict.asQueryString(','));
				}
			};

			function calendarContent() {
				var _ISBIDI = aDict.getValueFor('ISBIDI');
				var _LOCALIZEDMONTH = aDict.getValueFor('LOCALIZEDMONTH');
				var _LOCALIZEDYEAR = aDict.getValueFor('LOCALIZEDYEAR');
				var _LOCALIZEDDAYS = aDict.getValueFor('LOCALIZEDDAYS');
				var _FIRSTWEEKPAD = aDict.getValueFor('FIRSTWEEKPAD');
				var _DAYCOUNTER = aDict.getValueFor('DAYCOUNTER');
				var _DIM = aDict.getValueFor('DIM');
				var _ROWCOUNTER = aDict.getValueFor('ROWCOUNTER');
				var _DAYLIST = aDict.getValueFor('DAYLIST');
				var _FIRSTDAY = aDict.getValueFor('FIRSTDAY');
				
				if ( (_ISBIDI != null) && (_LOCALIZEDMONTH != null) && (_LOCALIZEDYEAR != null) && (_LOCALIZEDDAYS != null) && (_FIRSTWEEKPAD != null) && (_DAYCOUNTER != null) && (_DIM != null) && (_ROWCOUNTER != null) && (_DAYLIST != null) && (_FIRSTDAY != null) ) {
					_DAYCOUNTER = parseInt(_DAYCOUNTER);
					_FIRSTWEEKPAD = parseInt(_FIRSTWEEKPAD);
					_DIM = parseInt(_DIM);
					_ROWCOUNTER = parseInt(_ROWCOUNTER);

					var _FIRSTDAYdt = new Date(_FIRSTDAY);
					
					var _f = -1;
					var _DAYLISTar = _DAYLIST.split(',');
					for (k = 0; k < _DAYLISTar.length; k++) {
						_DAYLISTar[k] = parseInt(_DAYLISTar[k]);
					}

					html += '<tr><td>';
					html += '<div class="header">';
				
					if (_ISBIDI) {
						html += '<button type="button" id="btn_calendar_prev" class="' + ((browser_is_ff || browser_is_ns) ? 'buttonMenuClassFF' : 'buttonClass') + '" onclick="performCalendarPrevMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_this" class="' + ((browser_is_ff || browser_is_ns) ? 'buttonMenuClassFF' : 'buttonClass') + '" onclick="performViewingArticlesByMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;' + _LOCALIZEDMONTH + '&nbsp;' + _LOCALIZEDYEAR + '&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_next" class="' + ((browser_is_ff || browser_is_ns) ? 'buttonMenuClassFF' : 'buttonClass') + '" onclick="performCalendarNextMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;' + '</button>';
					} else {
						html += '<button type="button" id="btn_calendar_prev" class="' + ((browser_is_ff || browser_is_ns) ? 'buttonMenuClassFF' : 'buttonClass') + '" onclick="performCalendarPrevMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_this" class="' + ((browser_is_ff || browser_is_ns) ? 'buttonMenuClassFF' : 'buttonClass') + '" onclick="performViewingArticlesByMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;' + _LOCALIZEDMONTH + '&nbsp;' + _LOCALIZEDYEAR + '&nbsp;&nbsp;' + '</button>';
						html += '<button type="button" id="btn_calendar_next" class="' + ((browser_is_ff || browser_is_ns) ? 'buttonMenuClassFF' : 'buttonClass') + '" onclick="performCalendarNextMonth(\'' + aDict.asQueryString(',') + '\'); return false;">' + '&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;' + '</button>';
					}
	
					html += '</div>';
					html += '</td></tr>';
	
					html += '<tr><td>';
					html += '<center><table border=0 class="calendar_table" width="100%">';
					html += '<tr>';
					var ar = _LOCALIZEDDAYS.split(',');
					for (var i = 0; i < ar.length; i++) {
						html += '<td>' + ar[i] + '</td>';
					}
					html += '</tr>';
					html += '</td></tr>';
		
					html += '<tr>';
					for (i = 1; i <= _FIRSTWEEKPAD; i++) {
						html += '<td>&nbsp;</td>';
					}
					for (i = _FIRSTWEEKPAD + 1; i <= 7; i++) {
						_f = ezLocateArrayItems(_DAYLISTar, _DAYCOUNTER);
						html += '<td>' + ((_f > -1) ? '<button id="btn_calendarDay_' + (_FIRSTDAYdt.getMonth() + 1) + '_' + _DAYCOUNTER + '_' + _FIRSTDAYdt.getYear() + '" class="' + ((browser_is_ff || browser_is_ns) ? 'buttonMenuClassFF' : 'buttonClass') + '" onclick="performViewingArticlesByDay(this.id); return false;">' : '') + _DAYCOUNTER + ((_f > -1) ? '</button>' : '') + '</td>';
						_DAYCOUNTER++;
					}
					html += '</tr>';
					for (i = _DAYCOUNTER; i <= _DIM; i++) {
						if (_ROWCOUNTER == 1) {
							html += '<tr>';
						}
						_f = ezLocateArrayItems(_DAYLISTar, i);
						html += '<td>' + ((_f > -1) ? '<button id="btn_calendarDay_' + (_FIRSTDAYdt.getMonth() + 1) + '_' + i + '_' + _FIRSTDAYdt.getYear() + '" class="' + ((browser_is_ff || browser_is_ns) ? 'buttonMenuClassFF' : 'buttonClass') + '" onclick="performViewingArticlesByDay(this.id); return false;">' : '') + i + ((_f > -1) ? '</button>' : '') + '</td>';
						_ROWCOUNTER++;
						if (_ROWCOUNTER == 8) {
							html += '</tr>';
							_ROWCOUNTER = 1;
						}
					}
					if (_ROWCOUNTER > 1) {
						for (i = _DAYCOUNTER; i <= 7; i++) {
							html += '<td>&nbsp;</td>';
						}
						html += '</tr>';
					}
					html += '</table></center>';
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						var _boolUpdate = argsDict.getValueFor('boolUpdate');
						var isBoolUpdate = ((_boolUpdate != null) ? true : false);
						
						var oCalDiv = _$('div_calendarContent');
						var bool_isContentContainer = ( (!!oCalDiv) && (oCalDiv.innerHTML.length > 0) );

						if (!bool_isContentContainer) {
							html += '<div id="div_calendarContent">';
						}

						html += '<table width="100%" cellpadding="-1" cellspacing="-1">';

						qData1[0].iterateRecObjs(searchForCalendarMetaData);

						calendarContent();

						html += '</table>';

						if (!bool_isContentContainer) {
							html += '</div>';
						}

						if (!bool_isContentContainer) {
							var dObj = $(js_const_div_podContent);
							if (!!dObj) {
								if (jsBool_isCurrentBlogDefault) {
									dObj.innerHTML += podLayoutHTML(html, js_calendarTitle, 'calendarPod', '&td=' + 'align="center"'.ezURLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').ezURLEncode());
								}
							}
							oAJAXEngine.doAJAX('getBlogArchives', 'handleGetBlogArchives');
						} else {
							oCalDiv.innerHTML = html;
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

		function disableEnableButtonNamed(btnName, bool) {
			var oBtn = _$(btnName);
			if (!!oBtn) {
				oBtn.disabled = ((bool == true) ? bool : false);
			}
		}
		
		function popUpWindowForURL(aURL, winName) {
			window.open(aURL,winName,'width=' + (ezClientWidth() - 450) + ',height=' + (ezClientHeight() - 100) + ',resizeable=yes,scrollbars=1');
		}
		
		function populateSiteContent(num) {
			var html = '';
			var oDiv = _$('div_siteContents');
			if (!!oDiv) {
				switch (num) {
					case 111.1:
						html = '#JSStringFormat(content_111_1)#';
					break;

					case 112.1:
						html = '#JSStringFormat(content_112_1)#';
					break;

					default:
						html = '--- ' + num.toString() + ' ---';
					break;
				}
				oDiv.innerHTML = html;
			}
		}
		
		function getEzAJAXProductContent() {
			var html = '';
			
			html += '<table width="100%">';

			var ar = window.location.href.split('?');
			var ar2 = ar[0].split('/');

			html += '<tr>';
			html += '<td>';
			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';

			html += '<td bgcolor="##0000ff">';
			html += '<a href="" onclick="populateSiteContent(111.1); return false;"><span class="menux11StatusBoldClass"><u>What is ezAJAX' + js_trademarkSymbol + '</u></span></a>';
			html += '</td>';

			html += '<td bgcolor="##0000ff">';
			html += '<a href="" onclick="populateSiteContent(112.1); return false;"><span class="menux11StatusBoldClass"><u>Contact Us</u></span></a>';
			html += '</td>';

			html += '</tr>';
			html += '</table>';
			html += '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td>';
			html += '<div id="div_siteContents"></div>';
			html += '</td>';
			html += '</tr>';

			if (0) {
				html += '<tr>';
				html += '<td>';
				html += '<span class="normalx11StatusBoldClass"><p align="justify">With the ezAJAX' + js_trademarkSymbol + ' Framework, developers can create AJAX Applications faster and easier than ever before.<br><br>The ezAJAX' + js_trademarkSymbol + ' Framework has more than 10,000 lines of 100% reusable and redistributable ColdFusion and JavaScript code you can use to quickly build and deploy your AJAX Web Apps.<br><br>The ezAJAX' + js_trademarkSymbol + ' Framework has a unique and powerful JavaScript Compiler that compresses and encrypts your JavaScript code to better protect your Intellectual Property Rights.<br><br>The ezAJAX' + js_trademarkSymbol + ' Framework has a unique Runtime Licensing System that allows you to sell your AJAX Apps with the ability to deploy fully functional Demo versions that can easily be turned into fully functional Production versions.  You can pick and choose the features and functions you wish to limit the use of at runtime.  This gives your customers an easy upgrade path that also enhances your profitability.<br><br></p></span>';
				html += '</td>';
				html += '</tr>';
	
				html += '<tr>';
				html += '<td>';
				html += '<span class="normalx11StatusBoldClass"><p align="justify">We used the ezAJAX' + js_trademarkSymbol + ' Enterprise Edition Framework to build the <a href="" onclick="' + jsCodeDemoWaferAnalysis + '; return false;"><span class="titlex12BlackBoldClass">Semiconductor Wafer Analysis Prototype</span></a> in less than one week of development.<br><br></p></span>';
				html += '</td>';
				html += '</tr>';
	
				html += '<tr>';
				html += '<td>';
				html += '<span class="normalx11StatusBoldClass"><p align="justify"><span class="titlex12BlackBoldClass">Our Service Guarantee:</span> Download and Install the ezAJAX' + js_trademarkSymbol + ' Framework and then Buy a Long-Term Runtime License and we will work with you to ensure you have those features that are most important to you built into the Framework.  We will also fix every single bug you report to us in a timely manner.  We will continue to work to make our products the best in the industry, without exception.<br><br></p></span>';
				html += '</td>';
				html += '</tr>';
	
				html += '<tr>';
				html += '<td>';
				html += '<span class="normalx11StatusBoldClass"><p align="justify"><span class="titlex12BlackBoldClass">Under Development:</span> The ezAJAX' + js_trademarkSymbol + ' Enterprise Edition Framework will be released soon at this site.<br><br></p></span>';
				html += '</td>';
				html += '</tr>';
			}

			html += '<tr>';

			html += '<td style="border-top: thin solid Blue;">';

			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';

			var imgName = _fqServerName + '/app/images/downloadCommunityEdition.gif';

			html += '<td align="center" valign="middle">';
			html += '<span class="normalx11StatusBoldClass">Windows 2003,<br>Windows XP,<br>Windows 2000</span>';
			html += '</td>';

			html += '<td align="center" valign="middle">';
			html += '<span class="normalx11StatusBoldClass">ColdFusion MX 7</span>';
			html += '</td>';

			html += '<td align="center" valign="top">';
			if (0) {
				html += '<span class="normalx11StatusBoldClass"><a href="" onclick="alert(\'Downloads will be available soon.\'); return false;"><img border="0" src="' + imgName + '"><br>Community Edition FREE Download</a></span>';
			} else {
				html += '&nbsp;';
			}
			html += '</td>';

			imgName = _fqServerName + '/app/images/downloadTrialEdition.gif';

			html += '<td align="center" valign="top">';
			html += '<span class="normalx11StatusBoldClass"><a href="' + sCommunityEditionDownloadHref + '" target="_blank"><img border="0" src="' + imgName + '"><br>Community Edition 30-day Trial Edition FREE Download</a></span>';
			html += '</td>';

			html += '<td align="center" valign="middle">';
			html += '<span class="normalx11StatusBoldClass">ColdFusion MX 7</span>';
			html += '</td>';

			html += '<td align="center" valign="middle">';
			html += '<span class="normalx11StatusBoldClass">Windows 2003,<br>Windows XP,<br>Windows 2000</span>';
			html += '</td>';

			html += '</tr>';
			html += '</table>';

			html += '</td>';

			html += '</tr>';

			html += '<tr>';
			html += '<td style="border-bottom: thin solid Blue;">';

			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';

			html += '<td align="center" valign="top" style="border-top: thin solid Blue;">';

			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';
// +++
			html += '<td width="70%" align="left" valign="top">';
			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';
			html += '<td style="margin-bottom: 15px;">';
			html += '<span class="titlex14BoldClass">Product Info</span>';
			html += '&nbsp;&nbsp;&nbsp;&nbsp;';
			html += '<span class="normalx11TextClass">There are 2 ezAJAX' + js_trademarkSymbol + ' Framework Editions you may use.</span>';
			html += '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td>';
			html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';
			html += '<td>';
			html += '<span class="titlex12BlackBoldClass">Community Edition 30-Day Trial:</span>';
			html += '</td>';
			html += '<td>';
			html += '<span class="normalx11TextClass">Free for personal use (<a href="" onclick="popUpWindowForURL(js_urlCommunityEditionLicenseAgreement, \'CommunityEditionLicenseAgreement\'); return false;">license</a>).</span>';
			html += '</td>';
			html += '<td>';
	//		html += '<span class="normalx12StatusBoldClass"><a href="" onclick="alert(\'More Info will be added soon.\'); return false;">More info &gt;&gt;</a></span>';
			html += '<span class="normalx12StatusBoldClass"><a href="" onclick="popUpWindowForURL(js_urlCommunityEditionProgrammersGuide, \'CommunityEditionProgrammersGuide\'); return false;">Programmer\'s Guide</a></span>';
			html += '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td>';
			html += '<span class="titlex12BlackBoldClass">Community Edition Long-Term License:</span>';
			html += '</td>';
			html += '<td>';
			html += '<span class="normalx11TextClass">$495/Server&nbsp;<b>&sect;</b></span>';
			html += '</td>';
			html += '<td>';
	//		html += '<span class="normalx12StatusBoldClass"><a href="" onclick="alert(\'More Info will be added soon.\'); return false;">More info &gt;&gt;</a></span>';
			html += '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td colspan="3">';
			html += '<span class="normalx9TextClass"><b>&sect;</b>&nbsp;OEM, Partner, Educational and Volume Pricing available upon request.  Community Edition Long-Term License unlocks the limitations built into the Community Edition 30-day Trial.</span>';
			html += '</td>';
			html += '</tr>';
			html += '</table>';
			html += '</td>';
			html += '</tr>';

			html += '</table>';
			html += '</td>';

			html += '<td width="*" align="center" valign="top" style="border-left: thin solid Blue;">';
			html += '<span class="titlex14BoldClass">Demos & Tutorials</span>';
			html += '<br>';
			html += '<span class="normalx12StatusBoldClass"><a href="" onclick="' + jsCodeDemoWaferAnalysis + '; return false;">Semiconductor Wafer Analysis Prototype</a></span>';
			html += '</td>';

			html += '</tr>';
			html += '</table>';

			html += '</td>';

			html += '</tr>';

			if (0) {
				html += '<tr>';
				
				html += '<td>';
				html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
				html += '<tr>';
				html += '<td align="left" valign="top" style="border-top: thin solid Blue;">';
				html += '<span class="titlex14BoldClass">Contact Us</span>';
				html += '<br>';
				html += '<span class="normalx12StatusBoldClass"><a href="" onclick="displayContactUsContentIn(\'div_contactUsContent\', \'performContactUsAction\', \'' + js_salesEmailAddress + '\'); return false;">' + js_salesEmailAddress + '</a></span>';
				html += '<div id="div_contactUsContent"></div>';
				html += '</td>';
	
				html += '<td align="left" valign="top" style="border-top: thin solid Blue;">';
				html += '<span class="titlex14BoldClass">Investors, Contact Us.</span>';
				html += '<br>';
				html += '<span class="normalx12StatusBoldClass"><a href="" onclick="displayContactUsContentIn(\'div_contactUsContent\', \'performContactUsAction\', \'' + js_investorRelationsEmailAddress + '\'); return false;">' + js_investorRelationsEmailAddress + '</a></span>';
				html += '</td>';
	
				html += '<td align="left" valign="top" style="border-top: thin solid Blue;">';
				html += '<span class="titlex14BoldClass">Affiliates, Contact Us. (10%-60% Comissions Paid)</span>';
				html += '<br>';
				html += '<span class="normalx12StatusBoldClass"><a href="" onclick="displayContactUsContentIn(\'div_contactUsContent\', \'performContactUsAction\', \'' + js_affiliateRelationsEmailAddress + '\'); return false;">' + js_affiliateRelationsEmailAddress + '</a></span>';
				html += '</td>';
	
				html += '</tr>';
				html += '</table>';
				html += '</td>';
	
				html += '</tr>';
			}

			html += '</table>';

			html += '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td align="left" valign="top">';
			html += '<span class="normalx9TextClass">' + js_copyrightNotice + '</span>';
			html += '</td>';
			html += '</tr>';

			html += '';

			html += '</table>';
			
			return html;
		}
		
		function performDefaultBlogSearch() {
			if (jsBool_isCurrentBlogDefault) {
				if ( (js_URL_mode.toUpperCase() == 'ENTRY') && ((typeof js_URL_entry) == const_string_symbol) && (js_URL_entry.length > 0) ) {
					performGetArticleByEntry(js_URL_entry);
				} else {
					oAJAXEngine.doAJAX('getDefaultBlogArticles', 'handleGetDefaultBlogArticles', 'maxEntries', js_maxEntries);
				}
			} else {
				var dObj = $('div_articleContent');
				if (!!dObj) {
					dObj.innerHTML = getEzAJAXProductContent();
				} else {
					alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
				}
			}
		}
		
		function performDeleteBlogCategory(id, catName) {
			id = ((id != null) ? id : '');
			catName = ((catName != null) ? catName : '');
			if (confirm('Are you sure you want to delete category named "' + catName + '" that has the ID of "' + id + '" ?')) {
				oAJAXEngine.doAJAX('performDeleteBlogCategory', 'handleAdminFunctions', 'catID', id);
			}
		}

		function performCommitEditedBlogCategory(id, catName) {
			id = ((id != null) ? id : '');
			catName = ((catName != null) ? catName : '');
			var oInput = _$('input_categoryEditor' + ((id.length > 0) ? '_' + id : ''));
			if (!!oInput) {
				try { catName = oInput.value; } catch(e) {};
			}
			id = ((id.length == 0) ? '-1' : id);
			oAJAXEngine.doAJAX('performCommitBlogCategory', 'handleAdminFunctions', 'catID', id, 'catName', catName.ezURLEncode());
		}

		var stack_blogCategoryEditor = [];
				
		function performEditBlogCategory(id, catName) {
			id = ((id != null) ? id : '');
			catName = ((catName != null) ? catName : '');
			var dObj = _$('div_categoryEditor_' + id);
			if (!!dObj) {
				if (stack_blogCategoryEditor.length > 0) {
					var deObj = _$(stack_blogCategoryEditor.pop());
					if (!!deObj) {
						deObj.innerHTML = '';
						deObj.style.display = const_none_style;
					}
				}
				stack_blogCategoryEditor.push(dObj.id);
				dObj.innerHTML = '<span class="boldPromptTextClass">Category:</span>&nbsp;<input type="Text" class="textClass" id="input_categoryEditor_' + id + '" value="' + catName + '" size="50" maxlength="50" onkeyup="if (event.keyCode == 13) { performCommitEditedBlogCategory(\'' + id + '\', \'' + catName + '\'); };">&nbsp;<a href="" onclick="performCommitEditedBlogCategory(\'' + id + '\', \'' + catName + '\'); return false;"><img src="' + js_save_ActionImage + '" border="0" align="middle" title="Save to Database"></a>';
				dObj.style.display = const_inline_style;
				var oInput = _$('input_categoryEditor_' + id);
				if (!!oInput) {
			    	try { oInput.focus(); } catch(e) { };
				}
			}
		}
		
		function performAdminAddNewCategory() {
			var oDiv = _$('div_addNewCategory');
			if (!!oDiv) {
				if (stack_blogCategoryEditor.length > 0) {
					var deObj = _$(stack_blogCategoryEditor.pop());
					if (!!deObj) {
						deObj.innerHTML = '';
						deObj.style.display = const_none_style;
					}
				}
				stack_blogCategoryEditor.push(oDiv.id);
				oDiv.innerHTML = '<span class="boldPromptTextClass">Category:</span>&nbsp;<input type="Text" class="textClass" id="input_categoryEditor" value="" size="50" maxlength="50" onkeyup="if (event.keyCode == 13) { performCommitEditedBlogCategory(\'\', \'\'); };">&nbsp;<a href="" onclick="performCommitEditedBlogCategory(\'\', \'\'); return false;"><img src="' + js_save_ActionImage + '" border="0" align="middle" title="Save to Database"></a>';
				oDiv.style.display = const_inline_style;
				var oInput = _$('input_categoryEditor');
				if (!!oInput) {
			    	try { oInput.focus(); } catch(e) { };
				}
			}
		}
		
		function handleGetBlogArchives(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			
			function searchForArchives(_ri, _dict, _rowCntName) {
				var i = -1;
				var n = -1;
				var padStr = '';
				var _CATEGORYNAME = _dict.getValueFor('CATEGORYNAME');
				var _CATEGORYID = _dict.getValueFor('CATEGORYID');
				var _ENTRYCOUNT = _dict.getValueFor('ENTRYCOUNT');
				if ( (!!_CATEGORYNAME) && (!!_CATEGORYID) && (!!_ENTRYCOUNT) ) {
					n = Math.abs(5 - _ENTRYCOUNT.length);
					for (i = 1; i <= n; i++) {
						padStr += '&nbsp;';
					}
					_ENTRYCOUNT = parseInt(_ENTRYCOUNT);
					html += '<tr>';
					html += '<td>';
					html += '<button type="button"' + ((_ENTRYCOUNT == 0) ? ' disabled' : '') + ' id="btn_archives_' + _CATEGORYID + '" class="buttonArchivesClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="performViewingArticlesByCategory(this, \'' + _CATEGORYID + '\', \'' + _CATEGORYNAME + '\'); return false;">' + '&nbsp;&nbsp;' + padStr + _ENTRYCOUNT + '&nbsp;&nbsp;' + ':' + '&nbsp;&nbsp;' + _CATEGORYNAME + '&nbsp;' + '</button>';
					html += (( (jsBool_sessionLoggedin) && (jsBool_isUserAdmin) && (_ENTRYCOUNT == 0) ) ? '&nbsp;<a href="" onclick="performDeleteBlogCategory(\'' + _CATEGORYID + '\', \'' + _CATEGORYNAME + '\'); return false;"><img border="0" src="' + js_delete_ActionImage + '" align="middle"></a>' : '');
					html += (( (jsBool_sessionLoggedin) && (jsBool_isUserAdmin) ) ? '&nbsp;<a href="" onclick="performEditBlogCategory(\'' + _CATEGORYID + '\', \'' + _CATEGORYNAME + '\'); return false;"><img border="0" src="' + js_edit_ActionImage + '" align="middle"></a>' : '');
					html += '<br><div id="div_categoryEditor_' + _CATEGORYID + '"></div>';
					html += '</td>';
					html += '</tr>';
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						var _boolUpdate = argsDict.getValueFor('boolUpdate');
						var isBoolUpdate = ((_boolUpdate != null) ? true : false);
						
						html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
						qData1[0].iterateRecObjs(searchForArchives);
						html += '</table>';
						
						archivesByCategoryQObj = qData1[0];

						var archivesPodTitle = js_archivesBySubjectTitle + (( (jsBool_sessionLoggedin) && (jsBool_isUserAdmin) ) ? '&nbsp;<a href="" onclick="performAdminAddNewCategory(); return false;"><img border="0" src="' + js_edit_ActionImage + '" align="middle"></a><div id="div_addNewCategory"></div>' : '');
						if (!isBoolUpdate) {
							var dObj = $(js_const_div_podContent);
							if (!!dObj) {
								if (jsBool_isCurrentBlogDefault) {
									dObj.innerHTML += podLayoutHTML(html, archivesPodTitle, 'archivesPod', '&td=' + 'align="center"'.ezURLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').ezURLEncode());
									dObj.innerHTML += subscribePod();
								}
							}
							disableEnableButtonNamed('btn_expandBlogCols', false);
							performDefaultBlogSearch();
						} else {
							var dObj = _$('div_podLayoutContainer_archivesPod');
							if (!!dObj) {
								dObj.innerHTML = podLayoutHTML(html, archivesPodTitle, 'archivesPod', '&td=' + 'align="center"'.ezURLEncode() + '&td=' + ('bgColor="' + js_blogBgColor + '"').ezURLEncode());
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

		function dismissAdminAddEntry(btnID, divID) {
			var btnObj = _$(btnID);
			if (!!btnObj) {
				btnObj.disabled = false;
			}
			var oDiv = _$(divID);
			if (!!oDiv) {
				oDiv.innerHTML = '';
			}
		}
		
		function performAdminAddEntrySave() {
			var i = -1;
			var tSels = [];
			var oAdminAddEntryTitle = _$('input_adminAddEntryTitle');
			var oAdminAddEntryBody = _$('ta_adminAddEntryBody');
			var oAdminAddEntryPosted = _$('input_adminAddEntryPosted');
			var oAdminAddEntryCategories = _$('select_adminAddEntryCategories');
			var oAdminAddEntryNewCategory = _$('input_adminAddEntryNewCategory');
			var oAdminAddEntryAlias = _$('input_adminAddEntryAlias');
			var oAdminAddEntryAllowCommentsYes = _$('radio_adminAddEntryAllowCommentsYes');
			var oAdminAddEntryAllowCommentsNo = _$('radio_adminAddEntryAllowCommentsNo');
			
			function padEmptyString(s) {
				s = ((s == null) ? '' : s);
				return ((s.length == 0) ? ' ' : s);
			}
			
			if ( (!!oAdminAddEntryTitle) && (!!oAdminAddEntryBody) && (!!oAdminAddEntryPosted) && (!!oAdminAddEntryCategories) && (!!oAdminAddEntryNewCategory) && (!!oAdminAddEntryAlias) && (!!oAdminAddEntryAllowCommentsYes) && (!!oAdminAddEntryAllowCommentsNo) ) {
				var oSels = ezSelectionsFromObj(oAdminAddEntryCategories);
				if (oSels.length > 0) {
					var n = oSels.length;
					var n1 = n - 1;
					for (i = 1; i < n; i++) {
						tSels.push(oSels[i]);
					}
				}
				var tCSels = ((oAdminAddEntryAllowCommentsYes.checked) ? oAdminAddEntryAllowCommentsYes.value : ((oAdminAddEntryAllowCommentsNo.checked) ? oAdminAddEntryAllowCommentsNo.value : 'UNDEFINED'));
				oAJAXEngine.doAJAX('performAdminAddEntry', 'handleAdminFunctions', 'catID', id, 'catName', 'title', padEmptyString(oAdminAddEntryTitle.value).ezURLEncode(), 'body', padEmptyString(oAdminAddEntryBody.value).ezURLEncode(), 'postedAt', padEmptyString(oAdminAddEntryPosted.value).ezURLEncode(), 'categories', padEmptyString(tSels.toString()).ezURLEncode(), 'newCategory', padEmptyString(oAdminAddEntryNewCategory.value).ezURLEncode(), 'alias', padEmptyString(oAdminAddEntryAlias.value).ezURLEncode(), 'allowComments', padEmptyString(tCSels));
			} else {
				alert('ERROR: Programming Error - Missing some parms for function named "performAdminAddEntrySave".');
			}
		}
		
		function populateAdminEditArticle(btnObj, oDiv, aDict) {
			var html = '';

			function searchForCategories(_ri, _dict, _rowCntName) {
				var i = -1;
				var n = -1;
				var padStr = '';
				var _CATEGORYNAME = _dict.getValueFor('CATEGORYNAME');
				var _CATEGORYID = _dict.getValueFor('CATEGORYID');
				var _ENTRYCOUNT = _dict.getValueFor('ENTRYCOUNT');
				if ( (!!_CATEGORYNAME) && (!!_CATEGORYID) && (!!_ENTRYCOUNT) ) {
					var bool_isCatSelected = ((ezLocateArrayItems(ar_CATEGORYIDS, _CATEGORYID) > -1) ? true : false);
					html += '<option value="' + _CATEGORYID + '"' + ((bool_isCatSelected) ? ' selected' : '') + '>' + _CATEGORYNAME + '</option>';
				}
			};

	    	try {
				aDict = (( ((typeof aDict) == const_object_symbol) && (aDict.keys != null) ) ? aDict : ezDictObj.get$());
	        } catch(e) {
				aDict = ezDictObj.get$();
	        }

			var ar_CATEGORYIDS = [];
			var _CATEGORYIDS = aDict.getValueFor('CATEGORYIDS');
			if (!!_CATEGORYIDS) {
				ar_CATEGORYIDS = _CATEGORYIDS.split(',');
			}

			html += '<table width="98%" cellpadding="-1" cellspacing="-1">';
			html += '<tr>';
			html += '<td align="center" width="100%" bgcolor="silver"><span class="adminAddEntryClass">' + ((aDict.length() > 0) ? 'Edit Entry' : 'Add Entry') + '</span></td>';
			html += '<td align="right" bgcolor="silver" width="*"><button id="btn_dismissAdminAddEntry" class="buttonClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="dismissAdminAddEntry(\'' + btnObj.id + '\', \'' + oDiv.id + '\'); return false;">[X]</button></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td colspan="2">';

			html += '<table width="100%" border=0>';
			html += '<tr>';
			html += '<td width="10%" align="left"><b>' + js_entryTitleText + '</b></td>';
			html += '<td width="90%" align="left"><input type="text" id="input_adminAddEntryTitle" value="' + ((aDict.length() > 0) ? aDict.getValueFor('TITLE') : '') + '" size="100" maxlength="100" class="textClass" style="width:100%"></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td colspan=2>'; // <b>' + js_entryBodyText + '</b><br>
			html += '<textarea id="ta_adminAddEntryBody" cols=100 rows=10 class="textClass" style="width:100%">' + ((aDict.length() > 0) ? aDict.getValueFor('BODY') : '') + '</textarea></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td width="10%" align="left"><b>' + js_postedatText + '</b></td>';
			var _dt = ((aDict.length() > 0) ? aDict.getValueFor('POSTEDLONG') : '');
			if (_dt.length > 0) {
				var arDt = _dt.split(' ');
				arDt.pop();
				_dt = arDt.join(' ');
			}
			html += '<td width="90%" align="left"><input type="text" id="input_adminAddEntryPosted" value="' + _dt + '" class="textClass" size="50" maxlength="50" style="width:100%"></td>';
			html += '</tr>';

			html += '<tr valign="top">';
			html += '<td width="10%" align="left"><b>' + js_categoriesText + '</b></td>';
			html += '<td width="90%" align="left">';
			html += '<select name="select_adminAddEntryCategories" id="select_adminAddEntryCategories" multiple size=4 class="textClass" style="width:100%">';
			archivesByCategoryQObj.iterateRecObjs(searchForCategories);
			html += '</select>';
			html += '</td>';
			html += '</tr>';

			html += '<tr valign="top">';
			html += '<td width="10%" align="left"><b>' + js_newcategoryText + '</b></td>';
			html += '</td>';
			html += '<td width="90%" align="left">';
			html += '<input type="text" class="textClass" id="input_adminAddEntryNewCategory" value="" size="50" maxlength="50" style="width:100%">';
			html += '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td><b>' + js_aliasText + '</b></td>';
			html += '<td><input type="text" class="textClass" id="input_adminAddEntryAlias" value="' + ((aDict.length() > 0) ? aDict.getValueFor('ALIAS') : '') + '" size="100" maxlength="100" style="width:100%"></td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td><b>' + js_allowcommentsText + '</b></td>';
			html += '<td>';
			html += '<input type="Radio" name="radio_adminAddEntryAllowComments" id="radio_adminAddEntryAllowCommentsYes" value="Yes"' + ((aDict.length() > 0) ? ((parseInt(aDict.getValueFor('ALLOWCOMMENTS')) == 1) ? ' checked' : '') : '') + '>&nbsp;<span class="normalStatusBoldClass">Yes</span>';
			html += '&nbsp;<input type="Radio" name="radio_adminAddEntryAllowComments" id="radio_adminAddEntryAllowCommentsNo" value="No"' + ((aDict.length() > 0) ? ((parseInt(aDict.getValueFor('ALLOWCOMMENTS')) == 0) ? ' checked' : '') : '') + '>&nbsp;<span class="normalStatusBoldClass">No</span>';
			html += '</td>';
			html += '</tr>';
			html += '<tr>';
			html += '<td>&nbsp;</td>';
			html += '<td><input type="submit" class="buttonClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" id="btn_adminAddEntrySave" value="' + js_saveText + '" onclick="performAdminAddEntrySave(); return false;">';
			html += '<input type="submit" class="buttonClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" id="btn_adminAddEntryCancel" value="' + js_cancelText + '" onClick="var oBtn = _$(\'btn_dismissAdminAddEntry\'); if (!!oBtn) { oBtn.onclick(); }; return false;"></td>';
			html += '</tr>';
			html += '</table>';
			html += '</td>';
			html += '</tr>';
			html += '</table>';

			return html;
		}
		
		function populateAdminAddEntryGUI(btnObj, oDiv, aDict) {
			var html = '';

			html += populateAdminEditArticle(btnObj, oDiv, aDict);
			
			return html;
		}
		
		function performAdminEditArticle(oObj, aDict) {
			var _ID = aDict.getValueFor('ID');
			var oDiv = _$('div_adminEditArticleContent_' + _ID);
			if ( (!!oObj) && (!!oObj.id) && (!!oDiv) ) {
				oObj.disabled = true;
				oDiv.innerHTML = populateAdminAddEntryGUI(oObj, oDiv, aDict);
				var oInput = _$('input_adminAddEntryTitle');
				if (!!oInput) {
			    	try { oInput.focus(); } catch(e) { };
				}
			} else {
				alert('ERROR: Programming Error - Missing the id parm from performAdminDeleteEntry().');
			}
		}
		
		function performAdminAddEntry(oObj, aDict) {
			var oDiv = _$('div_adminAddEntryContent');
			if ( (!!oObj) && (!!oObj.id) && (!!oDiv) ) {
				oObj.disabled = true;
				oDiv.innerHTML = populateAdminAddEntryGUI(oObj, oDiv, aDict);
				var oInput = _$('input_adminAddEntryTitle');
				if (!!oInput) {
			    	try { oInput.focus(); } catch(e) { };
				}
			} else {
				alert('ERROR: Programming Error - Missing the id parm from performAdminDeleteEntry().');
			}
		}
		
		function performAdminDeleteEntry(oObj) {
			if ( (!!oObj) && (!!oObj.id) ) {
				var ar = oObj.id.split('_');
				var id = ar[ar.length - 1];
				if (confirm('Are you sure you want to delete the Blog Article with the ID of "' + id + '".')) {
					oObj.disabled = true;
					oAJAXEngine.doAJAX('performAdminDeleteEntry', 'handleAdminFunctions', 'id', id);
				}
			} else {
				alert('ERROR: Programming Error - Missing the id parm from performAdminDeleteEntry().');
			}
		}
		
		function performAdminEditEntry(oObj) {
			if ( (!!oObj) && (!!oObj.id) ) {
				var ar = oObj.id.split('_');
				var id = ar[ar.length - 1];
				oAJAXEngine.doAJAX('performGetArticleByEntry', 'handleAdminFunctions', 'id', id);
			} else {
				alert('ERROR: Programming Error - Missing the id parm from performAdminDeleteEntry().');
			}
		}
		
		function performRecentPodUpdate() {
			oAJAXEngine.doAJAX('getRecentArticles', 'handleGetRecentArticles', 'boolUpdate', 1);
		}
		
		function performCalendarPodUpdate() {
			oAJAXEngine.doAJAX('getCalendarMetaData', 'handleGetCalendarMetaData', 'boolUpdate', 1);
		}

		function performArchivesPodUpdate() {
			oAJAXEngine.doAJAX('getBlogArchives', 'handleGetBlogArchives', 'boolUpdate', 1);
		}
		
		function handleAdminEditEntry(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var articleDict = -1;
			var html = '';
			
			function searchForEditableArticle(_ri, _dict, _rowCntName) {
				if (articleDict == -1) {
					articleDict = ezDictObj.get$(_dict.asQueryString());
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						qData1[0].iterateRecObjs(searchForEditableArticle);

						var _ID = articleDict.getValueFor('ID');
						if (!!_ID) {
							var oBtn = _$('btn_adminEditEntry_' + _ID);
							if (!!oBtn) {
								performAdminEditArticle(oBtn, articleDict);
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

		function handleAdminFunctions(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			
			nRecs = ((nRecs != null) ? nRecs : -1);

			var oBtn = _$('btn_adminAddEntry');
			if (!!oBtn) {
				oBtn.disabled = false;
			}
			
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						oAJAXEngine.register_ezAJAX_function("performArchivesPodUpdate();");
						oAJAXEngine.register_ezAJAX_function("performCalendarPodUpdate();");
						oAJAXEngine.register_ezAJAX_function("performRecentPodUpdate();");
						clearBlogArticlesContent();

						var dObj = $('div_articleContent');
						if (!!dObj) {
							_html = '<div class="blogHeader">' + ((bool_isKeywordSearch) ? js_searchedforText + ' : ' + _keyword + ' / ' : ((bool_isEntryMode) ? js_viewingByEntryText + ' / ' : ((bool_isByDayMode) ? js_viewingbydayText + ((fmtDateStr.length > 0) ? ' : ' + fmtDateStr : '') : ((bool_isByMonthMode) ? js_viewingbymonthText + ((fmtDateStr.length > 0) ? ' : ' + fmtDateStr : '') : (((bool_isByCategoryMode) || (bool_isByCategoryNameMode)) ? js_viewingbycategoryText + ' : ' + currentCategoryName : ''))))) + '&nbsp;&nbsp;<button id="btn_returnToMainBlogArticles" class="buttonClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="this.disabled = true; clearBlogArticlesContent(); performDefaultBlogSearch(); return false;">' + js_mainText + '</button></div>';
							dObj.innerHTML = _html;
						} else {
							alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
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

		function performReassignCategoriesFor(id, catIds, catNames) {
			var html = '';
			id = ((id != null) ? id : '');
			catIds = ((catIds != null) ? catIds : '');
			catNames = ((catNames != null) ? catNames : '');
			var oDiv = _$('div_reassignCategories_' + id);
			if (!!oDiv) {
				var bool_isCategoryReassignOpen = false;
				var rDiv = _$('div_reassignCategoriesContainer_' + id);
				if (!!rDiv) {
					bool_isCategoryReassignOpen = ((rDiv.innerHTML.length > 0) ? true : false);
				}
				if (bool_isCategoryReassignOpen) {
					oDiv.innerHTML = '';
					var oBtn = _$('btn_reassignCategories_' + id);
					if (!!oBtn) {
						oBtn.disabled = false;
					}
					stack_blogCategoryReassignmentQueries.pop();
				} else {
					html += '<div id="div_reassignCategoriesContainer_' + id + '" class="reassignCategoriesClass">';
					html += '</div>';
					oDiv.innerHTML = html;
					oAJAXEngine.doAJAX('performPopulateBlogCategoryReassignment', 'handlePopulateBlogCategoryReassignment', 'id', id, 'catIds', catIds.ezURLEncode());
				}
			}
		}
		
		function performCategoryReassignmentFor(id, catID, bool_isChecked) {
			id = ((id != null) ? id : '');
			catID = ((catID != null) ? catID : '');
			bool_isChecked = false;
			var oCB = _$('cb_reassignCategory_' + catID);
			if (!!oCB) {
				bool_isChecked = ((oCB.checked == false) ? 'YES' : 'NO');
			}
			oAJAXEngine.doAJAX('performBlogCategoryReassignment', 'handleBlogCategoryReassignment', 'id', id, 'catID', catID, 'isChecked', bool_isChecked);
		}
		
		function handleBlogCategoryReassignment(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			var checkedCategories = 0;
			var checkedCategoriesCnt = 0;
			
			function countCheckedCategories(_ri, _dict, _rowCntName) {
				var _CATEGORYID = _dict.getValueFor('CATEGORYID');
				var _CATEGORYNAME = _dict.getValueFor('CATEGORYNAME');
				if ( (!!_CATEGORYID) && (!!_CATEGORYNAME) ) {
					var oCB = _$('cb_reassignCategory_' + _CATEGORYID);
					if (!!oCB) {
						checkedCategories += ((oCB.checked) ? 1 : 0);
					}
				}
			};

			function searchForCategories(_ri, _dict, _rowCntName) {
				var _CATEGORYID = _dict.getValueFor('CATEGORYID');
				var _CATEGORYNAME = _dict.getValueFor('CATEGORYNAME');
				if ( (!!_CATEGORYID) && (!!_CATEGORYNAME) ) {
					var oCB = _$('cb_reassignCategory_' + _CATEGORYID);
					if (!!oCB) {
						checkedCategoriesCnt += ((oCB.checked == true) ? 1 : 0);
						html += ((oCB.checked == true) ? '<a href="" onclick="performViewingArticlesByCategoryID(\'' + _CATEGORYID + '\', \'' + _CATEGORYNAME + '\'); return false;">' + _CATEGORYNAME + '</a>' + ((checkedCategoriesCnt != checkedCategories) ? ',' : '') : '');
					}
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						var _id = argsDict.getValueFor('id');
						var _catID = argsDict.getValueFor('catID');
						var _isChecked = argsDict.getValueFor('isChecked');
						if ( (!!_id) && (!!_catID) && (!!_isChecked) ) {
							var oCB = _$('cb_reassignCategory_' + _catID);
							if (!!oCB) {
								oCB.checked = ((_isChecked.toUpperCase() == 'YES') ? false : true);
								
								var oDiv = _$('div_currentBlogCategories_' + _id);
								if (!!oDiv) {
									stack_blogCategoryReassignmentQueries[0].iterateRecObjs(searchForCategories);
									oDiv.innerHTML = html;

									performArchivesPodUpdate();
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

		var stack_blogCategoryReassignmentQueries = [];
		
		function handlePopulateBlogCategoryReassignment(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			
			function searchForCategories(_ri, _dict, _rowCntName) {
				var _CATEGORYID = _dict.getValueFor('CATEGORYID');
				var _CATEGORYNAME = _dict.getValueFor('CATEGORYNAME');
				if ( (!!_CATEGORYID) && (!!_CATEGORYNAME) ) {
					var bool_isChecked = ((catsDict.getValueFor(_CATEGORYID) != null) ? true : false);
					html += '<input type="Checkbox" id="cb_reassignCategory_' + _CATEGORYID + '" class="textClass"' + ((bool_isChecked) ? ' checked' : '') + ' onclick="performCategoryReassignmentFor(\'' + _id + '\', \'' + _CATEGORYID + '\', \'' + bool_isChecked + '\'); return false;">&nbsp;' + _CATEGORYNAME + '<br>';
					html += '';
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						var _id = argsDict.getValueFor('id');
						var _catIds = argsDict.getValueFor('catIds');
						if ( (!!_id) && (!!_catIds) ) {
							var oDiv = _$('div_reassignCategoriesContainer_' + _id);
							if (!!oDiv) {
								_catIds = _catIds.ezURLDecode();
								var catIDs_ar = _catIds.split(',');
								for (i = 0; i < catIDs_ar.length; i++) {
									catIDs_ar[i] = catIDs_ar[i] + '=1';
								}
								var catsDict = ezDictObj.get$(catIDs_ar.join('&'));
								stack_blogCategoryReassignmentQueries.push(qData1[0]);
								qData1[0].iterateRecObjs(searchForCategories);
								oDiv.innerHTML = html;
							}
							
							var oBtn = _$('btn_reassignCategories_' + _id);
							if (!!oBtn) {
								oBtn.disabled = false;
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

		function handleGetDefaultBlogArticles(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var blogSettingsDict = -1;
			var html = '';
			var _html = '';
			var _lastDate = -1;
			var blogRecordCount = -1;
			
			function searchForBlogSettings(_ri, _dict, _rowCntName) {
				var _ALLOWTB = _dict.getValueFor('ALLOWTB');
				if ( (blogSettingsDict == -1) && (!!_ALLOWTB) ) {
					blogSettingsDict = ezDictObj.get$(_dict.asQueryString());
				}
			};
			
			function searchForBlogArticles(_ri, _dict, _rowCntName) {
				var _ALIAS = _dict.getValueFor('ALIAS');
				var _ALLOWCOMMENTS = _dict.getValueFor('ALLOWCOMMENTS');
				var _BODY = _dict.getValueFor('BODY');
				var _CATEGORYIDS = _dict.getValueFor('CATEGORYIDS');
				var _CATEGORYNAMES = _dict.getValueFor('CATEGORYNAMES');
				var _COMMENTCOUNT = _dict.getValueFor('COMMENTCOUNT');
				var _ENCLOSURE = _dict.getValueFor('ENCLOSURE');
				var _FILESIZE = _dict.getValueFor('FILESIZE');
				var _ID = _dict.getValueFor('ID');
				var _MIMETYPE = _dict.getValueFor('MIMETYPE');
				var _MOREBODY = _dict.getValueFor('MOREBODY');
				var _POSTED = _dict.getValueFor('POSTED');
				var _POSTEDLONG = _dict.getValueFor('POSTEDLONG');
				var _TITLE = _dict.getValueFor('TITLE');
				var _TRACKBACKCOUNT = _dict.getValueFor('TRACKBACKCOUNT');
				var _USERNAME = _dict.getValueFor('USERNAME');
				if ( (_ALIAS != null) && (_ALLOWCOMMENTS != null) && (_BODY != null) && (_CATEGORYIDS != null) && (_CATEGORYNAMES != null) && (_COMMENTCOUNT != null) && (_ENCLOSURE != null) && (_FILESIZE != null) && (_ID != null) && (_MIMETYPE != null) && (_MOREBODY != null) && (_POSTED != null) && (_TITLE != null) && (_TRACKBACKCOUNT != null) && (_USERNAME != null) && (_POSTEDLONG != null) ) {

					if (_POSTED != _lastDate) {
						_lastDate = _POSTED;
						html += '<div class="date">' + _POSTED;
						html += '</div>';
					} else {
						html += '<hr noshade size=1>';
					}

					var _url = ezFullyQualifiedAppPrefix() + '/' + _ID + '/';
					var articleLink = ((jsBool_sessionLoggedin) ? '&nbsp;<a href="' + _url + '" target="_blank"><img src="' + _fqServerName + '/app/images/Link.gif" width="18" height="18" border="0"></a>' : '');
					var articleURLLink = (( (jsBool_sessionLoggedin) && (jsBool_isUserAdmin) ) ? '&nbsp;<a href="" onclick="ezAlert(\'' + _url + '\'); return false;"><img src="' + _fqServerName + '/app/images/SCHEMA.GIF" alt="" width="18" height="18" border="0"></a>' : '');
					
					html += '<h1>' + '<a href="" name="' + _ID + '" onclick="performGetArticleByEntry(this.name); return false;">' + _TITLE + '</a>' + articleLink + articleURLLink + '</h1>';

					html += '<table width="100%" border="0" cellpadding="1" cellspacing="1">';
					html += '<tr>';
					html += '<td width="120" align="' + ((jsBool_sessionLoggedin) ? 'left' : 'center') + '" valign="top" style="margin-right: 40px;">';
					html += ((jsBool_sessionLoggedin) ? '' : '<span class="redBlogArticleAccessBoldPrompt">[Access to Blog Articles is Restricted to Registered Users]</span>');
					html += '</td>';
					html += '<td align="left" valign="top" width="*" style="margin-left: 40px;">';

					html += '<div class="byline">' + blogSettingsDict.getValueFor('POSTEDAT') + ' : ' + _POSTEDLONG;
					html += ((_USERNAME.length > 0) ? '| ' + blogSettingsDict.getValueFor('POSTEDBY') + ' : ' + _USERNAME : '') + '<br>';
					html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
					html += '<tr>';
					html += '<td width="10%" align="left" valign="top">';
					html += (( (jsBool_sessionLoggedin) && (jsBool_isUserAdmin) ) ? '<button id="btn_reassignCategories_' + _ID + '" class="buttonMenuClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="this.disabled = true; performReassignCategoriesFor(\'' + _ID + '\', \'' + _CATEGORYIDS + '\', \'' + _CATEGORYNAMES + '\'); return false;">' : '') + blogSettingsDict.getValueFor('RELATEDCATEGORIES') + (( (jsBool_sessionLoggedin) && (jsBool_isUserAdmin) ) ? '</button>' : '') + '&nbsp;:&nbsp;';
					html += '</td>';
					var isCurrentCategory = false;
					var ar = _CATEGORYNAMES.split(',');
					var _ar = _CATEGORYIDS.split(',');
					html += '<td width="*" align="left" valign="top">';
					html += '<div id="div_currentBlogCategories_' + _ID + '">';
					for (i = 0; i < _ar.length; i++) {
						isCurrentCategory = ( (ar[i].toUpperCase() == currentCategoryName.toUpperCase()) || (_ar[i] == currentCategoryID) );
						html += ((isCurrentCategory) ? '<span class="currentCategoryBoldClass">' : '<a href="" onclick="performViewingArticlesByCategoryID(\'' + _ar[i] + '\', \'' + ar[i] + '\'); return false;">') + ar[i] + ((isCurrentCategory) ? '</span>' : '</a>') + ((i != (ar.length - 1)) ? ',' : '');
					}
					html += '</div>';
					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</div>';
					html += (( (jsBool_sessionLoggedin) && (jsBool_isUserAdmin) ) ? '<div id="div_reassignCategories_' + _ID + '"></div>' : '');

					html += '<div class="body">';
					html += '<table width="100%" border="0" cellpadding="1" cellspacing="1">';
					html += '<tr>';
					html += '<td align="left" width="*">';
					html += ((jsBool_sessionLoggedin) ? _BODY : '&nbsp;');
					html += '</td>';
					html += '</tr>';
					html += '</table>';
					html += '</div>';

					html += '</td>';
					html += '</tr>';
					html += '</table>';

					html += '<div class="byline">';
					html += js_commentsText + ' (' + ((_COMMENTCOUNT == '') ? js_nocommentsText : _COMMENTCOUNT) + ')';
					html += '&nbsp;|&nbsp;';
					html += (((jsBool_isColdFusionMX7) && (jsBool_sessionLoggedin)) ? '<a href="' + js_printFlashPaperURL_template.ezClipCaselessReplace('+++', _ID) + '" target="_blank"><img src="' + js_print_ActionImage + '" border="0" align="middle" title="' + js_printText + '"></a>' : 'Print');
					html += '&nbsp;|&nbsp;';
					html += (((jsBool_isColdFusionMX7) && (jsBool_sessionLoggedin)) ? '<a href="' + js_printPdfURL_template.ezClipCaselessReplace('+++', _ID) + '" target="_blank"><img src="' + js_pdf_ActionImage + '" border="0" align="middle" title="PDF"></a>' : 'PDF');
					html += (((jsBool_sessionLoggedin) && (jsBool_isUserAdmin)) ? '&nbsp;|&nbsp;<button id="btn_adminDeleteEntry_' + _ID + '" class="buttonAdminFunctionClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="performAdminDeleteEntry(this); return false;">Delete Entry</button>' : '');
					html += (((jsBool_sessionLoggedin) && (jsBool_isUserAdmin)) ? '&nbsp;|&nbsp;<button id="btn_adminEditEntry_' + _ID + '" class="buttonAdminFunctionClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="performAdminEditEntry(this); return false;">Edit Entry</button>' : '');
					html += '</div>';
					
					html += '<div id="div_adminEditArticleContent_' + _ID + '"></div>';
					
					html += ((jsBool_sessionLoggedin) ? '' : '<span class="redBlogArticleAccessBoldPrompt">Registered users get unlimited access to Blog Articles, Trackbacks, Comments, Downloads and RSS Feeds.</span>');

					if (bool_isEntryMode) {
						oAJAXEngine.doAJAX('getBlogArticleTrackbacks', 'handleGetBlogArticleTrackbacks', 'id', _ID);
					}
					
					html += '';
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						var _keyword = argsDict.getValueFor('keyword');
						var _id = argsDict.getValueFor('id');
						var _catid = argsDict.getValueFor('catid');
						var _catName = argsDict.getValueFor('catName');

						var _day = argsDict.getValueFor('day');
						var _month = argsDict.getValueFor('month');
						var _year = argsDict.getValueFor('year');
						
						bool_isKeywordSearch = ((!!_keyword) ? true : false);
						bool_isEntryMode = ((!!_id) ? true : false);
						bool_isByDayMode = (((_day != null) && (!!_month) && (!!_year)) ? true : false);
						bool_isByMonthMode = (((_day == null) && (!!_month) && (!!_year)) ? true : false);
						bool_isByCategoryMode = ((_catid != null) ? true : false);
						bool_isByCategoryNameMode = ((_catName != null) ? true : false);
						
						if ( (!bool_isByCategoryMode) && (!bool_isByCategoryNameMode) ) {
							currentCategoryName = '';
						}

						var ii = -1;
						var ar = -1;
						var _dt = -1;
						var fmtDateStr = '';
						var fmtDateStrAR = -1;
						if (bool_isByMonthMode) {
							_dt = new Date(_year, _month, 1);
							var fmtDateStrAR = _dt.toLocaleString().split(' ');
							fmtDateStrAR.pop();
							fmtDateStrAR.pop();
							fmtDateStr = fmtDateStrAR.join(' ');
							fmtDateStrAR = fmtDateStr.split(',');
							for (ii = 0; ii < fmtDateStrAR.length; ii++) {
								fmtDateStrAR[ii] = fmtDateStrAR[ii].toString().ezTrim();
							}

							if (fmtDateStrAR.length == 3) {
								ar = fmtDateStrAR[1].split(' ');
								fmtDateStr = ar[0] + ' ' + fmtDateStrAR[fmtDateStrAR.length - 1];
							}
						} else if (bool_isByDayMode) {
							_dt = new Date(_year, _month, _day);
							var fmtDateStrAR = _dt.toLocaleString().split(' ');
							fmtDateStrAR.pop();
							fmtDateStrAR.pop();
							fmtDateStr = fmtDateStrAR.join(' ');
						}

						if (qData1.length == 2) qData1[1].iterateRecObjs(searchForBlogSettings);
						blogRecordCount = qData1[0].recordCount();
						qData1[0].iterateRecObjs(searchForBlogArticles);

						var dObj = $('div_articleContent');
						if (!!dObj) {
							if ( (bool_isKeywordSearch) || (bool_isEntryMode) || (bool_isByDayMode) || (bool_isByMonthMode) || (bool_isByCategoryMode) || (bool_isByCategoryNameMode) ) {
								_html = '<div class="blogHeader">' + ((bool_isKeywordSearch) ? js_searchedforText + ' : ' + _keyword + ' / ' : ((bool_isEntryMode) ? js_viewingByEntryText + ' / ' : ((bool_isByDayMode) ? js_viewingbydayText + ((fmtDateStr.length > 0) ? ' : ' + fmtDateStr : '') : ((bool_isByMonthMode) ? js_viewingbymonthText + ((fmtDateStr.length > 0) ? ' : ' + fmtDateStr : '') : (((bool_isByCategoryMode) || (bool_isByCategoryNameMode)) ? js_viewingbycategoryText + ' : ' + currentCategoryName : ''))))) + '&nbsp;&nbsp;<button id="btn_returnToMainBlogArticles" class="buttonClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="this.disabled = true; clearBlogArticlesContent(); performDefaultBlogSearch(); return false;">' + js_mainText + '</button></div>';
								dObj.innerHTML = _html + html;
							} else {
								dObj.innerHTML += html;
							}

							if ((jsBool_sessionLoggedin) && (jsBool_isUserAdmin)) {
								_html = '<div class="blogHeader">';
								_html += '<button id="btn_adminAddEntry" class="buttonAdminFunctionClass' + ((browser_is_ff || browser_is_ns) ? 'FF' : '') + '" onclick="performAdminAddEntry(this); return false;">Add Entry</button>';
								// &nbsp;|&nbsp;
								_html += '<div id="div_adminAddEntryContent"></div>';
								_html += '</div>';
								dObj.innerHTML = _html + dObj.innerHTML;
							}

							if (dObj.style.display != const_inline_style) {
								dObj.style.display = const_inline_style;
							}
						} else {
							alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
						}

						if (bool_isKeywordSearch) {
							var oObj = _$('input_searchPod_searchKeyword');
							if (!!oObj) {
								oObj.disabled = false;
							}

							var oObj = _$('btn_searchBlog');
							if (!!oObj) {
								oObj.disabled = false;
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

		function handleGetBlogArticleComments(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			var _html = '';
			
			function searchForComments(_ri, _dict, _rowCntName) {
				var _COMMENT = _dict.getValueFor('COMMENT');
				var _EMAIL = _dict.getValueFor('EMAIL');
				var _ID = _dict.getValueFor('ID');
				var _NAME = _dict.getValueFor('NAME');
				var _POSTED = _dict.getValueFor('POSTED');
				var _SUBSCRIBE = _dict.getValueFor('SUBSCRIBE');
				var _WEBSITE = _dict.getValueFor('WEBSITE');
				var _ISURLVALID = _dict.getValueFor('ISURLVALID');
				var _POSTEDSHORT = _dict.getValueFor('POSTEDSHORT');

				if ( (!!_COMMENT) && (!!_EMAIL) && (!!_ID) && (!!_NAME) && (!!_POSTED) && (!!_SUBSCRIBE) && (!!_WEBSITE) && (!!_ISURLVALID) && (!!_POSTEDSHORT) ) {
					_html += '<p>';
					_html += '<div class="body">';
					_html += _COMMENT;
					_html += '</div>';
					_html += '</p>';
					_html += '<p>';
					_html += '<div class="byline">' + js_postedbyText + ' ' + (((_WEBSITE.length > 0) && (_ISURLVALID)) ? '<a href="' + _WEBSITE + '" target="_blank">' + _NAME + '</a>' : _NAME) + ' / ' + js_postedatText + ' ' + _POSTEDSHORT + ' ' + _POSTED + '</div>';
					_html += '</p>';
					_html += '<hr noshade size=1>';
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						html += '<p>';
						html += '<div class="commentHeader">' + js_commentsText + '</div>';
						html += '</p>';

						qData1[0].iterateRecObjs(searchForComments);
						
						if (_html.length > 0) {
							html += _html;
						} else {
							html += '<p>' + js_nocommentsText + '</p>';
						}

						var dObj = $('div_articleContent');
						if (!!dObj) {
							dObj.innerHTML += html;
						} else {
							alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
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

		function handleGetBlogArticleTrackbacks(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var html = '';
			var _html = '';
			
			function searchForTrackbacks(_ri, _dict, _rowCntName) {
				var _BLOGNAME = _dict.getValueFor('BLOGNAME');
				var _CREATED = _dict.getValueFor('CREATED');
				var _CREATEDSHORT = _dict.getValueFor('CREATEDSHORT');
				var _EXCERPT = _dict.getValueFor('EXCERPT');
				var _ID = _dict.getValueFor('ID');
				var _POSTURL = _dict.getValueFor('POSTURL');
				var _TITLE = _dict.getValueFor('TITLE');

				if ( (!!_BLOGNAME) && (!!_CREATED) && (!!_CREATEDSHORT) && (!!_EXCERPT) && (!!_ID) && (!!_POSTURL) && (!!_TITLE) ) {
					_html += '<p>';
					_html += '<div class="body">';
					_html += '<b>' + _TITLE + '</b><br>';
					_html += _EXCERPT;
					_html += '</div>';
					_html += '<div class="byline">' + js_trackedbyText + ' ' + _BLOGNAME + ' / ' + js_trackedonText + ' ' + _CREATEDSHORT + ' ' + _CREATED + '</div>';
					_html += '<hr noshade size=1>';
					_html += '</p>';
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						html += '<p>';
						html += '<div class="trackbackHeader">TrackBacks</div>';
						html += '</p>';

						qData1[0].iterateRecObjs(searchForTrackbacks);
						
						if (_html.length > 0) {
							html += _html;
						} else {
							html += '<p>' + js_notrackbacksText + '</p>';
						}

						html += '<p>';
						html += '<div class="body">';
						html += js_trackbackurlText + '<br>';
						html += js_ApplicationRootURL + '/trackback.cfm?' + argsDict.getValueFor('id');
						html += '</div>';
						html += '</p>';

						var dObj = $('div_articleContent');
						if (!!dObj) {
							dObj.innerHTML += html;
						} else {
							alert('ERROR: Programming Error - Cannot find element named "div_articleContent".');
						}

						if (bool_isEntryMode) {
							oAJAXEngine.doAJAX('getBlogArticleComments', 'handleGetBlogArticleComments', 'id', argsDict.getValueFor('id'));
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

		var global_podNum = 0;
		var global_podsAR = [];
		
		function handleGetPodCount(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var podsDict = -1;
			var html = '';
			
			function searchForPodsCount(_ri, _dict, _rowCntName) {
				var _PODCOUNT = _dict.getValueFor('PODCOUNT');
				if ( (podsDict == -1) && (!!_PODCOUNT) ) {
					podsDict = ezDictObj.get$(_dict.asQueryString());
				}
			};

			function searchForPodNames(_ri, _dict, _rowCntName) {
				var _NAME = _dict.getValueFor('NAME');
				if (!!_NAME) {
					global_podsAR.push(_NAME);
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						qData1[0].iterateRecObjs(searchForPodsCount);
						
						if (podsDict != -1) {
							if (qData1.length == 2) {
								qData1[1].iterateRecObjs(searchForPodNames);
							//	var dObj = $('div_floatingContent');
							//	if (!!dObj) {
							//		html = '<table width="400" border="1" cellpadding="-1" cellspacing="-1">';
							//		html += '<tr>';
							//		html += '<td>';
							//		html += '<div id="div_activityMonitor"></div>';
							//		html += '</td>';
							//		html += '</tr>';
							//		html += '</table>';
							//		dObj.innerHTML = html;
							//		var cW = ezClientWidth();
							//		dObj.style.position = const_absolute_style;
							//		dObj.style.top = (ezClientHeight() / 2) + 'px';
							//		dObj.style.left = (cW / 2) - (cW / 4) + 'px';
							//		dObj.style.width = '400px';
							//		dObj.style.height = '50px';
							//		dObj.style.display = const_inline_style;

							//		doAJAX_func('getPodByName', 'handleGetPodByName(' + oAJAXEngine.js_global_varName + ')', 'podNum', global_podNum, 'podName', global_podsAR[global_podNum]);
							//	}
							} else {
								alert('ERROR: Programming Error - Missing the Query object that names the individual Pods.');
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

		function handleGetPodByName(qObj, nRecs, qStats, argsDict, qData1) {
			var _id = '';
			var i = -1;
			var n = -1;
			var podDict = -1;
			var html = '';
			
			function searchForPodData(_ri, _dict, _rowCntName) {
				var _PODNUM = _dict.getValueFor('PODNUM');
				if ( (podDict == -1) && (!!_PODNUM) ) {
					podDict = ezDictObj.get$(_dict.asQueryString());
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			if (!!qStats) {
				if (!!argsDict) {
					if (!!qData1) {
						qData1[0].iterateRecObjs(searchForPodData);

						var dObj = _$('div_activityMonitor');
						var _dObj = $('div_floatingContent');
						if ( (!!dObj) && (!!_dObj) ) {
							var pNum = podDict.getValueFor('PODNUM');
							var pTotal = global_podsAR.length;
							if (pNum != null) {
								pNum++;
							}
							var _pCent = Math.ceil((pNum / pTotal) * 100);
							var pCent = (_pCent / 100);
							var pWid = pCent * parseInt(_dObj.style.width);

							dObj.style.width = pWid + 'px';
							dObj.style.backgroundColor = 'lime';
							dObj.innerHTML = '<center><small>' + _pCent + '%</small></center>';

							oAJAXEngine.doAJAX('getPodByName', 'handleGetPodByName', 'podNum', pNum, 'podName', global_podsAR[pNum]);
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

		function expandBlogRightCol(oBtn) {
			var v = '';
			var b = false;
			var _html = '';
			var oDiv = -1;
			var oDiv2 = -1;
			var oTD_articleContent = $('td_articleContent');
			var oTD_podContent2 = $('td_podContent2');
			var oTD_podContent = $('td_podContent');
			var oDivPodContent = $('div_podContent');
			var oDivPodContent2 = $('div_podContent2');
			if ( (!!oBtn) && (!!oTD_articleContent) && (!!oTD_podContent2) && (!!oTD_podContent) && (!!oDivPodContent) && (!!oDivPodContent2) ) {
				v = ezButtonLabelByObj(oBtn);
				b = (v == js_const_expandButtonFace);
				var wid1 = parseInt(oTD_articleContent.width);
				var wid2 = parseInt(oTD_podContent2.width);
				var wid3 = parseInt(oTD_podContent.width);
				if (b) { // expand...
					wid3 = wid2;
					wid1 = 100 - (wid2 + wid3);
					oTD_articleContent.width = wid1 + '%';
					oTD_podContent2.width = wid2 + '%';
					oTD_podContent.width = wid3 + '%';

					var dObj = $('div_articleContent');
					if (!!dObj) {
						dObj.style.width = ezClientWidth() * (wid1 / 100);
					}

					var _els = [];
					var _els2 = [];
					var els = oTD_podContent.getElementsByTagName("div");
					for (var i = 0; i < els.length; i++) {
						if ( (!!els[i].id) && (els[i].id.ezTrim().length > 0) && (els[i].id.ezTrim().toUpperCase() != js_const_div_podContent.toUpperCase()) && (els[i].id.ezTrim().toUpperCase().indexOf('calendar'.toUpperCase()) == -1) && (els[i].id.ezTrim().toUpperCase().indexOf('subscribe'.toUpperCase()) == -1) ) {
							_els.push(els[i]);
						}
					}
					var iHalf = Math.floor(_els.length / 2);
					for (i = 0; i < iHalf; i++) {
						_els2.push(_els.pop());
					}
					_html = '';
					for (i = _els2.length - 1; i >= 0; i--) {
						oDivPodContent2.innerHTML += '<div id="' + _els2[i].id + '2"></div>';
						oDiv = _$(_els2[i].id + '2');
						if (!!oDiv) {
							oDiv.innerHTML = _els2[i].innerHTML;
						}
						_els2[i].style.display = const_none_style;
						_els2[i].innerHTML = '';
					}
					oTD_podContent2.style.display = const_inline_style;
					ezLabelButtonByObj(oBtn, js_const_contractButtonFace);
				} else { // contract...
					wid3 = 30;
					wid1 = 100 - wid3;
					oTD_articleContent.width = wid1 + '%';
					oTD_podContent.width = wid3 + '%';

					var dObj = $('div_articleContent');
					if (!!dObj) {
						dObj.style.width = ezClientWidth() * (wid1 / 100);
					}

					var els = oDivPodContent2.getElementsByTagName("div");
					for (var i = 0; i < els.length; i++) {
						oDiv2 = _$(els[i].id);
						oDiv = _$(els[i].id.substring(0, els[i].id.length - 1));
						if ( (!!oDiv2) && (!!oDiv) ) {
					    	try {
								oDiv.innerHTML = oDiv2.innerHTML;
								oDiv2.style.display = const_none_style;
								oDiv.style.display = const_inline_style;
					        } catch(e) {
					        }
						}
					}
					oDivPodContent2.innerHTML = '';
					
					oTD_podContent2.style.display = const_none_style;
					ezLabelButtonByObj(oBtn, js_const_expandButtonFace);
				}
			}
		}
	// -->
	</script>

	<cfsavecontent variable="ezClusterLink">
		<cfoutput>
			<a href="#Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#')#/blog/downloads/ezCluster(tm).htm" target="_blank"><span class="normalBoldGreenPrompt">ezCluster&##8482</span></a>
		</cfoutput>
	</cfsavecontent>
	<cfsavecontent variable="ezAJAXLink">
		<cfoutput>
			<a href="#ezAJAX_productLink#" target="_blank"><span class="normalBoldGreenPrompt">ezAJAX&##8482</span></a>
		</cfoutput>
	</cfsavecontent>
	<cfsavecontent variable="_poweredHTML">
		<cfoutput>
			<span class="normalBluePrompt">This Blog is powered by </span>#ezClusterLink#.&nbsp;
			#ezClusterLink#<span class="normalBluePrompt"> makes 2 or more of your web servers into a single super-computer web server using cheap off-the-shelf PC's using absolutely <b><u>NO</u></b> expensive Cisco equipment or Windows Load Balancer support.&nbsp;&nbsp;&nbsp;#ezClusterLink# is the lowest cost way to Cluster Web Servers.</span>
			&nbsp;
			<span class="normalBluePrompt">This Blog is powered by #ezAJAXLink#.  #ezAJAXLink# makes it Easy to Create and Publish your AJAX Web Apps.  Let us do all the work for you.</span>
			<br>
			The contents of this Site are protected under U.S. and International Copyright Laws. &copy 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.
		</cfoutput>
	</cfsavecontent>
	
	<table width="100%" cellpadding="-1" cellspacing="-1">
		<tr>
			<td width="10" background="#_urlParentPrefix#/app/images/DiagramBuilder/new/v_blueNarrow.gif">
				&nbsp;
			</td>
			<td width="*">
				<table id="table_outerContentWrapper" width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td background="#_urlParentPrefix#/app/images/DiagramBuilder/new/h_blueTop.gif">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top">
							<table width="100%" cellpadding="-1" cellspacing="-1" class="bannerTable">
								<tr>
									<td align="left" valign="top">
										<div id="banner">#application.blog.getProperty("blogTitle")#</div>
										<a id="anchor_bottomOfBlogTitle" name="anchor_bottomOfBlogTitle"></a>
									</td>
									<td align="left" valign="top">
										<div id="div_actualUsersOnlineStats" class="bannerStats"></div>
									</td>
								<cfif (NOT Request.primitiveCode.isUserPremium()) AND (cf_currentBlogName IS "default")>
									<td align="left" valign="top" style="border: thin solid ##0000cc;">
										<cfset _url = Request.commonCode.ezClusterizeURL('http://#CGI.SERVER_NAME#') & '/' & Request.scriptFirst & 'app/agooglead.cfm'>
										<iframe id="iframe_google_ad" name="iframe_google_ad" class="bannerTable" frameborder="0" scrolling="No" width="480" height="75" src="#_url#?enableMetaRefresh=30"></iframe>
										<center><span class="yellowBlogArticleAccessBoldPrompt">Upgrade to a Premium Subscription to remove these Ads.</span></center>
									</td>
								</cfif>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td valign="top">
							<table width="100%" cellpadding="-1" cellspacing="-1">
								<tr>
									<td background="#_urlParentPrefix#/app/images/DiagramBuilder/h_blue.gif">&nbsp;</td>
									<td colspan="2" align="left" <cfif (cf_currentBlogName IS 'default') AND 0>bgcolor="#cf_blogBgColor#"<cfelse>background="#_urlParentPrefix#/app/images/DiagramBuilder/h_blue.gif"</cfif>>
										<cfif (cf_currentBlogName IS 'default')>
											<button id="btn_expandBlogCols" disabled class="buttonClass<cfif (Request.commonCode.ezIsBrowserFF() OR Request.commonCode.ezIsBrowserFF())>FF</cfif>" onclick="expandBlogRightCol(this); return false;" style="display: none;">#cf_const_expandButtonFace#</button>
										</cfif>
									</td>
								</tr>
								<tr>
									<td id="td_articleContent" width="70%" valign="top" align="left" style="border-right: thin dotted Silver;">
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
										</table>
									</td>
									<td id="td_podContent" width="30%" valign="top" align="left" style="border-left: thin dotted Silver;">
										<div id="div_podContent"></div>
									</td>
									<td id="td_podContent2" width="25%" valign="top" align="left" style="display: none; border-left: thin dotted Silver;">
										<div id="div_podContent2"></div>
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
					<tr>
						<td background="#_urlParentPrefix#/app/images/DiagramBuilder/new/h_blueBottom.gif">&nbsp;</td>
					</tr>
				</table>
			</td>
			<td width="10" background="#_urlParentPrefix#/app/images/DiagramBuilder/new/v_blueNarrow.gif">
				&nbsp;
			</td>
		</tr>
	</table>

	<form id="form_downloadFile" name="myForm" action="" method="get" target="_blank">
		<input type="Submit" name="btn_submit" value="[Download]" style="display: none;">
	</form>
	
	<div id="div_floatingContent" style="display: none;"></div>
	
</cfoutput>

