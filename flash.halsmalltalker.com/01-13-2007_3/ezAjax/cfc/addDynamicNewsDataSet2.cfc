<cfcomponent displayname="addDynamicNewsDataSet2" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var sStatus = '';
			var _sql_statement = '';
			var scopesContent = '';
			try {
				switch (qryStruct.ezCFM) {
					case 'addDynamicNewsDataSet2':
						if ( (IsDefined("qryStruct.namedArgs.col")) AND (Len(qryStruct.namedArgs.col) gt 0) AND (IsDefined("qryStruct.namedArgs.category")) AND (Len(qryStruct.namedArgs.category) gt 0) AND (IsDefined("qryStruct.namedArgs.url")) AND (Len(qryStruct.namedArgs.url) gt 0) AND (IsDefined("qryStruct.namedArgs.row")) AND (Len(qryStruct.namedArgs.row) gt 0) AND (IsDefined("qryStruct.namedArgs.subcat")) AND (Len(qryStruct.namedArgs.subcat) gt 0) ) {
							if (NOT IsDefined("Session.qDynamicNewsData")) {
								Session.qDynamicNewsData = StructNew();
								sStatus = sStatus & 'initialized ';
							}
							if (NOT IsDefined("Session.qDynamicNewsData.qObj")) {
								Session.qDynamicNewsData.qObj = QueryNew('ID, cat, subcat, url');;
								sStatus = sStatus & 'created ';
							}
							if (IsDefined("Session.qDynamicNewsData.qObj")) {
								QueryAddRow(Session.qDynamicNewsData.qObj, 1);
								QuerySetCell(Session.qDynamicNewsData.qObj, 'ID', Session.qDynamicNewsData.qObj.recordCount, Session.qDynamicNewsData.qObj.recordCount);
								QuerySetCell(Session.qDynamicNewsData.qObj, 'cat', '#DateFormat(NOW(), "mmm")#-#DateFormat(NOW(), "yyyy")#@' & qryStruct.namedArgs.category, Session.qDynamicNewsData.qObj.recordCount);
								QuerySetCell(Session.qDynamicNewsData.qObj, 'subcat', qryStruct.namedArgs.subcat, Session.qDynamicNewsData.qObj.recordCount);
								QuerySetCell(Session.qDynamicNewsData.qObj, 'url', qryStruct.namedArgs.url, Session.qDynamicNewsData.qObj.recordCount);
								sStatus = sStatus & 'appended and now has #Session.qDynamicNewsData.qObj.recordCount# records';
							}

							qObj = QueryNew('ID, status'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'status', 'Dataset has been #sStatus#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...

							if ( (IsDefined("Session.qDynamicNewsData.qObj")) AND (IsQuery(Session.qDynamicNewsData.qObj)) ) {
								_sql_statement = "SELECT * FROM Session.qDynamicNewsData.qObj WHERE (CAT <> '') AND (SUBCAT <> '') AND (URL <> '')";
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
							if (NOT IsDefined("qryStruct.namedArgs.col")) {
								errorDetails = errorDetails & 'col';
							}
							if (NOT IsDefined("qryStruct.namedArgs.category")) {
								errorDetails = errorDetails & 'category';
							}
							if (NOT IsDefined("qryStruct.namedArgs.url")) {
								errorDetails = errorDetails & 'url';
							}
							if (NOT IsDefined("qryStruct.namedArgs.row")) {
								errorDetails = errorDetails & 'row';
							}
							if (NOT IsDefined("qryStruct.namedArgs.subcat")) {
								errorDetails = errorDetails & 'subcat';
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
