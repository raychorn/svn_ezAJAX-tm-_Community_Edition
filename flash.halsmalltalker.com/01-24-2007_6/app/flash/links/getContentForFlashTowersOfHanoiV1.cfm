<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlashTowersOfHanoi.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<cfscript>
		redirectOnExternalReferer();
	</cfscript>
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader">
				<p align="justify"><a href="/app/flash/links/getContentForFlashTowersOfHanoi.cfm" target="_self">Flash Towers Of Hanoi v1 :: Classic Computer Science Project</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<iframe frameborder="0" scrolling="No" width="650" height="450" src="/app/flash/towersOfHanoiFlash/towersofhanoi.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
</cfoutput>
