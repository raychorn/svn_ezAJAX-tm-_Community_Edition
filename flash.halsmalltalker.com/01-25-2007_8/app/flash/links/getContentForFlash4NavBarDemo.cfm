<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlash4NavBarDemo.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<cfscript>
		redirectOnExternalReferer();
	</cfscript>
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader" colspan="2">
				<p align="justify"><a href="/app/flash/links/getContentForFlash4NavBarDemo.cfm" target="_self">Flash 4 NavBar Demo</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				#flashContent("simpleNavBar", 150, 800, "/app/flash/simpleNavBar/simpleNavBar.swf?nocache=#RandRange(1, 65535, 'SHA1PRNG')#", "##164f9f")#
			</td>
			<td valign="top">
				<p align="justify">This Flash 4 Demo was designed originally to serve as a Nav Bar for a web site that no longer exists.<br><br>The value of this Demo is to show how directions and information can be conveyed to an end-user as they are using the functions of the Flash component.<br><br>Keep in mind this was done originally with Flash 4.<br><br><a href="/app/flash/simpleNavBar/simpleNavBar.fla" target="_blank">Click here to download the Flash Source File.</a></p>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
</cfoutput>
