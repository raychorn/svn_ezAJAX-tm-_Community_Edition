<cfcomponent displayname="userDefinedAJAXFunctions" output="No" extends="ezAjaxCode">

	<cfscript>
		cf_trademarkSymbol = '&##8482';
	</cfscript>

	<cfscript>
		err_primitiveCode = false;
		err_primitiveCodeMsg = '';
		try {
			Request.cfcPrefix = '';
			listFirst = ListFirst(CGI.SCRIPT_NAME, '/');
			if (FindNoCase('.cfm', listFirst) eq 0) {
				Request.cfcPrefix = listFirst & '.';
			}
			Request.primitiveCode = CreateObject("component", Request.cfcPrefix & 'app.cfc.commonCode');
		} catch(Any e) {
			err_primitiveCode = false;
			err_primitiveCodeMsg = '';
			try {
				Request.cfcPrefix = '';
				Request.primitiveCode = CreateObject("component", Request.cfcPrefix & 'app.cfc.commonCode');
			} catch(Any e) {
				err_primitiveCode = true;
				err_primitiveCodeMsg = '(1) The primitive.cfc component has NOT been created.';
				err_primitiveCodeMsg = '<font color="red"><b>101. #err_primitiveCodeMsg# | Reason: [#e.message#] [#e.detail#]</b></font>';
	
				qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				QuerySetCell(qObj, 'errorMsg', err_primitiveCodeMsg, qObj.recordCount);
				QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
				QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
				QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
				QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		}

		cf_currentBlogName = 'ezajax';

		application.blog = -1;
		try {
			application._fname = expandPath("/" & Request.cfcPrefix & "app/includes/main");
			application.blog = createObject("component", Request.cfcPrefix & "app.org.camden.blog.blog").init(cf_currentBlogName);
			application.resourceBundle = createObject("component", Request.cfcPrefix & "app.org.hastings.locale.resourcebundle");
			application._fname = ReplaceNoCase(application._fname, 'includes\includes\', 'includes\');
			application.resourceBundle.loadResourceBundle(application._fname, application.blog.getProperty("locale"));
			application.localeutils = createObject("component", Request.cfcPrefix & "app.org.hastings.locale.utils");
			application.localeutils.loadLocale(application.blog.getProperty("locale"));
		} catch (Any e) {
			qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
			QueryAddRow(qObj, 1);
			QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
			QuerySetCell(qObj, 'errorMsg', '<font color="red"><b>102. Reason: [#e.message#] [#e.detail#], [application._fname=#application._fname#], [cf_currentBlogName=#cf_currentBlogName#]</b></font>', qObj.recordCount);
			QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
			QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
			QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
			QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
			ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
		}
		
		Request.invalidEmailDomains = '';
		try {
			Request.invalidEmailDomains = Request.primitiveCode.getInvalidEmailDomains();
		} catch (Any e) {
			qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
			QueryAddRow(qObj, 1);
			QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
			QuerySetCell(qObj, 'errorMsg', '<font color="red"><b>103. Reason: [#e.message#] [#e.detail#]</b></font>', qObj.recordCount);
			QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
			QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
			QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
			QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
			ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
		}

		Request.ezAJAX_DSN = 'ezAJAX-Registrations';
		Request.ezAJAX_Newsletters_DSN = 'ezAJAX-Newsletters';

		function userDefinedAJAXFunctions(qryStruct) {
			if ( (IsDefined("qryStruct.ezSessid")) AND (NOT err_primitiveCode) ) {
				Request.primitiveCode.readSessionFromDb(qryStruct.ezSessid);
			}

			bool_isServerCommandCFCError = false;
			try {
				ezWebRootPrefix = Request.qryStruct['ezWebRootPrefix'];
			} catch (Any e) {
				bool_isServerCommandCFCError = true;
			}
			
			if (NOT bool_isServerCommandCFCError) {
				try {
					cfcObj = CreateObject("component", qryStruct.ezCFM);
					cfcObj._userDefinedAJAXFunctions(qryStruct);
					bool_isServerCommandCFCError = true;
				} catch (Any e) {
					qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'errorMsg', '<font color="red"><b>Something dreadful just happened... :: Reason: "#ezExplainError(e, false)#" [#Request.cfcPrefix#]</b></font>', qObj.recordCount);
					QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
					QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
					QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
					QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
					ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				}
			}
		}
	</cfscript>
</cfcomponent>
