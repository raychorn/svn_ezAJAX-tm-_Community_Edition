<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlash5DemosAJAX.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<cfscript>
		redirectOnExternalReferer();
	</cfscript>
	<table width="590">
		<tr>
			<td align="center" class="primaryContentContainerHeader">
				<p align="justify"><a href="/app/flash/links/getContentForFlash5DemosAJAX.cfm" target="_self">Flash 5 Adverts Demo</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				#flashContent("AdvertsClip1", 468, 80, "/app/flash/Adverts Movie/AdvertsClip1.swf?nocache=#RandRange(1, 65535, 'SHA1PRNG')#", "##ffffff")#
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify">This Flash 5 Demo is not functional at this time other than to serve as a sample of the work that was done way back whenever this particular Flash 5 component was functional.<br><br>This Flash 5 component could have been brought up to date and made to work with the Flash Media Server 2.<br><br>The Flash Media Server could have provided the ability to track stats on the Adverts that were displayed as well as those Adverts that were clicked.<br><br>Flash Media Server could have been also used to pick the next Advert to be shown.<br><br><a href="/app/flash/Adverts Movie/AdvertsClip1.fla" target="_blank">Click here to download the Flash Source File.</a></p>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
</cfoutput>
