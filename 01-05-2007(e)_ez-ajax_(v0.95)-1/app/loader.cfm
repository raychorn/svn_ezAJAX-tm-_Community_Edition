<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfparam name="fname" type="string" default="">
<cfparam name="dsr" type="string" default="0">
<cfparam name="callback" type="string" default="try { callBack_DynamicCodeTracker(); } catch (e) { };">
<cfparam name="out" type="string" default="1">
<cfsavecontent variable="callBackCode"><cfif (dsr eq 1)><cfoutput>#callback#</cfoutput></cfif></cfsavecontent>
<cfset jsCode = "">
<cfif (Len(fname) gt 0)>
	<cfset jsCode = Request.commonCode._readAndObfuscateJSCode(fname)>
</cfif>
<cftry>
	<cfif (out eq 1)>
		<cfoutput>#jsCode#</cfoutput>
		<cfoutput>#callBackCode#</cfoutput>
	<cfelse>
		<cfoutput>
			<CFHEADER NAME="Expires" VALUE="Mon, 06 Jan 1990 00:00:01 GMT">
			<CFHEADER NAME="Pragma" VALUE="no-cache">
			<CFHEADER NAME="cache-control" VALUE="no-cache">
			<cfcontent type="text/javascript" variable="#ToBinary(ToBase64(jsCode & callBackCode))#">
		</cfoutput>
	</cfif>

	<cfcatch type="Any">
		<cfoutput>
			<cfdump var="#cfcatch#" label="2.1 CFError in #CGI.SCRIPT_NAME#" expand="No">
		</cfoutput>
	</cfcatch>
</cftry>

