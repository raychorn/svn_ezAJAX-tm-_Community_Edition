<cfscript>
//	Request.bool_debugMode = (Find("192.168.", CGI.REMOTE_ADDR) gt 0) OR (Find("127.0.0.1", CGI.REMOTE_ADDR) gt 0);
	Request.bool_debugMode = (FindNoCase('.ez-ajax.com', CGI.SERVER_NAME) eq 0);
	Request.bool_privateMode = ( (Find("192.168.", CGI.REMOTE_ADDR) gt 0) OR (Find("127.0.0.1", CGI.REMOTE_ADDR) gt 0) OR (Find("71.133.203.26", CGI.REMOTE_ADDR) gt 0) );
</cfscript>