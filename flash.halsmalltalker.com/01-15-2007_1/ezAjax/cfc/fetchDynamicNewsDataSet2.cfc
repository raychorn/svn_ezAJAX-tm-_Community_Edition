<cfcomponent displayname="fetchDynamicNewsDataSet2" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var sStatus = '';
			var r = -1;
			var scopesContent = '';
			try {
				switch (qryStruct.ezCFM) {
					case 'fetchDynamicNewsDataSet2':
						if (NOT IsDefined("Session.qDynamicNewsData")) {
							Session.qDynamicNewsData = StructNew();
							sStatus = sStatus & 'initialized ';
						}
						if (NOT IsDefined("Session.qDynamicNewsData.qObj")) {
							Session.qDynamicNewsData.qObj = QueryNew('ID, cat, subcat, url');;
							sStatus = sStatus & 'created ';
						}

						qObj = QueryNew('ID, status'); // You may add Query Elements to this Query as needed...
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'status', 'Dataset has been fetched.', qObj.recordCount);
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...

						if ( (IsDefined("Session.qDynamicNewsData.qObj")) AND (IsQuery(Session.qDynamicNewsData.qObj)) ) {
							for (r = 1; r lte Session.qDynamicNewsData.qObj.recordCount; r = r + 1) {
								Session.qDynamicNewsData.qObj.id[r] = r;
							}
							ezRegisterQueryFromAJAX(Session.qDynamicNewsData.qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
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
