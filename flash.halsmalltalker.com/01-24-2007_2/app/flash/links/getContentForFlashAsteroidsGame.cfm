<cfsetting enablecfoutputonly="Yes">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlashAsteroidsGame.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader">
				<p align="justify"><a href="/app/flash/links/getContentForFlashAsteroidsGame.cfm" target="_self">Flash Game Demo :: Asteroids</a>&nbsp;<small><a href="/app/flash/insaneroids/insaneroids.zip" title="This source requires a proprietary Flash development system you may not already have." target="_blank">Download</a></small></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify">What makes this version of the 3DFA Flash Sample unique?  The fact that if you Register for and Login using a Player Account at this site you can track your High Scores and play against others who also enjoy this game.</p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<iframe frameborder="0" scrolling="No" width="820" height="650" src="/app/flash/insaneroids/AsteroidsDispatcher.cfm?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
</cfoutput>
