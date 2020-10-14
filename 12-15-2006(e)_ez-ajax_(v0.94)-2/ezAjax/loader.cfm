<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfscript>
	err_loaderCode = false;
	err_loaderCodeMsg = '';
	try {
		Request.loaderCode = CreateObject("component", "cfc.je$").init();
	} catch(Any e) {
		err_loaderCode = true;
	}
</cfscript>
<cfparam name="out" type="string" default="1">
<cfif (out eq 1)>
	<cfoutput>#Request.loaderCode.getCode()#</cfoutput>
<cfelse>
	<cfoutput>
		<CFHEADER NAME="Expires" VALUE="Mon, 06 Jan 1990 00:00:01 GMT">
		<CFHEADER NAME="Pragma" VALUE="no-cache">
		<CFHEADER NAME="cache-control" VALUE="no-cache">
		<cfcontent type="text/javascript" variable="#ToBinary(ToBase64(Request.loaderCode.getCode()))#">
	</cfoutput>
</cfif>

