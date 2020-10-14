<cfset developJSmode = false>
<cfscript>
	if (NOT developJSmode) {
		Request.importModules = 'ezTabsObj,ezTables'; // This can be a comma-delimited list of JavaScript Modules that are loaded in the order specified during the index.cfm processing cycle.  Core Modules are always loaded.
	} else {
		Request.importModules = 'ezAnchorPosition,ezTables'; // This can be a comma-delimited list of JavaScript Modules that are loaded in the order specified during the index.cfm processing cycle.  Core Modules are always loaded.
	}

	Request.cfincludeCFM = 'app/flash/index.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	
	Request.DOCTYPE = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';
	ezAJAX_title = 'Flash Demos of Ray C Horn featuring ezAJAX&##8482 !  ';

	cf_productionServerToken = '.ez-ajax.com';
	bool_isServerProduction = (FindNoCase(cf_productionServerToken, CGI.SERVER_NAME) gt 0); // this boolean value tells the framework when your app is running in Production mode versus Development mode - Development mode displays the debugging menu whereas Production mode does not...
//	bool_isServerProduction = true;

	Randomize(Left('#GetTickCount()#', 10), 'SHA1PRNG');
</cfscript>

<cfinclude template="cfinclude_varDefs.cfm">

<cfsavecontent variable="htmlHeader">
	<cfoutput>
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/StyleSheet<cfif (Request.commonCOde.ezIsBrowserFF()) OR (Request.commonCOde.ezIsBrowserNS())>FF</cfif>.css"> 
		<link rel="shortcut icon" type="image/x-icon" href="#ezAJAX_webRoot#/favicon.ico">
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/commonStyles.css"> 
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/app/styles.css"> 
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/app/flash/stylesheet.css"> 
		<META http-equiv=Content-Type content="text/html; charset=windows-1252">
		<META content="MSHTML 6.00.2900.3020" name=GENERATOR>
		<cfif (developJSmode)>
			<script language="JavaScript1.2" type="text/javascript" src="#ezAJAX_webRoot#/js/09_TabsObj.js"></script>
		</cfif>
	</cfoutput>
</cfsavecontent>
