<cfcomponent displayname="ezAJAX_PopulateDebugScope" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function init(_sig) {
			if (NOT IsDefined("Application.ezAJAX_PopulateDebugScope")) {
				Application.ezAJAX_PopulateDebugScope = StructNew();
				Application.ezAJAX_PopulateDebugScope.pendingStyles = '';
			}
			return this;
		}
		
		function getPendingStyles() {
			return URLDecode(Application.ezAJAX_PopulateDebugScope.pendingStyles);
		}
		
		function listToContentTable(aList, scopeName) {
			var _html = '';
			var i = -1;
			var ar = ListToArray(aList, ',');
			var n = ArrayLen(ar);
			var sQuote = "'";
			var _datum = '';
			var _value = '';
			var isSimple = false;
			var keyList = '';
			var keyListCount = -1;
			var varTypeText = '';
			
			_html = _html & '<table width="100%" cellpadding="-1" cellspacing="-1">';
			for (i = 1; i lte n; i = i + 1) {
				try {
					_datum = Evaluate('#scopeName#.#ar[i]#');
					isSimple = (IsSimpleValue(_datum));
					if (NOT isSimple) {
						keyList = StructKeyList(_datum, ',');
						keyListCount = ListLen(keyList, ',');
					}
				} catch (Any e) { isSimple = false; };
				_html = _html & '<tr>';
				if (isSimple) {
					try {
						_value = _datum;
					} catch (Any e) { _value = 'UNDEFINED'; };
					_html = _html & '<td id="btn_fetchDebug_#scopeName#.#ar[i]#" width="20%" valign="top" align="left" style="cursor:hand; cursor:pointer;" title="Click this button to view the #scopeName#.#ar[i]# variable which is (#_value#)." onclick="try { this.disabled = true; this.style.backgroundColor = #sQuote##sQuote#; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseover="this.style.backgroundColor = #sQuote#silver#sQuote#; return false;" onmouseout="this.style.backgroundColor = #sQuote##sQuote#; return false;"><span class="buttonClass">"#scopeName#.#ar[i]#"</span></td>';
					_html = _html & '<td valign="top" align="left" title="Debug: div_fetchDebug_#scopeName#.#ar[i]#"><div id="div_fetchDebug_#scopeName#.#ar[i]#" class="buttonClass">[***]</div></td>';
				} else {
					if (IsCustomFunction(_datum)) {
						keyListCount = 'f';
						varTypeText = 'function';
					} else {
						varTypeText = 'variable';
					}
					_html = _html & '<td id="btn_fetchDebug_#scopeName#.#ar[i]#" width="20%" valign="top" align="left" style="cursor:hand; cursor:pointer;" title="Click this button to view the #scopeName#.#ar[i]# #varTypeText#." onclick="try { this.disabled = true; this.style.backgroundColor = #sQuote##sQuote#; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseover="this.style.backgroundColor = #sQuote#silver#sQuote#; return false;" onmouseout="this.style.backgroundColor = #sQuote##sQuote#; return false;"><span class="buttonClass"><NOBR>[#scopeName#.#ar[i]#] (#keyListCount#)</NOBR></span></td>';
					_html = _html & '<td valign="top" align="left" title="Debug: div_fetchDebug_#scopeName#.#ar[i]#"><div id="div_fetchDebug_#scopeName#.#ar[i]#" class="buttonClass">[***]</div></td>';
				}
				_html = _html & '</tr>';
			}
			_html = _html & '</table>';
			return _html;
		}
		
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var scopesContent = '';
			var htmlContent = '';
			var _datum = -1;
			var isError = false;
			var aStruct = -1;
			var _db = '';
			try {
				Application.ezAJAX_PopulateDebugScope.pendingStyles = '';
				switch (qryStruct.ezCFM) {
					case 'ezAJAX_PopulateDebugScope':
						if ( (IsDefined("qryStruct.namedArgs.scopeName")) AND (Len(qryStruct.namedArgs.scopeName) gt 0) AND (NOT IsDefined("qryStruct.namedArgs.scopeMember")) ) {
							qObj = QueryNew('ID, CONTENT'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							switch (qryStruct.namedArgs.scopeName) {
								case 'Application':
									try {
										htmlContent = listToContentTable(StructKeyList(Application, ','), qryStruct.namedArgs.scopeName);
									} catch (Any e) { htmlContent = ezExplainError(e, true); };
								break;

								case 'Session':
									try {
										htmlContent = listToContentTable(StructKeyList(Session, ','), qryStruct.namedArgs.scopeName);
									} catch (Any e) { htmlContent = ezExplainError(e, true); };
								break;

								case 'CGI':
									try {
										htmlContent = listToContentTable(StructKeyList(CGI, ','), qryStruct.namedArgs.scopeName);
									} catch (Any e) { htmlContent = ezExplainError(e, true); };
								break;

								case 'Request':
									try {
										htmlContent = listToContentTable(StructKeyList(Request, ','), qryStruct.namedArgs.scopeName);
									} catch (Any e) { htmlContent = ezExplainError(e, true); };
								break;
							}
							if (NOT IsDefined("htmlContent")) {
								htmlContent = 'Variable htmlContent is undefined [#qryStruct.namedArgs.scopeName#] !';
							}
							QuerySetCell(qObj, 'CONTENT', htmlContent, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else if ( (IsDefined("qryStruct.namedArgs.scopeName")) AND (Len(qryStruct.namedArgs.scopeName) gt 0) AND (IsDefined("qryStruct.namedArgs.scopeMember")) AND (Len(qryStruct.namedArgs.scopeMember) gt 0) ) {
							isError = false;
							try {
								_datum = Evaluate(qryStruct.namedArgs.scopeMember);
								_db = _db & '(1)=[#(IsStruct(_datum))#]';
								_db = _db & '&nbsp;(2)=[#(IsSimpleValue(_datum))#]';
								_db = _db & '&nbsp;(3)=[#(IsObject(_datum))#]';
								_db = _db & '&nbsp;(4)=[#(IsCustomFunction(_datum))#]';
								if (IsStruct(_datum)) {
									htmlContent = listToContentTable(StructKeyList(_datum, ','), qryStruct.namedArgs.scopeMember);
								} else if (IsObject(_datum)) {
									htmlContent = ezExplainError(_datum, true);
								} else if (IsCustomFunction(_datum)) {
									aStruct = ezProcessComplexHTMLContent(ezCFDump(_datum, qryStruct.namedArgs.scopeMember, true));
									htmlContent = URLEncodedFormat(aStruct.htmlContent);
		//							aStruct = ezProcessComplexHTMLContent(ezCFDump(Evaluate(qryStruct.namedArgs.scopeName), qryStruct.namedArgs.scopeName & '.' & qryStruct.namedArgs.scopeMember, true));
		//							Application.ezAJAX_PopulateDebugScope.pendingStyles = URLEncodedFormat(aStruct.styleContent);
								} else if (IsSimpleValue(_datum)) {
									htmlContent = _datum & ' [Simple]';
								}
							} catch (Any e) {
								isError = true;
								htmlContent = ezExplainError(e, true);
							};
							qObj = QueryNew('ID, CONTENT, HASSTYLES'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'CONTENT', htmlContent & '<br>' & _db, qObj.recordCount);
							QuerySetCell(qObj, 'HASSTYLES', (Len(Application.ezAJAX_PopulateDebugScope.pendingStyles) gt 0), qObj.recordCount);
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
							if (NOT IsDefined("qryStruct.namedArgs.scopeMember")) {
								errorDetails = errorDetails & 'scopeMember';
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
