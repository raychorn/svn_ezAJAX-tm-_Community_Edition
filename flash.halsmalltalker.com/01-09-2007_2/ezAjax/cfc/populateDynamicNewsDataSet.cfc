<cfcomponent displayname="populateDynamicNewsDataSet" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var scopesContent = '';
			try {
				switch (qryStruct.ezCFM) {
					case 'populateDynamicNewsDataSet':
						if ( (IsDefined("qryStruct.namedArgs.method")) AND (Len(qryStruct.namedArgs.method) gt 0) ) {
							fName = '';
							sErrorFlag = '';
							sErrorMsg = '';
							switch (qryStruct.namedArgs.method) {
								case 1:
									Session.dynamicNews = StructNew();
									Session.dynamicNews.qObj = QueryNew('ID, cat, subcat, url');;
									QueryAddRow(Session.dynamicNews.qObj, 1);
									QuerySetCell(Session.dynamicNews.qObj, 'ID', Session.dynamicNews.qObj.recordCount, Session.dynamicNews.qObj.recordCount);
									QuerySetCell(Session.dynamicNews.qObj, 'cat', '#DateFormat(NOW(), "mmm")#-#DateFormat(NOW(), "yyyy")#@Cat-1', Session.dynamicNews.qObj.recordCount);
									QuerySetCell(Session.dynamicNews.qObj, 'subcat', 'SubCat-1', Session.dynamicNews.qObj.recordCount);
									QuerySetCell(Session.dynamicNews.qObj, 'url', 'http:' & '/' & '/' & CGI.SERVER_NAME & '/app/flash/news-flash-headlines2/url1.html', Session.dynamicNews.qObj.recordCount);
									_wddx = ezCFML2WDDX(Session.dynamicNews.qObj);
									fName = ExpandPath('..\app\flash\news-flash-headlines2\dynamicNews.wddx');
									ezCfFileWrite(fName, _wddx);
									sErrorFlag = Request.fileError;
									sErrorMsg = Request.errorMsg;
									break;
							}
							qObj = QueryNew('ID, STATUS'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'STATUS', 'Dataset has been created in "#fName# [#sErrorFlag#/#sErrorMsg#]".', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.method")) {
								errorDetails = errorDetails & 'method';
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
