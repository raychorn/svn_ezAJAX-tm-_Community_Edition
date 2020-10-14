<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForArriveAliveGame.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<cfscript>
		redirectOnExternalReferer();
	</cfscript>
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader">
				<p align="justify">
				<a href="/app/flash/links/getContentForArriveAliveGame.cfm" target="_self">Flash Game Demo :: Arrive Alive</a>&nbsp;<small><a href="/app/flash/arrive alive/arrive alive.zip" title="This source requires a proprietary Flash development system you may not already have." target="_blank">Download</a></small></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/arrive alive/big_day_out.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe>
			</td>
		</tr>
	</table>
	
	</body>
	</html>
</cfoutput>

