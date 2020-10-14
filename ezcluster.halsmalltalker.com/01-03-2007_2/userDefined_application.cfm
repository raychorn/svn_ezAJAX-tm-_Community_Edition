<!--- cfinclude_application.cfm --->

<cfscript>
	Request.importModules = ''; // This can be a comma-delimited list of JavaScript Modules that are loaded in the order specified during the index.cfm processing cycle.  Core Modules are always loaded.

	Request.cfincludeCFM = 'app/StatisticsServer/index.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	
	Request.DOCTYPE = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';
	ezAJAX_title = 'ezAJAX&##8482 - ezCluster Interface !  ';

	cf_productionServerToken = '.ez-ajax.com';
	bool_isServerProduction = (FindNoCase(cf_productionServerToken, CGI.SERVER_NAME) gt 0); // this boolean value tells the framework when your app is running in Production mode versus Development mode - Development mode displays the debugging menu whereas Production mode does not...
//	bool_isServerProduction = true;
</cfscript>

<cfsavecontent variable="htmlHeader">
	<cfoutput>
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/app/StatisticsServer/StyleSheet.css"> 
		<link rel="shortcut icon" type="image/x-icon" href="#ezAJAX_webRoot#/favicon.ico">
		<style type="text/css">
		<!--
		A.ssmItems:link		{color:black;text-decoration:none;}
		A.ssmItems:hover	{color:black;text-decoration:none;}
		A.ssmItems:active	{color:black;text-decoration:none;}
		A.ssmItems:visited	{color:black;text-decoration:none;}
		//-->
		</style>
	</cfoutput>
</cfsavecontent>

<cfsetting showdebugoutput="No">
