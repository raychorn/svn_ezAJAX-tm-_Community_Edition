<cfcomponent displayname="performEmailNewsletters" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
//		Request.ezAJAX_Newsletters_DSN = 'ezAJAX-Registrations';
		Request.ezAJAX_Newsletters_DSN = 'ezAJAX-Registrations2005';

		function ConstructListOfUniqueCustomers(inQ) {
			var i = -1;
			var n = -1;
			var j = -1;
			var m = -1;
			var ar = ArrayNew(1);
			var ar2 = -1;
			var outQ = -1;
			if ( (IsDefined("inQ")) AND (IsQuery(inQ)) ) {
				outQ = QueryNew(inQ.columnList);
				ar2 = ListToArray(inQ.columnList, ',');
				m = ArrayLen(ar2);
				n = inQ.recordCount;
				for (i = 1; i lte n; i = i + 1) {
					if (ListFindNoCase(ArrayToList(ar, ','), inQ.username[i], ',') eq 0) {
						QueryAddRow(outQ, 1);
						for (j = 1; j lte m; j = j + 1) {
							QuerySetCell(outQ, ar2[j], inQ[ar2[j]][i], outQ.recordCount);
						}
						ar[ArrayLen(ar) + 1] = inQ.username[i];
					}
				}
			}
			return outQ;
		}
				
		function monthNameAbbrev(mmm) {
			var mmmAR = ArrayNew(1);
			mmmAR[1] = 'Jan';
			mmmAR[2] = 'Feb';
			mmmAR[3] = 'Mar';
			mmmAR[4] = 'April';
			mmmAR[5] = 'May';
			mmmAR[6] = 'June';
			mmmAR[7] = 'July';
			mmmAR[8] = 'Aug';
			mmmAR[9] = 'Sept';
			mmmAR[10] = 'Oct';
			mmmAR[11] = 'Nov';
			mmmAR[12] = 'Dec';
			if ( (mmm gte 1) AND (mmm lte 12) ) {
				return mmmAR[mmm];
			}
			return '';
		}
		
		function _userDefinedAJAXFunctions(qryStruct) {
			try {
				switch (qryStruct.ezCFM) {
					case 'performEmailNewsletters':
						_sql_statement = "SELECT DISTINCT UserNames.username, Newsletters.dtSent, DATEDIFF(d, Newsletters.dtSent, GETDATE()) AS 'days', OptInNewsletters.isOptIn FROM UserNames LEFT OUTER JOIN OptInNewsletters ON UserNames.username = OptInNewsletters.emailAddress LEFT OUTER JOIN Newsletters ON UserNames.id = Newsletters.uid WHERE ((Newsletters.dtSent IS NULL) OR (Newsletters.removed IS NULL) OR (DATEDIFF(d, Newsletters.dtSent, GETDATE()) > 30)) AND ( (OptInNewsletters.isOptIn IS NULL) OR (OptInNewsletters.isOptIn <> 0) ) ORDER BY UserNames.username, Newsletters.dtSent";
						_dsn = Request.ezAJAX_Newsletters_DSN;
						ezExecSQL('Request.qGetNewsletterSubscribers0', _dsn, _sql_statement);
						if (NOT Request.dbError) {
							if (Request.qGetNewsletterSubscribers0.recordCount gt 0) {
								folderName = monthNameAbbrev(Month(Now())) & DateFormat(Now(), 'yyyy');
								cfmFolder = ExpandPath('/app/NewsLetters/' & folderName & '/index.html');
								bool_FileExists = false;
								if (FileExists(cfmFolder)) {
									bool_FileExists = true;
								} else {
									folderName = monthNameAbbrev(Month(Now()) - 1) & DateFormat(Now(), 'yyyy');
									cfmFolder = ExpandPath('/app/NewsLetters/' & folderName & '/index.html');
									if (FileExists(cfmFolder)) {
										bool_FileExists = true;
									}
								}
								
								if (bool_FileExists) {
									ezCfFileRead(cfmFolder, 'Request.sContent');
									if (NOT Request.fileError) {
										bool_failedEmails = false;
										bool_failedDBUpdates = false;
										_statusMsg = 'Newsletter for #folderName# sent to: ';
										_statusMsg2 = 'Newsletter for #folderName# was not sent to: ';
										_statusDBMsg = 'Newsletter status was not updated for : ';
										Request.qGetNewsletterSubscribers = ConstructListOfUniqueCustomers(Request.qGetNewsletterSubscribers0);
										if ( (IsDefined("Request.qGetNewsletterSubscribers")) AND (IsQuery(Request.qGetNewsletterSubscribers)) ) {
											for (i = 1; i lte Request.qGetNewsletterSubscribers.recordCount; i = i + 1) {
												ezCfMail(Request.qGetNewsletterSubscribers.username[i], 'do-not-respond@ez-ajax.com', 'ezAJAX(tm) Newsletter for #folderName#', Request.sContent);
												if (NOT Request.anError) {
													_statusMsg = ListAppend(_statusMsg, Request.qGetNewsletterSubscribers.username[i], ',');
	
													_sql_statement = "DECLARE @uid as integer; SELECT @uid = (SELECT id FROM UserNames WHERE (username = '#Request.qGetNewsletterSubscribers.username[i]#')); if @uid IS NOT NULL BEGIN INSERT INTO Newsletters (uid, dtSent) VALUES (@uid,GETDATE()); END;";
													ezExecSQL('Request.qUpdateNewsletterSubscribers', _dsn, _sql_statement);
													if ( (Request.dbError) OR (Request.isPKviolation) ) {
														bool_failedDBUpdates = true;
														_statusDBMsg = ListAppend(_statusDBMsg, Request.qGetNewsletterSubscribers.username[i], ',');
													}
												} else {
													bool_failedEmails = true;
													_statusMsg2 = ListAppend(_statusMsg2, Request.qGetNewsletterSubscribers.username[i], ',');
												}
											}
	
											qObj = QueryNew('id, statusMsg');
											QueryAddRow(qObj, 1);
											QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
											_statusMsg = _statusMsg & '.';
											if (bool_failedEmails) {
												_statusMsg = _statusMsg & _statusMsg2 & '.';
											}
											if (bool_failedDBUpdates) {
												_statusMsg = _statusMsg & _statusDBMsg & '.';
											}
											QuerySetCell(qObj, 'statusMsg', _statusMsg, qObj.recordCount);
											ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
										} else {
											qObj = QueryNew('id, statusMsg');
											QueryAddRow(qObj, 1);
											QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
											QuerySetCell(qObj, 'statusMsg', 'System Error :: Unable to process "ConstructListOfUniqueCustomers" - back to the drawing board gang.', qObj.recordCount);
											ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
										}
									} else {
										qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
										QueryAddRow(qObj, 1);
										QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
										QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
										QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
										QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
										QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
										QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
										ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
									}
								} else {
									qObj = QueryNew('id, statusMsg');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'statusMsg', 'Unable to locate the Newsletter for (#cfmFolder#).', qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								}
							} else {
								qObj = QueryNew('id, statusMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'statusMsg', 'There are no customers to whom Newsletters can be sent at this time.', qObj.recordCount);
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
					break;
				}
			} catch (Any e) {
				qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				QuerySetCell(qObj, 'errorMsg', '<font color="red"><b>Something dreadful just happened... :: Reason: "Detail=Please check that the given name is correct and that the component exists.,Message=Could not find the ColdFusion Component performEmailNewsletters.,missingFileName=performEmailNewsletters,Type=Application," []</b></font>', qObj.recordCount);
				QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
				QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
				QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
				QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		}
	</cfscript>
</cfcomponent>
