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
				<cfif (bool_useURLEncodedFormat)>x$.push("#URLEncodedFormat(_jscode)#");<cfelse>x$.push("#_jscode#");</cfif>
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
	
	<cfif (FileExists(fullyQualified_cfJavaScriptSourceCodeFName))>
		<cffile action="DELETE" file="#fullyQualified_cfJavaScriptSourceCodeFName#">
	</cfif>
	<cffile action="WRITE" file="#fullyQualified_cfJavaScriptSourceCodeFName#" output="#Request.commonCode.jsMinifier(someContent)#" addnewline="No" fixnewline="No">
</cfif>
