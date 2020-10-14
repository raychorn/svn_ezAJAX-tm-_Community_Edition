<cfsetting requesttimeout="3600">

<cfset debugJavaScriptPackager = false>
<cfscript>
	jsCodeList = '_js/433511201010924803.dat,_js/decontextmenu.js';
//	jsCodeList = '_js/decontextmenu.js';
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
			if ( (NOT _directoryError2) AND (IsQuery(Request.qDirH2)) AND (Request.qDirH2.recordCount gt 0) AND (NOT _directoryError1) AND (IsQuery(Request.qDirH1)) AND (Request.qDirH1.recordCount gt 0) ) {
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
			<cfset nItems = ArrayLen(jsCodeAR)>
			<cfloop index="_i" from="1" to="#nItems#">
				<cfset anItem = jsCodeAR[_i]>
				<cfset _anItem = ListSetAt(anItem, 1, "", "/")>
				<cfset _anItem = ReplaceNoCase(_anItem, "/", "_", "all")>
				<cfset _anItem = ReplaceNoCase(_anItem, ".js", "_", "all")>
				<cfset _anItem = ReplaceNoCase(_anItem, ".dat", "_", "all")>
				<cfset _anItem = "j/" & Reverse(_anItem)>
				<cfset boolFlag = false>
				<cfset _jscode = Request.commonCode._readAndObfuscateJSCode(anItem)>
				<cfif (FindNoCase("00_", anItem) neq 0)>
					#_jscode#
				</cfif>
			</cfloop>
		</cfoutput>
	</cfsavecontent>
	<cfsavecontent variable="someContent2">
		<cfoutput>
			<cfscript>
	//			_contentA = '<script language="JavaScript1.2" type="text/javascript">';
				_contentA = '';
			</cfscript>
			<cfset Request.jsCodeObfuscationIndex = 1>
			<cfset Request.jsCodeObfuscationDecoderAR = ArrayNew(1)>
			<cfset nItems = ArrayLen(jsCodeAR)>
			<cfloop index="_i" from="1" to="#nItems#">
				<cfset anItem = jsCodeAR[_i]>
				<cfset _anItem = ListSetAt(anItem, 1, "", "/")>
				<cfset _anItem = ReplaceNoCase(_anItem, "/", "_", "all")>
				<cfset _anItem = ReplaceNoCase(_anItem, ".js", "_", "all")>
				<cfset _anItem = ReplaceNoCase(_anItem, ".dat", "_", "all")>
				<cfset _anItem = "j/" & Reverse(_anItem)>
				<cfset boolFlag = false>
				<cfset _jscode = Request.commonCode._readAndObfuscateJSCode(anItem)>
				<cfif (FindNoCase("00_", anItem) eq 0)>
					#_jscode#
				</cfif>
			</cfloop>
			<cfscript>
	//			_contentB = '</script>';
				_contentB = '';
			</cfscript>
		</cfoutput>
	</cfsavecontent>
	
	<cfif (debugJavaScriptPackager)>
		<cfdump var="#xxAR#" label="xxAR" expand="No">
	</cfif>			
	
	<cfif (FileExists(fullyQualified_cfJavaScriptSourceCodeFName1))>
		<cffile action="DELETE" file="#fullyQualified_cfJavaScriptSourceCodeFName1#">
	</cfif>
	<cffile action="WRITE" file="#fullyQualified_cfJavaScriptSourceCodeFName1#" output="#(Request.commonCode.standardCopyrightNotice() & Request.commonCode.jsMinifier(someContent1))#" addnewline="No" fixnewline="No">

	<cfif (FileExists(fullyQualified_cfJavaScriptSourceCodeFName2))>
		<cffile action="DELETE" file="#fullyQualified_cfJavaScriptSourceCodeFName2#">
	</cfif>
	<cffile action="WRITE" file="#fullyQualified_cfJavaScriptSourceCodeFName2#" output="#(_contentA & Request.commonCode.standardCopyrightNotice() & Request.commonCode.jsMinifier(someContent2) & _contentB)#" addnewline="No" fixnewline="No">
</cfif>
