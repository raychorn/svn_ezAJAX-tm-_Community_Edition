<cfsetting enablecfoutputonly="Yes">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForCrusaderGame.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader">
				<p align="justify"><a href="/app/flash/links/getContentForCrusaderGame.cfm" target="_self">Flash Game Demo :: Crusader</a>&nbsp;<small><a href="/app/flash/crusader/crusader.zip" title="This source requires a proprietary Flash development system you may not already have." target="_blank">Download</a></small></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/crusader/crusader.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe>
			</td>
		</tr>
	</table>
	
	</body>
	</html>
</cfoutput>

