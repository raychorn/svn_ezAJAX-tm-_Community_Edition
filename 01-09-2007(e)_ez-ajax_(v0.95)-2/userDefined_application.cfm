<!--- cfinclude_application.cfm --->

<cfinclude template="app/cfinclude_application.cfm">

<cfscript>
//	Request.importModules = 'ezThoughtBubbleObj,ezGUIActsObj,ezTables,ezFishEyeMenuObj'; // This can be a comma-delimited list of JavaScript Modules that are loaded in the order specified during the index.cfm processing cycle.  Core Modules are always loaded.
	Request.importModules = 'ezThoughtBubbleObj,ezGUIActsObj,ezTables,ezTabsObj'; // This can be a comma-delimited list of JavaScript Modules that are loaded in the order specified during the index.cfm processing cycle.  Core Modules are always loaded.

//	Request.cfincludeCFM = 'cfinclude_index_body.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	Request.cfincludeCFM = 'app/cfinclude_index_10-20-2006.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	// Comment out the following lines once you have read the information containd below.
//	writeOutput('<p align="justify"><small>This is the file called "cfinclude_application.cfm" that contains user-defined code that is included during the application.cfm processing cycle.</small></p>');
//	writeOutput('<p align="justify"><small>The purpose of the "cfinclude_application.cfm" file is to allow the end-user to create user-defined code that defines ColdFusion source files via the variable called "Request.cfincludeCFM" that are loaded sequentially during the processing of the index.cfm file.</small></p>');
//	writeOutput('<p align="justify"><small>This allows the end-user to create user-defined code that runs in the client browser from the context of the exAJAX<sup>(tm)</sup> Framework thus allowing ezAJAX<sup>(tm)</sup> Applications to be easily crafted with little effort.</small></p>');
//	writeOutput('<p align="justify"><small>At this time the following list of ColdFusion source files should contain executable source code "#Request.cfincludeCFM#".</small></p>');
	
	Request.DOCTYPE = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';
	ezAJAX_title = 'ezAJAX&##8482 - AJAX made Easy !  ';

	cf_productionServerToken = '.ez-ajax.com';
	bool_isServerProduction = (FindNoCase(cf_productionServerToken, CGI.SERVER_NAME) gt 0); // this boolean value tells the framework when your app is running in Production mode versus Development mode - Development mode displays the debugging menu whereas Production mode does not...
//	bool_isServerProduction = true;
</cfscript>

<cfsavecontent variable="htmlHeader">
	<cfoutput>
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/app/style.css"> 
		<link rel="shortcut icon" type="image/x-icon" href="#ezAJAX_webRoot#/favicon.ico">
		<META http-equiv=Content-Type content="text/html; charset=windows-1252">
		<META content="MSHTML 6.00.5730.11" name=GENERATOR>
		<style type="text/css">
		<!--
		A.ssmItems:link		{color:black;text-decoration:none;}
		A.ssmItems:hover	{color:black;text-decoration:none;}
		A.ssmItems:active	{color:black;text-decoration:none;}
		A.ssmItems:visited	{color:black;text-decoration:none;}
		//-->
		</style>
		<script language="JavaScript1.2" type="text/javascript">
			var const_whatsNew_menu_symbol = "What's New ?";
			var const_whatsIs_menu_symbol = "What is ezAJAX ?";
			var const_JSONSupport_menu_symbol = "JSON Support";
			var const_Features_menu_symbol = "Features Chart";
			var const_Installation_menu_symbol = "Installation";
			var const_RuntimeLicenses_menu_symbol = "Manage Runtime Licenses";
			var const_Downloads_menu_symbol = "Downloads";
			var const_DocsAndGuides_menu_symbol = "Documentation";
			var const_SampleApps_menu_symbol = "Sample Apps";
			var const_DemosTutorials_menu_symbol = "Demos & Tutorials";
			var const_SupportForum_menu_symbol = "Support Forum";
			var const_ContactUs_menu_symbol = "Contact Us";
			var const_SampleWeb20API_menu_symbol = "Web 2.0 API Sample";
		</script>
		<cfif 0>
			<SCRIPT SRC="#ezAJAX_webRoot#/app/js/menu/ssm.js" language="JavaScript1.2" type="text/javascript"></SCRIPT>
			<SCRIPT SRC="#ezAJAX_webRoot#/app/js/menu/ssmItems.js" language="JavaScript1.2" type="text/javascript"></SCRIPT>
			<script language="JavaScript1.2" src="/app/js/resources/stmenu.js" type="text/javascript"></script>
		</cfif>
	</cfoutput>
</cfsavecontent>

<cfsetting showdebugoutput="No">
