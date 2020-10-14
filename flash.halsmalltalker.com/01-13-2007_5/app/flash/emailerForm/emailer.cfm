<cfsetting enablecfoutputonly="Yes">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>emailer.cfm</title>
	</head>
	
	<body>
	
		<cfdump var="#CGI#" label="CGI Scope" expand="No">
		<cfdump var="#URL#" label="URL Scope" expand="No">
		<cfdump var="#FORM#" label="FORM Scope" expand="No">
	
	</body>
	</html>
</cfoutput>
