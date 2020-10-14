<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlash4MenuDemo.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<cfscript>
		redirectOnExternalReferer();
	</cfscript>
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader">
				<p align="justify"><a href="/app/flash/links/getContentForFlash4MenuDemo.cfm" target="_self">Flash 4 Menu Demo</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				#flashContent("issueTrackOpening", 600, 300, "/app/flash/myIssueTrack/issueTrackOpening.swf?nocache=#RandRange(1, 65535, 'SHA1PRNG')#", "##164f9f")#
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p>This Flash Demo is a Menu for a set of documents that no longer exist.</p>
				<p>The purpose for this Flash Demo originally was to serve as an animated Menu for a set of documents.</p>
				<p>At this time you may notice the various documents that once existed have been replaced by some rather simple HTML pages that simply state who created the Flash Demo.</p>
				<p>Back when this Flash Demo was originally created each of the documents listed in the Menu did exist and were completely functional.</p>
				<p>Notice the various mouse-over effects that can be seen whenever the mouse is hovered over certain menu items.</p>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
</cfoutput>
