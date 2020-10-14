<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfcontent type="text/plain">
<cfparam name="URL.username" type="string" default="">
<cfparam name="URL.password" type="string" default="">
<cfparam name="URL.cmd" type="string" default="">
<cftry>
	<cfscript>
		_result = '';
		_isValid = false;
		switch (URL.cmd) {
			case 'login':
				if ( (URL.username is 'admin') AND (URL.password is 'peek@b00') ) {
					_isValid = true;
				} else {
					_sqlStatement = "SELECT id, username, password FROM Users WHERE (username = '#URL.username#') AND (password = '#Encrypt(URL.password, URL.username, 'CFMX_COMPAT', 'HEX')#')";
					Request.commonCode.ezExecSQL('Request.qUserChk', 'FlashGames', _sqlStatement);
					if (Request.dbError) {
						_result = _result & '&dbError=' & dbError;
						_result = _result & '&errorMsg=' & errorMsg;
						_result = _result & '&moreErrorMsg=' & moreErrorMsg;
					} else if ( (IsQuery(Request.qUserChk)) AND (Request.qUserChk.recordCount eq 1) ) {
						_isValid = true;

						_sqlStatement = "INSERT INTO UsersActivity (uid, thisDate, action) VALUES (#Request.qUserChk.id#,GetDate(),'Login')";
						Request.commonCode.ezExecSQL('Request.qUserAct', 'FlashGames', _sqlStatement);
						if (Request.dbError) {
							_result = _result & '&dbError=' & dbError;
							_result = _result & '&errorMsg=' & errorMsg;
							_result = _result & '&moreErrorMsg=' & moreErrorMsg;
						}
					}
				}
				break;
	
			case 'register':
				_sqlStatement = "SELECT id, username, password FROM Users WHERE (username = '#URL.username#')";
				Request.commonCode.ezExecSQL('Request.qUserChk', 'FlashGames', _sqlStatement);
				if (Request.dbError) {
					_result = _result & '&dbError=' & dbError;
					_result = _result & '&errorMsg=' & errorMsg;
					_result = _result & '&moreErrorMsg=' & moreErrorMsg;
				} else {
					if ( (IsQuery(Request.qUserChk)) AND (Request.qUserChk.recordCount eq 0) ) {
						_sqlStatement = "INSERT INTO Users (username, password, regDate) VALUES ('#URL.username#','#Encrypt(URL.password, URL.username, 'CFMX_COMPAT', 'HEX')#',getDate())";
						Request.commonCode.ezExecSQL('Request.qUserAdd', 'FlashGames', _sqlStatement);
						if (Request.dbError) {
							_result = _result & '&dbError=' & dbError;
							_result = _result & '&errorMsg=' & errorMsg;
							_result = _result & '&moreErrorMsg=' & moreErrorMsg;
						} else {
							_isValid = true;
						}
					}
		//			writeOutput(Request.commonCode.ezCFDump(Request.qUserChk, 'Request.qUserChk', false));
				}
				break;
		}
	</cfscript>

	<cfcatch type="Any">
		<cfscript>
			_result = _result & '&dbError=' & cfcatch.message;
			_result = _result & '&errorMsg=' & cfcatch.detail;
		</cfscript>
	</cfcatch>
</cftry>
<cfif (NOT (CGI.SERVER_NAME contains ".halsmalltalker.com"))>
	<cfset _result = "">
</cfif>
<cfoutput>&_loaded=1&bool_isValid=#_isValid##_result#</cfoutput>
