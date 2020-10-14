<cfcomponent displayname="sampleAJAXCommand" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var scopesContent = '';
			var _sql_statement = '';
			var fName = ExpandPath('*.*');
			fName = ListDeleteAt(fName, ListLen(fName, '\'), '\');
			try {
				switch (qryStruct.ezCFM) {
					case 'sampleAJAXCommand':
						// sample ezAJAX Server Command
						ezCfDirectory('Request.qDir', fName, '*.*');
						if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
							_sql_statement = "SELECT NAME, TYPE, SIZE, DIRECTORY FROM Request.qDir WHERE (TYPE = 'File') ORDER BY NAME";
							ezExecSQL('Request.qFiles', '', _sql_statement);
							ezRegisterQueryFromAJAX(Request.qFiles); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
	//						scopesContent = '<br>Request.directoryError = [#Request.directoryError#], (IsQuery(Request.qDir)) = [#(IsQuery(Request.qDir))#], Request.qDir.recordCount = [#Request.qDir.recordCount#], fName = [#fName#]';
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', '<font color="red"><b>ezCFDirectory failed to return a Query Object in "#CGI.SCRIPT_NAME#".</b></font>' & scopesContent, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
							QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
							QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				}
			} catch (Any e) {
				errMsg = ezExplainError(e, false);
				qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				if (CGI.REMOTE_HOST is '127.0.0.1') {
					scopesContent = '<br><table width="100%"><tr><td>' & ezCfDump(e, 'CF Error', false) & '</td></tr></table>';
				}
				QuerySetCell(qObj, 'errorMsg', '<font color="red"><b>Something just went wrong in "#CGI.SCRIPT_NAME#"... :: Reason: "#errMsg#".</b></font>' & scopesContent, qObj.recordCount);
				QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
				QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
				QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
				QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		}
	</cfscript>
</cfcomponent>
