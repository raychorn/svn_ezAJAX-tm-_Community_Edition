<cfcomponent displayname="userDefinedAJAXFunctions" output="No" extends="ezAjaxCode">

	<cfscript>
		cf_trademarkSymbol = '&##8482';
	</cfscript>

	<cfscript>
		function userDefinedAJAXFunctions(qryStruct) {
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
