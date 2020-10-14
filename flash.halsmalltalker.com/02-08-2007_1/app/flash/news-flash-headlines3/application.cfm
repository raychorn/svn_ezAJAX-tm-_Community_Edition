<!--- application.cfm --->

<cfscript>
	if (NOT IsDefined("This.name")) {
		aa = ListToArray('/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/', '/');
		subName = aa[1];
		if (Len(subName) gt 0) {
			subName = '_' & subName;
		}

		myAppName = right(reReplace(CGI.SERVER_NAME & subName, "[^a-zA-Z]","_","all"), 64);
		myAppName = ArrayToList(ListToArray(myAppName, '_'), '_');
		myAppName = UCASE(myAppName);
		myAppName = ReplaceNoCase(myAppName, '_APP', '_EZAJAX');
	}
</cfscript>

<cfapplication name="#myAppName#" clientmanagement="Yes" sessionmanagement="Yes" clientstorage="clientvars" setclientcookies="No" setdomaincookies="No" scriptprotect="All" sessiontimeout="#CreateTimeSpan(0,1,0,0)#" applicationtimeout="#CreateTimeSpan(1,0,0,0)#" loginstorage="Session">

<cfset _cfcatch = -1>
<cfset err_ajaxCode = false>
<cfset err_ajaxCodeMsg = ''>
<cftry>
	<cfset Request.commonCode = CreateObject("component", "ezAjax.cfc.ezAjaxCode")>
	<cfcatch type="Any">
		<cfset err_ajaxCode = true>
		<cfset _cfcatch = cfcatch>
	</cfcatch>
</cftry>

<cfif (err_ajaxCode)>
	<cfdump var="#_cfcatch#" label="ERROR - ezAjaxCode.cfc cannot be created." expand="No">
	<cfabort showerror="CF ERROR :: ezAjaxCode.cfc cannot be created.">
</cfif>

<cfscript>
	Request.ezAJAX_Cr = Chr(13);
	Request.ezAJAX_Lf = Chr(10);
	Request.ezAJAX_CrLf = Request.ezAJAX_Cr & Request.ezAJAX_Lf;
	Request.parentKeyword = 'parent.';

	Request.const_SHA1PRNG = 'SHA1PRNG';
	Request.const_CFMX_COMPAT = 'CFMX_COMPAT';

	Request.const_encryption_method = 'BLOWFISH';
	Request.const_encryption_encoding = 'Hex';
</cfscript>


