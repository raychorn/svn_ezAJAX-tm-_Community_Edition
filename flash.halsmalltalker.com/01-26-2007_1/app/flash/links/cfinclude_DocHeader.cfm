<cfsetting enablecfoutputonly="Yes">

<cffunction name="flashContent" output="No" returntype="string" access="public">
	<cfargument name="id" required="Yes" type="string">
	<cfargument name="w" type="numeric" required="yes">
	<cfargument name="h" type="numeric" required="yes">
	<cfargument name="url" type="string" required="yes">
	<cfargument name="bgColor" type="string" required="yes">
	<cfsavecontent variable="_html">
		<cfoutput>
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=8,0,0,0" width="#w#" height="#h#" id="#id#" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="movie" value="#url#" />
			<param name="loop" value="false" />
			<param name="menu" value="false" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#bgColor#" />
			<embed src="#url#" loop="false" menu="false" quality="high" bgcolor="#bgColor#" width="#w#" height="#h#" name="#id#" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>
		</cfoutput>
	</cfsavecontent>
	<cfreturn _html>
</cffunction>

<cffunction name="redirectOnExternalReferer" output="No" returntype="string" access="public">
	<cfif (FindNoCase(CGI.SERVER_NAME & "/", CGI.HTTP_REFERER) eq 0)>
		<cflocation url="http://#CGI.SERVER_NAME#/index.cfm?linkname=#ListLast(CGI.SCRIPT_NAME, "/")#">
	</cfif>
</cffunction>

<cfoutput>
	<LINK rel="STYLESHEET" type="text/css" href="../../../StyleSheet<cfif (Request.commonCOde.ezIsBrowserFF()) OR (Request.commonCOde.ezIsBrowserNS())>FF</cfif>.css"> 
	<link href="../../../favicon.ico" rel="shortcut icon">
	<LINK rel="STYLESHEET" type="text/css" href="../../../commonStyles.css"> 
	<LINK rel="STYLESHEET" type="text/css" href="../../../app/styles.css"> 
	<LINK rel="STYLESHEET" type="text/css" href="../stylesheet.css"> 
	<META http-equiv=Content-Type content="text/html; charset=windows-1252">
	<META content="MSHTML 6.00.2900.3020" name=GENERATOR>
</cfoutput>
