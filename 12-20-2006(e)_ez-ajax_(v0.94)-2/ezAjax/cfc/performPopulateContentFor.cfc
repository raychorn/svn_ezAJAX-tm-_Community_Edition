<cfcomponent displayname="performPopulateContentFor" output="No" extends="userDefinedAJAXFunctions">
	<cfset cf_buttonClass = "buttonClass">
	<cfif (ezIsBrowserFF())>
		<cfset cf_buttonClass = cf_buttonClass & "FF">
	</cfif>

	<cfscript>
		_loc = '15,000';

		_urlDojoMailSample031 = 'http://#CGI.SERVER_NAME#/dojo-0.3.1-ajax/demos/widget/mail.html';
		_urlDojoMailSample041 = 'http://#CGI.SERVER_NAME#/dojo-0.4.1-ajax/demos/widget/mail.html';
		
		_urlDojoMailSample = _urlDojoMailSample031;

		_urlSampleWeb20APISource = 'http://#CGI.SERVER_NAME#/app/web2.0/sample/api.cfm';
		_urlSampleWeb20APISource2 = 'http://#CGI.SERVER_NAME#/app/web2.0/sample/api2.cfm';
		_urlSampleWeb20APISource3 = 'http://#CGI.SERVER_NAME#/app/web2.0/sample/api3.cfm';
		_urlSampleWeb20APISource4 = 'http://#CGI.SERVER_NAME#/app/web2.0/sample/api4.cfm';
		_urlSampleWeb20APISource5 = 'http://#CGI.SERVER_NAME#/app/web2.0/sample/api5.cfm';
		_urlSampleWeb20APISource6 = 'http://#CGI.SERVER_NAME#/app/web2.0/sample/api6.cfm';
	</cfscript>

	<cfscript>
		Request.supportEmailAddress = 'support@ez-ajax.com';
		Request.salesEmailAddress = 'sales@ez-ajax.com';
		Request.affiliatesEmailAddress = 'affiliates@ez-ajax.com';
		Request.investorsEmailAddress = 'investors@ez-ajax.com';

		qFeatures = QueryNew('id, sFeature, sCheckCE, sCheckEE');
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>7900+ Lines of Robust Reusable ColdFusion Code you can Redistribute with YOUR Application.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "&nbsp;", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>8600+ Lines of Robust Reusable ColdFusion Code you can Redistribute with YOUR Application.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "&nbsp;", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>#_loc#+ Lines of Robust Reusable JavaScript Code you can Redistribute with YOUR Application.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Runtime Licensing System - allows Trialware to be easily created.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>ezLicenser#cf_trademarkSymbol# System - allows you to easily create and distribute Runtime Licenses for your 3rd party customers.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', '<b>ezCompiler#cf_trademarkSymbol# System - allows you to easily create "compiled" obfuscated JavaScript payloads for your code using our unique "secure" JavaScript compiler.</b>', qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine provides support for using Hidden &lt;IFRAME&gt; AND XmlHttpRequest AND Cross-Domain AJAX dynamically and interchangeably.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine provides support for Cross-Domain JSON with native support for all Yahoo Web 2.0 API's.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine automatically uses Hidden &lt;IFRAME&gt; OR XmlHttpRequest based on the client browser type.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine allows Hidden &lt;IFRAME&gt; OR XmlHttpRequest OR Cross-Domain JSON to be used based on the programmer's preferences.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine provides support for using GET AND POST methods dynamically and interchangeably. (Cross-Domain AJAX is limited to the GET method only.)</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine automatically uses GET OR POST method based on the amount of data being sent to the server. (Cross-Domain AJAX is limited to the GET method only.)</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine automatically handles and reports ColdFusion Errors for AJAX Server Commands.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine automatically allows one ColdFusion Query Object to be returned from the AJAX Server, Community Edition only.  The Enterprise Edition is not limited to returning only one ColdFusion Query Object from the AJAX Server.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "&nbsp;", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine automatically allows an unlimited number of ColdFusion Query Objects to be returned from the AJAX Server, Enterprise Edition only.  The Community Edition is limited to returning only one ColdFusion Query Object from the AJAX Server.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "&nbsp;", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine handles Server-Side errors such as the server being down with automatic failover to a Call-Back function to allow the client to respond to this type of error in a graceful manner. (This allows for easy deployment of a web server cluster with no hassles in how the cluster is organized.)</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine handles Client-Side JavaScript errors in a graceful manner - this reduces your coding effort by allowing you as the developer to focus on correcting errors before your code is deployed.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX Engine automatically creates Server Command CFC Stubs - this reduces your coding effort by allowing you as the developer to focus on coding your application logic rather than Framework infrastructure.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX JavaScript API supports the ability to cache ColdFusion Query Objects that are returned from the server. Cached Query Objects can be queried from the client using our unique client based JavaScript API.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX server automatically interfaces with our AJAX Engine running on the client regardless of which options or features are being used by the programmer.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX API provides more than 1 MegaByte of compiled ColdFusion MX 7 code you can reuse and redistribute.  This allows you to focus entirely on your Application Logic without having to think about how AJAX works.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>The ezAJAX API fully supports the &lt;cfquery&gt; tag for both SQL DBMS Queries and Query of Queries with automatic error recovery and automatic error reporting.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "<b>X</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>ezAJAX Enterprise Edition provide an Object-Oriented Networked Data Model that frees the developer from ever having to code SQL Statements unless the developer really wants to code SQL Statements.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckCE', "&nbsp;", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheckEE', "<b>X</b>", qFeatures.recordCount);
	</cfscript>

	<cffunction name="ContactUsFormHTML" access="public" returntype="string">
		<cfargument name="bool_optInOnly" type="boolean" required="yes">
		<cfargument name="actionID" type="string" required="Yes">
		<cfargument name="toEmailAddrs" type="string" required="Yes">
		<cfargument name="divName" type="string" required="Yes">
		
		<cfset var html_ContactUsForm = "">
		<cfset var _button_dismiss_contactUs_panel = 'button_dismiss_contactUs_panel_' & CreateUUID()>
		<cfset var _dismissAction = "var oObj = _$('#divName#'); if (!!oObj) { oObj.style.display = const_none_style; }">
		<cfset var _input_emailAddress = 'input_emailAddress_' & CreateUUID()>
		<cfset var _button_submit_contactUs_panel = '_button_submit_contactUs_panel' & CreateUUID()>
		<cfset var _textarea_yourMessage = 'textarea_yourMessage_' & CreateUUID()>
		<cfset var bool_optInToggle = (FindNoCase("OptIn", divName) gt 0)>
		<cfset var optInPrompt = "In">
	
		<cfsavecontent variable="html_ContactUsForm">
			<cfoutput>
				<table width="350px" border="1" bgcolor="##FFFFA8" cellpadding="-1" cellspacing="-1">
				<tr bgcolor="silver">
				<td>
				<table width="100%" cellpadding="-1" cellspacing="-1">
				<tr>
				<td width="90%" align="center" valign="top">
				<cfif (bool_optInOnly)>
					<cfif (NOT bool_optInToggle)>
						<cfset optInPrompt = "Out">
					</cfif>
					<span class="normalBoldBluePrompt">Opt-#optInPrompt# for Monthly Newsletters</span>
				<cfelse>
					<span class="normalBoldBluePrompt">Contact Us at #toEmailAddrs#</span>
				</cfif>
				</td>
				<td width="*" align="center" valign="top">
				<input type="Button" id="#_button_dismiss_contactUs_panel#" class="buttonClass" value="[X]" onclick="#_dismissAction# return false;">
				</td>
				</tr>
				</table>
				</td>
				</tr>
				<tr>
				<td>
				<table width="100%" cellpadding="-1" cellspacing="-1">
				<tr>
				<td width="20%" align="left" valign="top">
				<span class="normalBoldBluePrompt">Your Email Address:</span>
				</td>
				<td width="*" align="left" valign="top">
				<cfif (bool_optInOnly)>
					<input id="#_input_emailAddress#" value="yourEmail@yourDomain.com" size="50" maxlength="255" onfocus="this.value = '';" onblur="var oBtn = _$('#_button_submit_contactUs_panel#'); if (!!oBtn) { ezSetFocus(oBtn); }; return false;" onkeyup="if (!!validateConactUsUserEmailAddrs) { validateConactUsUserEmailAddrs(this, '#_button_submit_contactUs_panel#'); }; simulateEnterKeyForContactUsActions(event, '#_button_submit_contactUs_panel#');">
				<cfelse>
					<input id="#_input_emailAddress#" value="yourEmail@yourDomain.com" size="50" maxlength="255" onfocus="this.value = '';" onblur="var oInput = _$('_textarea_yourMessage'); if (!!oInput) { ezSetFocus(oInput); }; return false;" onkeyup="if (!!validateConactUsUserEmailAddrs) { validateConactUsUserEmailAddrs(this, '#_button_submit_contactUs_panel#'); };">
				</cfif>
				</td>
				</tr>
				<tr>
				<td>
				<span class="normalBoldBluePrompt" style="display: <cfif (NOT bool_optInOnly)>inline<cfelse>none</cfif>">Your Message:</span>
				</td>
				<td>
				<textarea id="#_textarea_yourMessage#" cols="50" rows="3" style="display: <cfif (NOT bool_optInOnly)>inline<cfelse>none</cfif>"></textarea>
				</td>
				</tr>
				<tr>
				<td colspan="2">
				<span class="normalBoldBluePrompt" style="display: <cfif (NOT bool_optInOnly)>inline<cfelse>none</cfif>">Kindly allow 24-48 hours for a response.</span>
				</td>
				</tr>
				<tr>
				<td colspan="2">
				<input type="Button" id="#_button_submit_contactUs_panel#" disabled class="buttonClass" value="[Submit]" onclick="#_dismissAction# performContactUsAJAXAction('#actionID#', _$('#_input_emailAddress#'), _$('#_textarea_yourMessage#'), '#toEmailAddrs#'); return false;">
				</td>
				</tr>
				</table>
				</td>
				</tr>
				</table>
			</cfoutput>
		</cfsavecontent>
	
		<cfreturn html_ContactUsForm>
	</cffunction>

	<cfsavecontent variable="content_101_1"> <!--- 101.1 --->
		<cfoutput>
			<div id="div_WhatsIsContentContainer" style="margin: 5px 5px 5px 5px;">
			<p align="justify" class="normalSiteContentTextClass">ezAJAX is the EASY way to create high-powered AJAX Applications with very little effort.</p>
			<p align="justify" class="normalSiteContentTextClass">What makes ezAJAX so EASY?</p>
			<p align="justify" class="normalSiteContentTextClass">We give you more than #_loc# lines of code that is already debugged and ready to use.  Our entire Framework is one AJAX Sample App to which you make minor adjustments.  All you need to do after installing ezAJAX is begin coding your application logic.</p>
			<p align="justify" class="normalSiteContentTextClass">When it comes time for you to sell your AJAX App to 3rd parties we can provide you with Runtime Licenses that allow you to redistribute our Framework with your application logic.  This gives you a clear advantage in the marketplace because you are able to easily produce Limited-Use Trial Apps that allow your potential customers to test-drive your applications before they make a purchase.</p>
			<p align="justify" class="normalSiteContentTextClass">Let us do all the work for <u>you</u>!</p>
			<div id="div_linesOfCodeContent">
				<p class="normalSiteContentTextClass">More than #_loc# lines of Reusable JavaScript/ColdFusion MX 7 code.  Best of all YOU can Redistribute the whole Reusable Framework with YOUR code using our powerful Runtime Licensing System that protects YOUR Intellectual Property Rights while making it easy for YOU to create Trial Editions of your Applications that can easily be made into Enterprise Editions simply by issuing a Runtime License using our ezLicenser#cf_trademarkSymbol# product.</p>
			</div>
			<p align="justify" class="normalSiteContentTextClass">Work less !  Deploy more AJAX Apps in less time !  We do all the hard work for you !  You do very little work !  Save your boss time and money !  Get your AJAX Apps deployed in less time !  You begin every single project with #_loc# lines of code already written !  How long would it take you to write #_loc# lines of code ?  It takes less than <a href="" onclick="try { installationText(); } catch(e) { } finally { }; return false;">2 minutes to install</a> this product and begin using it.</p>
			</div>
		</cfoutput>
	</cfsavecontent>
	
	<cfsavecontent variable="contactUsContent">
		<cfoutput>
			<div id="div_contactUsContent_#Request.supportEmailAddress#_201.1" style="display: none;">#ContactUsFormHTML(false, "performContactUsAction", Request.supportEmailAddress, "div_contactUsContent_#Request.supportEmailAddress#_201.1")#</div>
			<div id="div_contactUsContent_#Request.salesEmailAddress#_202.2" style="display: none;">#ContactUsFormHTML(false, "performContactUsAction", Request.salesEmailAddress, "div_contactUsContent_#Request.salesEmailAddress#_202.2")#</div>
			<div id="div_contactUsContent_#Request.affiliatesEmailAddress#_203.3" style="display: none;">#ContactUsFormHTML(false, "performContactUsAction", Request.affiliatesEmailAddress, "div_contactUsContent_#Request.affiliatesEmailAddress#_203.3")#</div>
			<div id="div_contactUsContent_#Request.investorsEmailAddress#_204.4" style="display: none;">#ContactUsFormHTML(false, "performContactUsAction", Request.investorsEmailAddress, "div_contactUsContent_#Request.investorsEmailAddress#_204.4")#</div>
			<div id="div_ContactUsContentContainer" style="margin: 5px 5px 5px 5px;">
				<table width="100%">
					<tr>
						<td align="center">
							<p align="justify" class="titlex14BoldClass">
								Contact Us
							</p>
						</td>
					</tr>
					<tr>
						<td align="left">
							<p align="justify" class="titlex12BoldClass">
								Hierarchical Applications Limited, creators of ezAJAX, ezCluster, ezLicenser and ezCompiler, can be contacted using the following links:
							</p>
						</td>
					</tr>
					<tr>
						<td align="left">
							<br>
							<p align="justify" class="titlex12BoldClass">
								Contact our Sales Department (<a href="" onclick="popUpContactUsDialog('div_contactUsContent_#Request.salesEmailAddress#_202.2', ['div_contactUsContent_#Request.supportEmailAddress#_201.1', 'div_contactUsContent_#Request.affiliatesEmailAddress#_203.3', 'div_contactUsContent_#Request.investorsEmailAddress#_204.4']); return false;">#Request.salesEmailAddress#</a>).
							<br>
								Our Sales Department can help you purchase the Runtime Licenses you need to meet your development and deployment requirements.
							</p>
						</td>
					</tr>
					<tr>
						<td align="left">
							<br>
							<p align="justify" class="titlex12BoldClass">
								Contact our Support Department (<a href="" onclick="popUpContactUsDialog('div_contactUsContent_#Request.supportEmailAddress#_201.1', ['div_contactUsContent_#Request.salesEmailAddress#_202.2', 'div_contactUsContent_#Request.affiliatesEmailAddress#_203.3', 'div_contactUsContent_#Request.investorsEmailAddress#_204.4']); return false;">#Request.supportEmailAddress#</a>).
							<br>
								Our Support Department can help you get bugs fixed based on your bug reports.  Our Support Department can also get custom features and functions added to ezAJAX - just drop us a line and let us know what your specific needs are and we will knock-out the code you need written.
							</p>
						</td>
					</tr>
					<tr>
						<td align="left">
							<br>
							<p align="justify" class="titlex12BoldClass">
								Contact our Affiliates Department (<a href="" onclick="popUpContactUsDialog('div_contactUsContent_#Request.affiliatesEmailAddress#_203.3', ['div_contactUsContent_#Request.salesEmailAddress#_202.2', 'div_contactUsContent_#Request.supportEmailAddress#_201.1', 'div_contactUsContent_#Request.investorsEmailAddress#_204.4']); return false;">#Request.affiliatesEmailAddress#</a>).
							<br>
								Our Affiliates Department can help you make money.  You advertise ezAJAX and send visitors to our site - when they make a purchase you get a generous percentage of the sale.  We typically pay between 30% and 60% commissions for each sale.  You too could easily begin making thousands of $'s every week by becoming an Affiliate for ezAJAX.
							</p>
						</td>
					</tr>
					<tr>
						<td align="left">
							<br>
							<p align="justify" class="titlex12BoldClass">
								Contact our Investor Relations Department (<a href="" onclick="popUpContactUsDialog('div_contactUsContent_#Request.investorsEmailAddress#_204.4', ['div_contactUsContent_#Request.salesEmailAddress#_202.2', 'div_contactUsContent_#Request.supportEmailAddress#_201.1', 'div_contactUsContent_#Request.affiliatesEmailAddress#_203.3']); return false;">#Request.investorsEmailAddress#</a>).
							<br>
								Our Investor Relations Department wants to talk with you if you have money to invest in ezAJAX.  We are currently looking for those of you who want to partner with us as we push the envelope of Web Development into the future.  We believe ezAJAX is the future of Rapid Web Development.  We believe ezAJAX can make Web 2.0 Developers far more productive than they might have been otherwise.  We know ezAJAX is the most robust AJAX Development Framework on the planet.
							</p>
						</td>
					</tr>
				</table>
			</div>
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="content_102_3"> <!--- 102.3 --->
		<cfoutput>
			<div id="div_contactUsContent_#Request.supportEmailAddress#_102.3" style="display: none;">#ContactUsFormHTML(false, "performContactUsAction", Request.supportEmailAddress, "div_contactUsContent_#Request.supportEmailAddress#_102.3")#</div>
			<div id="div_contactUsContent_#Request.salesEmailAddress#_102.3" style="display: none;">#ContactUsFormHTML(false, "performContactUsAction", Request.salesEmailAddress, "div_contactUsContent_#Request.salesEmailAddress#_102.3")#</div>
			<div id="div_WhatsIsContentContainer" style="margin: 5px 5px 5px 5px;">
			<table width="100%" cellpadding="-1" cellspacing="-1">
				<tr>
					<td valign="top">
						<p align="justify" class="normalDetailedContentTextClass">
	This product currently supports Windows 2003, Windows 2000 or Windows XP.  Contact our Support Department (<a href="" onclick="var oObj = _$('div_contactUsContent_#Request.supportEmailAddress#_102.3'); if (!!oObj) { oObj.style.display = const_inline_style; }; var oObj = _$('div_contactUsContent_#Request.supportEmailAddress#_104.03'); if (!!oObj) { oObj.style.display = const_none_style; }; var oObj = _$('div_contactUsContent_#Request.supportEmailAddress#_102.3a'); if (!!oObj) { oObj.style.display = const_none_style; }; return false;">#Request.supportEmailAddress#</a>) if you wish to install this product using any other OS.
						</p>
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">
						<span class="normalPrompt">Click on each Step below.</span>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="0" cellpadding="5" cellspacing="5">
							<tr>
								<td id="td_container_InstallProcess.1" align="center" class="installProcessUnSelectedClass" onclick="populateSiteContent('content_104_1'); global_oldClass = this.className; return false;" onmouseover="global_oldClass = this.className; this.className = 'installProcessHoverSelectedClass'; return false;" onmouseout="this.className = global_oldClass; return false;">
									<span class="normalPrompt">Step ##1</span>
								</td>
								<td id="td_container_InstallProcess.2" align="center" class="installProcessUnSelectedClass" onclick="populateSiteContent('content_104_2'); global_oldClass = this.className; return false;" onmouseover="global_oldClass = this.className; this.className = 'installProcessHoverSelectedClass'; return false;" onmouseout="this.className = global_oldClass; return false;">
									<span class="normalPrompt">Step ##2</span>
								</td>
								<td id="td_container_InstallProcess.3" align="center" class="installProcessUnSelectedClass" onclick="populateSiteContent('content_104_3'); global_oldClass = this.className; return false;" onmouseover="global_oldClass = this.className; this.className = 'installProcessHoverSelectedClass'; return false;" onmouseout="this.className = global_oldClass; return false;">
									<span class="normalPrompt">Step ##3</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
			<div id="p_installationProcessStepDesc" class="normalDetailedContentTextClass" style="overflow: auto; height: 265px; margin: 5px 5px 5px 5px;">
			</div>
					</td>
				</tr>
			</table>
			</div>
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="content_104_1"> <!--- 104.01 --->
		<cfoutput>
		<div id="div_104_2_ContentContainer" style="margin: 5px 5px 5px 5px;">
	(1). Create a folder on your web server where the product is to be installed.  This folder can be in the root for your web server which is sometimes named "wwwroot" for IIS, for instance, or this folder can be a sub-folder below your web root folder.  ezAJAX supports any web server that is supported by ColdFusion MX 7 including the web server that is built into ColdFusion MX 7.  For us, ezAJAX works best with Apache 2.0.55.  We are working on a PHP Connector to allow those who use PHP deploy ezAJAX without having to buy any licenses for ColdFusion MX 7.
		</div>
		</cfoutput>
	</cfsavecontent>
	
	<cfsavecontent variable="content_104_2"> <!--- 104.02 --->
		<cfoutput>
		<div id="div_104_2_ContentContainer" style="margin: 5px 5px 5px 5px;">
	(2). Download the ezAJAX Installer program to your web server in a folder other than the one that was created or set aside for Step (1).  The ezAJAX Installer program <b><u>MUST</u></b> be executed using the <u>same</u> Physical Server as the one to which you are installing the ezAJAX product.  You <b><u>cannot</u></b> do a remote installation across a network, this will not work.  Additionally, the ezAJAX Installer program works much better when it is running from a folder that has nothing it in but the ezAJAX Installer program.
	<br><br>(2a). Double-Click on the ezAJAX Installer program and click on the "I Agree" button to begin the Installation Process.
	<br><br>(2b). The first question prompts you for your valid Internet email address.  This is the email address where you will receive the Runtime License we will send to you once the Registration Process has successfully created a Runtime License for your physical server.  There is a limit of one Runtime License per physical server for the Trial period.  You may purchase a Perpetual Runtime Licenses that are less restrictive however each Runtime License will specific one domain name or server name for each physical server.  Contact our Sales Department (#Request.salesEmailAddress#) for whatever your Runtime Licensing needs may be and we will take care of your specific needs.
	<br><br>(2c). The second question prompt you for your Server Name or Domain Name; the Server Name or Domain Name does not include any use of "http://".  This is the specific Server Name or Domain Name that matches the server name or domain name for your specific web server.  This could be "localhost" or "127.0.0.1" or "laptop.mydomain.com" or "www.mydomain.com" or "mydomain.com" or whatever domain name you wish to use when forming URLs for the web server for which you wish to use this product.  Typically the Server Name or Domain Name appears AFTER the "http://" but does not include the "http://". <b>Be sure to leave the "http://" off the Server Name or Domain Name - our Registration Server will simply ignore the use of "http://" in case you forget to remove it before hitting the button to process the Product Registration.</b>  There is a limit of one server name or domain name per physical server during the Trial period.  Contact our Sales Department (<a href="" onclick="var oObj = _$('div_contactUsContent_#Request.salesEmailAddress#_102.3'); if (!!oObj) { oObj.style.display = const_inline_style; }; return false;">#Request.salesEmailAddress#</a>) to have your specific Runtime Licensing needs resolved.
		</div>
		</cfoutput>
	</cfsavecontent>
	
	<cfsavecontent variable="content_104_3"> <!--- 104.03 --->
		<cfoutput>
		<div id="div_104_3_ContentContainer" style="margin: 5px 5px 5px 5px;">
	(3). After the second prompt has been responded to the ezAJAX Installer program will contact our Registration Server(s) to create the Runtime License that matches your specific installation.  If successful, you will see a prompt that states your Registration was successful and a Runtime License file has been emailed to you using the email address entered in Step (4).
	<br><br>(3a). If you need your Runtime License resent to your email address or a different email address, assuming the original email address was incorrect, simply restart the ezAJAX Installer program and respond to all the prompts.  The Runtime License that was originally created in Step (6) will be resent to the email address you entered during the Installation Process.
	<br><br>(3b). If you encounter any problems during the Installation Process simply contact our Support Department (<a href="" onclick="var oObj = _$('div_contactUsContent_#Request.supportEmailAddress#_102.3'); if (!!oObj) { oObj.style.display = const_inline_style; }; return false;">#Request.supportEmailAddress#</a>) to get the problem resolved.  Our Support Department will not be able to send you a Runtime License file but they will be able to tell you what went wrong during the Installation Process so you can resolve the problem and achieve a successful installation.
	<br><br>(3c). You may install this product on as many physical servers as you wish however there is a limit of one Trial per physical server.  And "yes" you can also install this product on a workstation if desired however workstation OS's typically don't provide the level of support required for robust web apps such as those that are created using this product.
	<br><br>(3d). The ezAJAX Community Edition supports any version of ColdFusion MX 7 using any web server supported by ColdFusion MX 7.  Be sure to let our Support Department (<a href="" onclick="var oObj = _$('div_contactUsContent_#Request.supportEmailAddress#_102.3'); if (!!oObj) { oObj.style.display = const_inline_style; }; return false;">#Request.supportEmailAddress#</a>) know if you encounter anything that differs from this.
		</div>
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="content_105_1"> <!--- 105.1 --->
		<cfoutput>
			<table width="100%" cellpadding="-1" cellspacing="-1">
				<tr>
					<td bgcolor="silver" align="center">
						<span class="normalSmallPrompt">ezAJAX Features Comparison Chart</span>
					</td>
				</tr>
				<tr>
					<td>
						<div style="overflow: auto; height: 410px;">
							<table width="99%" cellpadding="-1" cellspacing="-1" style="margin-left: 5px;">
								<tr>
									<td width="80%" bgcolor="silver" align="left" valign="top">
										<span class="featuresText">Feature Description</span>
									</td>
									<td width="10%" bgcolor="silver" align="center" valign="top">
										<span class="featuresText">Community<br>Edition</span>
									</td>
									<td width="10%" bgcolor="silver" align="center" valign="top">
										<span class="featuresText">Enterprise<br>Edition</span>
									</td>
								</tr>
								<cfset colorL = "white">
								<cfset colorR = "white">
								<cfloop query="qFeatures" startrow="1" endrow="#qFeatures.recordCount#">
									<tr>
										<td width="80%" bgcolor="#colorL#" align="left" valign="top">
											<span class="featuresText">#qFeatures.sFeature#<br></span>
										</td>
										<td width="10%" bgcolor="#colorR#" align="center" valign="top">
											<span class="featuresText">#qFeatures.sCheckCE#</span>
										</td>
										<td width="10%" bgcolor="#colorR#" align="center" valign="top">
											<span class="featuresText">#qFeatures.sCheckEE#</span>
										</td>
									</tr>
		
									<cfif (colorL is "white")>
										<cfset colorL = "silver">
									<cfelse>
										<cfset colorL = "white">
									</cfif>
		
									<cfif (colorR is "white")>
										<cfset colorR = "silver">
									<cfelse>
										<cfset colorR = "white">
									</cfif>
								</cfloop>
							</table>
						</div>
					</td>
				</tr>
			</table>
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="content_106_1"> <!--- 106.1 --->
		<cfoutput>
			<div id="div_RuntimeLicensesContentContainer" style="margin: 5px 5px 5px 5px;">
				<table width="100%" border="1" cellpadding="-1" cellspacing="-1">
					<tr>
						<td>
							<table width="100%" cellpadding="-1" cellspacing="-1">
								<tr>
									<td width="50%" valign="top">
										<table width="100%" cellpadding="-1" cellspacing="-1">
											<tr>
												<td align="center" bgcolor="silver">
													<span class="normalPrompt"><b>Manage my Runtime Licenses</b></span>
												</td>
											</tr>
											<tr>
												<td>
													<p align="justify" class="normalPrompt">Enter the EMail Address and Server Name you used when you Installed your copy of ezAJAX. Download the ezAJAX Installer program and Install ezAJAX to get your Runtime License for your 30-day Trial and then return here to Manage or Upgrade your Runtime Licenses to Annual or Perpetual.</p>
													<p align="justify" class="normalPrompt">The Runtime License Management System cannot issue Runtime Licenses but it can resend your Runtime Licenses to your EMail Address.  The Runtime License Management System also allows you to change your email address in case your email address has changed since your Runtime License was issued.</p>
												</td>
											</tr>
											<tr>
												<td align="left">
													&nbsp;<span class="normalPrompt"><b>Email Address:</b></span>&nbsp;<input type="text" id="manageLicenses_emailAddress" class="textClass" tabindex="1" size="30" maxlength="255" value="" onblur="var oInput2 = _$('manageLicenses_serverName'); if (!!oInput2) { ezSetFocus(oInput2); }; return false;" onkeyup="if (!!validateManageLicensesUserEmailAddrs()) { validateManageLicensesUserEmailAddrs() }; simulateEnterKeyForManageLicensesActions(event);"><br>
													&nbsp;<span class="normalPrompt"><b>Server Name:</b></span>&nbsp;<input type="text" id="manageLicenses_serverName"  class="textClass" tabindex="2" size="50" maxlength="255" value="" onblur="var oBtn = _$('btn_manageLicenses_Submit'); if (!!oBtn) { ezSetFocus(oBtn); }; return false;" onkeyup="this.value = filterServerName(this.value); simulateEnterKeyForManageLicensesActions(event);"><br>
													&nbsp;<button id="btn_manageLicenses_Submit" type="button" disabled class="#cf_buttonClass#" tabindex="3" onclick="var oInput1 = _$('manageLicenses_emailAddress'); var oInput2 = _$('manageLicenses_serverName'); if ( (!!oInput1) && (!!oInput2) ) { if ( (oInput1.value.length > 0) && (oInput2.value.length > 0) ) { oGuiActions.pushButton(this.id); oGuiActions.pushButton(oInput1.id); oGuiActions.pushButton(oInput2.id); oAJAXEngine.doAJAX('performGetRegistrationData', 'handleGetRegistrationData', 'emailAddress', oInput1.value, 'serverName', oInput2.value); } else { alert('Missing values for EMail Address and/or Server Name.'); } } else { alert('ERROR: Programming Error - Unable to fetch the value for \'emailAddress\' and/or \'serverName\'.'); } return false;">[Retrieve Runtime Licenses]</button>&nbsp;
													<cfif 0>
													&nbsp;<button id="btn_manageLicenses_Cancel" type="button" class="#cf_buttonClass#" tabindex="4" onclick="populateSiteContent(106.2); return false;">[Cancel]</button>
													</cfif>
												</td>
											</tr>
											<tr>
												<td align="right">
													<table width="100%" cellpadding="-1" cellspacing="-1">
														<tr>
															<td>
																<span class="normalPrompt">
																<a href="" title="This site has been determined to be 100 percent Safe from Hacker intrusions and is protected by our state-of-the-art anti-hacker protection system known as 'Hacker Dog'#cf_trademarkSymbol#." onmouseover="handleOnMouseOverLinkSpan('span_hackerSafe');" onmouseout="handleOnMouseOutLinkSpan('span_hackerSafe');" onclick="/*popUpWindowForHackerSafe();*/ return false;" style="color: black;"><span id="span_hackerSafe"><img src="http://#CGI.SERVER_NAME#/app/images/Hacker Dog (small).gif" width="113" height="56" border="0"><br>(#DateFormat(Now(), "medium")# #TimeFormat(Now(), "short")#)</span></a>
																</span>
															</td>
															<td>
																<!-- Begin Official PayPal Seal --><a href="" onclick="popUpWindowForPayPal(); return false;"><span id="span_verifiedPaypal"><img src="http://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal"></span></A><!-- End Official PayPal Seal -->
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
									<td width="50%" valign="top">
										<table width="100%" cellpadding="-1" cellspacing="-1">
											<tr>
												<td align="center" bgcolor="silver">
													<span class="normalPrompt"><b>my Runtime Licenses</b></span>
												</td>
											</tr>
											<tr>
												<td align="left">
													<div id="div_manageLicenses_content"></div>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="content_YahooSearchV2">
		<cfoutput>
			<div id="div_WhatsNewContentContainer" style="margin: 5px 5px 5px 5px;">
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td>
							<table width="100%">
								<tr>
									<td>
										<h6 style="color: blue; margin-bottom: 15px;">Yahoo Search V2 API using JSON</h6>
									</td>
									<td style="border: thin solid Blue;">
										<table width="100%" border="0">
											<tr>
												<td width="20%">
													<span class="normalPrompt"><NOBR>&nbsp;Local Search Criteria:</NOBR></span>
												</td>
												<td width="40%">
													<input id="input_YahooSearchV2_criteria" class="textClass" size="50" maxlength="40" onkeydown="if (event.keyCode == 13) { performYahooSearchV2Action(this.id); return false; }; return true;">
												</td>
												<td width="*">
													<button onclick="var oInput = _$('input_YahooSearchV2_criteria'); if (!!oInput) { performYahooSearchV2Action(oInput.id); }; return false;"><img src="/app/images/icons/16x16/internet-search.gif" title="Click this icon to perform the Yahoo Search v2" width="17" height="16" border="0"></button>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<span class="normalPrompt">
								<p align="justify">
								This code sample uses a prototype for a new and exciting method for AJAX that features a better way to issue cross-domain AJAX Server Commands as well as built-in support for Yahoo Search v2 API as shown below.
								</p>
								<p align="justify">
								You can expect to get this level of JSON support in our next major release of ezAJAX which will begin with the Version 1.0 Release of ezAJAX.
								</p>
								<p align="justify">
								Also this highlights the level of support we, who develop ezAJAX, like to provide to those who purchase this exciting product.  Someone made a suggestion and we rushed in to add some new features for our loyal user community.
								</p>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span class="normalPrompt">
								<p align="justify">
								Here is a simple task using Javascript. Please have a look at our Local Search v2 API: <a href="http://developer.yahoo.com/search/local/V2/localSearch.html" target="_blank">http://developer.yahoo.com/search/local/V2/localSearch.html</a>,
								</p>
								<p align="justify">
								Using the API, I'd like you to create a standalone HTML file that uses Javascript to make a request to the Local Search API for a single restaurant, say a Pizza restaurant in Palo Alto, CA and display the following information on the page.
								</p>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<table width="100%">
								<tr>
									<td>
										<UL>
											<LI><span class="normalPrompt">Business Name</span></LI>
											<LI><span class="normalPrompt">Phone ##</span></LI>
											<LI><span class="normalPrompt">Address, City, State</span></LI>
										</UL>
									</td>
									<td>
										<div id="div_content_YahooSearchV2_Results"></div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<span class="normalPrompt">
								<p align="justify">
								A link to the Yahoo! Local details page The rating of the business. The information can be styled anyway you like, but if you need inspiration, take a look at the Business Card information at the top of this page: <a href="http://local.yahoo.com/details?id=28734629" target="_blank">http://local.yahoo.com/details?id=28734629</a>.
								</p>
								
								<p align="justify">
								Please let me know if you have any questions, otherwise send me the file or a link to it once complete, thanks!
								</p>
							</span>
						</td>
					</tr>
				</table>
			</div>
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="content_107_1a">
		<cfoutput>
			<div id="div_WhatsIsContentContainer" style="margin: 5px 5px 5px 5px;">
				<h6 style="color: blue; margin-bottom: 15px;">Ready Now !</h6>
				<p align="justify" class="normalPrompt"><b>ezAJAX Version 0.94 now completely supports JSON.  That's right, ezAJAX Version 0.94 now fully support JSON.  This means you can now interface with and consume Web 2.0 Services that provide a JSON interface using ezAJAX Version 0.94.  This also means you can create Web 2.0 Services that provide a JSON interface for others to use.  For those of you who may not be aware of what JSON is (as if this requires any explanation) JSON is a nice compact method for transmitting data from place to place using JavaScript.  The problem with JSON is that JSON typically does not typically provide a Schema for the data one wishes to convey from the Server to the client.  ezAJAX provides JSON what it has been missing by automatically converting JSON data blocks into ezAJAX Query Objects so that Query of Queries can be executed from the client's perspective.  Client-side Query of Queries can execute much faster than server-side Queries and this alone can enable your ezAJAX Apps to run much faster than similar AJAX apps that were constructed using some other Framework other than ezAJAX.</b></p>
				<h6 style="color: blue; margin-bottom: 15px;">Do you Yahoo ?</h6>
				<p align="justify" class="normalPrompt"><b>ezAJAX Version 0.94 now completely completely supports all Yahoo Web 2.0 API's that use JSON.  We have published an ezAJAX Sample Applet that interfaces with one of the Yahoo Web 2.0 API's. ezAJAX Version 0.94 now completely completely supports the same cross-domain AJAX method that Yahoo is using internally at Yahoo.  Yahoo recently contacted our development staff to have our developers create a cross-domain AJAX method for them and soon ezAJAX will use this same cross-domain AJAX method.  In addition to the iFrame and xmlHttpRequest AJAX methods you will also be able to use the cross-domain AJAX method we programmed for Yahoo.  The problem with using the cross-domain AJAX method is that it cannot POST data to the server which means the GET method must be used and this may severely limit the amount of data one can transmit to the AJAX Server since most browsers are limited to performing the GET method on blocks of 2000 bytes or less.  ezAJAX Version 0.95 or later will fully support the cross-domain GET method for those who wish to use this cross-domain method using our superior robust ezAAJX Engine.</b></p>
				<h6 style="color: blue; margin-bottom: 15px;">Ready Soon !</h6>
				<p align="justify" class="normalPrompt"><b>ezAJAX will soon provide support for the Geonosis Data Model - this is an Object-Oriented Networked Database Engine that works with any ODBC/JDBC Data Source that ColdFusion MX 7 can interface with.  Geonosis makes it possible to dynamically store and manipulate any data type of data structure without having to hand code any SQL Statements.  Geonosis fully supports traditional SQL Statements for those who wish to maintain support for traditional Relational Data Models.  Geonosis will empower AJAX Developers to deploy their AJAX Apps without having to give any thought to the database other than having access to an empty Relational Database, if desired, which means Geonosis will be able to populate the Geonosis Data Model without having to have a trained DBA on staff.  ezAJAX is the only AJAX Framework that provides this level of support for your data-driven Web 2.0 Applications and Software Services.</b></p>
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
							<span class="normalPrompt"><b>ezAJAX has an expanded <a href="" onclick="try { /* ezAlert(ezObjectExplainer(window.location)); */ downloadsDocsText(); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">Programmer's Guide with a Tutorial Primer</a> that explains how to use ezAJAX after it has been installed.</b></span>
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
										<p align="justify" class="normalPrompt">ezAJAX is currently being featured at <a href="http://www.tucows.com/preview/504416" target="_blank">TuCows</a>.</p>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<p align="justify" class="normalPrompt"><b>ezAJAX Version 0.94 is now ready for downloads and is completely compatible with <a href="" onclick="try { sampleAppsText(); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">the Dojo Toolkit</a></b>.&nbsp;
							You can <span id="span_DojoMailSample_anchor"><a id="anchor_DojoMailSample" href="" onclick="try { prepareWindowForDojoMailSample(); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">view our Dojo Sample - the Mail Sample Application</a></span><span id="div_DojoMailSample" style="display: none;">&nbsp;<input type="radio" name="radio_DojoMailSample" id="radio_DojoMailSample031" onclick="try { popUpWindowForDojoMailSample('031'); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">&nbsp;<a href="" onclick="try { clickWindowForDojoMailSample('031'); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">Version 0.3.1</a>&nbsp;<input type="radio" name="radio_DojoMailSample" id="radio_DojoMailSample041" onclick="try { popUpWindowForDojoMailSample('041'); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">&nbsp;<a href="" onclick="try { clickWindowForDojoMailSample('041'); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">Version 0.4.1</a></span> as taken from <a href="" onclick="try { sampleAppsText(); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">the Dojo Toolkit</a>.<cfif (ezIsBrowserIE())>&nbsp;<cfelse>&nbsp;&nbsp;</cfif>
							It was quite easy to integrate ezAJAX with <a href="" onclick="try { sampleAppsText(); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">the Dojo Toolkit</a> - ezAJAX offers a superior AJAX Engine that compliments the slick GUI effects found in <a href="" onclick="try { sampleAppsText(); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">the Dojo Toolkit</a>.
							The problem with <a href="" onclick="try { sampleAppsText(); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">the Dojo Toolkit</a> is that it suffers from a weak Client-Server integration and it offers no server API support as well as providing a slower GUI interface than ezAJAX.  
							We have provided some <a href="" onclick="try { sampleAppsText(); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">sample Dojo Toolkit Apps</a> to demonstrate our level of compatability with the Dojo Toolkit for those who may be using the Dojo Toolkit.  
							We recommend you do a thorough comparison between your current AJAX Framework and ezAJAX and then make up your own mind as to which framework you should be using.
							We are sure once you perform a careful analysis you will conclude ezAJAX is far superior to every other AJAX Framework you may be able to find or build because ezAJAX is the only AJAX Framework that provides for a rock-solid Client-Server Integration that provide automatic code generation for server-side logic - this shortens development time and also shortens your time to market.
							</p>
							#content_107_1a#
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<h6 style="color: blue; margin-bottom: 15px;">Ready Earlier !</h6>
							<span class="normalPrompt"><b>ezAJAX Version 0.93 and later includes the following:</b><br>
							<b>GUI Support for Tabbed Interfaces like the one you are interacting with now.</b></span>
							<cfset tb_width = 190>
							<cfif (ezIsBrowserFF())>
								<cfset tb_width = 240>
							</cfif>
							#showThoughtBubbleUsingCF('<font size="1">This is an exmaple of a static Thought Bubble...</font>', tb_width)#
							<span class="normalPrompt"><b>GUI Support for Thought Bubbles like the one you can see here or the one that appears when your mouse hovers over <a id="anchor_thoughtBubbleSample" name="anchor_thoughtBubbleSample" href="" title="This is a sample of a thought bubble that appears dynamically." onmouseover="try { ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, 220, -100, ((ezAJAXEngine.browser_is_ff) ? -15 : -10)); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;" onmouseout="try { ezThoughtBubbleObj.dismissThoughtBubbleForAnchor(this.id); } catch(e) { ezAlertError(ezErrorExplainer(e)); }; return false;">this anchor</a>.</b></span>
							<br><br>
							<span class="normalPrompt"><b>Both the Enterprise and Community Editions are combined for easier upgrading to allow those who want to use the Trial Edition move up to the Enterprise Edition simply by purchasing a new Runtime License.</b></span></span>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<h6 style="color: blue; margin-bottom: 15px;">Stay tuned...</h6>
							<span class="normalPrompt"><b>The ezAJAX Support Forum - a Public Forum to allow all of us get the support and help we need when installing and using ezAJAX.</b><br>
						</td>
					</tr>
				</table>
			</div>
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="content_underConstruction1">
		<cfoutput>
			<div id="div_WhatsNewContentContainer" style="margin: 5px 5px 5px 5px;">
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td>
							<h1 align="center">Support Forum is Under Construction</h1>
						</td>
					</tr>
				</table>
			</div>
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="content_underConstruction2">
		<cfoutput>
			<div id="div_WhatsNewContentContainer" style="margin: 5px 5px 5px 5px;">
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td>
							<h1 align="center">Contact Us is Under Construction</h1>
						</td>
					</tr>
				</table>
			</div>
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="content_underLogo">
		<cfoutput>
			<div id="div_WhatsNewContentContainer" style="margin: 5px 5px 5px 5px;">
				<table width="100%" border="0" cellpadding="-1" cellspacing="-1">
					<tr>
						<td width="10">
							&nbsp;
						</td>
						<td width="*">
							<A HREF="http://www.download2you.com/" target="_blank"><IMG ALT="FREE Downloads, Discount Software, Freeware, Games, Submissions & More" BORDER="0" SRC="http://www.download2you.com/awards/images/5star2.gif"></A>
						</td>
					</tr>
				</table>
			</div>
		</cfoutput>
	</cfsavecontent>

	<cffunction name="content_108_1" output="No" returntype="string" access="private">
		<cfargument name="_fqServerName" type="string" required="No">
		<cfargument name="sCommunityEditionDownloadHref" type="string" required="No">

		<cfset var _html = "">
		<cfset var _folderName = "/downloads_433611211010024813/">

		<cfset ezCfDirectory('Request.qDownloadsEXE', ExpandPath(_folderName), '*')>
		<cfif ( (NOT Request.directoryError) AND (IsQuery(Request.qDownloadsEXE)) AND (Request.qDownloadsEXE.recordCount gt 0) )>
			<cfscript>
				_sql_statement = "SELECT NAME, TYPE, SIZE, DIRECTORY FROM Request.qDownloadsEXE WHERE (TYPE = 'File') AND (NAME LIKE '%.exe') ORDER BY NAME";
				ezExecSQL('Request.qDownloadsFiles', '', _sql_statement);
			</cfscript>
			<cfsavecontent variable="_html"> <!--- 108.1 --->
				<cfoutput>
					<div id="div_DownloadsContentContainer" style="margin: 5px 5px 5px 5px;">
						<table width="100%" cellpadding="-1" cellspacing="-1">
							<tr>
								<td>
									<table width="100%" cellpadding="-1" cellspacing="-1">
										<tr>
											<cfset imgName = _fqServerName & '/app/images/downloadCommunityEdition.gif'>
											<td align="center" valign="middle">
												<span class="normalx11StatusBoldClass">Windows 2003,<br>Windows XP,<br>Windows 2000</span>
											</td>
											<td align="center" valign="middle">
												<span class="normalx11StatusBoldClass">ColdFusion MX 7</span>
											</td>
											<td align="center" valign="top">
												&nbsp;
											</td>
											<cfset imgName = _fqServerName & '/app/images/downloadTrialEdition-transparent.gif'>
											<cfif ( (NOT Request.dbError) AND (IsQuery(Request.qDownloadsFiles)) AND (Request.qDownloadsFiles.recordCount gt 0) )>
												<cfset sCommunityEditionDownloadHref = _fqServerName & _folderName & Request.qDownloadsFiles.NAME>
											</cfif>
											<td align="center" valign="top">
												<span class="normalx11StatusBoldClass"><a href="#sCommunityEditionDownloadHref#" target="_blank"><img border="0" src="#imgName#"><br>Community &amp; Enterprise Editions FREE Trial Download</a></span>
											</td>
											<td align="center" valign="middle">
												<span class="normalx11StatusBoldClass">ColdFusion MX 7</span>
											</td>
											<td align="center" valign="middle">
												<span class="normalx11StatusBoldClass">Windows 2003,<br>Windows XP,<br>Windows 2000</span>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td style="border-bottom: thin solid Blue;">
									<table width="100%" cellpadding="-1" cellspacing="-1">
										<tr>
											<td align="center" valign="top" style="border-top: thin solid Blue;">
												<table width="100%" cellpadding="-1" cellspacing="-1">
													<tr>
														<td width="70%" align="left" valign="top">
															<table width="100%" cellpadding="-1" cellspacing="-1">
																<tr>
																	<td style="margin-bottom: 15px;">
																		<p align="justify" class="titlex14BoldClass" style="margin: 5px 5px 5px 5px;">Product Info
																		&nbsp;&nbsp;
																		<span class="normalx11TextClass">There are 2 ezAJAX Framework Editions you may use.  The Community Edition and the Enterprise Edition.  The Community Edition cannot be used for commercial purposes; the Enterprise Edition may be used for commercial purposes.  The Community Edition Annual License and the Enterprise Edition Annual License provides a Runtime License that allows use for 12 months at a time.  The Community Edition Perpetual License and the Enterprise Edition Perpetual License provides a renewable Runtime License that provides perpetual support for the current version you are using through all versions up to but no including the next major release.  A Perpetual License would provide a renewable Runtime License for all version up to but not including version 1.0 assuming the current version of 0.94 is the version that was registered at the time the Perpetual License was purchased.  Bug fixes will always be provided free of charge.</span></p>
																	</td>
																</tr>
																<tr>
																	<td>
																		<table width="100%" cellpadding="1" cellspacing="1">
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass">Community Edition 30-Day Trial:</span><br>
																				</td>
																				<td valign="top">
																					<span class="normalx11TextClass">Free for personal use<br>(Personal Use requires a server name of <i>localhost</i> or <i>127.0.0.1</i>; Personal Use Runtime Licenses must be requested via email and may be renewed every 30 days<br><a href="" onclick="popUpWindowForCommunityEditionLicenseAgreement(); return false;">Community Edition License Agreement</a>).</span><br>
																					<span class="normalx11TextClass">Commercial Use<br><a href="" onclick="popUpWindowForEnterpriseEditionLicenseAgreement(); return false;">Enterprise Edition License Agreement</a>).</span><br>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass"><NOBR>Community Edition Annual License:</NOBR></span>
																				</td>
																				<td valign="top">
																					<span class="normalx11TextClass"><b>$195</b>/Server&nbsp;<b>&sect;</b></span>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass"><NOBR>Enterprise Edition Annual License:</NOBR></span>
																				</td>
																				<td valign="top">
																					<span class="normalx11TextClass"><b>$495</b>/Server&nbsp;<b>&sect;</b></span>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass"><NOBR>Community Edition Perpetual License:</NOBR></span>
																				</td>
																				<td valign="top">
																					<span class="normalx11TextClass"><b>$995</b>/Server&nbsp;<b>&sect;</b></span>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass"><NOBR>Enterprise Edition Perpetual License:</NOBR></span>
																				</td>
																				<td valign="top">
																					<table width="100%">
																						<tr>
																							<td valign="top">
																								<span class="normalx11TextClass"><b>$1995</b>/Server&nbsp;<b>&sect;</b></span><br>
																							</td>
																							<td valign="top">
																								<span class="onholdStatusBoldClass"><b>Qualifying orders get a FREE ColdFusion MX 7 Server License.</b></span><br>
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td colspan="3">
																					<span class="normalx9TextClass"><b>&sect;</b>&nbsp;OEM, Partner, Educational and Volume Pricing available upon request.<br>Enterprise Edition Runtime Licenses unlock the limitations built into the Community Edition Trial Edition.</span>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
															</table>
														</td>
														<td width="*" align="center" valign="top" style="border-left: thin solid Blue;">
															<table width="100%">
																<tr>
																	<td align="center">
																		<span class="titlex14BoldClass">Demos & Tutorials</span>
																	</td>
																</tr>
																<tr>
																	<td align="left">
																		<span class="normalx12StatusBoldClass"><a href="" onclick="popUpWindowForCodeDemoWaferAnalysis(); return false;">Semiconductor Wafer Analysis Prototype</a></span>
																	</td>
																</tr>
																<tr>
																	<td align="left">
																		<span class="normalPrompt"><a href="" onclick="popUpWindowForDojoMailSample(); return false;">Dojo Toolkit Mail Sample</a></span>
																	</td>
																</tr>
																<tr>
																	<td align="left">
																		<span class="normalPrompt"><a href="" onclick="oAJAXEngine.doAJAX('performRetrieveSourceCodeFromURL', 'handleRetrieveSourceCodeFromURL', 'filename', '#_urlDojoMailSample#'); return false;">Dojo Toolkit Mail Sample (Source)</a></span>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</tr>
										</table>
									</td>
								</tr>
							</table>
					</div>
				</cfoutput>
			</cfsavecontent>
		</cfif>

		<cfreturn _html>
	</cffunction>
	
	<cffunction name="downloadsDocs" output="No" returntype="string" access="private">
		<cfargument name="_fqServerName" type="string" required="No">
		<cfargument name="_js_CF_TEMPLATE_PATH" type="string" required="No">
		<cfargument name="_folderName" type="string" required="No">

		<cfset var _html = "">
		<cfset var i = 1>
		<cfset var sColor = "">
		<cfset var _hRef = "">
		<cfset var jsCode = "">

		<cfset ezCfDirectory('Request.qDownloadsDocs', ExpandPath('/#_folderName#/'), '*')>
		<cfif ( (NOT Request.directoryError) AND (IsQuery(Request.qDownloadsDocs)) AND (Request.qDownloadsDocs.recordCount gt 0) )>
			<cfscript>
				_sql_statement = "SELECT NAME, TYPE, SIZE, DIRECTORY FROM Request.qDownloadsDocs WHERE (TYPE = 'File') ORDER BY NAME";
				ezExecSQL('Request.qDownloadsFiles', '', _sql_statement);
			</cfscript>
			<cfsavecontent variable="_html">
				<cfoutput>
					<div id="div_DownloadsDocsContentContainer" style="margin: 5px 5px 5px 5px;">
						<table width="100%" cellpadding="-1" cellspacing="-1">
							<tr class="menuTitle">
								<td align="center">
									<b>Downloads &amp; Docs</b>
								</td>
							</tr>
							<tr>
								<td>
									<table width="100%" cellpadding="-1" cellspacing="-1">
										<tr bgcolor="silver">
											<td align="center">
												<small><b>Name</b></small>
											</td>
											<td align="center">
												<small><b>Size in Bytes</b></small>
											</td>
										</tr>
										<cfif ( (NOT Request.dbError) AND (IsQuery(Request.qDownloadsFiles)) AND (Request.qDownloadsFiles.recordCount gt 0) )>
											<cfloop query="Request.qDownloadsFiles" startrow="1" endrow="#Request.qDownloadsFiles.recordCount#">
												<cfif (FindNoCase(".exe", Request.qDownloadsFiles.NAME) eq 0)>
													<cfset _hRef = _fqServerName & Replace(Mid(Request.qDownloadsFiles.DIRECTORY, FindNoCase(CGI.SERVER_NAME, Request.qDownloadsFiles.DIRECTORY) + Len(CGI.SERVER_NAME), Len(Request.qDownloadsFiles.DIRECTORY)), '\', '/', 'all') & '/' & Request.qDownloadsFiles.NAME>
													<cfscript>
														jsCode = "window.open('" & _hRef & "','downloadDocs','width=800,height=600,resizeable=yes,scrollbars=1'); return false;";
													</cfscript>
													<cfset sColor = "">
													<cfif (i MOD 2) eq 0>
														<cfset sColor = "lime">
													</cfif>
													<tr<cfif (Len(sColor) gt 0)> bgcolor="#sColor#"</cfif>>
														<td align="left">
															<span class="normalPrompt"><a href="" onclick="#jsCode#">#Request.qDownloadsFiles.NAME#</a><cfif 0> (<b>#_hRef#</b>)</cfif></span>
														</td>
														<td align="center">
															<span class="normalPrompt">#Request.qDownloadsFiles.SIZE#</span>
														</td>
													</tr>
													<cfset i = i + 1>
												</cfif>
											</cfloop>
										</cfif>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</cfoutput>
			</cfsavecontent>
		</cfif>

		<cfreturn _html>
	</cffunction>

	<cffunction name="contentSampleApps" output="No" returntype="string" access="private">
		<cfargument name="_fqServerName" type="string" required="No">

		<cfset var _html = "">

		<cfsavecontent variable="_html">
			<cfoutput>
				<div id="div_DownloadsDocsContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%" cellpadding="-1" cellspacing="-1">
						<tr class="menuTitle">
							<td align="center">
								<b>Sample Apps</b>
							</td>
						</tr>
						<tr>
							<td>
								<table width="100%" cellpadding="-1" cellspacing="-1">
									<tr>
										<td valign="top">
											<table width="100%" cellpadding="-1" cellspacing="-1">
												<tr class="menuTitle">
													<td align="center">
														<b>Sample Dojo Toolkit Apps powered by ezAJAX</b>
													</td>
												</tr>
												<tr>
													<td align="center">
														<span class="normalPrompt"><a href="" onclick="popUpWindowForDojoMailSample(); return false;">Dojo Toolkit Mail Sample</a></span>
													</td>
												</tr>
												<tr>
													<td align="center">
														<span class="normalPrompt"><a href="" onclick="oAJAXEngine.doAJAX('performRetrieveSourceCodeFromURL', 'handleRetrieveSourceCodeFromURL', 'filename', '#_urlDojoMailSample#'); return false;">Dojo Toolkit Mail Sample (Source)</a></span>
													</td>
												</tr>
											</table>
										</td>
										<td valign="top">
											<table width="100%" cellpadding="-1" cellspacing="-1">
												<tr class="menuTitle">
													<td align="center">
														<b>Sample ezAJAX Apps</b>
													</td>
												</tr>
												<tr>
													<td align="center">
														<span class="normalPrompt"><a href="" onclick="popUpWindowForCodeDemoWaferAnalysis(); return false;">Semiconductor Wafer Analysis<cfif (NOT ezIsBrowserIE())> (Works best with IE 6.x or later)</cfif></a></span>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>

		<cfreturn _html>
	</cffunction>
	
	<cffunction name="pageIndexFor" access="private" output="No" returntype="string">
		<cfargument name="pageNum" required="Yes" type="numeric">
		<cfargument name="pageMax" required="Yes" type="numeric">
		<cfset var i = -1>
		<cfset var t = "">
		<cfset var j = pageNum - 1>
		<cfset var _html = "">
		<cfsavecontent variable="_html">
			<cfoutput>
				<cfif (j eq 1)>
					<cfset t = "">
				<cfelse>
					<cfset t = j>
				</cfif>
				<span class="titlex12BoldClass">Page Index:<cfif (pageNum neq 1)>&nbsp;<a href="" onclick="sampleWeb20APIText(#t#); return false;">&lt;&lt;</a></cfif>
				<cfloop index="i" from="1" to="#pageMax#">
					&nbsp;
					<cfif (i eq 1)>
						<cfset t = "">
					<cfelse>
						<cfset t = i>
					</cfif>
					<cfif (pageNum neq i)><a href="" onclick="sampleWeb20APIText(#t#); return false;"></cfif>
					<cfif (pageNum eq i)>&lt;<u></cfif>#i#<cfif (pageNum eq i)></u>&gt;</cfif>
					<cfif (pageNum neq i)></a></cfif>
				</cfloop>
				<cfif (pageNum neq pageMax)>&nbsp;<a href="" onclick="sampleWeb20APIText(#(pageNum + 1)#); return false;">&gt;&gt;</a></cfif>
				&nbsp;<a href="" onclick="sampleWeb20APIText(0); return false;">All</a>
				</span>
			</cfoutput>
		</cfsavecontent>
		<cfreturn _html>
	</cffunction>
	
	<cffunction name="content_Web20API" access="private" output="No" returntype="string">
		<cfargument name="pageNum" required="Yes" type="numeric">

		<cfset var i = -1>
		<cfset var n = -1>
		<cfset var _html = "">
		<cfset var htmlContent = "">
		<cfset var const_numberPages_Web20API = 10>
		<cfset var ar_content_Web20API = ArrayNew(1)>
		<cfset var bool_usePageIndex = (pageNum neq 0)>
		
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API1ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<p align="justify" class="normalSiteContentTextClass">Web 2.0 API's are very easy to code using ezAJAX.<br><br>
								First, we begin by writing the ColdFusion MX 7 code for the server-side support for our Web 2.0 API. Click here to view the <a href="" onclick="oAJAXEngine.doAJAX('performRetrieveSourceCodeFromURL', 'handleRetrieveSourceCodeFromURL', 'filename', '#_urlSampleWeb20APISource#'); return false;">Sample Web 2.0 API (Source)</a>.<br><br>
								As you can see from the source code the Sample Web 2.0 API is quite simple.<br><br>
								A Struct is used to hold the data.  The ezJSONencode() function is used to convert the Struct into the JSON format and the ColdFusion &lt;cfcontent&gt; tag is used to transmit the JSON data block to the client.<br><br>
								That's all the code that is required for our Sample Web 2.0 API.<br><br>
								From the client's perspective, the following block of JSON code represents the Struct from ColdFusion:<br><br>
								The Struct <div class="codePrint">&lt;cfscript&gt;<br>aStruct = StructNew();<br>aStruct.number = 101;<br>aStruct.dataNode = 'Sample Data Node';<br>&lt;/cfscript&gt;</div>
								<span class="normalSiteContentTextClass">in JSON becomes <div class="codePrint">{"number":101,"datanode":"Sample Data Node"}</div>.</span>
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(1, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfset ar_content_Web20API[1] = htmlContent>
	
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API2ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<p align="justify" class="normalSiteContentTextClass">And now let's take a look at how to use ezAJAX to consume the Web 2.0 API we just constructed.<br><br>
								Prior to Version 0.94 ezAJAX did not have the capability to consume Web 2.0 API's but now with the advent of Version 0.94 (available for downloads now) ezAJAX can easily consume JSON based Web 2.0 API's.<br><br>
								Introducing the ezJSON JavaScript Object.<br><br>
								The ezJSON JavaScript Object is the Object you will want to use when consuming Web 2.0 API's such as for those Yahoo Web 2.0 API Samples we have posted to the site.<br><br>
								Sample use of ezJSON JavaScript Object to consume a Yahoo Web 2.0 API:&nbsp;<div class="codePrint">jsonObj = ezJSON.get$('http://local.yahooapis.com/LocalSearchService/V2/localSearch?appid=YahooDemo&query=pizza&zip=94306&results=2&output=json&callback=handleJSONCallBack');</div>
								<span class="normalSiteContentTextClass">This is all there is to it ! The ezJSON JavaScript Object makes it so completely easy to consume Web 2.0 API's.<br><br>
								Keep in mind, the fact that the ezJSON JavaScript Object does not handle scenarios where the server goes down or is offline at the moment the Web 2.0 API is invoked using this method.  We who are developers for ezAJAX have planned to make the ezJSON Web 2.0 Interface available as a standard AJAX method to be used like the &lt;iframe&gt; or xmlHttpRequest() methods.  Our ezAJAXEngine Object handles server-side failures with a lot more grace than is available to the ezJSON JavaScript Object. Beginning with ezAJAX Version 0.95 you can expect the ezJSON Cross-Domain AJAX Method to be integrated into the ezAJAXEngine for greater flexibility.<br><br>
								Sample use of ezJSON JavaScript Object to consume our Sample Web 2.0 API:&nbsp;<div class="codePrint">jsonObj = ezJSON.get$('#_urlSampleWeb20APISource#');</div>
								Again this is all it takes to consume our Sample Web 2.0 API.</span><br><br>
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(2, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfset ar_content_Web20API[2] = htmlContent>
	
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API3ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<p align="justify" class="normalSiteContentTextClass">Now let's take a look at what can be done with the ezJSON JavaScript Object after the Web 2.0 API has been invoked.<br><br>
								The ezJSON JavaScript Object allows the Script tag to be removed from the HEAD Object:&nbsp;<div class="codePrint">ezJSON.removeScriptTag(); ezJSON.remove$(jsonObj.id);</div>
								<span class="normalSiteContentTextClass">As you can see it is quite useful to dynamically remove the Script tag from the HEAD Object as a way to perform some clean-up after a Web 2.0 API has been invoked.<br><br>
								You could also use the ezJSON JavaScript Object to dynamically load JavaScript for the purpose of dynamically loading JavaScript rather than dynamically invoking Web 2.0 API's.  Some care must be taken when dynamically loading JavaScript because the JavaScript you are loading may not be loaded immediately which means the code you load using this method would need to take care of itself in terms of what actions are taken after the code has been loaded.<br><br>
								And now let's add some more server-side code to allow the Sample Web 2.0 do something more than simply return us some JSON data.  It might be interesting to show how to take the Sample ColdFusion code we posted earlier in this discussion to the next step because some of you may wish to follow in Yahoo's footsteps and create Web 2.0 API's that mimic the dunctionality of the way Yahoo likes to do things.<br><br>
								</span>
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(3, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>

		<cfset ar_content_Web20API[3] = htmlContent>
	
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API4ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<p align="justify" class="normalSiteContentTextClass">Let's add the notion of a Callback to the Sample Web 2.0 API.<br><br>
								Click here to view the <a href="" onclick="oAJAXEngine.doAJAX('performRetrieveSourceCodeFromURL', 'handleRetrieveSourceCodeFromURL', 'filename', '#_urlSampleWeb20APISource2#'); return false;">Sample Web 2.0 API with Callback (Source)</a><div class="codePrint">jsonObj = ezJSON.get$('#_urlSampleWeb20APISource2#?callback=handleJSONCallBack');</div>
								<span class="normalSiteContentTextClass">Notice the usage of the URL.callback and how we used ColdFusion to ensure this variable has a default value to ward off any errors that might be caused in case there is no Callback specified.  Notice also the conditional code that ensures no failures other than there is no Callback but we still return the JSON data block even when there is no callback.<br><br>
								This all works well enough. But now we need to do something about the scenario when there is no Callback specified by the caller of our Sample Web 2.0 API.  We need to leverage the Error Handling features that are part of the ezAJAX API.<br><br>
								It would be pretty easy to display some kind of pop-up for end end-user when no Callback has been specified using a well known JavaScript function called "alert()".  This would certainly show the end-user who may be a developer sitting there testing some code but let's get a bit fancier and let's show off the power of the ezAJAX API.<br><br>
								Click here to view the <a href="" onclick="oAJAXEngine.doAJAX('performRetrieveSourceCodeFromURL', 'handleRetrieveSourceCodeFromURL', 'filename', '#_urlSampleWeb20APISource3#'); return false;">Sample Web 2.0 API with no-Callback Error Handler (Source)</a>.
								</span>
								<div class="codePrint">&lt;cfparam name="URL.callback" type="string" default="ezAlertError"&gt;</div>
								<span class="normalSiteContentTextClass">Notice all we did was add the default value of ezAlertError to the statement above which ensures the end-user is notified whenever there is no Callback specified by the API invocation.  In case you are not using ezAJAX you can simply replace the "ezAlertError" with "alert" to achieve a similar effect without the glitz and glitter.<br><br>
								Next we will take a look at how we can further use the ezAJAX API to make our Sample Web 2.0 API more robust and able to handle server-side errors in a more graceful manner.
								</span>
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(4, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>

		<cfset ar_content_Web20API[4] = htmlContent>
	
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API5ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<p align="justify" class="normalSiteContentTextClass">Now let's take a look at how we can further use the ezAJAX API to make our Sample Web 2.0 API more robust and able to handle server-side errors in a more graceful manner.<br><br>
								Click here to view the <a href="" onclick="oAJAXEngine.doAJAX('performRetrieveSourceCodeFromURL', 'handleRetrieveSourceCodeFromURL', 'filename', '#_urlSampleWeb20APISource4#'); return false;">Sample Web 2.0 API with Robust Server-Side Error Handler (Source)</a>.<br><br>
								Notice how the &lt;cftry&gt; and &lt;cfcatch&gt; tags allows us to capture when an Error takes place on the server.  Notice also the way the Error Message is being sent back to the client for processing.  Here we are using the built-in ezAJAX Client-Side API known as "ezAlertHTMLError" that allows us to display HTML based messages in a pop-up window on the client.<br><br>
								Now let's combine everything we have learned to see how it looks at runtime.  We are using the latest version of the ezAJAX Enterprise Framework and your browser knows how to respond to our client-side API right now.<br><br>
								For this example we have taken the development of our Sample Web 2.0 API one more step forward by using a ColdFusion Query Object as the wrapper for our JSON data.  We are doing this because ColdFusion Query Objects provides a schema for the data we wish to transmit back to the client and native JSON does not provide any schema metadata which means once a JSON data block has been defined to be used for a Web 2.0 API it would be unwise to change the schema for that JSON data block assuming one did not want to possibly break the client-side code that may be consuming that JSON data block.  Never fear we will provide JavaScript code you can use to access the original ColdFusion Query Object using JavaScript as part of this discussion.<br><br>
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(5, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfset ar_content_Web20API[5] = htmlContent>
	
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API6ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<p align="justify" class="normalSiteContentTextClass">Now let's tie everything together we have discussed so far.<br><br>
								Click here to demo the <a href="" onclick="jsonObj = ezJSON.get$('#_urlSampleWeb20APISource5#?callback=handleJSONSampleAPICallback'); return false;">Sample Web 2.0 API (Demo)</a>.<br><br>
								When you click on the Demo link above you should see a pop-up window that shows the JSON data block using "ezAlert(ezObjectExplainer(jsonData))".<br><br>
								This is the JavaScript code that consumes our Sample Web 2.0 API: <div class="codePrint">jsonObj = ezJSON.get$('#_urlSampleWeb20APISource5#?callback=handleJSONSampleAPICallback');</div>
								<span class="normalSiteContentTextClass">This is what you will see in the pop-up window after the server responds with the JSON data block:</span>
								<div class="codePrint">recordcount = [1]<br>columnlist = [DATANODE,ID,NUMBER]<br>data = [DATANODE = [[Sample Data Node]],ID = [[1]],NUMBER = [[101]]]</div>
								<span class="normalSiteContentTextClass">As you can see the ezAJAX API handles the display for the JSON data object that was created from a ColdFusion Query Object.<br><br>
								Next we will take a look at the JavaScript code one can use to retrieve data elements from the JSON data block.</span>
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(6, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfset ar_content_Web20API[6] = htmlContent>
	
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API7ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<p align="justify" class="normalSiteContentTextClass">Now let's take a look at the JavaScript code one can use to retrieve data elements from the JSON data block.<br><br>
								<div class="codePrint">
	function handleJSONSampleAPICallback(jsonData) {<br>
	&nbsp;&nbsp;var i = -1;<br>
	&nbsp;&nbsp;var j = -1;<br>
	&nbsp;&nbsp;var cols = jsonData.columnlist.split(',');<br>
	&nbsp;&nbsp;var n = jsonData.recordcount;<br>
	&nbsp;&nbsp;var ele = -1;<br>
	&nbsp;&nbsp;ezAlert(ezObjectExplainer(jsonData));<br>
	&nbsp;&nbsp;ezAlert('jsonData.recordcount = [' + jsonData.recordcount + ']');<br>
	&nbsp;&nbsp;ezAlert('cols = [' + cols + ']');<br>
	&nbsp;&nbsp;ezAlert('============================================================\n');<br>
	&nbsp;&nbsp;for (i = 0; i < n; i++) {<br>
	&nbsp;&nbsp;&nbsp;&nbsp;for (j = 0; j < cols.length; j++) {<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ele = jsonData.data[cols[j]];<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ezAlert(cols[j] + '[' + i + '] = [' + ele[i] + ']');<br>
	&nbsp;&nbsp;&nbsp;&nbsp;}<br>
	&nbsp;&nbsp;&nbsp;&nbsp;ezAlert('============================================================\n');<br>
	&nbsp;&nbsp;}<br>
	}<br>
								</div>
								<span class="normalSiteContentTextClass">Next we will take a look at the output from the JavaScript code listed above.</span>
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(7, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfset ar_content_Web20API[7] = htmlContent>
	
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API8ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<p align="justify" class="normalSiteContentTextClass">Now let's take a look at the output from the JavaScript code that was listed on the previous page.<br><br>
								<div class="codePrint">
	recordcount = [2]<br>
	columnlist = [DATANODE,ID,NUMBER]<br>
	data = [DATANODE = [[Sample Data Node 1],[Sample Data Node 2]],ID = [[1],[2]],NUMBER = [[101],[102]]]<br>
	jsonData.recordcount = [2]<br>
	cols = [DATANODE,ID,NUMBER]<br>
	DATANODE[0] = [Sample Data Node 1]<br>
	ID[0] = [1]<br>
	NUMBER[0] = [101]<br>
	============================================================<br>
	<br>
	DATANODE[1] = [Sample Data Node 2]<br>
	ID[1] = [2]<br>
	NUMBER[1] = [102]<br>
	============================================================<br>
								</div>
								<span class="normalSiteContentTextClass">Next we will take a look at the output when there is an error from the server.</span>
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(8, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfset ar_content_Web20API[8] = htmlContent>
	
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API9ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<p align="justify" class="normalSiteContentTextClass">Now let's take a look at the output when there is an error from the server.<br><br>
								Click here to demo the <a href="" onclick="jsonObj = ezJSON.get$('#_urlSampleWeb20APISource6#?callback=handleJSONSampleAPICallback'); return false;">Sample Web 2.0 API (Server Error Demo)</a>.<br><br>
								When you click on the Demo link above you should see a pop-up window that shows what happens when there was a server-side error.  You will see a very familiar ColdFusion Dump for a ColdFusion Error.  This makes the error handling process much easier because you get to see what you are already familiar with, a standard ColdFusion Error Dump.<br><br>
								Take a look at the JavaScript code that handles both the error condition as well as the nominal condition when there are no errors:
								<div class="codePrint">
	function handleJSONSampleAPICallback(jsonData) {<br>
	&nbsp;&nbsp;var i = -1;<br>
	&nbsp;&nbsp;var j = -1;<br>
	&nbsp;&nbsp;var cols = jsonData.columnlist.split(',');<br>
	&nbsp;&nbsp;var n = jsonData.recordcount;<br>
	&nbsp;&nbsp;var ele = -1;<br>
	&nbsp;&nbsp;if (jsonData.columnlist.toUpperCase().indexOf('ERRORMSG') > -1) {<br>
	&nbsp;&nbsp;&nbsp;&nbsp;ele = jsonData.data['ERRORMSG'];<br>
	&nbsp;&nbsp;&nbsp;&nbsp;ezAlertHTMLError(ele[0]);<br>
	&nbsp;&nbsp;} else {<br>
	&nbsp;&nbsp;&nbsp;&nbsp;ezAlert(ezObjectExplainer(jsonData));<br>
	&nbsp;&nbsp;&nbsp;&nbsp;ezAlert('jsonData.recordcount = [' + jsonData.recordcount + ']');<br>
	&nbsp;&nbsp;&nbsp;&nbsp;ezAlert('cols = [' + cols + ']');<br>
	&nbsp;&nbsp;&nbsp;&nbsp;ezAlert('============================================================\n');<br>
	&nbsp;&nbsp;&nbsp;&nbsp;for (i = 0; i < n; i++) {<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;for (j = 0; j < cols.length; j++) {<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ele = jsonData.data[cols[j]];<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ezAlert(cols[j] + '[' + i + '] = [' + ele[i] + ']');<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ezAlert('============================================================\n');<br>
	&nbsp;&nbsp;&nbsp;&nbsp;}<br>
	&nbsp;&nbsp;}<br>
	}<br>
								</div>
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(9, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfset ar_content_Web20API[9] = htmlContent>
	
		<cfsavecontent variable="htmlContent">
			<cfoutput>
				<div id="div_Web20API10ContentContainer" style="margin: 5px 5px 5px 5px;">
					<table width="100%">
						<tr>
							<td>
								<span class="titleSmallBlackBoldClass">Conclusion:</span>
								<p align="justify" class="normalSiteContentTextClass">
								ezAJAX provides a robust solution for your Web 2.0 API development needs.<br><br>
								ezAJAX supports cross-domain Web 2.0 that uses JSON.<br><br>
								Now get out there and begin coding your own Web 2.0 API's using ezAJAX.
								</p>
							</td>
						</tr>
						<cfif (bool_usePageIndex)>
							<tr>
								<td align="right">
									#pageIndexFor(10, const_numberPages_Web20API)#
								</td>
							</tr>
						</cfif>
					</table>
				</div>
			</cfoutput>
		</cfsavecontent>
		
		<cfset ar_content_Web20API[10] = htmlContent>
		
		<cfscript>
			switch (pageNum) {
				case 0:
					n = ArrayLen(ar_content_Web20API);
					for (i = 1; i lte n; i = i + 1) {
						_html = _html & ar_content_Web20API[i];
					}
				break;
				
				default:
					try {
						_html = ar_content_Web20API[pageNum];
					} catch (Any e) {
						_html = '*** UNDEFINED ***';
					}
				break;
			}
		</cfscript>

		<cfreturn _html>
	</cffunction>

	<cfscript>
		function _userDefinedContent(id, _fqServerName, js_CF_TEMPLATE_PATH, sCommunityEditionDownloadHref) {
			var _data = '';
			try {
				switch (URLDecode(id)) {
					case 'Whats New':
						_data = content_107_1;
					break;

					case 'Whats Is':
						_data = content_101_1;
					break;
					
					case 'JSON Support':
						_data = content_107_1a;
					break;
					
					case 'Features':
						_data = content_105_1;
					break;
					
					case 'Installation':
						_data = content_102_3;
					break;
					
					case 'content_104_1':
						_data = content_104_1;
					break;
					
					case 'content_104_2':
						_data = content_104_2;
					break;
					
					case 'content_104_3':
						_data = content_104_3;
					break;
					
					case 'Runtime Licenses':
						_data = content_106_1;
					break;
					
					case 'Support Forum':
						_data = content_underConstruction1;
					break;
					
					case 'Contact Us':
						_data = contactUsContent;
					break;
					
					case 'Under Logo':
						_data = content_underLogo;
					break;
					
					case 'Download Docs':
						_data = downloadsDocs(_fqServerName, js_CF_TEMPLATE_PATH, 'downloads_433611211010024813');
					break;
					
					case 'Downloads':
						_data = content_108_1(_fqServerName, sCommunityEditionDownloadHref);
					break;
					
					case 'Sample Apps':
						_data = contentSampleApps(_fqServerName);
					break;
					
					case 'Yahoo Search V2':
						_data = content_YahooSearchV2;
					break;
					
					case 'Web20APIall':
						_data = content_Web20API(0);
					break;

					case 'Web20API1':
						_data = content_Web20API(1);
					break;

					case 'Web20API2':
						_data = content_Web20API(2);
					break;

					case 'Web20API3':
						_data = content_Web20API(3);
					break;

					case 'Web20API4':
						_data = content_Web20API(4);
					break;

					case 'Web20API5':
						_data = content_Web20API(5);
					break;

					case 'Web20API6':
						_data = content_Web20API(6);
					break;

					case 'Web20API7':
						_data = content_Web20API(7);
					break;

					case 'Web20API8':
						_data = content_Web20API(8);
					break;

					case 'Web20API9':
						_data = content_Web20API(9);
					break;

					case 'Web20API10':
						_data = content_Web20API(10);
					break;

					default:
						_data = '*** Unknown ***';
					break;
				}
			} catch (Any e) {
				_data = '*** ERROR ***' & '<br>' & ezExplainError(e, true);
			}
			return _data;
		}
		
		function _userDefinedAJAXFunctions(qryStruct) {
			var _content = '';
			var _fqServerName = '';
			var js_CF_TEMPLATE_PATH = '';
			var sCommunityEditionDownloadHref = '';
			try {
				switch (qryStruct.ezCFM) {
					case 'performPopulateContentFor':
						if (IsDefined("qryStruct.namedArgs.aName")) {
							qObj = QueryNew('id, CONTENT');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							if (IsDefined("qryStruct.namedArgs._fqServerName")) {
								_fqServerName = qryStruct.namedArgs._fqServerName;
							}
							if (IsDefined("qryStruct.namedArgs.js_CF_TEMPLATE_PATH")) {
								js_CF_TEMPLATE_PATH = qryStruct.namedArgs.js_CF_TEMPLATE_PATH;
							}
							if (IsDefined("qryStruct.namedArgs.sCommunityEditionDownloadHref")) {
								sCommunityEditionDownloadHref = qryStruct.namedArgs.sCommunityEditionDownloadHref;
							}
							_content = _userDefinedContent(qryStruct.namedArgs.aName, _fqServerName, js_CF_TEMPLATE_PATH, sCommunityEditionDownloadHref);
							QuerySetCell(qObj, 'CONTENT', _content, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.ezCFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (aName)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
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
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		}
	</cfscript>
</cfcomponent>
