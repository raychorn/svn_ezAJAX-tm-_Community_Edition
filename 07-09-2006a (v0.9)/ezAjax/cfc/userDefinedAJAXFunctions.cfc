<cfcomponent displayname="userDefinedAJAXFunctions" output="No" extends="ezAjaxCode">

	<cfscript>
		function userDefinedAJAXFunctions(qryStruct) {
			switch (qryStruct.ezCFM) {
				case 'sampleAJAXCommand':
					pName = GetDirectoryFromPath(ExpandPath('/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/' & '*.*'));
					ezCfDirectory('Request.qDir', pName, '*.cfm', false);
					if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
						qObj = QueryNew('id, fileCount');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'fileCount', Request.qDir.recordCount, qObj.recordCount);
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...

						_sql_statement = "SELECT NAME FROM Request.qDir ORDER BY NAME";
						ezExecSQL('Request.qDir2', '', _sql_statement);
						if (NOT Request.dbError) {
							ezRegisterQueryFromAJAX(Request.qDir2); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
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
						QuerySetCell(qObj, 'errorMsg', Request.directoryErrorMsg & ',' & Request.directoryFullErrorMsg & ', pName = [#pName#]', qObj.recordCount);
						QuerySetCell(qObj, 'moreErrorMsg', Request.directoryFullErrorMsg, qObj.recordCount);
						QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
						QuerySetCell(qObj, 'isPKviolation', false, qObj.recordCount);
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				break;
			}
		}
	</cfscript>
</cfcomponent>
