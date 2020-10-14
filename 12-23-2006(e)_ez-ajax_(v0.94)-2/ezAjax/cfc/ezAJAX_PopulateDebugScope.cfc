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
		
		function getDisplayClass(_datum) {
			var aClass = '';
			if (IsSimpleValue(_datum)) {
				if (IsWDDX(_datum)) {
					aClass = 'wddx';
				} else if (IsXML(_datum)) {
					aClass = 'xml';
				} else if (IsBinary(_datum)) {
					aClass = 'binary';
				}
			} else {
				if (IsStruct(_datum)) {
					aClass = 'struct';
				} else if (IsArray(_datum)) {
					aClass = 'array';
				} else if (IsQuery(_datum)) {
					aClass = 'query';
				} else if (IsObject(_datum)) {
					aClass = 'object';
				} else if (IsCustomFunction(_datum)) {
					aClass = 'udf';
				} else {
					aClass = 'cfc';
				}
			}
			return 'cfdump_' & aClass;
		}

		function listToContentTable(aList, scopeName, iBegin) {
			var _html = '';
			var i = -1;
			var ar = ListToArray(aList, ',');
			var n = ArrayLen(ar);
			var p = -1;
			var nn = n;
			var sQuote = "'";
			var _datum = '';
			var _value = '';
			var isSimple = false;
			var keyList = '';
			var keyListCount = -1;
			var varTypeText = '';
			var tableClass = '';
			var theClass = '';
			var pageSize = 10;
			var areTooManyItems = (n gt pageSize);
			
			tableClass = getDisplayClass(Evaluate(scopeName));
			theClass = ReplaceNoCase(tableClass, 'cfdump_', '');

			_html = _html & '<table width="100%" cellpadding="-1" cellspacing="-1">';
			if (areTooManyItems) {
				n = Min(n, pageSize);
			}
			if (NOT IsNumeric(iBegin)) {
				iBegin = 0;
			} else if (iBegin gt 1) {
				n = Min(iBegin + n, nn);
			}
			p = (iBegin - Min(pageSize, (nn - n) + 1));
			if (p eq 0) {
				p = p + 1;
			}
			if ((nn - p) lt pageSize) {
				p = (p - pageSize) + 1;
			}
			for (i = iBegin; i lte n; i = i + 1) {
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
					_html = _html & '<td id="btn_fetchDebug_#scopeName#.#ar[i]#" width="20%" valign="top" align="left" style="cursor:hand; cursor:pointer;" title="Click this item to view the #scopeName#.#ar[i]# variable (#i#) of (#nn#)." onclick="try { this.disabled = true; this.style.backgroundColor = #sQuote##sQuote#; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseover="this.style.backgroundColor = #sQuote#silver#sQuote#; return false;" onmouseout="this.style.backgroundColor = #sQuote##sQuote#; return false;"><span class="buttonClass">"#scopeName#.#ar[i]#"</span></td>';
					_html = _html & '<td valign="top" align="left" title="Debug: div_fetchDebug_#scopeName#.#ar[i]#"><div id="div_fetchDebug_#scopeName#.#ar[i]#" class="buttonClass">&nbsp;</div></td>';
				} else {
					if (IsCustomFunction(_datum)) {
						keyListCount = 'f';
						varTypeText = 'function';
					} else {
						varTypeText = 'variable';
					}
					_html = _html & '<td id="btn_fetchDebug_#scopeName#.#ar[i]#" width="20%" valign="top" align="left" style="cursor:hand; cursor:pointer;" class="buttonClass" title="Click this item to view the #scopeName#.#ar[i]# #varTypeText#  (#i#) of (#nn#)." onclick="try { this.disabled = true; this.style.backgroundColor = #sQuote##sQuote#; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseover="this.style.backgroundColor = #sQuote#silver#sQuote#; return false;" onmouseout="this.style.backgroundColor = #sQuote##sQuote#; return false;"><NOBR>[#scopeName#.#ar[i]#] (#keyListCount#)</NOBR></td>';
					_html = _html & '<td valign="top" align="left" title="Debug: div_fetchDebug_#scopeName#.#ar[i]#"><div id="div_fetchDebug_#scopeName#.#ar[i]#" class="buttonClass">&nbsp;</div></td>';
				}
				_html = _html & '</tr>';
			}
			if (areTooManyItems) {
				_html = _html & '<tr><td align="center"><table width="50%" cellpadding="-1" cellspacing="-1"><tr>';
				if (iBegin gte pageSize) {
					_html = _html & '<td id="btn_fetchDebug_#scopeName#_more_prev_1_#nn#" width="20%" valign="top" align="left" style="cursor:hand; cursor:pointer;" title="Click this item to view the (1) beginning items of #nn#." onclick="try { this.disabled = true; this.style.backgroundColor = #sQuote##sQuote#; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseover="this.style.backgroundColor = #sQuote#silver#sQuote#; return false;" onmouseout="this.style.backgroundColor = #sQuote##sQuote#; return false;"><span class="buttonClass">[|&lt;]</span></td>';
				} else {
					_html = _html & '<td>&nbsp;</td>';
				}
				if (p gt 0) {
					_html = _html & '<td id="btn_fetchDebug_#scopeName#_more_prev_#p#_#nn#" width="20%" valign="top" align="left" style="cursor:hand; cursor:pointer;" title="Click this item to view the (#p#) prev #Min(pageSize, (nn - p))# items of #nn#." onclick="try { this.disabled = true; this.style.backgroundColor = #sQuote##sQuote#; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseover="this.style.backgroundColor = #sQuote#silver#sQuote#; return false;" onmouseout="this.style.backgroundColor = #sQuote##sQuote#; return false;"><span class="buttonClass">[&lt;]</span></td>';
				} else {
					_html = _html & '<td>&nbsp;</td>';
				}
				if (n lt nn) {
					_html = _html & '<td id="btn_fetchDebug_#scopeName#_more_next_#n#_#nn#" width="20%" valign="top" align="left" style="cursor:hand; cursor:pointer;" title="Click this item to view the (#n#) next #Min(pageSize, (nn - n))# items of #nn#." onclick="try { this.disabled = true; this.style.backgroundColor = #sQuote##sQuote#; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseover="this.style.backgroundColor = #sQuote#silver#sQuote#; return false;" onmouseout="this.style.backgroundColor = #sQuote##sQuote#; return false;"><span class="buttonClass">[&gt;]</span></td>';
				} else {
					_html = _html & '<td>&nbsp;</td>';
				}
				if (iBegin lt (nn - pageSize)) {
					_html = _html & '<td id="btn_fetchDebug_#scopeName#_more_prev_#(nn - pageSize)#_#nn#" width="20%" valign="top" align="left" style="cursor:hand; cursor:pointer;" title="Click this item to view the (#(nn - pageSize)#) ending items of #nn#." onclick="try { this.disabled = true; this.style.backgroundColor = #sQuote##sQuote#; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseover="this.style.backgroundColor = #sQuote#silver#sQuote#; return false;" onmouseout="this.style.backgroundColor = #sQuote##sQuote#; return false;"><span class="buttonClass">[&gt;|]</span></td>';
				} else {
					_html = _html & '<td>&nbsp;</td>';
				}
				_html = _html & '</tr></table></td></tr>';
			}
			_html = _html & '</table>';
			return _html;
		}

		function _listToContentTable(aList, scopeName) {
			var _html = '';
			var i = -1;
			var ar = ListToArray(aList, ',');
			var n = ArrayLen(ar);
			var sQuote = "'";
			var _datum = '';
			var _value = '';
			var isSimple = false;
			var isFunction = false;
			var keyList = '';
			var keyListCount = 0;
			var varTypeText = '';
			var aStruct = StructNew();
			
			_html = _html & '<table width="100%" cellpadding="-1" cellspacing="-1">';
			for (i = 1; i lte n; i = i + 1) {
				try {
					_datum = Evaluate('#scopeName#.#ar[i]#');
					isSimple = (IsSimpleValue(_datum));
					isFunction = (IsCustomFunction(_datum));
					if (isFunction) {
						keyList = StructKeyList(_datum, ',');
						keyListCount = ListLen(keyList, ',');
						aStruct = ezProcessComplexHTMLContent(ezCfDumpByLevel(_datum, '#scopeName#.#ar[i]# (#keyListCount#)', 1, false));
					} else if (isSimple) {
						aStruct.htmlContent = '[#_datum#]';
					}
				} catch (Any e) { isSimple = false; aStruct.htmlContent = IIf((CGI.SERVER_NAME IS 'ezajax2.halsmalltalker.com'), 'ezExplainErrorWithStack(e, true)', 'ezExplainError(e, true)'); };
				_html = _html & '<tr>';
				_html = _html & '<td id="btn_fetchDebug_#scopeName#.#ar[i]#" width="20%" valign="top" align="left" style="cursor:hand; cursor:pointer;" title="Click this button to view the #scopeName#.#ar[i]# #varTypeText#." onclick="try { this.disabled = true; this.style.backgroundColor = #sQuote##sQuote#; handle_fetchDebugVariableByName(this.id); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseover="this.style.backgroundColor = #sQuote#silver#sQuote#; return false;" onmouseout="this.style.backgroundColor = #sQuote##sQuote#; return false;"><div>' & aStruct.htmlContent & '</div></td>';
				_html = _html & '<td valign="top" align="left" title="Debug: div_fetchDebug_#scopeName#.#ar[i]#"><div id="div_fetchDebug_#scopeName#.#ar[i]#" class="buttonClass">[***]</div></td>';
				_html = _html & '</tr>';
			}
			_html = _html & '</table>';
			return _html;
		}
		
		function getPageOfContentFromStruct(structName, iBegin) {
			var htmlContent = '<NOBR>';
			var _datum = -1;
			var hasStyles = false;
			var isError = false;
			try {
				_datum = Evaluate(structName);
				if (IsStruct(_datum)) {
					htmlContent = listToContentTable(StructKeyList(_datum, ','), structName, iBegin);
				} else if (IsObject(_datum)) {
					htmlContent = ezExplainError(_datum, true);
				} else if (IsCustomFunction(_datum)) {
					aStruct = ezProcessComplexHTMLContent(ezCFDump(_datum, structName, true));
					htmlContent = URLEncodedFormat(aStruct.htmlContent);
					hasStyles = true;
				} else if (IsSimpleValue(_datum)) {
					htmlContent = '<small>' & _datum & '</small>&nbsp;(S)';
				}
			} catch (Any e) {
				isError = true;
				htmlContent = ezExplainError(e, true);
			};
			return htmlContent & '</NOBR>';
		}

		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var scopesContent = '';
			var htmlContent = '';
			var _datum = -1;
			var isError = false;
			var aStruct = -1;
			var hasStyles = false;
			var _db = '';
			try {
				Application.ezAJAX_PopulateDebugScope.pendingStyles = '';
				switch (qryStruct.ezCFM) {
					case 'ezAJAX_PopulateDebugScope':
						if ( (IsDefined("qryStruct.namedArgs.scopeName")) AND (Len(qryStruct.namedArgs.scopeName) gt 0) AND (NOT IsDefined("qryStruct.namedArgs.scopeMember")) AND (NOT IsDefined("qryStruct.namedArgs.iBegin")) ) {
							qObj = QueryNew('ID, CONTENT'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							switch (qryStruct.namedArgs.scopeName) {
								case 'Application':
									try {
										htmlContent = listToContentTable(StructKeyList(Application, ','), qryStruct.namedArgs.scopeName, 1);
									} catch (Any e) { htmlContent = IIf((CGI.SERVER_NAME IS 'ezajax2.halsmalltalker.com'), 'ezExplainErrorWithStack(e, true)', 'ezExplainError(e, true)'); };
								break;

								case 'Session':
									try {
										htmlContent = listToContentTable(StructKeyList(Session, ','), qryStruct.namedArgs.scopeName, 1);
									} catch (Any e) { htmlContent = IIf((CGI.SERVER_NAME IS 'ezajax2.halsmalltalker.com'), 'ezExplainErrorWithStack(e, true)', 'ezExplainError(e, true)'); };
								break;

								case 'CGI':
									try {
										htmlContent = listToContentTable(StructKeyList(CGI, ','), qryStruct.namedArgs.scopeName, 1);
									} catch (Any e) { htmlContent = IIf((CGI.SERVER_NAME IS 'ezajax2.halsmalltalker.com'), 'ezExplainErrorWithStack(e, true)', 'ezExplainError(e, true)'); };
								break;

								case 'Request':
									try {
										htmlContent = listToContentTable(StructKeyList(Request, ','), qryStruct.namedArgs.scopeName, 1);
									} catch (Any e) { htmlContent = IIf((CGI.SERVER_NAME IS 'ezajax2.halsmalltalker.com'), 'ezExplainErrorWithStack(e, true)', 'ezExplainError(e, true)'); };
								break;
							}
							if (NOT IsDefined("htmlContent")) {
								htmlContent = 'Variable htmlContent is undefined [#qryStruct.namedArgs.scopeName#] !';
							}
							QuerySetCell(qObj, 'CONTENT', htmlContent, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else if ( (IsDefined("qryStruct.namedArgs.scopeName")) AND (Len(qryStruct.namedArgs.scopeName) gt 0) AND (IsDefined("qryStruct.namedArgs.scopeMember")) AND (Len(qryStruct.namedArgs.scopeMember) gt 0) ) {
							htmlContent = getPageOfContentFromStruct(qryStruct.namedArgs.scopeMember, 1);
							qObj = QueryNew('ID, CONTENT, HASSTYLES'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'CONTENT', URLEncodedFormat(htmlContent), qObj.recordCount); //  & '<br>' & _db
							QuerySetCell(qObj, 'HASSTYLES', (hasStyles eq true), qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else if ( (IsDefined("qryStruct.namedArgs.scopeName")) AND (Len(qryStruct.namedArgs.scopeName) gt 0) AND (IsDefined("qryStruct.namedArgs.iBegin")) AND (Len(qryStruct.namedArgs.iBegin) gt 0) ) {
							hasStyles = false;
							htmlContent = getPageOfContentFromStruct(qryStruct.namedArgs.scopeName, qryStruct.namedArgs.iBegin);
							qObj = QueryNew('ID, CONTENT, HASSTYLES'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'CONTENT', URLEncodedFormat(htmlContent), qObj.recordCount);
							QuerySetCell(qObj, 'HASSTYLES', (hasStyles eq true), qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.scopeName")) {
								errorDetails = ListAppend(errorDetails, 'scopeName', ',');
							}
							if (NOT IsDefined("qryStruct.namedArgs.scopeMember")) {
								errorDetails = ListAppend(errorDetails, 'scopeMember', ',');
							}
							if (NOT IsDefined("qryStruct.namedArgs.iBegin")) {
								errorDetails = ListAppend(errorDetails, 'iBegin', ',');
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
