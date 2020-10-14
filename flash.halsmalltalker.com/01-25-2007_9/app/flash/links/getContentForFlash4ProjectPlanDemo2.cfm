<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlash4ProjectPlanDemo2.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
		<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/#cfJavaScriptSourceCodeFName1#"></script>
		<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/ezAjax/loader.cfm?out=0&modules=#URLEncodedFormat(Request.importModules)#&sig=#Trim(_JavaScriptSignature)#"></script>
		<script language="JavaScript1.2" type="text/javascript" src="popUpDocumentForFlash4ProjectPlanDemo2.js"></script>
	</head>
	
	<body>
	
	<cfscript>
		redirectOnExternalReferer();
	</cfscript>
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader">
				<p align="justify"><a href="/app/flash/links/getContentForFlash4ProjectPlanDemo2.cfm" target="_self">Flash 4 Project Plan Demo 2</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify">Keep in mind this Flash 4 Demo was originally designed for a specific purpose that no longer exists.<br><br><a href="/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-PlanA.fla" target="_blank">Click here to download the Flash Source File.</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify"><a href="" onclick="popUpDocumentForFlash4ProjectPlanDemo2(); return false;">Click HERE to Launch the Demo</a></p>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
</cfoutput>
