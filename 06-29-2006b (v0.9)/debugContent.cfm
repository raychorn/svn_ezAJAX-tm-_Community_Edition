<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">

	<cfoutput>
		
<cfif (1)>
		<div id="#Request.cf_div_floating_debug_menu#" style="display: inline; height: 20px; background-color: ##80FFFF; border: thin solid Black;">
			<table width="*" border="0" cellpadding="-1" cellspacing="-1" style="margin-left: 5px; margin-right: 5px;">
				<tr>
					<td align="left" valign="top">
						<table width="100%" cellpadding="-1" cellspacing="-1">
							<tr>
	<cfif (Request.commonCode.isServerLocal()) OR (Request.cf_isDebugMode)>
								<td align="left">
									<span class="onholdStatusBoldClass">AJAX:</span>&nbsp;<button name="btn_helperPanel" id="btn_helperPanel" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" title="Click this button to open the ezAJAX(tm) Debug Panel" onclick="var cObj = $('td_ajaxHelperPanel'); var bObj = $('btn_helperPanel'); var tbObj = $('table_ajaxHelperPanel'); if ( (!!cObj) && (!!bObj) && (!!tbObj) ) { cObj.style.display = ((cObj.style.display == const_none_style) ? const_inline_style : const_none_style); labelButtonByObj(bObj, ((cObj.style.display == const_inline_style) ? '[<<]' : '[>>]')); if (cObj.style.display == const_inline_style) { tbObj.style.width = _global_clientWidth; repositionBasedOnFloatingDebugPanel(tbObj); oAJAXEngine.setDebugMode(); } else { oAJAXEngine.setReleaseMode(); }; }; return false;">[>>]</button>&nbsp;
								</td>
								<td align="left">
									<span class="onholdStatusBoldClass">Scopes:</span>&nbsp;<button name="btn_helperPanel2" id="btn_helperPanel2" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" title="Click this button to open the Scopes Debug Panel" onclick="handle_ajaxHelper2_onClick(); return false;">[>>]</button>  <!--- var oO = _$(const_div_floating_debug_menu); if (!!oO) { _alert(oO.innerHTML); }; --->
								</td>
	</cfif>
		<cfif (Request.commonCode.isServerLocal())>
									<td>
										<NOBR>
										&nbsp;|&nbsp;
										<span class="normalx9TextClass">isIE = [#Request.commonCode.isBrowserIE()#]</span>
										&nbsp;|&nbsp;
										<span class="normalx9TextClass">isFF = [#Request.commonCode.isBrowserFF()#]</span>
										&nbsp;|&nbsp;
										<span class="normalx9TextClass">isNS = [#Request.commonCode.isBrowserNS()#]</span>
										&nbsp;|&nbsp;
										<span class="normalx9TextClass">isOP = [#Request.commonCode.isBrowserOP()#]</span>
										</NOBR>
									</td>
		</cfif>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		
		<table width="100%" cellpadding="-1" cellspacing="-1">
			<tr>
				<td align="center" id="td_ajaxHelperPanel" style="display: none;">
					<table width="100%" bgcolor="##80FFFF" border="1" bordercolor="silver" cellspacing="-1" cellpadding="-1" id="table_ajaxHelperPanel" style="width: 800px;">
						<tr>
							<td>
								<table width="100%" cellpadding="-1" cellspacing="-1">
									<tr>
										<td width="16%" align="center">
											<button name="btn_useDebugMode" id="btn_useDebugMode" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="var s = getButtonLabelByObj(this); if (s.toUpperCase().indexOf('DEBUG') != -1) { oAJAXEngine.setReleaseMode(); labelButtonByObj(this, labelDebug2ReleaseButton); } else { oAJAXEngine.setDebugMode(); labelButtonByObj(this, labelRelease2DebugButton); }; return false;">[Debug Mode]</button>
										</td>
										<td width="17%" align="center">
											<button name="btn_useXmlHttpRequest" id="btn_useXmlHttpRequest" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="var s = getButtonLabelByObj(this); var bObj = _$('btn_hideShow_iFrame'); if (s.toUpperCase().indexOf('XMLHTTPREQUEST') == -1) { oAJAXEngine.isXmlHttpPreferred = false; labelButtonByObj(this, labelIFrame2XmlHttpRequestButton); } else { oAJAXEngine.isXmlHttpPreferred = true; labelButtonByObj(this, labelXmlHttpRequest2IFrameButton); }; if (!!bObj) { bObj.style.display = ((oAJAXEngine.isXmlHttpPreferred) ? const_none_style : const_inline_style); } return false;">[Use iFrame]</button>
										</td>
										<td width="16%" align="center">
											<button name="btn_useMethodGetOrPost" id="btn_useMethodGetOrPost" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="var s = getButtonLabelByObj(this); if (s.toUpperCase().indexOf('GET') != -1) { oAJAXEngine.setMethodGet(); labelButtonByObj(this, labelGet2PostButton); } else { oAJAXEngine.setMethodPost(); labelButtonByObj(this, labelPost2GetButton); }; return false;">[Use Get]</button>
										</td>
										<td width="17%" align="center">
											<button name="btn_hideShow_iFrame" id="btn_hideShow_iFrame" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="var s = getButtonLabelByObj(this); if (s.toUpperCase().indexOf('SHOW') != -1) { oAJAXEngine.showFrame(); labelButtonByObj(this, labelShow2HideButton); } else { oAJAXEngine.hideFrame(); labelButtonByObj(this, labelHide2ShowButton); }; return false;">[Show iFrame]</button>
										</td>
										<td width="17%" align="center">
											<input type="checkbox" id="cb_debugPanel_toggle_AJAX_echo" onclick="global_echo_AJAX_commands = ((global_echo_AJAX_commands) ? false : true); return true;">&nbsp;<a href="" onclick="simulateCheckBoxClick('cb_debugPanel_toggle_AJAX_echo'); return false;"><span class="textClass"><NOBR>Echo ezAJAX&##8482 Commands</NOBR></span></a>
										</td>
										<td width="17%" align="center">
											<button name="btn_1" id="btn_1" class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="doAJAX_func('getTopLevelMenuNames'); return false;">[Test]</button>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		
	<cfif (Request.commonCode.isServerLocal())>
		<cfsavecontent variable="content_application_debug_panel">
			<cfoutput>
				#Request.commonCode.scopesDebugPanelContentLayout()#
			</cfoutput>
		</cfsavecontent>		
		
		<table id="table_ajaxHelperPanel2" style="width: 800px;" cellpadding="-1" cellspacing="-1">
			<tr>
				<td id="td_ajaxHelperPanel2" align="center" style="display: none;">
					<table border="1" cellspacing="-1" cellpadding="-1">
						<tr>
							<td align="center">
								#content_application_debug_panel#
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</cfif>
</cfif>
</cfoutput>

