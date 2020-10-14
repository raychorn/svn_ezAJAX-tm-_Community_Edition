<cfcomponent displayname="removeDynamicNewsDataSet2" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var r = -1;
			var c = -1;
			var colsAR = -1;
			var nn = -1;
			var errMsg = '';
			var _sql_statement = '';
			var scopesContent = '';
			try {
				switch (qryStruct.ezCFM) {
					case 'removeDynamicNewsDataSet2':
						if ( (IsDefined("qryStruct.namedArgs.row")) AND (Len(qryStruct.namedArgs.row) gt 0) ) {
							if ( (IsDefined("Session.qDynamicNewsData.qObj")) AND (IsQuery(Session.qDynamicNewsData.qObj)) ) {
								colsAR = ListToArray(Session.qDynamicNewsData.qObj.columnList, ',');
								nn = ArrayLen(colsAR);
								for (c = 1; c lte nn; c = c + 1) {
									Session.qDynamicNewsData.qObj[colsAR[c]][qryStruct.namedArgs.row] = '';
								}
							}

							qObj = QueryNew('ID, status'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'status', 'Data has been removed for row ###qryStruct.namedArgs.row#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...

							if ( (IsDefined("Session.qDynamicNewsData.qObj")) AND (IsQuery(Session.qDynamicNewsData.qObj)) ) {
								_sql_statement = "SELECT * FROM Session.qDynamicNewsData.qObj WHERE (ID IS NOT NULL) AND (ID <> '') AND (CAT IS NOT NULL) AND (CAT <> '') AND (SUBCAT IS NOT NULL) AND (SUBCAT <> '') AND (URL IS NOT NULL) AND (URL <> '')";
								ezExecSQL('Session.qDynamicNewsData.qObj', '', _sql_statement);
								if ( (IsDefined("Session.qDynamicNewsData.qObj")) AND (IsQuery(Session.qDynamicNewsData.qObj)) ) {
									ezRegisterQueryFromAJAX(Session.qDynamicNewsData.qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								}
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.row")) {
								errorDetails = errorDetails & 'row';
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
