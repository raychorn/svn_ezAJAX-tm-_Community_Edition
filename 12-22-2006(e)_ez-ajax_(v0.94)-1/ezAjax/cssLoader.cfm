<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfparam name="out" type="string" default="1">
<cfparam name="sig" type="string" default="">
<cfparam name="debugMode" type="string" default="0">
<cfscript>
	err_loaderCode = false;
	err_loaderCodeMsg = '';
	try {
		Request.loaderCode = CreateObject("component", "cfc.ezAJAX_PopulateDebugScope").init(sig);
	} catch(Any e) {
		err_loaderCode = true;
		if (debugMode) writeOutput(Request.commonCode.ezCFDump(e, '1.1 CFError in #CGI.SCRIPT_NAME#', false));
	}
</cfscript>
<cftry>
	<cfoutput>
		<cfif (out eq 1)>
			#Request.loaderCode.getPendingStyles()#
		<cfelse>
			<CFHEADER NAME="Expires" VALUE="Mon, 06 Jan 1990 00:00:01 GMT">
			<CFHEADER NAME="Pragma" VALUE="no-cache">
			<CFHEADER NAME="cache-control" VALUE="no-cache">
			<cfcontent type="text/css" variable="#ToBinary(ToBase64(Request.loaderCode.getPendingStyles()))#">
		</cfif>
	</cfoutput>

	<cfcatch type="Any">
		<cfoutput>
			<cfdump var="#cfcatch#" label="2.1 CFError in #CGI.SCRIPT_NAME#" expand="No">
		</cfoutput>
	</cfcatch>
</cftry>

