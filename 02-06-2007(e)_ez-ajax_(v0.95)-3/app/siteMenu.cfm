<cfsetting enablecfoutputonly="Yes">
<cfparam name="dojo" type="string" default="0">
<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

<title>Site Menu for ezAJAX Enterprise Edition using Dojo 0.3.1</title>

<cfif (dojo)>
	<script type="text/javascript">
		var djConfig = {isDebug: false, debugAtAllCosts: false};
	</script>
	<script src="../dojo-0.3.1-ajax/dojo.js" type="text/javascript"></script>
	<script language="JavaScript" type="text/javascript">
		dojo.require("dojo.widget.FisheyeList");
	//	dojo.hostenv.writeIncludes();
	</script>
</cfif>
	
	<style>
	
	.dojoHtmlFisheyeListBar {
		margin: 0 auto;
		text-align: center;
	}
	
	.outerbar {
		background-color: white;
		text-align: center;
		position: absolute;
		left: 0px;
		top: 0px;
		width: 100%;
	}
	
	body {
		font-family: Arial, Helvetica, sans-serif;
		padding: 0;
		margin: 0;
	}
	
	A 			{ color: ##0000cc; font-family: Trebuchet MS, verdana, arial, sans-serif; text-decoration: none; font-weight: bold; } 
	A:link		{ color: ##0000cc; text-decoration: none; font-weight: bold; } 
	A:visited	{ color: ##0000cc; text-decoration: none; font-weight: bold; } 
	A:active	{ color: ##99CC66; font-weight: bold; } 
	A:hover		{ color: black; background-color: silver; font-weight: bold; } 

	.page {
		padding: -5px -5px -5px -5px;
	}
	
	</style>
</head>
<body>

<cfif 0>
	<cfinclude template="siteMenu.cfm">
</cfif>

</body>
</html>
</cfoutput>
