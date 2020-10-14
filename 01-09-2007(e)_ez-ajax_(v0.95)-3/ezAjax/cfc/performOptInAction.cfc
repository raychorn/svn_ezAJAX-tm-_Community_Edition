<cfcomponent displayname="performOptInAction" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var scopesContent = '';
			var _opt_bit_setting = 1;
			try {
				switch (qryStruct.ezCFM) {
					case 'performOptInAction':
						if ( (IsDefined("qryStruct.namedArgs.emailAddress")) AND (Len(qryStruct.namedArgs.emailAddress) gt 0) ) {
							_sql_statement = "INSERT INTO OptInNewsletters (emailAddress, isOptIn) VALUES ('#ezFilterQuotesForSQL(qryStruct.namedArgs.EmailAddress)#', #_opt_bit_setting#)";
							ezExecSQL('Request.qPutNewsletterSubscribers', Request.ezAJAX_DSN, _sql_statement);
							if ( (Request.dbError) OR (Request.isPKviolation) ) {
								_sql_statement = "UPDATE OptInNewsletters SET isOptIn = #_opt_bit_setting# WHERE (emailAddress = '#ezFilterQuotesForSQL(qryStruct.namedArgs.EmailAddress)#')";
								ezExecSQL('Request.qPutNewsletterSubscribers', Request.ezAJAX_DSN, _sql_statement);
							}
							if ( (NOT Request.dbError) OR (Request.isPKviolation) ) {
								qObj = QueryNew('ID, status, optFlag');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'STATUS', 1, qObj.recordCount);
								QuerySetCell(qObj, 'optFlag', _opt_bit_setting, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.emailAddress")) {
								errorDetails = errorDetails & 'emailAddress';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.ezCFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				}
			} catch (Any e) {
				errMsg = ezExplainError(e, false);
				qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				if (CGI.REMOTE_HOST is '127.0.0.1') {
					scopesContent = scopesContent & '<br><table width="100%"><tr><td>' & ezExplainError(e, true) & '</td></tr></table>';
				}
				QuerySetCell(qObj, 'errorMsg', '<font color="red"><b>Something just went wrong in "#CGI.SCRIPT_NAME#"... :: Reason: "#errMsg#".</b></font>' & scopesContent, qObj.recordCount);
				QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
				QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
				QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
				QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		}
	</cfscript>
</cfcomponent>
