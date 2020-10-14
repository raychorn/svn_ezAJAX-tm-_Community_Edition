<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>cfm page</title>
</head>

<body>

<cfsavecontent variable="c">
	<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>cfm page</title>
</head>

<body>
		<cfdump var="#CGI#" label="CGI Scope" expand="yes">
		<cfdump var="#URL#" label="URL Scope" expand="yes">
		<cfdump var="#FORM#" label="FORM Scope" expand="yes">
		<cfdump var="#Request#" label="Request Scope" expand="yes">
</body>
</html>
	</cfoutput>
</cfsavecontent>

<cftry>
		<cffile action="write" addnewline="yes" file="#ExpandPath('debugcfm.html')#" output="#c#" fixnewline="yes">

	<cfcatch type="any">
		<cfdump var="#cfcatch#" label="CFError" expand="no">
	</cfcatch>
</cftry>

</body>
</html>
