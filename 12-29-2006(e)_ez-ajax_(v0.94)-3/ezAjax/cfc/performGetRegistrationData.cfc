<cfcomponent displayname="performGetRegistrationData" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			try {
				switch (qryStruct.ezCFM) {
				case 'performGetRegistrationData':
					if ( (IsDefined("qryStruct.namedArgs.emailAddress")) AND (Len(qryStruct.namedArgs.emailAddress) gt 0) AND (IsDefined("qryStruct.namedArgs.serverName")) AND (Len(qryStruct.namedArgs.serverName) gt 0) ) {
						_sql_statement = "SELECT 0 as 'id', ServerNames.id AS 'sid', ServerNames.uid, UserNames.username, ServerNames.serverName, 0 as 'hasLicense', 0 as 'isCommunityEdition', '' as 'expirationDate' FROM UserNames INNER JOIN ServerNames ON UserNames.id = ServerNames.uid WHERE (UserNames.username = '#ezFilterQuotesForSQL(qryStruct.namedArgs.emailAddress)#') AND (ServerNames.serverName = '#ezFilterQuotesForSQL(qryStruct.namedArgs.serverName)#')";
						ezExecSQL('Request.qGetRegistrationData', Request.ezAJAX_DSN, _sql_statement);
						if (NOT Request.dbError) {
							if (Request.qGetRegistrationData.recordCount gt 0) {
								_sql_statement = "SELECT id, sid, expirationDate, ProductName, productVersion, ServerName, isCommunityEdition FROM RuntimeLicenses WHERE (sid = #Request.qGetRegistrationData.sid#)";
								ezExecSQL('Request.qGetLicenseData', Request.ezAJAX_DSN, _sql_statement);
								if (NOT Request.dbError) {
									if (Request.qGetLicenseData.recordCount gt 0) {
										Request.qGetRegistrationData.id[1] = Request.qGetLicenseData.id[1];
										Request.qGetRegistrationData.hasLicense[1] = 1;
										Request.qGetRegistrationData.isCommunityEdition[1] = Request.qGetLicenseData.isCommunityEdition[1];
										Request.qGetRegistrationData.expirationDate[1] = DateFormat(Request.qGetLicenseData.expirationDate[1], 'mm/dd/yyyy') & ' ' & TimeFormat(Request.qGetLicenseData.expirationDate[1], 'hh:mm:ss tt') & '';
									}
									ezRegisterQueryFromAJAX(Request.qGetRegistrationData); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
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
								qObj = QueryNew('id, statusMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'statusMsg', 'Warning: Invalid data provided for the Email Address (#qryStruct.namedArgs.emailAddress#) and/or Server Name (#qryStruct.namedArgs.serverName#).', qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
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
						if (NOT IsDefined("qryStruct.namedArgs.emailAddress")) {
							errorDetails = errorDetails & 'emailAddress';
						}
						if (NOT IsDefined("qryStruct.namedArgs.serverName")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'serverName';
						}
						extraErrorMsg = '';
						if ( (isDebugMode()) OR (isServerLocal()) ) {
							extraErrorMsg = ' for #qryStruct.ezCFM# in #CGI.SCRIPT_NAME#';
						}
						QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
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
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		}
	</cfscript>
</cfcomponent>
