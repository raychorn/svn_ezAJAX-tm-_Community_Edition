<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfcontent type="text/plain">
<cfparam name="URL.username" type="string" default="">
<cfparam name="URL.password" type="string" default="">
<cfscript>
	_isValid = false;
	if ( (URL.username is 'admin') AND (URL.password is 'peek@b00') ) {
		_isValid = true;
	}
</cfscript>
<cfoutput>&_loaded=1&bool_isValid=#_isValid#</cfoutput>
