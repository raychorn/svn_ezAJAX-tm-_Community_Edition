<cfcomponent displayname="updateDynamicNewsDataSet2" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var r = -1;
			var scopesContent = '';
			try {
				switch (qryStruct.ezCFM) {
					case 'updateDynamicNewsDataSet2':
						if ( (IsDefined("qryStruct.namedArgs.col")) AND (Len(qryStruct.namedArgs.col) gt 0) AND (IsDefined("qryStruct.namedArgs.row")) AND (Len(qryStruct.namedArgs.row) gt 0) AND (IsDefined("qryStruct.namedArgs.colName")) AND (Len(qryStruct.namedArgs.colName) gt 0) AND (IsDefined("qryStruct.namedArgs.dataValue")) AND (Len(qryStruct.namedArgs.dataValue) gt 0) ) {
							if ( (IsDefined("Session.qDynamicNewsData.qObj")) AND (IsQuery(Session.qDynamicNewsData.qObj)) ) {
								for (r = 1; r lte Session.qDynamicNewsData.qObj.recordCount; r = r + 1) {
									if (Session.qDynamicNewsData.qObj.id[r] eq qryStruct.namedArgs.row) {
										Session.qDynamicNewsData.qObj[qryStruct.namedArgs.colName][r] = qryStruct.namedArgs.dataValue;
									}
								}
							}

							qObj = QueryNew('ID, status'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'status', 'Data has been updated for row ###qryStruct.namedArgs.row# and col ###qryStruct.namedArgs.col#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.col")) {
								errorDetails = errorDetails & 'col';
							}
							if (NOT IsDefined("qryStruct.namedArgs.row")) {
								errorDetails = errorDetails & 'row';
							}
							if (NOT IsDefined("qryStruct.namedArgs.row2")) {
								errorDetails = errorDetails & 'row2';
							}
							if (NOT IsDefined("qryStruct.namedArgs.col2")) {
								errorDetails = errorDetails & 'col2';
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
