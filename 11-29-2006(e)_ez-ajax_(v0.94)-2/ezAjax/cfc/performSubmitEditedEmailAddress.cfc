<cfcomponent displayname="performSubmitEditedEmailAddress" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			try {
				switch (qryStruct.ezCFM) {
				case 'performSubmitEditedEmailAddress':
					if ( (IsDefined("qryStruct.namedArgs.EmailAddress")) AND (Len(qryStruct.namedArgs.emailAddress) gt 0) AND (IsDefined("qryStruct.namedArgs.id")) AND (Len(qryStruct.namedArgs.id) gt 0) AND (IsDefined("qryStruct.namedArgs.sid")) AND (Len(qryStruct.namedArgs.sid) gt 0) ) {
						_sql_statement = "SELECT id FROM UserNames WHERE (username = '#ezFilterQuotesForSQL(qryStruct.namedArgs.EmailAddress)#')";
						ezExecSQL('Request.qGetEmailAddress', Request.ezAJAX_DSN, _sql_statement);
						if (NOT Request.dbError) {
							if (Request.qGetEmailAddress.recordCount eq 0) {
								_sql_statement = "INSERT INTO UserNames (username) VALUES ('#ezFilterQuotesForSQL(qryStruct.namedArgs.EmailAddress)#'); SELECT @@IDENTITY as 'id';";
								ezExecSQL('Request.qGetEmailAddress', Request.ezAJAX_DSN, _sql_statement);
							}
						}
						if (NOT Request.dbError) {
							_sql_statement = "UPDATE ServerNames SET uid = #Request.qGetEmailAddress.id# WHERE (id = #qryStruct.namedArgs.sid#)";
							ezExecSQL('Request.qUpdateEmailAddressLinkageToServerName', Request.ezAJAX_DSN, _sql_statement);
							if (NOT Request.dbError) {
								qObj = QueryNew('id, statusMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'statusMsg', 'INFO: The requested changes have been made, next time you must use the updated Email Address when accessing the specific Runtime License that belongs to you.', qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					} else {
						qObj = QueryNew('id, errorMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						errorDetails = '';
						if (NOT IsDefined("qryStruct.namedArgs.emailAddress")) {
							errorDetails = errorDetails & 'emailAddress';
						}
						if (NOT IsDefined("qryStruct.namedArgs.id")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'id';
						}
						if (NOT IsDefined("qryStruct.namedArgs.sid")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'sid';
						}
						extraErrorMsg = '';
						if ( (isDebugMode()) OR (isServerLocal()) ) {
							extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
					break;
				}
			} catch (Any e) {
				qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				QuerySetCell(qObj, 'errorMsg', '<font color="red"><b>Something dreadful just happened... :: Reason: "#ezExplainError(e, false)#" [#Request.cfcPrefix#]</b></font>', qObj.recordCount);
				QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
				QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
				QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
				QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		}
	</cfscript>
</cfcomponent>
