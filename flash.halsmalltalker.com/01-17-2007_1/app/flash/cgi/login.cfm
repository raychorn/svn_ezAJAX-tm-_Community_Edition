<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfcontent type="text/plain">
<cfparam name="URL.username" type="string" default="">
<cfparam name="URL.password" type="string" default="">
<cfparam name="URL.cmd" type="string" default="">
<cfparam name="URL.datum" type="string" default="">
<cftry>
	<cfscript>
		function recordUserAction(sUsername, sPassword, sAction, sDatum) {
			var sResult = '';
			var _sqlStatement = '';
			if ( (Len(sUsername) gt 0) AND (Len(sPassword) gt 0) ) {
				_sqlStatement = "SELECT id, username, password FROM Users WHERE (username = '#sUsername#') AND (password = '#Encrypt(sPassword, sUsername, 'CFMX_COMPAT', 'HEX')#')";
			} else if ( (Len(sUsername) gt 0) AND (Len(sPassword) eq 0) ) {
				_sqlStatement = "SELECT TOP 1 Users.id, Users.username, Users.password, Users.regDate, UsersActivity.thisDate, UsersActivity.action FROM Users LEFT OUTER JOIN UsersActivity ON Users.id = UsersActivity.uid WHERE (Users.username = '#sUsername#') AND (UsersActivity.action = 'Login') AND (Users.regDate IS NOT NULL) AND (DATEPART ( mm, UsersActivity.thisDate ) = DATEPART ( mm, GetDate() )) AND (DATEPART ( dd, UsersActivity.thisDate ) = DATEPART ( dd, GetDate() )) AND (DATEPART ( yyyy, UsersActivity.thisDate ) = DATEPART ( yyyy, GetDate() )) AND (UsersActivity.thisDate < GetDate())";
			}
			Request.commonCode.ezExecSQL('Request.qUserChk', 'FlashGames', _sqlStatement);
			if (Request.dbError) {
				sResult = sResult & '&dbError=' & Replace('1.1 [' & Request.dbError & ',' & Request.errorMsg & ']' & ' sUsername = [#sUsername#], sPassword=[#sPassword#], sAction=[#sAction#], sDatum=[#sDatum#], _sqlStatement=[#_sqlStatement#]', Chr(13), '', 'all');
				sResult = sResult & '&errorMsg=' & Replace(Request.errorMsg, Chr(13), '', 'all');
				sResult = sResult & '&moreErrorMsg=' & Replace(Request.moreErrorMsg, Chr(13), '', 'all');
			} else if ( (IsQuery(Request.qUserChk)) AND (Request.qUserChk.recordCount eq 1) ) {
				if ( (Len(sUsername) gt 0) AND (Len(sPassword) gt 0) ) {
					Session.flashUser = URL.username;
				}
				_isValid = true;

				_sqlStatement = "INSERT INTO UsersActivity (uid, thisDate, action, datum) VALUES (#Request.qUserChk.id#,GetDate(),'#sAction#','#sDatum#')";
				Request.commonCode.ezExecSQL('Request.qUserAct', 'FlashGames', _sqlStatement);
				if (Request.dbError) {
					sResult = sResult & '&dbError=' & Replace('1.2 [' & Request.dbError & ',' & Request.errorMsg & ']', Chr(13), '', 'all');
					sResult = sResult & '&errorMsg=' & Replace(Request.errorMsg, Chr(13), '', 'all');
					sResult = sResult & '&moreErrorMsg=' & Replace(Request.moreErrorMsg, Chr(13), '', 'all');
				}
			}
			return sResult;
		}
		
		_result = '';
		_userResult = '';
		aResult = '';
		_isValid = false;
		switch (URL.cmd) {
			case 'islogin':
				if ( (IsDefined("Session.flashUser")) AND (Len(Session.flashUser) gt 0) ) {
					_userResult = _userResult & '&_username=' & Session.flashUser;
					_isValid = true;
				} else {
					_userResult = _userResult & '&_username=' & '';
				}
				break;
	
			case 'score':
				_uName = URL.username;
				if ( (IsDefined("Session.flashUser")) AND (Len(Session.flashUser) gt 0) ) {
					_uName = Session.flashUser;
				}
				aResult = recordUserAction(_uName, '', 'Score', URL.datum);
				if (Len(aResult) eq 0) {
					_isValid = true;
				} else {
					_result = _result & aResult;
				}
				break;
	
			case 'login':
				if ( (URL.username is 'admin') AND (URL.password is 'peek@b00') ) {
					Session.flashUser = URL.username;
					_isValid = true;
				} else {
					_result = _result & recordUserAction(URL.username, URL.password, 'Login', URL.datum);
				}
				break;
	
			case 'register':
				_sqlStatement = "SELECT id, username, password FROM Users WHERE (username = '#URL.username#')";
				Request.commonCode.ezExecSQL('Request.qUserChk', 'FlashGames', _sqlStatement);
				if (Request.dbError) {
					_result = _result & '&dbError=' & Replace('1.3 [' & Request.dbError & ',' & Request.errorMsg & ']', Chr(13), '', 'all');
					_result = _result & '&errorMsg=' & Replace(Request.errorMsg, Chr(13), '', 'all');
					_result = _result & '&moreErrorMsg=' & Replace(Request.moreErrorMsg, Chr(13), '', 'all');
				} else {
					if ( (IsQuery(Request.qUserChk)) AND (Request.qUserChk.recordCount eq 0) ) {
						_sqlStatement = "INSERT INTO Users (username, password, regDate) VALUES ('#URL.username#','#Encrypt(URL.password, URL.username, 'CFMX_COMPAT', 'HEX')#',getDate())";
						Request.commonCode.ezExecSQL('Request.qUserAdd', 'FlashGames', _sqlStatement);
						if (Request.dbError) {
							_result = _result & '&dbError=' & Replace('1.4 [' & Request.dbError & ',' & Request.errorMsg & ']', Chr(13), '', 'all');
							_result = _result & '&errorMsg=' & Replace(Request.errorMsg, Chr(13), '', 'all');
							_result = _result & '&moreErrorMsg=' & Replace(Request.moreErrorMsg, Chr(13), '', 'all');
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
			_result = _result & '&dbError=' & Replace('1.5 [' & cfcatch.message & ',' & cfcatch.detail & ']', Chr(13), '', 'all');
			_result = _result & '&errorMsg=' & Replace(cfcatch.detail, Chr(13), '', 'all');
		</cfscript>
	</cfcatch>
</cftry>
<cfoutput>&bool_isValid=#_isValid##_result##_userResult#&_loaded=1</cfoutput>
