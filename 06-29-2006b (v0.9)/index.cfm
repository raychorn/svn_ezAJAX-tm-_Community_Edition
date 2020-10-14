<cfsetting showdebugoutput="No">

<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>ezAJAX(tm) Test/Sample Application - #_copyrightNotice#</title>
		<LINK rel="STYLESHEET" type="text/css" href="#_urlPrefix#/StyleSheet.css"> 
		<link href="#_urlParentPrefix#/includes/style.css" rel="stylesheet" type="text/css"> 
		
		<cfset debugJavaScriptPackager = false>
		<cfscript>
			jsCodeList = '../js/433511201010924803.dat,../js/decontextmenu.js';
			jsCodeAR = ListToArray(jsCodeList, ',');
			
			bool_recompileJavaScript = false;
			Request.commonCode.cf_directory('Request.qDir', ExpandPath('js'), '*.js', true);
			if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
				_sql_statement = "SELECT * FROM Request.qDir WHERE (TYPE = 'File') AND (SIZE > 0) ORDER BY DATELASTMODIFIED DESC";
				Request.commonCode.safely_execSQL('Request.qDir2', '', _sql_statement);
				if (NOT Request.dbError) {
	
					_path = GetDirectoryFromPath(GetCurrentTemplatePath());
					Request.commonCode.cf_directory('Request.qDirH', _path, cfJavaScriptSourceCodeFName, false);
					if ( (NOT Request.directoryError) AND (IsQuery(Request.qDirH)) AND (Request.qDirH.recordCount gt 0) ) {
						bool_recompileJavaScript = (DateCompare(Request.qDir2.DATELASTMODIFIED[1], Request.qDirH.DATELASTMODIFIED[1]) gt 0);
					}
				}

				_sql_statement = "SELECT * FROM Request.qDir2 WHERE (TYPE = 'File') AND (SIZE > 0) ORDER BY NAME, DIRECTORY";
				Request.commonCode.safely_execSQL('Request.qDir3', '', _sql_statement);
				if (NOT Request.dbError) {
					fPath = GetCurrentTemplatePath();
					pName = ListDeleteAt(fPath, ListLen(fPath, '\'), '\') & '\';
					for (i = 1; i lte Request.qDir3.recordCount; i = i + 1) {
						aFolderName = Replace(ReplaceNoCase(Request.qDir3.DIRECTORY[i], pName, ''), '\', '/', 'all');
						if (debugJavaScriptPackager) writeOutput(aFolderName & "/" & TRIM(Request.qDir3.NAME[i]) & '<br>');
						jsCodeAR[ArrayLen(jsCodeAR) + 1] = aFolderName & "/" & TRIM(Request.qDir3.NAME[i]);
					}
				}
			}
		</cfscript>
		
		<cfif (debugJavaScriptPackager)>
			<cfdump var="#jsCodeAR#" label="jsCodeAR" expand="No">
		</cfif>

		<cfset fullyQualified_cfJavaScriptSourceCodeFName = ExpandPath(cfJavaScriptSourceCodeFName)>
		<cfset bool_rebuildCfJavaScriptSourceCodeFile = (bool_recompileJavaScript) OR (NOT FileExists(fullyQualified_cfJavaScriptSourceCodeFName))>

		<cfif (bool_rebuildCfJavaScriptSourceCodeFile)>
			<cfset xxAR = ArrayNew(1)>
			<cfsavecontent variable="someContent">
				<cfoutput>
					<cfset Request.jsCodeObfuscationIndex = 1>
					<cfset Request.jsCodeObfuscationDecoderAR = ArrayNew(1)>
					<cfset _jsCodeList = "decontextmenu.js,initAJAXEngine.js,doAJAX_func.js,ajaxSupport.js,AJaxContextObj.js,AJAXObj.js,AJAXEngine.js">
					<cfset nItems = ArrayLen(jsCodeAR)>
					var x$ = [];
					<cfloop index="_i" from="1" to="#nItems#">
						<cfset anItem = jsCodeAR[_i]>
						<cfset boolFlag = (ListFindNoCase(_jsCodeList, ListLast(anItem, '/'), ",") gt 0)>
						<cfsavecontent variable="_jscode"><cfoutput>#Request.commonCode.readAndObfuscateJSCode(anItem, boolFlag)#</cfoutput></cfsavecontent>
						<cfset xxAR[ArrayLen(xxAR) + 1] = "boolFlag = [#boolFlag#] (#anItem#) [#_jscode#]">
						x$.push("#URLEncodedFormat(_jscode)#");
					</cfloop>
					var isSiteHavingProblems = 0; for (i=0; i < x$.length; i++) { eval(unescape(x$[i])); };
					<cfloop index="_i" from="1" to="#ArrayLen(Request.jsCodeObfuscationDecoderAR)#">
						#Request.jsCodeObfuscationDecoderAR[_i]#
					</cfloop>
					if (isSiteHavingProblems > 0) alert('This site is experiencing a malfunction, kindly return later on.')
				</cfoutput>
			</cfsavecontent>

			<cfif (debugJavaScriptPackager)>
				<cfdump var="#xxAR#" label="xxAR" expand="No">
			</cfif>			
			
			<cfif (FileExists(fullyQualified_cfJavaScriptSourceCodeFName))>
				<cffile action="DELETE" file="#fullyQualified_cfJavaScriptSourceCodeFName#">
			</cfif>
			<cffile action="WRITE" file="#fullyQualified_cfJavaScriptSourceCodeFName#" output="#Request.commonCode.jsMinifier(someContent)#" addnewline="No" fixnewline="No">
		</cfif>

		<script language="JavaScript1.2" type="text/javascript" src="#_urlPrefix#/#cfJavaScriptSourceCodeFName#"></script>
	</head>

	<body onload="window_onload()" onunload="window_onUnload()">
<cfif (NOT debugJavaScriptPackager)>
		<cfif 0>
			<cfdump var="#CGI#" label="CGI Scope" expand="No">
		</cfif>

		<script language="JavaScript1.2" type="text/javascript">
		<!--//
			var const_cf_html_container_symbol = '#Request.cf_html_container_symbol#';
			var const_loading_data_message_symbol = '<span class="ajaxLoadingStatusClass"><NOBR>&nbsp;Server Busy !</NOBR></span>';
			var const_system_ready_message_symbol = '<span class="normalStatusClass">&nbsp;Ready !</span>';
			var const_jsapi_loading_image = '#Request.const_jsapi_loading_image#';
			var const_busy_loading_image = '#Request.const_busy_loading_image#';
			var const_system_busy_message_symbol = '<span class="ajaxLoadingStatusClass"><NOBR>&nbsp;Busy !</NOBR></span>';
			
			var cf_AUTH_USER = '#Request.AUTH_USER#';

			var js_isDebugMode = (('#Request.cf_isDebugMode#'.toUpperCase() == 'YES') ? true : false);
		
			var cf_cgiReferer = '';
			<cfif (IsDefined("CGI.SERVER_NAME"))>cf_cgiReferer = '#CGI.SERVER_NAME#';</cfif>
			
			var const_div_floating_debug_menu = '#Request.cf_div_floating_debug_menu#';

			var const_jsapi_width_value = 200;

			var global_allow_loading_data_message = false;

			var url_sBasePath = 'http' + (('#CGI.SERVER_PORT#' == '443') ? 's' : '') + ':\/\/#CGI.HTTP_HOST#';

			url_sBasePath += '#Request.cfm_gateway_process_html#';
			
		//	alert('url_sBasePath = [' + url_sBasePath + ']');
			
			// create the gateway object
			var oAJAXEngine = AJAXEngine.get$(url_sBasePath, false);

			var browser_is_op = oAJAXEngine.browser_is_op;
			var browser_is_ns = oAJAXEngine.browser_is_ns;
			var browser_is_ff = oAJAXEngine.browser_is_ff;
			var browser_is_ie = oAJAXEngine.browser_is_ie;

			oAJAXEngine.setMethodGet();
			oAJAXEngine.setReleaseMode(); // this overrides the oAJAXEngine.set_isServerLocal() setting...

			// The following line of code sets-up the Production environment for a preference for XmlHttpRequest rather than iFrame...
			oAJAXEngine.isXmlHttpPreferred = ((window.location.href.toUpperCase().indexOf('.CONTENTOPIA.NET') == -1) ? false : true);
			// The following line of code sets-up the Development environment for a preference for XmlHttpRequest rather than iFrame...
	//		oAJAXEngine.isXmlHttpPreferred = (((window.location.href.toUpperCase().indexOf('LAPTOP.HALSMALLTALKER.COM') > -1) || (js_isDebugMode)) ? true : false);

			oAJAXEngine.timeout = 120;
			oAJAXEngine.js_global_varName = 'js$';

			oAJAXEngine.hideFrameCallback = function () { var dObj = $('div_articleContent'); if (!!dObj) { dObj.style.display = const_inline_style; }; };
			oAJAXEngine.showFrameCallback = function () { var dObj = $('div_articleContent'); if (!!dObj) { dObj.style.display = const_none_style; }; };
			
			oAJAXEngine.createAJAXEngineCallback = function () { this.top = '120px'; };  /* this.setDebugMode(); alert('isDebugMode() = [' + this.isDebugMode() + ']'); */
			
			var global_echo_AJAX_commands = false;
		//-->
		</script>

		<script language="JavaScript1.2" type="text/javascript">
		<!--
		// place this on the page where you want the gateway to appear
			oAJAXEngine.create();
		//-->
		</script>

		<script language="JavaScript1.2" type="text/javascript">
		<!--
			document.write('<div id="html_container" style="display: inline; position: absolute; top: 0px; left: ' + (clientWid$() - const_jsapi_width_value) + 'px">');
			document.write('</div>');
		// -->
		</script>
		
		<cfinclude template="debugContent.cfm">
		
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

		<cfinclude template="cfinclude_index_body.cfm">
		
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
