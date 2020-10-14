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
	}
</cfscript>

<cfapplication name="#myAppName#" clientmanagement="Yes" sessionmanagement="Yes" clientstorage="clientvars" setclientcookies="No" setdomaincookies="No" scriptprotect="All" sessiontimeout="#CreateTimeSpan(0,1,0,0)#" applicationtimeout="#CreateTimeSpan(1,0,0,0)#" loginstorage="Session">

<cfset err_ajaxCode = false>
<cfset err_ajaxCodeMsg = ''>
<cftry>
	<cfset Request.commonCode = CreateObject("component", "cfc.userDefinedAJAXFunctions")>
	<cfcatch type="Any">
		<cfset err_ajaxCode = true>
		<cfdump var="#cfcatch#" label="ERROR - userDefinedAJAXFunctions.cfc cannot be created." expand="No">
	</cfcatch>
</cftry>

<cfscript>
	Request.ezAJAX_Cr = Chr(13);
	Request.ezAJAX_Lf = Chr(10);
	Request.ezAJAX_CrLf = Request.ezAJAX_Cr & Request.ezAJAX_Lf;
	Request.parentKeyword = 'parent.';
	Request.cf_html_container_symbol = "html_container";
	Request.const_jsapi_loading_image = "../images/loading.gif";
	Request.const_busy_loading_image = "../images/wait.gif";
	Request.const_paper_color_light_yellow = '##FFFFBF';
	Request.const_color_light_blue = '##80FFFF';
</cfscript>

<cferror type="EXCEPTION" template="onError.cfm" mailto="support@ez-ajax.com">

