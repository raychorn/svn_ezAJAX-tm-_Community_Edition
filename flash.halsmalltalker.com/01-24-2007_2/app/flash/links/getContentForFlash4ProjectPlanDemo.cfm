<cfsetting enablecfoutputonly="Yes">
<cfinclude template="../../../cfinclude_application.cfm">
<cfset ezAJAX_webRoot = ListDeleteAt(ezAJAX_webRoot, ListLen(ezAJAX_webRoot, '/'), '/')>
<cfset ezAJAX_webRoot = ListDeleteAt(ezAJAX_webRoot, ListLen(ezAJAX_webRoot, '/'), '/')>
<cfset ezAJAX_webRoot = ListDeleteAt(ezAJAX_webRoot, ListLen(ezAJAX_webRoot, '/'), '/')>
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlash4ProjectPlanDemo.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
		<cfif 1>
			<cfset _JavaScriptSignature = URLEncodedFormat(Trim(_asBlowfishEncryptedHex(DateFormat(Now(), "mm/dd/yyyy") & "_" & TimeFormat(Now(), "hh:mm:ss tt"))))>
			<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/#cfJavaScriptSourceCodeFName1#"></script>
			<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/ezAjax/loader.cfm?out=0&modules=#URLEncodedFormat(Request.importModules)#&sig=#Trim(_JavaScriptSignature)#"></script>
		</cfif>
		<script language="JavaScript1.2" type="text/javascript" src="getFlashContent.js"></script>
		<script language="JavaScript1.2" type="text/javascript" src="popUpWindowForURL.js"></script>
		<script language="JavaScript1.2" type="text/javascript" src="popUpDocumentForFlash4ProjectPlanDemo.js"></script>
	</head>
	
	<body>
		<cfif 1>
			<cfinclude template="../../../cfinclude_ajaxBody1.cfm">
		</cfif>
	
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader">
				<p align="justify"><a href="/app/flash/links/getContentForFlash4ProjectPlanDemo.cfm" target="_self">Flash 4 Project Plan Demo</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify">This Flash 4 project Plan was originally designed to demonstrate how a set of images could be wrapped-up into a Flash component.<br><br>Flash provides a nice way to stream content in a manner that tends to reduce the amount of bandwidth that is used to display traditional images.<br><br><a href="/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-Plan.fla" target="_blank">Click here to download the Flash Source File.</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<a href="" onclick="popUpDocumentForFlash4ProjectPlanDemo('#RandRange(1, 65535, 'SHA1PRNG')#'); return false;">Click HERE to Launch the Demo</a>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
	
</cfoutput>
