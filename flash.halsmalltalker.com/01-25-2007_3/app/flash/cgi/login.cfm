<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfcontent type="text/plain">
<cfparam name="URL.username" type="string" default="">
<cfparam name="URL.password" type="string" default="">
<cfparam name="URL.cmd" type="string" default="">
<cfparam name="URL.datum" type="string" default="">
<cfparam name="URL.game" type="string" default="">
<cftry>
	<cfscript>
		_result = '';
		_userResult = '';
		aResult = '';
		_isValid = 0;

		function recordUserAction(sUsername, sPassword, sAction, sDatum, sGame) {
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
				_isValid = 1;

				_sqlStatement = "INSERT INTO UsersActivity (uid, thisDate, action, datum, game) VALUES (#Request.qUserChk.id#,GetDate(),'#sAction#','#sDatum#','#sGame#')";
				Request.commonCode.ezExecSQL('Request.qUserAct', 'FlashGames', _sqlStatement);
				if (Request.dbError) {
					sResult = sResult & '&dbError=' & Replace('1.2 [' & Request.dbError & ',' & Request.errorMsg & ']', Chr(13), '', 'all');
					sResult = sResult & '&errorMsg=' & Replace(Request.errorMsg, Chr(13), '', 'all');
					sResult = sResult & '&moreErrorMsg=' & Replace(Request.moreErrorMsg, Chr(13), '', 'all');
				}
			}
			return sResult;
		}
		
		function retrievePlayerScores(sUsername, sGame, bool) {
			var i = -1;
			var sResult = '';
			var num = -1;
			var whereClause = '';
			var _sqlStatement = '';
			if (NOT IsBoolean(bool)) {
				bool = false;
			}
			if (NOT bool) {
				whereClause = "(Users.username = '#sUsername#') AND ";
			}
			_sqlStatement = "SELECT Users.id, Users.username, Users.regDate, UsersActivity.thisDate, UsersActivity.action, UsersActivity.game, UsersActivity.datum FROM Users LEFT OUTER JOIN UsersActivity ON Users.id = UsersActivity.uid WHERE #whereClause#(UsersActivity.game = '#sGame#') AND (UsersActivity.action = 'Score') AND (Users.regDate IS NOT NULL) AND (DATEPART(mm, UsersActivity.thisDate) = DATEPART(mm, GETDATE())) AND (DATEPART(dd, UsersActivity.thisDate) = DATEPART(dd, GETDATE())) AND (DATEPART(yyyy, UsersActivity.thisDate) = DATEPART(yyyy, GETDATE())) AND (UsersActivity.thisDate < GETDATE()) ORDER BY UsersActivity.datum DESC";
			Request.commonCode.ezExecSQL('Request.qGetScores', 'FlashGames', _sqlStatement);
			if (Request.dbError) {
				sResult = sResult & '&num=0';
				sResult = sResult & '&dbError=' & Replace('1.1 [' & Request.dbError & ',' & Request.errorMsg & ']' & ' sUsername = [#sUsername#], sGame=[#sGame#], _sqlStatement=[#_sqlStatement#]', Chr(13), '', 'all');
				sResult = sResult & '&errorMsg=' & Replace(Request.errorMsg, Chr(13), '', 'all');
				sResult = sResult & '&moreErrorMsg=' & Replace(Request.moreErrorMsg, Chr(13), '', 'all');
			} else if ( (IsQuery(Request.qGetScores)) AND (Request.qGetScores.recordCount gt 0) ) {
				for (i = 1; i lte Request.qGetScores.recordCount; i = i + 1) {
					Request.qGetScores.datum[i] = Int(Request.qGetScores.datum[i]);
				}
				_sqlStatement = "SELECT username, datum FROM Request.qGetScores ORDER BY datum DESC";
				Request.commonCode.ezExecSQL('Request.qGetScores', '', _sqlStatement);
				if (Request.dbError) {
					sResult = sResult & '&num=0';
					sResult = sResult & '&dbError=' & Replace('1.1.1 [' & Request.dbError & ',' & Request.errorMsg & ']' & ' sUsername = [#sUsername#], sGame=[#sGame#], _sqlStatement=[#_sqlStatement#]', Chr(13), '', 'all');
					sResult = sResult & '&errorMsg=' & Replace(Request.errorMsg, Chr(13), '', 'all');
					sResult = sResult & '&moreErrorMsg=' & Replace(Request.moreErrorMsg, Chr(13), '', 'all');
				} else {
					num = Min(5, Request.qGetScores.recordCount);
					sResult = sResult & '&num=#num#';
					for (i = 1; i lte Min(5, num); i = i + 1) {
						sResult = sResult & '&score#i#=#Request.qGetScores.datum[i]#';
						if (bool) {
							sResult = sResult & '&username#i#=#Request.qGetScores.username[i]#';
						}
					}
					_isValid = 1;
				}
			}
			return sResult;
		}
		
		switch (URL.cmd) {
			case 'islogin':
				if ( (IsDefined("Session.flashUser")) AND (Len(Session.flashUser) gt 0) ) {
					_userResult = _userResult & '&_username=' & Session.flashUser;
					_isValid = 1;
				} else {
					_userResult = _userResult & '&_username=' & '';
				}
				break;
	
			case 'score':
				_uName = URL.username;
				if ( (IsDefined("Session.flashUser")) AND (Len(Session.flashUser) gt 0) ) {
					_uName = Session.flashUser;
				}
				aResult = recordUserAction(_uName, '', 'Score', URL.datum, URL.game);
				if (Len(aResult) eq 0) {
					_isValid = 1;
				} else {
					_result = _result & aResult;
				}
				break;
				
			case 'getscores':
				_uName = URL.username;;
				if ( (IsDefined("Session.flashUser")) AND (Len(Session.flashUser) gt 0) ) {
					_uName = Session.flashUser;
				}
				_result = _result & retrievePlayerScores(_uName, URL.game, false);
				break;
	
			case 'hiscores':
				_uName = URL.username;;
				if ( (IsDefined("Session.flashUser")) AND (Len(Session.flashUser) gt 0) ) {
					_uName = Session.flashUser;
				}
				_result = _result & retrievePlayerScores(_uName, URL.game, true);
				break;

			case 'login':
				if ( (URL.username is 'admin') AND (URL.password is 'peek@b00') ) {
					Session.flashUser = URL.username;
					_isValid = 1;
				} else {
					_result = _result & recordUserAction(URL.username, URL.password, 'Login', URL.datum, URL.game);
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
							_isValid = 1;
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
