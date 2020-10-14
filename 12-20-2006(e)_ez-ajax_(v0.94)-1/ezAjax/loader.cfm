<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfparam name="Request.importModules" type="string" default="">
<cfparam name="modules" type="string" default="">
<cfparam name="sig" type="string" default="">
<cfparam name="debugMode" type="string" default="0">
<cfscript>
	if ( (Len(Request.importModules) gt 0) AND (Len(modules) eq 0) ) {
		modules = Request.importModules;
	}
	err_loaderCode = false;
	err_loaderCodeMsg = '';
	try {
		Request.loaderCode = CreateObject("component", "cfc.je$").init(sig).use(modules);
	} catch(Any e) {
		err_loaderCode = true;
		if (debugMode) writeOutput(Request.commonCode.ezCFDump(e, '1.1 CFError in #CGI.SCRIPT_NAME#', false));
	}
	if ( (IsDefined("Request.loaderCode")) AND (debugMode) ) {
		writeOutput(Request.commonCode.ezCFDump(Request.loaderCode, 'Request.loaderCode in #CGI.SCRIPT_NAME#', false));
	}
</cfscript>
<cfparam name="out" type="string" default="1">
<cftry>
	<cfif (out eq 1)>
		<cfoutput>#Request.loaderCode.getCode(debugMode)#</cfoutput>
	<cfelse>
		<cfoutput>
			<CFHEADER NAME="Expires" VALUE="Mon, 06 Jan 1990 00:00:01 GMT">
			<CFHEADER NAME="Pragma" VALUE="no-cache">
			<CFHEADER NAME="cache-control" VALUE="no-cache">
			<cfcontent type="text/javascript" variable="#ToBinary(ToBase64(Request.loaderCode.getCode(debugMode)))#">
		</cfoutput>
	</cfif>

	<cfcatch type="Any">
		<cfoutput>
			<cfdump var="#cfcatch#" label="2.1 CFError in #CGI.SCRIPT_NAME#" expand="No">
		</cfoutput>
	</cfcatch>
</cftry>

