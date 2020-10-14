<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfparam name="Request.importModules" type="string" default="">
<cfparam name="modules" type="string" default="">
<cfscript>
	if ( (Len(Request.importModules) gt 0) AND (Len(modules) eq 0) ) {
		modules = Request.importModules;
	}
	err_loaderCode = false;
	err_loaderCodeMsg = '';
	try {
		Request.loaderCode = CreateObject("component", "cfc.je$").init().use(modules);
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

