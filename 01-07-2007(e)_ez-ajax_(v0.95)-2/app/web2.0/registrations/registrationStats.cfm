<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cftry>
	<cfparam name="URL.callback" type="string" default="ezAlertError">

	<cfscript>
		Request.ezAJAX_DSN = 'ezAJAX-Registrations';

		_sql_statement = "SELECT COUNT(id) AS cnt FROM RuntimeLicenses";
		Request.commonCode.ezExecSQL('Request.aQueryObj', Request.ezAJAX_DSN, _sql_statement);
		if (Request.dbError) {
			qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
			QueryAddRow(qObj, 1);
			QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
			QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
			QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
			QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
			QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
			Request.aQueryObj = qObj;
		}
	</cfscript>
	
	<cfcatch type="Any">
		<cfscript>
			Request.aQueryObj = QueryNew('id, errorMsg');
			QueryAddRow(Request.aQueryObj, 1);
			QuerySetCell(Request.aQueryObj, 'id', Request.aQueryObj.RecordCount, Request.aQueryObj.RecordCount);
			QuerySetCell(Request.aQueryObj, 'errorMsg', Request.commonCode.ezCFDump(cfcatch, 'CF Error', false), Request.aQueryObj.RecordCount);
		</cfscript>
	</cfcatch>
</cftry>

<cfsavecontent variable="jsonCode"><cfoutput><cfif (Len(URL.callback) gt 0)>try { </cfif>#URL.callback#<cfif (Len(URL.callback) gt 0)>(</cfif>#Request.commonCode.ezJSONencode(Request.aQueryObj)#<cfif (Len(URL.callback) gt 0)>);</cfif><cfif (Len(URL.callback) gt 0)> } catch (e) { ezAlertError(ezErrorExplainer()); };</cfif></cfoutput></cfsavecontent>

<cfoutput>
	<CFHEADER NAME="Expires" VALUE="Mon, 06 Jan 1990 00:00:01 GMT">
	<CFHEADER NAME="Pragma" VALUE="no-cache">
	<CFHEADER NAME="cache-control" VALUE="no-cache">
	<cfcontent type="text/javascript" variable="#ToBinary(ToBase64(jsonCode))#">
</cfoutput>
