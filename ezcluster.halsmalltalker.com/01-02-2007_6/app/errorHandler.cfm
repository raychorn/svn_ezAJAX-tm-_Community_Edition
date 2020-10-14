<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Error Handler</title>
</head>

<body>

<cfdump var="#error#" label="Error Scope" expand="No">
<cfdump var="#Application#" label="App Scope" expand="No">
<cfdump var="#Session#" label="Session Scope" expand="No">
<cfdump var="#CGI#" label="CGI Scope" expand="No">
<cfdump var="#Request#" label="Request Scope" expand="No">

</body>
</html>
