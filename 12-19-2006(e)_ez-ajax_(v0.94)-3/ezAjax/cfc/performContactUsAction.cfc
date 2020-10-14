<cfcomponent displayname="performContactUsAction" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			try {
				switch (qryStruct.ezCFM) {
				case 'performContactUsAction':
					if ( (IsDefined("qryStruct.namedArgs.emailAddress")) AND (IsDefined("qryStruct.namedArgs.emailMessage")) AND (IsDefined("qryStruct.namedArgs.toEmailAddrs")) AND (ListLen(qryStruct.namedArgs.toEmailAddrs, '@') eq 2) AND (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.toEmailAddrs, 2, '@'), ',') eq 0) ) { 
						ezCfMail(qryStruct.namedArgs.toEmailAddrs, qryStruct.namedArgs.emailAddress, 'ezAJAX(tm) Site Visitor EMail from (#qryStruct.namedArgs.emailAddress#)', qryStruct.namedArgs.emailMessage);
						if (NOT Request.anError) {
							qObj = QueryNew('ID, status');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'STATUS', 1, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
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
						if (NOT IsDefined("qryStruct.namedArgs.emailMessage")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'emailMessage';
						}
						if (NOT IsDefined("qryStruct.namedArgs.toEmailAddrs")) {
							if (Len(errorDetails) gt 0) {
								errorDetails = errorDetails & ' and ';
							}
							errorDetails = errorDetails & 'toEmailAddrs';
						} else {
							if ( (ListLen(qryStruct.namedArgs.toEmailAddrs, '@') neq 2) OR (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.toEmailAddrs, 2, '@'), ',') neq 0) ) {
								if (ListLen(qryStruct.namedArgs.toEmailAddrs, '@') neq 2) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The email address value is invalid because it is not an email address.';
								}
								if (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.toEmailAddrs, 2, '@'), ',') neq 0) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The email address value is invalid because it uses a domain name that violates the EULA because it is for a known anonymous email service. Users may not construct their email addresses using domains that provide anonymous email services.';
								}
							}
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
