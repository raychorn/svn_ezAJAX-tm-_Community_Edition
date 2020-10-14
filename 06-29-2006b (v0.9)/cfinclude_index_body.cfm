<cfoutput>
	<cfscript>
		cf_REMOTE_ADDR = CGI.REMOTE_ADDR;
		cf_SERVER_NAME = 'http:' & '/' & '/' & CGI.SERVER_NAME & '/' & CGI.SCRIPT_NAME;
		
		_urlCommunityEditionLicenseAgreement = Request.commonCode.clusterizeURL('#_urlParentPrefix#/AJAX-Framework/ezAJAX(tm) Community Edition License Agreement.htm');

		cf_isColdFusionMX7 = application.isColdFusionMX7;
	</cfscript>
	
<cfif 0>
	<cfdump var="#Session#" label="Session" expand="No">
	<cfdump var="#CGI#" label="CGI Scope" expand="No">
	<cfdump var="#URL#" label="URL Scope" expand="No">
</cfif>

	<script language="JavaScript1.2" type="text/javascript">
	<!--
		var _db = 'browser_is_ie = [' + browser_is_ie + ']' + ', browser_is_ff = [' + browser_is_ff + ']' + ', browser_is_ns = [' + browser_is_ns + ']' + ', browser_is_op = [' + browser_is_op + ']';
		if ( (browser_is_ie != null) && (browser_is_ff != null) && (browser_is_ns != null) && (browser_is_op != null) ) {
	//		_alert('browser_is_ie = [' + browser_is_ie + ']' + ', browser_is_ff = [' + browser_is_ff + ']' + ', browser_is_ns = [' + browser_is_ns + ']'); 
		} else {
			if (window.location.href.toUpperCase().indexOf('.CONTENTOPIA.NET') > -1) {
				_db = '';
			}
			alert("ERROR: Unable to determine your browser type - some content may not work as expected. Kindly return using IE 6.x, FireFox 1.5.0.4, Netscape 8.1 or Opera 9 - IE 6.x works best but that's life now isn't it." + '\n' + _db);
		}
		
		var js_REMOTE_ADDR = '#cf_REMOTE_ADDR#';
		var js_SERVER_NAME = '#cf_SERVER_NAME#';
		
		var js_urlCommunityEditionLicenseAgreement = '#_urlCommunityEditionLicenseAgreement#';
		
		var jsBool_isColdFusionMX7 = (('#cf_isColdFusionMX7#'.toUpperCase() == 'YES') ? true : false);
		
		var jsBool_isDebugMode = (('#isDebugMode()#'.toUpperCase() == 'YES') ? true : false);
		var jsBool_isServerLocal = (('#Request.commonCode.isServerLocal()#'.toUpperCase() == 'YES') ? true : false);
		
		var fqServerName = fullyQualifiedAppPrefix();
		
		function windowOnReSizeCallback(_width, _height) {
		}
	
		function windowOnscrollCallback(top, left) {
			var bool_isDebugPanelRepositionable = false;
			return bool_isDebugPanelRepositionable;
		}
	// -->
	</script>

</cfoutput>
