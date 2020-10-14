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
			Request.commonCode.ezCfDirectory('Request.qDirH', _path, cfJavaScriptSourceCodeFName, false);
			if ( (NOT Request.directoryError) AND (IsQuery(Request.qDirH)) AND (Request.qDirH.recordCount gt 0) ) {
				bool_recompileJavaScript = (DateCompare(Request.qDir2.DATELASTMODIFIED[1], Request.qDirH.DATELASTMODIFIED[1]) gt 0);
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

<cfset fullyQualified_cfJavaScriptSourceCodeFName = ExpandPath(cfJavaScriptSourceCodeFName)>
<cfset bool_rebuildCfJavaScriptSourceCodeFile = (bool_recompileJavaScript) OR (NOT FileExists(fullyQualified_cfJavaScriptSourceCodeFName))>

<cfset bool_useURLEncodedFormat = true>

<cfif (bool_rebuildCfJavaScriptSourceCodeFile)>
	<cfset xxAR = ArrayNew(1)>
	<cfif 0>
		<cfsavecontent variable="someContent">
			<cfoutput>
				<cfset Request.jsCodeObfuscationIndex = 1>
				<cfset Request.jsCodeObfuscationDecoderAR = ArrayNew(1)>
				<cfset _jsCodeList = "decontextmenu.js,initAJAXEngine.js,doAJAX_func.js,ajaxSupport.js,AJaxContextObj.js,AJAXObj.js,AJAXEngine.js">
				<cfset nItems = ArrayLen(jsCodeAR)>
				<cfscript>
					_jCode = 'var x$ = [];';
				</cfscript>
				#_jCode#
				<cfloop index="_i" from="1" to="#nItems#">
					<cfset anItem = jsCodeAR[_i]>
					<cfset boolFlag = (ListFindNoCase(_jsCodeList, ListLast(anItem, '/'), ",") gt 0)>
					<cfset _jscode = Request.commonCode.readAndObfuscateJSCode(anItem, boolFlag)>
					<cfset _anItem = ListSetAt(anItem, 1, "", "/")>
					<cfset _anItem = ReplaceNoCase(_anItem, "/", "_", "all")>
					<cfset _anItem = ReplaceNoCase(_anItem, ".js", "_", "all")>
					<cfset _anItem = ReplaceNoCase(_anItem, ".dat", "_", "all")>
					<cfset _anItem = "j/" & Reverse(_anItem)>
					<cfset Request.debugCompiler = Request.debugCompiler & 'anItem=[#anItem#], _anItem=[#_anItem#]' & Chr(13)>
					<cfset xxAR[ArrayLen(xxAR) + 1] = "boolFlag = [#boolFlag#] (#anItem#) [#_jscode#]">
					<cfset bool_handledByJAPI = false>
					<cfif (FindNoCase("/api.js/", anItem) eq 0)>
						<cfif (bool_useURLEncodedFormat)>
							<cfset bool_handledByJAPI = (FindNoCase("00_ezElementPositon.js", anItem) eq 0)>
							<cfif (bool_handledByJAPI)>
								<cfset _lineOfCode = 'jAPIObj.x$.push("#URLEncodedFormat(_jscode)#");'>
							<cfelse>
								<cfset _lineOfCode = 'x$.push("#URLEncodedFormat(_jscode)#");'>
							</cfif>
						<cfelse>
							<cfset _lineOfCode = 'x$.push("#_jscode#");'>
						</cfif>
					</cfif>
					<cfscript>
						Request.commonCode.ezCfFileWrite(ExpandPath(_anItem), _lineOfCode);
					</cfscript>
					<cfif (NOT bool_handledByJAPI)>
						#_lineOfCode#
					</cfif>
				</cfloop>
				<cfscript>
					_j_Code = 'x$[i]';
					if (bool_useURLEncodedFormat) {
						_j_Code = 'unescape(x$[i])';
					}
					_jCode_ = 'var isSiteHavingProblems = 0; for (i=0; i < x$.length; i++) { eval(#_j_Code#); };';
					_jCode = _jCode & _jCode_;
				</cfscript>
				#_jCode_#
				<cfloop index="_i" from="1" to="#ArrayLen(Request.jsCodeObfuscationDecoderAR)#">
					<cfscript>
						_jCode_ = Request.jsCodeObfuscationDecoderAR[_i];
						_jCode = _jCode & _jCode_;
					</cfscript>
					#_jCode_#
				</cfloop>
				<cfscript>
					_jCode_ = "if (isSiteHavingProblems > 0) alert('This site is experiencing a malfunction, kindly return later on.')";
					_jCode = _jCode & _jCode_;
				</cfscript>
				#_jCode_#
			</cfoutput>
		</cfsavecontent>
	<cfelse>
		<cfsavecontent variable="someContent">
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
					<cfset Request.debugCompiler = Request.debugCompiler & 'anItem=[#anItem#], _anItem=[#_anItem#]' & Chr(13)>
					<cfset boolFlag = (ListFindNoCase(_jsCodeList, ListLast(anItem, '/'), ",") gt 0)>
					<cfset boolFlag = false>
					<cfset _jscode = Request.commonCode.readAndObfuscateJSCode(anItem, boolFlag)>
					<cfset xxAR[ArrayLen(xxAR) + 1] = "boolFlag = [#boolFlag#] (#anItem#) [#_jscode#]">
					<cfif (FindNoCase("/api.js/", anItem) eq 0)>
						<cfset bool_handledByJAPI = (ListFindNoCase("00_ezElementPositonX.js,00_ezElementPositon.js,00_getSelectionsFromObj.js,01_clickRadioButton.js,01_clientHt$.js,01_clientWid$.js,09_window_onload.js,01_disableAllButtonsLike.js,01_events.js,01_ezFullyQualifiedAppUrl.js,01_ezFullyQualifiedAppPrefix.js,01_ezURLPrefixFromHref.js,01_ezFirstFolderAfterDomainNameFromHref.js,01_ezClusterSupport.js,01_getStyle.js,01_insertArrayItem.js,01_locateArrayItems.js,01_ezHex.js,01_misc.js,01_objectExplainer.js,01_removeArrayItem.js,01_removeEmptyItemsFromArray.js,01_setFocusSafely.js,01_setStyle.js", ListLast(anItem, "/"), ",") gt 0)>
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
	</cfif>
	
	<cfif (debugJavaScriptPackager)>
		<cfdump var="#xxAR#" label="xxAR" expand="No">
	</cfif>			
	
	<cfif (FileExists(fullyQualified_cfJavaScriptSourceCodeFName))>
		<cffile action="DELETE" file="#fullyQualified_cfJavaScriptSourceCodeFName#">
	</cfif>
	<cffile action="WRITE" file="#fullyQualified_cfJavaScriptSourceCodeFName#" output="#Request.commonCode.jsMinifier(someContent)#" addnewline="No" fixnewline="No">
</cfif>
