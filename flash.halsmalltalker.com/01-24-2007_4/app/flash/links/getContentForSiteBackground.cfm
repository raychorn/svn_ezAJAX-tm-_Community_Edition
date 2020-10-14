<cfsetting enablecfoutputonly="Yes" requesttimeout="120">

<cfsavecontent variable="ezClusterLink"><cfoutput>ezCluster&##8482</cfoutput></cfsavecontent>
<cfsavecontent variable="ezAJAXLink"><cfoutput>ezAJAX&##8482</cfoutput></cfsavecontent>
<cfsavecontent variable="_poweredHTML"><cfoutput><p align="justify"><small>This Site is powered by #ezClusterLink# Patents Pending and <a href="http://www.ez-ajax.com" target="_blank">#ezAJAXLink# Enterprise Edition v1.0</a>.&nbsp;#ezClusterLink# makes 2 or more web servers into a single coherent web server using low-cost techniques.&nbsp;#ezAJAXLink# shortens time to market for AJAX Apps.&nbsp;&nbsp;Let us do all the work for you.&nbsp;&nbsp;<cfif (NOT Request.commonCode.ezIsBrowserIE())><b><i>This site is best when viewed using IE 7.x (1024x768) resolution.</i></b></cfif>&nbsp;The contents of this Site are protected under U.S. and International Copyright Laws. &copy 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.</small></p></cfoutput></cfsavecontent>

<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>7.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
		<cfscript>
			redirectOnExternalReferer();
		</cfscript>
		<table width="590">
			<tr>
				<td class="primaryContentContainerHeader">
					<p align="justify"><a href="/app/flash/links/getContentForSiteBackground.cfm" target="_self">Site Background</a></p>
				</td>
			</tr>
			<tr>
				<td>
					<p align="justify">This site displays some of the many Flash components Ray C. Horn has created over the years.<br><br>This site was architected to use a new product called "#ezAJAXLink#"; ezAJAX provides a standardized reusable AJAX Framework that is composed of more than 15000 lines of JavaScript and ColdFusion.<br><br>In addition to ezAJAX this site uses another product called "#ezClusterLink#"; ezCluster provides support for web server clustering that allows AJAX Server Commands to be spread-out among a number of separate web servers each of which has identical web content.  ezCluster make it possible for AJAX Web Apps to leverage the power of many web servers rather than a single web server.  ezCluster is built into ezAJAX Enterprise 1.0.<br><br>As you can see, Ray C Horn has done a lot of work to make this site happen; the ability to make this site happen with all of its subtle complexities must surely mean whatever work you may need done could also be done with just as much professionalism and dedication.<br><br>As you look at the various Flash components hat have been posted to this site keep in mind the fact that the best Flash components will leave you with the feeling that they may not have been coded using Flash at-all.<br><br>Over the years Flash Development has eveolved from very simplistic "animations" that took a lot of time to create into more complex components that can be easily programmed using far less time, in most cases.<br><br>Notice the fact that each page of content can be linked to.  Each page of content that appears by clicking on a Tab or SubTab displays a page header that allows the user to click on it in order to link to that page of content.  This same technique can be used to link to content that is delivered via AJAX.</p><br>
				</td>
			</tr>
			<tr>
				<td>#_poweredHTML#</td>
			</tr>
		</table>	
	
	</body>
	</html>
</cfoutput>
