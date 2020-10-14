<cfcomponent displayname="performResendRuntimeLicense" output="No" extends="userDefinedAJAXFunctions">
	<cffunction name="do_resentProductRegistrationNotice" access="private" returntype="string">
		<cfset var _html = "">

		<cfsavecontent variable="_html">
			<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>&copy; Hierarchical Applications Limited, All Rights Reserved.</title>
	</head>
	
	<body>
	
	<H3 style="color: blue;">Congratulations Again on successfully Registering your copy of exAJAX&##8482 Community Edition Framework</H3>
	
	<small>Your Runtime License file is attached.  Be sure you save this file as "runtimeLicense.dat" and place it in the root folder where you installed exAJAX&##8482 Community Edition Framework.</small><br>
	<small>If you encounter any problems or you cannot find the attached file then contact our Support Department at support@ez-ajax.com for help with your issues.</small>
	
	</body>
	</html>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn _html>
	</cffunction>
	
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var bool_isServerCommandCFCError = false;
			try {
				if (NOT bool_isServerCommandCFCError) {
					switch (qryStruct.ezCFM) {
					case 'performResendRuntimeLicense':
						if ( (IsDefined("qryStruct.namedArgs.id")) AND (Len(qryStruct.namedArgs.id) gt 0) ) {
							_sql_statement = "SELECT RuntimeLicenses.id, RuntimeLicenses.sid, RuntimeLicenses.expirationDate, RuntimeLicenses.computerID, RuntimeLicenses.ProductName, RuntimeLicenses.productVersion, RuntimeLicenses.ServerName, RuntimeLicenses.ColdfusionID, RuntimeLicenses.osID, RuntimeLicenses.isCommunityEdition, RuntimeLicenses.copyrightNotice, RuntimeLicenses.RuntimeLicenseData, UserNames.username, ServerNames.uid FROM RuntimeLicenses INNER JOIN ServerNames ON RuntimeLicenses.sid = ServerNames.id INNER JOIN UserNames ON ServerNames.uid = UserNames.id WHERE (RuntimeLicenses.id = #qryStruct.namedArgs.id#)";
							ezExecSQL('Request.qGetLicenseFromDb', Request.ezAJAX_DSN, _sql_statement);
							if (NOT Request.dbError) {
								_statusMsg = '';
								if (Request.qGetLicenseFromDb.recordCount gt 0) {
									aFilePath = CreateUUID() & "_" & Request.qGetLicenseFromDb.ServerName & '_runtimeLicense.dat';
									ezCfFileWrite(ExpandPath(aFilePath), Request.qGetLicenseFromDb.RuntimeLicenseData);
									if (NOT Request.fileError) {
										optionsStruct = StructNew();
										optionsStruct.bcc = 'support@ez-ajax.com';
										optionsStruct.cfmailparam = StructNew();
										optionsStruct.cfmailparam.type = 'text/plain';
										optionsStruct.cfmailparam.file = 'http:' & '/' & '/' & CGI.SERVER_NAME & ListSetAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, '/'), aFilePath, '/');
										ezCfMail(Request.qGetLicenseFromDb.username, 'do-not-respond@ez-ajax.com', 'Attached is your Runtime License for ezAJAX(tm) for #Request.qGetLicenseFromDb.username# / #Request.qGetLicenseFromDb.ServerName#', do_resentProductRegistrationNotice(), optionsStruct);
										if (NOT Request.anError) {
											_statusMsg = 'Your Runtime License, which was previously created for you, has been resent to your email address.';	
										} else {
											_statusMsg = '<font color="red"><b>It was not possible to resend your Runtime License file to your email address at this time due to a technical issue that is being resolved.  Kindly contact our Support Department at support@ez-ajax.com to get this problem resolved.</b></font>';
										}
									} else {
										_statusMsg = '<font color="red"><b>Cannot resend your Runtime License to your email address at this time due to a technical issue that is being resolved. Kindly contact our Support Department at support@ez-ajax.com to get this problem resolved.</b></font>';
									}
									ezCfMail('support@ez-ajax.com', 'do-not-respond@ez-ajax.com', 'Resent Runtime License for ezAJAX(tm) for #Request.qGetLicenseFromDb.username# / #Request.qGetLicenseFromDb.ServerName#', _statusMsg);
								}

								qObj = QueryNew('id, statusMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'statusMsg', _statusMsg, qObj.recordCount);
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
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.id")) {
								errorDetails = errorDetails & 'id';
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
