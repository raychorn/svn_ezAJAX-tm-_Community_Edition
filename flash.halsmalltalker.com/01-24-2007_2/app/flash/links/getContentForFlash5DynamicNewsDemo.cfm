<cfsetting enablecfoutputonly="Yes">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlash5DynamicNewsDemo.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader" colspan="2">
				<p align="justify"><NOBR><a href="/app/flash/links/getContentForFlash5DynamicNewsDemo.cfm" target="_self">Flash 5 Dynamic News Demo</a></NOBR></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				#flashContent("newsFlashHeadlines", 150, 600, "/app/flash/news-flash-headlines/news-flash-headlines.swf?nocache=#RandRange(1, 65535, 'SHA1PRNG')#", "##ffffff")#
			</td>
			<td valign="top">
				<p align="justify">This Flash 5 component is completely dynamic.  It reads the data that is displayed using a technique that was used long before Flash Remoting ever existed.<br><br>This proves the fact that Flash 5 was able to be data-driven using nothing more than the HTTP protocol which was quite inefficient as compared with Flash Media Server 2, for instance.<br><br>As you can see this instance of this Demo shows nothing more than the current Month and Year with no other data.<br><br><a href="/app/flash/news-flash-headlines/news-flash-headlines.fla" target="_blank">Click here to download the Flash Source File.</a></p>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
</cfoutput>
