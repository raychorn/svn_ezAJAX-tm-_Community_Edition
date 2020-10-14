<cfcomponent displayname="ezAJAX_PopulateDebugScope" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function listToContentTable(aList, scopeName) {
			var _html = '';
			var i = -1;
			var ar = ListToArray(aList, ',');
			var n = ArrayLen(ar);
			
			_html = _html & '<table width="100%" cellpadding="-1" cellspacing="-1">';
			for (i = 1; i lte n; i = i + 1) {
				_html = _html & '<tr>';
				_html = _html & '<td><button id="btn_fetchDebug_#scopeName#.#ar[i]#" onclick="try { this.disabled = true; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" title="Click this button to view the #scopeName#.#ar[i]# variable" class="buttonClass">[#scopeName#.#ar[i]#]</button></td>';
				_html = _html & '</tr>';
			}
			_html = _html & '</table>';
		}
		
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var scopesContent = '';
			var _Content = '';
			try {
				switch (qryStruct.ezCFM) {
					case 'ezAJAX_PopulateDebugScope':
						if ( (IsDefined("qryStruct.namedArgs.scopeName")) AND (Len(qryStruct.namedArgs.scopeName) gt 0) ) {
							qObj = QueryNew('ID, CONTENT'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							switch (qryStruct.namedArgs.scopeName) {
								case 'Application':
									try {
										_Content = listToContentTable(StructKeyList(Application, ','), qryStruct.namedArgs.scopeName);
									} catch (Any e) { _Content = ezExplainError(e, true); };
								break;

								case 'Session':
									try {
										_Content = listToContentTable(StructKeyList(Session, ','), qryStruct.namedArgs.scopeName);
									} catch (Any e) { _Content = ezExplainError(e, true); };
								break;

								case 'CGI':
									try {
										_Content = listToContentTable(StructKeyList(CGI, ','), qryStruct.namedArgs.scopeName);
									} catch (Any e) { _Content = ezExplainError(e, true); };
								break;

								case 'Request':
									try {
										_Content = listToContentTable(StructKeyList(Request, ','), qryStruct.namedArgs.scopeName);
									} catch (Any e) { _Content = ezExplainError(e, true); };
								break;
							}
							if (NOT IsDefined("_Content")) {
								_Content = 'Variable _Content is undefined [#qryStruct.namedArgs.scopeName#] !';
							}
							QuerySetCell(qObj, 'CONTENT', _Content, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.scopeName")) {
								errorDetails = errorDetails & 'scopeName';
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
