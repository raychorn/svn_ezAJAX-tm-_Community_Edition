<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfset _loc = "http://#CGI.SERVER_NAME##CGI.SCRIPT_NAME#?#CGI.QUERY_STRING#">
<html>
<head>
	<title>Dummy Page</title>
	<cfoutput>
		<script type="text/javascript">
			function getLocation() {
				return '#_loc#';
			}
		</script>
	</cfoutput>
</head>

<body>

<cfif (CGI.REMOTE_ADDR eq "127.0.0.1")>
	<cfoutput>
		<small>_loc = [#_loc#]</small><br>
	</cfoutput>
</cfif>

</body>
</html>
