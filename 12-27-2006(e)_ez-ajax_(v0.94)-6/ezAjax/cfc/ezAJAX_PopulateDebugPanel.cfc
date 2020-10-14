<cfcomponent displayname="ezAJAX_PopulateDebugPanel" output="No" extends="userDefinedAJAXFunctions">
	<cffunction name="contentDebugPanel" access="private" output="No" returntype="string">
		<cfargument name="ezAJAX_webRoot" type="string" required="Yes">
		<cfargument name="bool_useGeonosis" type="string" default="false">

		<cfset var content_application_debug_panel = "">
		<cfset var contentDebugPanel = "">

		<cfsavecontent variable="content_application_debug_panel">
			<cfoutput>
				#ezScopesDebugPanelButtons()#
			</cfoutput>
		</cfsavecontent>		

		<cfsavecontent variable="_contentDebugPanel">
			<cfoutput>
				<table width="1000" border="0" cellpadding="-1" cellspacing="-1">
					<tr>
						<td align="left" valign="top">
							<div id="div_debugOuterContainer">
								<table width="100%" cellpadding="-1" cellspacing="-1">
									<tr>
										<td align="left" valign="top">
											<div id="div_debugContainer" style="display: none;">
												<NOBR>&nbsp;<a href="" title="Click this button to open the ezAJAX(tm) Debug Panel" onclick="handleEzAJAXDebugButtonClick(oAJAXEngine); return false;"><span class="onholdStatusBoldClass">ezAJAX:</span>&nbsp;
												<img id="btn_helperPanel" src="#ezAJAX_webRoot#/images/next.gif" border="0"></a>
												&nbsp;</NOBR>
											</div>
										</td>
										<td align="left" valign="top">
											<div id="div_scopesContainer" style="display: none;">
												<NOBR>&nbsp;<a href="" title="Click this button to open the Scopes Debug Panel" onclick="handle_ajaxHelper2_onClick(); return false;"><span class="onholdStatusBoldClass">Scopes</span>&nbsp;
												<img id="btn_helperPanel2" src="#ezAJAX_webRoot#/images/next.gif" border="0"></a></NOBR>
											</div>
										</td>
										<cfif (bool_useGeonosis)>
											<td align="left" valign="top">
												<div id="div_objectsContainer" style="display: none;">
													<NOBR>&nbsp;<a href="" title="Click this button to open the Objects Browser Panel" onclick="oAJAXEngine.doAJAX('performGetGeonosisClasses', 'handle_ezAJAXCallBack'); return false;"><span class="onholdStatusBoldClass">[Objects]</span>&nbsp;
													<img id="btn_objectsPanel" src="#ezAJAX_webRoot#/images/database.gif" align="top" border="0"></a></NOBR>
												</div>
											</td>
										</cfif>
										<td valign="top">
											<div id="div_browserContainer"></div>
										</td>
										<td valign="top">
											<div id="div_extraContainer"></div>
										</td>
										<td valign="top">
											<div id="div_contentHome" style="position: absolute; top: 50px; left: 0px; width: 990px;">
											</div>
										</td>
										<td width="100%" valign="top" style="height: -20px;">
											<div id="td_ajaxHelperPanel" style="display: none;">
												<table width="100%" <cfif (ezIsBrowserIE())>height="10"<cfelse>height="0"</cfif> bgcolor="##80FFFF" cellpadding="1" cellspacing="1">
													<tr>
														<td width="20%" align="center">
															<button name="btn_useDebugMode" id="btn_useDebugMode" class="buttonMenuClass<cfif (ezIsBrowserFF() OR ezIsBrowserNS())>FF</cfif>" onclick="var s = ezButtonLabelByObj(this); if (s.toUpperCase().indexOf('DEBUG') != -1) { oAJAXEngine.setReleaseMode(); ezLabelButtonByObj(this, labelDebug2ReleaseButton); } else { oAJAXEngine.setDebugMode(); ezLabelButtonByObj(this, labelRelease2DebugButton); }; return false;">[Debug Mode]</button>
														</td>
														<td width="20%" align="center">
															<button name="btn_useXmlHttpRequest" id="btn_useXmlHttpRequest" class="buttonMenuClass<cfif (ezIsBrowserFF() OR ezIsBrowserNS())>FF</cfif>" onclick="handleEzAJAXUseXmlHttpRequestButtonClick(this, oAJAXEngine); return false;">[Use iFrame]</button>
														</td>
														<td width="20%" align="center">
															<button name="btn_useMethodGetOrPost" id="btn_useMethodGetOrPost" class="buttonMenuClass<cfif (ezIsBrowserFF() OR ezIsBrowserNS())>FF</cfif>" onclick="var s = ezButtonLabelByObj(this); if (s.toUpperCase().indexOf('GET') != -1) { oAJAXEngine.setMethodGet(); ezLabelButtonByObj(this, labelGet2PostButton); } else { oAJAXEngine.setMethodPost(); ezLabelButtonByObj(this, labelPost2GetButton); }; return false;">[Use Get]</button>
														</td>
														<td width="20%" align="center">
															<button name="btn_hideShow_iFrame" id="btn_hideShow_iFrame" class="buttonMenuClass<cfif (ezIsBrowserFF() OR ezIsBrowserNS())>FF</cfif>" onclick="var s = ezButtonLabelByObj(this); if (s.toUpperCase().indexOf('SHOW') != -1) { oAJAXEngine.showFrame(); ezLabelButtonByObj(this, labelShow2HideButton); } else { oAJAXEngine.hideFrame(); ezLabelButtonByObj(this, labelHide2ShowButton); }; return false;">[Show iFrame]</button>
														</td>
														<td width="20%" align="center">
															<input type="checkbox" id="cb_debugPanel_toggle_AJAX_echo" onclick="global_echo_AJAX_commands = ((global_echo_AJAX_commands) ? false : true); return true;">&nbsp;<a href="" onclick="ezSimulateCheckBoxClick('cb_debugPanel_toggle_AJAX_echo'); return false;"><span class="textClass"><NOBR>Echo Commands</NOBR></span></a>
														</td>
													</tr>
												</table>
											</div>
											<div id="td_ajaxHelperPanel2" style="display: none;">#content_application_debug_panel#</div>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn _contentDebugPanel>
	</cffunction>

	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var errMsg = '';
			var scopesContent = '';
			try {
				switch (qryStruct.ezCFM) {
					case 'ezAJAX_PopulateDebugPanel':
						if ( (IsDefined("qryStruct.ezWebRoot")) AND (Len(qryStruct.ezWebRoot) gt 0) ) { 
							qObj = QueryNew('id, content');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'content', contentDebugPanel(qryStruct.ezWebRoot), qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.ezWebRoot")) {
								errorDetails = errorDetails & 'ezWebRoot';
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
