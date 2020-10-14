<cfscript>
	function theAppName() {
		var aa = -1;
		var subName = -1;
		var myAppName = -1;
		
		if (NOT IsDefined("This.name")) {
			aa = ListToArray('/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/', '/');
			subName = aa[1];
			if (Len(subName) gt 0) {
				subName = '_' & subName;
			}
	
			myAppName = right(reReplace(CGI.SERVER_NAME & subName, "[^a-zA-Z]","_","all"), 64);
			myAppName = ArrayToList(ListToArray(myAppName, '_'), '_');
			myAppName = UCASE(myAppName);
		}
		return myAppName;
	}
	myAppName = theAppName();
	
	ezAJAX_title = 'ezAJAX(tm) Test/Sample Application - ';
</cfscript>

<cfset myAppNameCFM = ExpandPath("ezappname.cfm")>
<cfif (FileExists(myAppNameCFM))>
	<cfinclude template="#myAppNameCFM#">
<cfelse>
	<cfapplication name="#myAppName#" clientmanagement="Yes" sessionmanagement="Yes" clientstorage="clientvars" setclientcookies="No" setdomaincookies="No" scriptprotect="All" sessiontimeout="#CreateTimeSpan(0,1,0,0)#" applicationtimeout="#CreateTimeSpan(1,0,0,0)#" loginstorage="Session">
</cfif>

<cffunction name="findAJAXCodeCFC" access="private" returntype="string">
	<cfargument name="_thisName_" type="string" required="Yes">
	
	<cfset var pName = ExpandPath("/" & ListFirst(CGI.SCRIPT_NAME, "/"))>
	<cfset var sPath = "">
	<cfset var mPath = "">
	<cfset var xPath = "">
	<cfset var ar = "">
	<cfset var hitCount = ArrayNew(1)>
	<cfset var iRow = "">
	<cfset var i = "">
	<cfset var nn = "">
	<cfset var iHits = 0>
	<cfset var iRowHitsMax = "">
	<cfset var _keyWord = "">
	<cfset var _f = "">
	<cfset var iMax = -1>

	<cfset Request.directoryError = false>
	<cftry>
		<cfdirectory action="LIST" directory="#pName#" name="Request.qDir" filter="#_thisName_#.cfc" recurse="Yes">

		<cfcatch type="Any">
			<cfset Request.directoryError = true>
			<cfdump var="#cfcatch#" label="cfcatch" expand="No">
		</cfcatch>
	</cftry>

	<cfif (0)>
		<cfdump var="#Request.qDir#" label="Request.qDir [#_thisName_#.cfc]" expand="No">
	</cfif>

	<cfscript>
		if (NOT Request.directoryError) {
			sPath = ListDeleteAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, "/"), "/");
			sPath = Replace(sPath, "/", "\", "all");
			ar = ListToArray(sPath, '\');
			nn = ArrayLen(ar);
			for (iRow = 1; iRow lte Request.qDir.recordCount; iRow = iRow + 1) {
				iHits = 0;
				for (i = 1; i lte nn; i = i + 1) {
					_keyWord = '\' & ar[i] & '\';
					_f = FindNoCase(_keyWord, Request.qDir.DIRECTORY[iRow]);
					if (_f gt 0) {
						iHits = iHits + 1;
					}
				}
				_f = FindNoCase(sPath & '\', Request.qDir.DIRECTORY[iRow]);
				if (_f gt 0) {
					iHits = iHits + 1;
				}
				hitCount[iRow] = iHits;
			}
			nn = ArrayLen(hitCount);
			for (iRow = 1; iRow lte nn; iRow = iRow + 1) {
				iMax = Max(iMax, hitCount[iRow]);
			}
			iRowHitsMax = -1;
			for (iRow = 1; iRow lte nn; iRow = iRow + 1) {
				if (hitCount[iRow] eq iMax) {
					iRowHitsMax = iRow;
					mPath = Request.qDir.DIRECTORY[iRowHitsMax];
					i = FindNoCase(sPath, mPath);
					while (i eq 0) {
						sPath = ListDeleteAt(sPath, ListLen(sPath, '\'), '\');
						i = FindNoCase(sPath, mPath);
					}
					if (i gt 0) {
						xPath = Right(mPath, Len(mPath) - i + 1);
					}
					if (Left(xPath, 1) eq '\') {
						xPath = Right(xPath, Len(xPath) - 1);
					}
					xPath = ReplaceNoCase(xPath, '\', '.', 'all');
					break;
				}
			}
		}
	</cfscript>
	
	<cfreturn xPath>
</cffunction>

<cfscript>
	err_ajaxCode = false;
	err_ajaxCodeMsg = '';
	errorExplanation = '';
</cfscript>

<cfscript>
	httpPrefix = 'http';
	if (CGI.SERVER_PORT eq '443') {
		httpPrefix = httpPrefix & 's';
	}
	ezAJAX_webRoot = httpPrefix & '://#CGI.SERVER_NAME#' & ListDeleteAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, '/'), '/') & '/';
	if (Right(ezAJAX_webRoot, 1) eq '/') {
		ezAJAX_webRoot = Left(ezAJAX_webRoot, Len(ezAJAX_webRoot) - 1);
	}

	_copyrightNotice = '&copy; 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.';
</cfscript>

<cfscript>
	if ( (IsDefined("ezAJAX_getDebugMode")) AND (IsCustomFunction(ezAJAX_getDebugMode)) ) {
		try {
			Request.ezAJAX_isDebugMode = ( (ezAJAX_getDebugMode(CGI.REMOTE_ADDR)) OR (isDebugMode()) );
		} catch (Any e) {
			Request.ezAJAX_isDebugMode = (isDebugMode());
		}
	} else {
		Request.ezAJAX_isDebugMode = ( (FindNoCase('192.168.1.', CGI.REMOTE_ADDR) gt 0) OR (FindNoCase('127.0.0.1', CGI.REMOTE_ADDR) gt 0) OR (isDebugMode()) );
	}
	
	Request.ezAJAX_Cr = Chr(13);
	Request.ezAJAX_Lf = Chr(10);
	Request.ezAJAX_CrLf = Request.ezAJAX_Cr & Request.ezAJAX_Lf;
	Request.const_paper_color_light_yellow = '##FFFFBF';
	Request.const_color_light_blue = '##80FFFF';
	
	temporalIndex = '#GetTickCount()#';
	Randomize(Right(temporalIndex, Min(Len(temporalIndex), 9)), 'SHA1PRNG');
	
	Request.cf_div_floating_debug_menu = 'div_floating_debug_menu';

	cf_trademarkSymbol = '&##8482';
			
	cfJavaScriptSourceCodeFName = "javascript.js";
	
	Request.AUTH_USER = '';
	if ( (IsDefined("CGI.AUTH_USER")) AND (Len(CGI.AUTH_USER) gt 0) ) {
		Request.AUTH_USER = CGI.AUTH_USER;
	}

	err_ajaxCode = false;
	err_ajaxCodeMsg = '';
	try {
		_cfcName = 'ezLicenserCode';
		_prefix = findAJAXCodeCFC(_cfcName);
		if (Len(_prefix) eq 0) {
			_cfcName = 'ezCompilerCode';
			_prefix = findAJAXCodeCFC(_cfcName);
			if (Len(_prefix) eq 0) {
				_cfcName = 'ezAjaxCode';
				_prefix = findAJAXCodeCFC(_cfcName);
			}
		}

		_chDot = '.';
		if (Len(_prefix) eq 0) {
			_prefix = 'ezAjax.cfc';
			_chDot = '.';
		}
		fqCFCName = _prefix & _chDot & _cfcName;
		Request.commonCode = CreateObject("component", fqCFCName);
	} catch(Any e) {
		err_ajaxCode = true;
		err_ajaxCodeMsg = '(1) The #fqCFCName#.cfc component has NOT been created.';
		writeOutput('<font color="red"><b>#err_ajaxCodeMsg# | Reason: [#e.message#] [#e.detail#]</b></font><br>');
	}
	
	Request.ezAJAX_functions_cfm = ezAJAX_webRoot & "/ezAjax/ezAJAX_functions.cfm";
	
	Request.RuntimeLicenseStatus = '';
</cfscript>

<cfif (err_ajaxCode)>
	<cflog file="#Application.applicationname#" type="Error" text="[#err_ajaxCodeMsg#]">
</cfif>

<cfif (Request.commonCode.isServerLocal()) AND 0>
	<cfdump var="#Request.commonCode#" label="Request.commonCode" expand="No">
</cfif>

<cfset makeNewRuntimeLicense = (Request.commonCode.isServerLocal()) AND 0>

<!--- BEGIN: Read the Runtime License File --->
<cfif (NOT makeNewRuntimeLicense)>
	<cfscript>
		aStruct = Request.commonCode.readRuntimeLicenseFile(Request.commonCode.productName, DateFormat(Now(), 'mm/dd/yyyy') & ' ' & TimeFormat(Now(), 'hh:mm:ss tt'));
		Request.RuntimeLicenseStatus = aStruct.RuntimeLicenseStatus;
	</cfscript>
	<cfif (IsDefined("URL.showLicense")) AND (URL.showLicense)>
		<cfdump var="#aStruct#" label="aStruct" expand="No">
	</cfif>
</cfif>
<!--- END! Read the Runtime License File --->


<!--- BEGIN: Make a Runtime License File --->
<cfif (makeNewRuntimeLicense)>
	<cfscript>
		Request.commonCode.writeRuntimeLicenseForEndDate(CreateDateTime(2099, 12, 31, 23, 59, 59), Request.commonCode.productName, CGI.SERVER_NAME);
	</cfscript>
</cfif>
<!--- END! Make a Runtime License File --->

<cfset majorVersion = listFirst(server.coldfusion.productversion)>
<cfset minorVersion = listGetAt(server.coldfusion.productversion,2)>
<cfset cfversion = majorVersion & "." & minorVersion>
<cfset application.isColdFusionMX7 = server.coldfusion.productname is "ColdFusion Server" and cfversion gte 7>

<cfif (FileExists(ExpandPath("userDefined_application.cfm")))>
	<cfinclude template="userDefined_application.cfm">
</cfif>