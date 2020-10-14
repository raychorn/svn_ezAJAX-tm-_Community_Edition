<cfsetting showdebugoutput="No" enablecfoutputonly="Yes" requesttimeout="120">
<!--- BEGIN: This block of code sets-up the Request.qryObj which is a ColdFusion Query Object that holds the parms from the ezAJAX(tm) call --->
<!--- Request.qryStruct also contains the variables that were passed-in from the caller... --->
<cfparam name="_AUTH_USER" type="string" default="">

<cfset bool_using_xmlHttpRequest_viaGET = (isDefined("CGI.QUERY_STRING") AND (FindNoCase("&cfajax=1", URLDecode(CGI.QUERY_STRING)) gt 0))>
<cfset bool_using_xmlHttpRequest_viaPOST = (isDefined("form.QUERY_STRING") AND (FindNoCase("&cfajax=1", URLDecode(form.QUERY_STRING)) gt 0))>
<cfset bool_using_xmlHttpRequest = (bool_using_xmlHttpRequest_viaGET) OR (bool_using_xmlHttpRequest_viaPOST)>

<cfinclude template="ezAJAX_Init.cfm">

<cfscript>
	Request.qryObj = Request.commonCode.initQryObj("name, val");
	Request.qryStruct = StructNew();
</cfscript>

<cfscript>
	cf_trademarkSymbol = '&##8482';
	if (IsDefined("Request.commonCode")) {
		Request.commonCode.init('exAJAX#cf_trademarkSymbol# Community Edition Framework', Now());
	}
</cfscript>

<cfif (bool_using_xmlHttpRequest)>
	<cfscript>
		_CGI_QUERY_STRING = '';
		if (IsDefined("CGI.QUERY_STRING")) {
			_CGI_QUERY_STRING = CGI.QUERY_STRING;
		}
		_form_QUERY_STRING = '';
		if (IsDefined("form.QUERY_STRING")) {
			_form_QUERY_STRING = form.QUERY_STRING;
		}

		_QUERY_STRING = '';
		if (bool_using_xmlHttpRequest_viaGET) {
			_QUERY_STRING = '#_CGI_QUERY_STRING#';
		} else if (bool_using_xmlHttpRequest_viaPOST) {
			_QUERY_STRING = '#_form_QUERY_STRING#';
		}
	</cfscript>
<cfelse>
	<cfoutput>
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
		
		<html>
		<head>
			<cfoutput>
				#Request.commonCode.ezBrowserNoCache()#
			</cfoutput>
			<cfscript>
				if (bool_canDebugHappen) {
					_prefix = '.';
					if (FileExists(ExpandPath('..\StyleSheet.css'))) {
						_prefix = '../';
					} else if (FileExists(ExpandPath('StyleSheet.css'))) {
						_prefix = '';
					}
					if (_prefix neq '.') {
						writeOutput('<LINK rel="STYLESHEET" type="text/css" href="#_prefix#StyleSheet.css"> ');
					}
				}
			</cfscript>
		</head>
		<body>
	</cfoutput>
	
	<cfoutput>
		<cfif (bool_canDebugHappen)>
			<table width="100%" cellpadding="-1" cellspacing="-1">
				<tr>
					<td>
						<table width="100%" cellpadding="-1" cellspacing="-1">
							<tr>
								<td>
									<cfdump var="#Application#" label="App Scope" expand="No">
								</td>
								<td>
									<cfdump var="#Session#" label="Session Scope" expand="No">
								</td>
								<td>
									<cfdump var="#URL#" label="URL Scope" expand="No">
								</td>
								<td>
									<cfdump var="#FORM#" label="FORM Scope" expand="No">
								</td>
								<td>
									<cfdump var="#CGI#" label="CGI Scope" expand="No">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<small>
						BEGIN: #Request.commonCode.blue_formattedModuleName('A. cfinclude_AJAX_Begin.cfm')#<br>
						(isDefined("url.data")) = [#(isDefined("url.data"))#]<br>
						(isDefined("form.packet")) = [#(isDefined("form.packet"))#]<br>
						(isDefined("url.wddx")) = [#(isDefined("url.wddx"))#]<br>
						(isDefined("form.wddx")) = [#(isDefined("form.wddx"))#]<br>
						(isDefined("CGI.QUERY_STRING")) = [#(isDefined("CGI.QUERY_STRING"))#]<br>
						</small>
					</td>
				</tr>
			</table>
		</cfif>

		<!--- BEGIN: Determine the data source from all available sources of data and route to _QUERY_STRING --->
		<cfscript>
			_QUERY_STRING = '';
			if (isDefined("url.data")) {
				if (Len(url.data) gt 0) {
					_QUERY_STRING = TRIM(url.data);
				}
			} else if (isDefined("form.packet")) {
				if (Len(form.packet) gt 0) {
					_QUERY_STRING = TRIM(form.packet);
				}
			} else if (isDefined("CGI.QUERY_STRING")) {
				if (Len(CGI.QUERY_STRING) gt 0) {
					_QUERY_STRING = TRIM(CGI.QUERY_STRING);
				}
			}
		</cfscript>
		<!--- END! Determine the data source from all available sources of data and route to _QUERY_STRING --->
		
		<cfif (Len(_QUERY_STRING) gt 0)>
			<cfif (bool_canDebugHappen)>
				_QUERY_STRING = [#_QUERY_STRING#]<br>
			</cfif>
			<cfloop index="_item" list="#_QUERY_STRING#" delimiters="&">
				<cfif (bool_canDebugHappen)>
					_item = [#_item#]
				</cfif>
				<cfif (ListLen(_item, "=") eq 2)>
					<cfif (bool_canDebugHappen)>
						&nbsp;[#Request.commonCode.ezGetToken(_item, 1, "=")#]&nbsp;[#Request.commonCode.ezGetToken(_item, 2, "=")#]<br>
					</cfif>
					<cfif (LCase(Request.commonCode.ezGetToken(_item, 1, "=")) eq LCase("wddx"))>
						<cfif (bool_canDebugHappen)>
							0. Exec WDDX2CFML<br>
							[#Request.commonCode.ezGetToken(_item, 2, "=")#]<br>
						</cfif>
						<cfset input_item = URLDecode(Request.commonCode.ezGetToken(_item, 2, "="))>
						<cfif (bool_canDebugHappen)>
							input_item = [#input_item#]<br>
						</cfif>
						<cfwddx action="WDDX2CFML" input="#input_item#" output="_CMD_">
	
						<cfif (IsDefined("_CMD_"))>
							<cfif (bool_canDebugHappen)>
								<cfif (IsQuery(_CMD_))>
									<cfdump var="#_CMD_#" label="_CMD_" expand="No">
								<cfelse>
									_CMD_ = [#_CMD_#]<br>
								</cfif>
							</cfif>
						</cfif>
					<cfelse>
						<cfparam name="_CMD_" type="string" default="">
						<cfset _CMD_ = ListAppend(_CMD_, _item, "&")>
					</cfif>
				</cfif>
				<cfif (bool_canDebugHappen)>
					<br>
				</cfif>
			</cfloop>
		</cfif>
		<cfif (bool_canDebugHappen)>
			<cfif (isDefined("url.wddx"))>
				url.wddx = [#url.wddx#] [#URLDecode(url.wddx)#]<br>
			<cfelseif (isDefined("form.wddx"))>
				form.wddx = [#URLDecode(form.wddx)#]<br>
			</cfif>
			END! #Request.commonCode.blue_formattedModuleName('A. cfinclude_AJAX_Begin.cfm')#<br>
		</cfif>
	</cfoutput>
	
	<cfif (isDefined("url.wddx"))>
		<cfif (bool_canDebugHappen)>
			<cfoutput>
				A. Exec WDDX2CFML<br>
			</cfoutput>
		</cfif>
	
		<cfwddx action="WDDX2CFML" input="#url.wddx#" output="_CMD_">
	<cfelseif (isDefined("form.wddx"))>
		<cfif (bool_canDebugHappen)>
			<cfoutput>
				B. Exec WDDX2CFML<br>
			</cfoutput>
		</cfif>
	
		<cfwddx action="WDDX2CFML" input="#form.wddx#" output="_CMD_">
	</cfif>

	<cfset Request._CMD_ = _CMD_>
	
	<cfif (bool_canDebugHappen)>
		<cfoutput>
			BEGIN: #Request.commonCode.blue_formattedModuleName('B. cfinclude_AJAX_Begin.cfm')#<br>
			(IsDefined("Request._CMD_") = [#IsDefined("Request._CMD_")#]<br>
			<cfif (IsDefined("Request._CMD_"))>
				(IsQuery(Request._CMD_)) = [#(IsQuery(Request._CMD_))#]<br>
				<cfif (IsQuery(Request._CMD_))>
					#Request.primitiveCode.debugQueryInTable(Request._CMD_, "Request._CMD_")#
				<cfelse>
					Request._CMD_ = [#Request._CMD_#]<br>
				</cfif>
			</cfif>
			END! #Request.commonCode.blue_formattedModuleName('B. cfinclude_AJAX_Begin.cfm')#<br>
		</cfoutput>
	</cfif>

	<cfscript>
		_QUERY_STRING = Request._CMD_;
	</cfscript>
</cfif>

<cfscript>
	aa = ListToArray(_QUERY_STRING, '&');
	aaN = ArrayLen(aa);
	for (i = 1; i lte aaN; i = i + 1) {
		QueryAddRow(Request.qryObj, 1);
		aaP = ListToArray(URLDecode(aa[i]), '=');
		try {
			QuerySetCell(Request.qryObj, 'NAME', aaP[1], Request.qryObj.recordCount);
			QuerySetCell(Request.qryObj, 'VAL', aaP[2], Request.qryObj.recordCount);
			Request.qryStruct[aaP[1]] = aaP[2];
		} catch (Any e) {
		}
	}
</cfscript>
<!--- END! This block of code sets-up the Request.qryObj which is a ColdFusion Query Object that holds the parms from the ezAJAX(tm) call --->

<cfscript>
	cf_trademarkSymbol = '&##8482';
</cfscript>

<!--- This is where you may code your ColdFusion code that processes the ezAJAX(tm) Function --->
<cfif (IsDefined("Request.qryStruct.ezCFM"))>
	<cfscript>
		bool_onChangeSubMenu = false;
		Request.qryStruct.namedArgs = StructNew();
		if (IsDefined("Request.qryStruct.argCnt")) {
			try {
				for (i = 1; i lte Request.qryStruct.argCnt; i = i + 2) {
					argName = URLDecode(Request.qryStruct['arg' & i]);
					argVal = URLDecode(Request.qryStruct['arg' & (i + 1)]);
					Request.qryStruct.namedArgs[argName] = argVal;
				}
			} catch(Any e) {
			}
		}

		bool_RuntimeLicenseStatus = false;
		RuntimeLicenseStatus = 'Invalid parameters passed to ezAJAX Server - ezAJAX will not function when invalid parms are being used.';

		if ( (IsDefined("Request.qryStruct.ezCFM")) AND (Len(Request.qryStruct.ezCFM) gt 0) AND (IsDefined("Request.qryStruct.ezReferer")) AND (Len(Request.qryStruct.ezReferer) gt 0) AND (IsDefined("Request.qryStruct.ezAUTHUSER")) AND (IsDefined("Request.qryStruct.ezCallBack")) AND (Len(Request.qryStruct.ezCallBack) gt 0) AND (IsDefined("Request.qryStruct.ezTime")) AND (IsDate(Request.qryStruct.ezTime)) ) {
			aRuntimeLicenseStruct = Request.commonCode.readRuntimeLicenseFile(Request.commonCode.productName, Request.qryStruct.ezTime);
	//		writeOutput(Request.commonCode.ezCfDump(aRuntimeLicenseStruct, 'A. (#CGI.SCRIPT_NAME#) aRuntimeLicenseStruct', false));
	//		writeOutput(Request.commonCode.ezCfDump(Request.qryStruct, 'Request.qryStruct', false));
	//		aRuntimeLicenseStruct = Request.commonCode._aRuntimeLicenseStruct();
			try {
				RuntimeLicenseStatus = aRuntimeLicenseStruct.RuntimeLicenseStatus;
				bool_RuntimeLicenseStatus = (Len(aRuntimeLicenseStruct.RuntimeLicenseStatus) eq 0);
			} catch (Any e) {
				RuntimeLicenseStatus = 'ERROR: Undefined Runtime License.';
				bool_RuntimeLicenseStatus = false;
			}
		}

		if (bool_RuntimeLicenseStatus) {
			if ( (IsDefined("Request.qryStruct.ezReferer")) AND (FindNoCase(CGI.SERVER_NAME, Request.qryStruct.ezReferer) gt 0) ) {
				if ( (IsDefined("Request.qryStruct.ezSessid")) AND (IsValid('UUID', Request.qryStruct.ezSessid)) ) {
					switch (Request.qryStruct.ezCFM) {
						case 'validateAJAXRuntimeLicense':
							qObj = QueryNew('id, validateAJAXRuntimeLicense');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'validateAJAXRuntimeLicense', true, qObj.recordCount);
							Request.commonCode.ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
						break;
						
						default:
							Request.commonCode.userDefinedAJAXFunctions(Request.qryStruct);
							if ( (NOT IsDefined("Request.qryData")) OR (NOT IsArray(Request.qryData)) OR (ArrayLen(Request.qryData) eq 0) ) {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', 'ezAJAXEngine Server Error - No Server Command implementor was detected or the Server Command implementor did not return a Query Object.&nbsp;&nbsp;Double-check the userDefinedAJAXFunctions.cfc file to ensure you have implmented the command (#Request.qryStruct.ezCFM#) and make sure it returns a Query Object.', qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
								QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', false, qObj.recordCount);
								Request.commonCode.ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						break;
					}
				} else {
					qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
					QueryAddRow(qObj, 1);
					QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
					QuerySetCell(qObj, 'errorMsg', '<br><br><br><h5 style="color: red">201. Use of this ezAJAX(tm) Server is strictly limited to those who have valid User Accounts for this site.</h5>', qObj.recordCount);
					QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
					QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
					QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
					QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
					Request.commonCode.ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
				}
			} else {
				qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				errorReason = '';
				if (NOT IsDefined("Request.qryStruct.ezReferer")) {
					errorReason = 'Missing the referer from the ezAJAX(tm) parameters.';
				} else if (FindNoCase(CGI.SERVER_NAME, Request.qryStruct.ezReferer) gt 0) {
					errorReason = 'Use of this ezAJAX(tm) Server is limited to the #CGI.SERVER_NAME# domain.';
				}
				QuerySetCell(qObj, 'errorMsg', '<br><br><br><h5 style="color: red">' & errorReason & '</h5>', qObj.recordCount);
				QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
				QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
				QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
				QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
				Request.commonCode.ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		} else {
			qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation, isHTML');
			QueryAddRow(qObj, 1);
			QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
			QuerySetCell(qObj, 'errorMsg', 'RuntimeLicenseStatus is "#RuntimeLicenseStatus#".', qObj.recordCount);
			QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
			QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
			QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
			QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
			Request.commonCode.ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
		}
	</cfscript>
<cfelse>
	<cfoutput>
		bool_canDebugHappen = [#bool_canDebugHappen#]<br>
		<cfdump var="#URL#" label="URL Scope" expand="No">
		<cfdump var="#FORM#" label="FORM Scope" expand="No">
		<cfdump var="#CGI#" label="CGI Scope" expand="No">
	</cfoutput>
</cfif>
<!--- the name of the cfm page is stored in the following variable: Request.qryObj.NAME["cfm"] --->

<!--- BEGIN: This block of code passes the Request.qryObj which is a ColdFusion Query Object back to the ezAJAX(tm) caller via a JavaScript object called qObj --->
<cfinclude template="ezAJAX_End.cfm">
<!--- END! This block of code passes the Request.qryObj which is a ColdFusion Query Object back to the ezAJAX(tm) caller via a JavaScript object called qObj --->
