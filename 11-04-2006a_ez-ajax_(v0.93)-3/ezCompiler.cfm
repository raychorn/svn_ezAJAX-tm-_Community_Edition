<cfsetting requesttimeout="3600">

<cfset debugJavaScriptPackager = false>
<cfscript>
	jsCodeList = '_js/433511201010924803.dat,_js/decontextmenu.js';
	jsCodeAR = ListToArray(jsCodeList, ',');
	
	bool_recompileJavaScript = false;
	Request.commonCode.ezCfDirectory('Request.qDir', ExpandPath('js'), '*.js', true);
	if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
		_sql_statement = "SELECT * FROM Request.qDir WHERE (TYPE = 'File') AND (SIZE > 0) ORDER BY DATELASTMODIFIED DESC";
		Request.commonCode.ezExecSQL('Request.qDir2', '', _sql_statement);
		if (NOT Request.dbError) {

			_path = GetDirectoryFromPath(GetCurrentTemplatePath());
			Request.commonCode.ezCfDirectory('Request.qDirH1', _path, cfJavaScriptSourceCodeFName1, false);
			_directoryError1 = Request.directoryError;
			Request.commonCode.ezCfDirectory('Request.qDirH2', _path, cfJavaScriptSourceCodeFName2, false);
			_directoryError2 = Request.directoryError;
			if ( (NOT _directoryError1) AND (NOT _directoryError2) AND (IsQuery(Request.qDirH1)) AND (Request.qDirH1.recordCount gt 0) AND (IsQuery(Request.qDirH2)) AND (Request.qDirH2.recordCount gt 0) ) {
				bool_recompileJavaScript = ( (DateCompare(Request.qDir2.DATELASTMODIFIED[1], Request.qDirH1.DATELASTMODIFIED[1]) gt 0) OR (DateCompare(Request.qDir2.DATELASTMODIFIED[1], Request.qDirH2.DATELASTMODIFIED[1]) gt 0) );
			}
		}

		_sql_statement = "SELECT * FROM Request.qDir2 WHERE (TYPE = 'File') AND (SIZE > 0) ORDER BY NAME, DIRECTORY";
		Request.commonCode.ezExecSQL('Request.qDir3', '', _sql_statement);
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

<cfset fullyQualified_cfJavaScriptSourceCodeFName1 = ExpandPath(cfJavaScriptSourceCodeFName1)>
<cfset fullyQualified_cfJavaScriptSourceCodeFName2 = ExpandPath(cfJavaScriptSourceCodeFName2)>
<cfset bool_rebuildCfJavaScriptSourceCodeFile = (bool_recompileJavaScript) OR (NOT FileExists(fullyQualified_cfJavaScriptSourceCodeFName1)) OR (NOT FileExists(fullyQualified_cfJavaScriptSourceCodeFName2))>

<cfset bool_useURLEncodedFormat = true>

<cfif (bool_rebuildCfJavaScriptSourceCodeFile)>
	<cfset xxAR = ArrayNew(1)>
	<cfset Request.debugCompiler = "">
	<cfsavecontent variable="someContent1">
		<cfoutput>
			<cfset Request.jsCodeObfuscationIndex = 1>
			<cfset Request.jsCodeObfuscationDecoderAR = ArrayNew(1)>
			<cfset _jsCodeList = "decontextmenu.js,initAJAXEngine.js,doAJAX_func.js,ajaxSupport.js,AJaxContextObj.js,AJAXObj.js,AJAXEngine.js">
			<cfset nItems = ArrayLen(jsCodeAR)>
			var x$ = [];
			<cfloop index="_i" from="1" to="#nItems#">
				<cfset anItem = jsCodeAR[_i]>
				<cfset boolFlag = (ListFindNoCase(_jsCodeList, ListLast(anItem, '/'), ",") gt 0)>
				<cfif 0>
					<cfsavecontent variable="_jscode"><cfoutput>#Request.commonCode.readAndObfuscateJSCode(anItem, boolFlag)#</cfoutput></cfsavecontent>
				<cfelse>
					<cfset _jscode = Request.commonCode.readAndObfuscateJSCode(anItem, boolFlag)>
				</cfif>
				<cfif 0>
					<cfset Request.debugCompiler = Request.debugCompiler & '[#boolFlag#]&nbsp;#URLEncodedFormat(_jscode)##Chr(13)#'>
				</cfif>
				<cfset xxAR[ArrayLen(xxAR) + 1] = "boolFlag = [#boolFlag#] (#anItem#) [#_jscode#]">
				<cfif (bool_useURLEncodedFormat)>x$.push("#URLEncodedFormat(_jscode)#");<cfelse>x$.push("#_jscode#");</cfif>
			</cfloop>
			var isSiteHavingProblems = 0; for (i=0; i < x$.length; i++) { eval(<cfif (bool_useURLEncodedFormat)>unescape(x$[i])<cfelse>x$[i]</cfif>); };
			<cfloop index="_i" from="1" to="#ArrayLen(Request.jsCodeObfuscationDecoderAR)#">
				#Request.jsCodeObfuscationDecoderAR[_i]#
			</cfloop>
			if (isSiteHavingProblems > 0) alert('This site is experiencing a malfunction, kindly return later on.')
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="someContent2">
		<cfoutput>
			<cfset Request.jsCodeObfuscationIndex = 1>
			<cfset Request.jsCodeObfuscationDecoderAR = ArrayNew(1)>
			<cfset _jsCodeList = "decontextmenu.js,initAJAXEngine.js,doAJAX_func.js,ajaxSupport.js,AJaxContextObj.js,AJAXObj.js,AJAXEngine.js">
			<cfset nItems = ArrayLen(jsCodeAR)>
			var x$ = [];
			<cfloop index="_i" from="1" to="#nItems#">
				<cfset anItem = jsCodeAR[_i]>
				<cfset _anItem = ListSetAt(anItem, 1, "", "/")>
				<cfset _anItem = ReplaceNoCase(_anItem, "/", "_", "all")>
				<cfset _anItem = ReplaceNoCase(_anItem, ".js", "_", "all")>
				<cfset _anItem = ReplaceNoCase(_anItem, ".dat", "_", "all")>
				<cfset _anItem = "j/" & Reverse(_anItem)>
				<cfif 0>
					<cfset Request.debugCompiler = Request.debugCompiler & 'anItem=[#anItem#], _anItem=[#_anItem#]' & Chr(13)>
				</cfif>
				<cfset boolFlag = (ListFindNoCase(_jsCodeList, ListLast(anItem, '/'), ",") gt 0)>
				<cfset boolFlag = false>
				<cfset _jscode = Request.commonCode.readAndObfuscateJSCode(anItem, boolFlag)>
				<cfset xxAR[ArrayLen(xxAR) + 1] = "boolFlag = [#boolFlag#] (#anItem#) [#_jscode#]">
				<cfif (FindNoCase("/api.js/", anItem) eq 0)>
					<cfset bool_handledByJAPI = (ListFindNoCase("00_ezElementPositonX.js,00_ezElementPositon.js,00_getSelectionsFromObj.js,01_clickRadioButton.js,01_clientHt$.js,01_clientWid$.js,09_window_onload.js,01_disableAllButtonsLike.js,01_events.js,01_ezFullyQualifiedAppUrl.js,01_ezFullyQualifiedAppPrefix.js,01_ezURLPrefixFromHref.js,01_ezFirstFolderAfterDomainNameFromHref.js,01_ezClusterSupport.js,01_getStyle.js,01_insertArrayItem.js,01_locateArrayItems.js,01_ezHex.js,01_misc.js,01_objectExplainer.js,01_removeArrayItem.js,01_removeEmptyItemsFromArray.js,01_setFocusSafely.js,01_setStyle.js,01_simulateCheckBoxClick.js,01_toCamelCase.js,01_getViewportHeight.js,01_getViewportWidth.js,01_getScrollLeft.js,01_getScrollTop.js,01_setCookie.js,01_getCookie.js,01_deleteCookie.js,01_getFilename.js,01_getPath.js,01_StringPrototypeClipCaselessReplace.js,01_StringPrototypeFormatForWidth.js,01_StringPrototypeIsAlpha.js,01_StringPrototypeIsNumeric.js,01_StringPrototypeReplaceSubString.js,01_StringPrototypeStripCrLfs.js,01_StringPrototypeStripHTML.js,01_StringPrototypeStripSpacesBy2s.js,01_StringPrototypeStripTabs.js,01_StringPrototypeTrim.js,01_Style2String.js,01_URLDecode.js,01_URLEncode.js,02_ArrayPrototypeCfString.js,02_StringPrototypeFilterInAlpha.js,02_StringPrototypeFilterInNumeric.js,02_flushCache$.js,02_getButtonLabelByObj.js,02_labelButtonByObj.js,02_setFocusSafelyById.js,03_StringPrototypeStripIllegalChars.js,05_handleEzAJAXDebugButtonClick.js,05_handle_ajaxHelper2_onClick.js,06_DictObj.js,02_AnchorPosition.js,02_TabsObj.js,07_GUIActsObj.js,09_anyErrorRecords.js,10_debugMenuSupport.js", ListLast(anItem, "/"), ",") gt 0)>
					<cfif (bool_handledByJAPI)>
						<cfscript>
							Request.commonCode.ezCfFileWrite(ExpandPath(_anItem), _jscode);
						</cfscript>
					<cfelse>
						<cfif (bool_useURLEncodedFormat)>x$.push("#URLEncodedFormat(_jscode)#");<cfelse>x$.push("#_jscode#");</cfif>
					</cfif>
				<cfelse>
					<cfscript>
						Request.commonCode.ezCfFileWrite(ExpandPath(_anItem), _jscode);
					</cfscript>
				</cfif>
			</cfloop>
			var isSiteHavingProblems = 0; for (i=0; i < x$.length; i++) { eval(<cfif (bool_useURLEncodedFormat)>unescape(x$[i])<cfelse>x$[i]</cfif>); };
			<cfloop index="_i" from="1" to="#ArrayLen(Request.jsCodeObfuscationDecoderAR)#">
				#Request.jsCodeObfuscationDecoderAR[_i]#
			</cfloop>
			if (isSiteHavingProblems > 0) alert('This site is experiencing a malfunction, kindly return later on.')
		</cfoutput>
	</cfsavecontent>
	
	<cfif (debugJavaScriptPackager)>
		<cfdump var="#xxAR#" label="xxAR" expand="No">
	</cfif>			
	
	<cfif (FileExists(fullyQualified_cfJavaScriptSourceCodeFName1))>
		<cffile action="DELETE" file="#fullyQualified_cfJavaScriptSourceCodeFName1#">
	</cfif>
	<cffile action="WRITE" file="#fullyQualified_cfJavaScriptSourceCodeFName1#" output="#Request.commonCode.jsMinifier(someContent1)#" addnewline="No" fixnewline="No">

	<cfif (FileExists(fullyQualified_cfJavaScriptSourceCodeFName2))>
		<cffile action="DELETE" file="#fullyQualified_cfJavaScriptSourceCodeFName2#">
	</cfif>
	<cffile action="WRITE" file="#fullyQualified_cfJavaScriptSourceCodeFName2#" output="#Request.commonCode.jsMinifier(someContent2)#" addnewline="No" fixnewline="No">
</cfif>
