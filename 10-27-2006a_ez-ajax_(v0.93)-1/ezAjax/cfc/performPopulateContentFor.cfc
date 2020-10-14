<cfcomponent displayname="performPopulateContentFor" output="No" extends="userDefinedAJAXFunctions">
	<cfscript>
		_urlDojoMailSample = 'http://#CGI.SERVER_NAME#/dojo-0.3.1-ajax/demos/widget/mail.html';
		cf_urlDojoMailSample = "window.open('#_urlDojoMailSample#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";
	</cfscript>

	<cfsavecontent variable="content_101_1"> <!--- 101.1 --->
		<cfoutput>
			<div id="div_WhatsIsContentContainer" style="margin: 5px 5px 5px 5px;">
			<p align="justify" class="normalSiteContentTextClass">ezAJAX#cf_trademarkSymbol# is the EASY way to create high-powered AJAX Applications with very little effort.</p>
			<p align="justify" class="normalSiteContentTextClass">What makes ezAJAX#cf_trademarkSymbol# so EASY?</p>
			<p align="justify" class="normalSiteContentTextClass">We give you more than <a href="" onclick="populateSiteContent(102.1); return false;">10,000 lines of code</a> that is already debugged and ready to use.  Our entire Framework is one AJAX Sample App to which you make minor adjustments.  All you need to do after installing ezAJAX#cf_trademarkSymbol# is begin coding your application logic.</p>
			<p align="justify" class="normalSiteContentTextClass">When it comes time for you to sell your AJAX App to 3rd parties we can provide you with Runtime Licenses that allow you to redistribute our Framework with your application logic.  This gives you a clear advantage in the marketplace because you are able to easily produce Limited-Use Trial Apps that allow your potential customers to test-drive your applications before they make a purchase.</p>
			<p align="justify" class="normalSiteContentTextClass">Let us do <a href="" onclick="populateSiteContent(102.2); return false;">all the work for <u>you</u></a>!</p>
			<div id="div_linesOfCodeContent"></div>
			</div>
		</cfoutput>
	</cfsavecontent>
	
	<cfsavecontent variable="content_107_1"> <!--- 107.1 --->
		<cfoutput>
			<div id="div_WhatsNewContentContainer" style="margin: 5px 5px 5px 5px;">
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td>
							<h6 style="color: blue; margin-bottom: 15px;">What's New ?</h6>
							<span class="normalPrompt"><b>ezAJAX#cf_trademarkSymbol# has an expanded <a href="" onclick="try { oTabSystem1.activateTab(downloadsTab); } catch(e) { } finally { }; return false;">Programmer's Guide with a Tutorial Primer</a> that explains how to use ezAJAX#cf_trademarkSymbol# after it has been installed.</b></span>
						</td>
					</tr>
					<tr>
						<td>
							<table width="100%" cellpadding="-1" cellspacing="-1">
								<tr>
									<td width="20%">
										<a href="http://www.tucows.com/preview/504416" target="_blank"><img src="http://#CGI.SERVER_NAME#/app/images/tucows-logo-small.gif" alt="" width="130" height="40" border="0"></a>
									</td>
									<td width="*" valign="middle">
										<p align="justify" class="normalPrompt">ezAJAX#cf_trademarkSymbol# is currently being featured at <a href="http://www.tucows.com/preview/504416" target="_blank">TuCows</a>.</p>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<p align="justify" class="normalPrompt"><b><a href="" onclick="try { oTabSystem1.activateTab(downloadsTab); } catch(e) { } finally { }; return false;">ezAJAX#cf_trademarkSymbol# Version 0.92</a> is now compatible with <a href="" onclick="try { oTabSystem1.activateTab(sampleAppsTab); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a></b>&nbsp;
							You can <a href="" onclick="#cf_urlDojoMailSample#; return false;">view our Dojo Sample - the Mail Sample Application</a> as taken from <a href="" onclick="try { oTabSystem1.activateTab(sampleAppsTab); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a>.<cfif (Request.commonCode.ezIsBrowserIE())><br><cfelse>&nbsp;&nbsp;</cfif>
							It was quite easy to integrate ezAJAX#cf_trademarkSymbol# with <a href="" onclick="try { oTabSystem1.activateTab(sampleAppsTab); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a> - ezAJAX#cf_trademarkSymbol# offers a superior AJAX Engine that compliments the slick GUI effects found in <a href="" onclick="try { oTabSystem1.activateTab(sampleAppsTab); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a>.
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<h6 style="color: blue; margin-bottom: 15px;">Coming Soon...</h6>
							<span class="normalPrompt"><b>ezAJAX#cf_trademarkSymbol# Version 0.93 will include the following:</b><br>
							<b>GUI Support for Tabbed Interfaces like the one you are interacting with now.</b></span>
							<cfset tb_width = 190>
							<cfif (Request.commonCode.ezIsBrowserFF())>
								<cfset tb_width = 240>
							</cfif>
							#Request.commonCode.showThoughtBubbleUsingCF('<font size="1">This is an exmaple of a static Thought Bubble...</font>', tb_width)#
							<span class="normalPrompt"><b>GUI Support for Thought Bubbles like the one you can see here or the one that appears when your mouse hovers over <a id="anchor_thoughtBubbleSample" name="anchor_thoughtBubbleSample" href="" title="This is a sample of a thought bubble that appears dynamically." onmouseover="ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, 220, -100, ((ezAJAXEngine.browser_is_ff) ? -15 : -10)); return false;" onmouseout="ezThoughtBubbleObj.dismissThoughtBubbleForAnchor(this.id); return false;">this anchor</a>.</b></span>
						</td>
					</tr>
				</table>
			</div>
		</cfoutput>
	</cfsavecontent>

	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			var bool_isServerCommandCFCError = false;
			try {
				if (NOT bool_isServerCommandCFCError) {
					switch (qryStruct.ezCFM) {
						case 'performPopulateContentFor':
							if (IsDefined("qryStruct.namedArgs.aName")) {
								qObj = QueryNew('id, CONTENT');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								switch (qryStruct.namedArgs.aName) {
									case 'Whats New':
										QuerySetCell(qObj, 'CONTENT', content_107_1, qObj.recordCount);
									break;

									case 'Whats Is':
										QuerySetCell(qObj, 'CONTENT', content_101_1, qObj.recordCount);
									break;
									
									default:
										QuerySetCell(qObj, 'CONTENT', '*** Unknown ***', qObj.recordCount);
									break;
								}
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								extraErrorMsg = '';
								if ( (isDebugMode()) OR (isServerLocal()) ) {
									extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
								}
								QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (aName)#extraErrorMsg#.', qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... he CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						break;
					}
				}
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
	</cfscript>
</cfcomponent>
