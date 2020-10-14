<cfcomponent displayname="performPopulateClickMenuTab" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var _content = '';
			var scopesContent = '';
			try {
				switch (qryStruct.ezCFM) {
					case 'performPopulateClickMenuTab':
						if ( (IsDefined("qryStruct.namedArgs.iTab")) AND (Len(qryStruct.namedArgs.iTab) gt 0) ) {
							qObj = QueryNew('ID, content'); // You may add Query Elements to this Query as needed...
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qryStruct.namedArgs.iTab, qObj.recordCount);
							_content = '+';
							switch (qryStruct.namedArgs.iTab) {
								case 2:
									_content = '<iframe id="iframe_siteMenuUsingDojo2a" width="870" height="20" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=info&plain=1"></iframe>'; // <br><iframe id="iframe_siteMenuUsingDojo2b" width="870" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=info&dojo=1"></iframe>
								break;

								case 3:
									_content = '<iframe id="iframe_siteMenuUsingDojo3a" width="870" height="20" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=json&plain=1"></iframe>'; // <br><iframe id="iframe_siteMenuUsingDojo3b" width="870" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=json&dojo=1"></iframe>
								break;

								case 4:
									_content = '<iframe id="iframe_siteMenuUsingDojo4a" width="870" height="20" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=web20&plain=1"></iframe>'; // <br><iframe id="iframe_siteMenuUsingDojo4b" width="870" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=web20&dojo=1"></iframe>
								break;

								case 5:
									_content = '<iframe id="iframe_siteMenuUsingDojo5a" width="870" height="20" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=install&plain=1"></iframe>'; // <br><iframe id="iframe_siteMenuUsingDojo5b" width="870" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=install&dojo=1"></iframe>
								break;

								case 6:
									_content = '<iframe id="iframe_siteMenuUsingDojo6a" width="870" height="20" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=samples&plain=1"></iframe>'; // <br><iframe id="iframe_siteMenuUsingDojo6b" width="870" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=samples&dojo=1"></iframe>
								break;

								case 7:
									_content = '<iframe id="iframe_siteMenuUsingDojo7a" width="870" height="20" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=downloads&plain=1"></iframe>'; // <br><iframe id="iframe_siteMenuUsingDojo7b" width="870" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=downloads&dojo=1"></iframe>
								break;

								case 8:
									_content = '<iframe id="iframe_siteMenuUsingDojo8a" width="870" height="20" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=licenses&plain=1"></iframe>'; // <br><iframe id="iframe_siteMenuUsingDojo8b" width="870" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=licenses&dojo=1"></iframe>
								break;

								case 9:
									_content = '<iframe id="iframe_siteMenuUsingDojo9a" width="870" height="20" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=support&plain=1"></iframe>'; // <br><iframe id="iframe_siteMenuUsingDojo9b" width="870" frameborder="0" scrolling="No" src="app/siteMenu.cfm?mode=support&dojo=1"></iframe>
								break;
							}
							QuerySetCell(qObj, 'content', URLEncodedFormat(_content), qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.iTab")) {
								errorDetails = errorDetails & 'iTab';
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
