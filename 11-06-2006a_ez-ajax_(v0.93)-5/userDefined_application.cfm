<!--- cfinclude_application.cfm --->

<cfinclude template="app/cfinclude_application.cfm">

<cfscript>
	ar = ListToArray(application.rooturl, "/");
	ar2 = ListToArray(ar[2], ".");
	ar2a = ArrayNew(1);
	ar2a[ArrayLen(ar2a) + 1] = ar2[1];
	ar2a[ArrayLen(ar2a) + 1] = ar2[ArrayLen(ar2) - 1];
	ar2a[ArrayLen(ar2a) + 1] = ar2[ArrayLen(ar2)];
	ar[2] = ArrayToList(ar2a, ".");
	if ( (UCASE(ar[1]) eq UCASE('http:')) AND (ArrayLen(ar) eq 3) ) {
		application.rootURL = ar[1] & '//' & ar[2] & '/' & ar[3];
	}
</cfscript>

<cfscript>
//	Request.cfincludeCFM = 'cfinclude_index_body.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
//	Request.cfincludeCFM = 'app/cfinclude_index.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	Request.cfincludeCFM = 'app/cfinclude_index_10-20-2006.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	// Comment out the following lines once you have read the information containd below.
//	writeOutput('<p align="justify"><small>This is the file called "cfinclude_application.cfm" that contains user-defined code that is included during the application.cfm processing cycle.</small></p>');
//	writeOutput('<p align="justify"><small>The purpose of the "cfinclude_application.cfm" file is to allow the end-user to create user-defined code that defines ColdFusion source files via the variable called "Request.cfincludeCFM" that are loaded sequentially during the processing of the index.cfm file.</small></p>');
//	writeOutput('<p align="justify"><small>This allows the end-user to create user-defined code that runs in the client browser from the context of the exAJAX<sup>(tm)</sup> Framework thus allowing ezAJAX<sup>(tm)</sup> Applications to be easily crafted with little effort.</small></p>');
//	writeOutput('<p align="justify"><small>At this time the following list of ColdFusion source files should contain executable source code "#Request.cfincludeCFM#".</small></p>');
	
	Request.DOCTYPE = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';
	ezAJAX_title = 'ezAJAX&##8482 - AJAX made Easy !  ';
</cfscript>

<cfsavecontent variable="htmlHeader">
	<cfoutput>
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/app/style.css"> 
		<link rel="shortcut icon" type="image/x-icon" href="#ezAJAX_webRoot#/favicon.ico">
		<style type="text/css">
		<!--
		A.ssmItems:link		{color:black;text-decoration:none;}
		A.ssmItems:hover	{color:black;text-decoration:none;}
		A.ssmItems:active	{color:black;text-decoration:none;}
		A.ssmItems:visited	{color:black;text-decoration:none;}
		//-->
		</style>
		
		<SCRIPT SRC="#ezAJAX_webRoot#/app/js/menu/ssm.js" language="JavaScript1.2"></SCRIPT>
		<SCRIPT SRC="#ezAJAX_webRoot#/app/js/menu/ssmItems.js" language="JavaScript1.2"></SCRIPT>
	</cfoutput>
</cfsavecontent>

<cfsetting showdebugoutput="No">
