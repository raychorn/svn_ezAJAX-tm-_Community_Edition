<cfsetting requesttimeout="120">
<cfparam name="debugJavaScriptPackager" type="boolean" default="false">

<cfparam name="Request.importModules" type="string" default="">

<cfinclude template="cfinclude_application.cfm">

<cfoutput>
	<cfif (IsDefined("Request.DOCTYPE")) AND (Len(Request.DOCTYPE) gt 0)>
		#Request.DOCTYPE#
	<cfelse>
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	</cfif>
	
	<html>
	<head>
		<title>#ezAJAX_title##_copyrightNotice#</title>
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/StyleSheet<cfif (Request.commonCOde.ezIsBrowserFF())>FF</cfif>.css"> 
		#htmlHeader#
	</head>

	<body>
		<noscript>You must enable JavaScript to use this site.<br>Please enable JavaScript for your browser or use a browser that support JavaScript.<br>
		<a href="http://flash.ez-ajax.com">ezAJAX&##8482 - AJAX made Easy - Easily Develop your next AJAX Application using this amazing Product !</a>
		</noscript>
		
		<cfloop index="_item" list="#Request.cfincludeCFM#" delimiters=",">
			<cfif (FileExists(ExpandPath(_item)))>
				<cfinclude template="#_item#">
			</cfif>
		</cfloop>
		
	</body>

	</html>
</cfoutput>
