<cfcomponent displayname="performPopulateContentFor" output="No" extends="userDefinedAJAXFunctions">
	<cfset cf_buttonClass = "buttonClass">
	<cfif (ezIsBrowserFF() OR ezIsBrowserFF())>
		<cfset cf_buttonClass = cf_buttonClass & "FF">
	</cfif>

	<cfset _urlWaferAnalysis = "">
	<cfset cf_CodeDemoWaferAnalysis = "">

	<cfscript>
		_waferAnalysisServer = 'laptop.halsmalltalker.com';
		if (FindNoCase('.ez-ajax.com', CGI.SERVER_NAME) gt 0) {
			_waferAnalysisServer = 'rabid.contentopia.net';
		}
		_urlWaferAnalysis = Request.commonCode.ezClusterizeURL('http://#_waferAnalysisServer#/blog/samples/semiconductors/wafer-analysis/index.cfm') & '?sessID=#Session.sessID#';
		cf_CodeDemoWaferAnalysis = "window.open('#_urlWaferAnalysis#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";
	</cfscript>

	<cfscript>
		_urlDojoMailSample = 'http://#CGI.SERVER_NAME#/dojo-0.3.1-ajax/demos/widget/mail.html';
		cf_urlDojoMailSample = "window.open('#_urlDojoMailSample#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";

		Request.supportEmailAddress = 'support@ez-ajax.com';
		Request.salesEmailAddress = 'sales@ez-ajax.com';

		qFeatures = QueryNew('id, sFeature, sCheck');
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>10,000+ Lines of Robust Reusable Code you can Redistribute with YOUR Application.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Runtime Licensing System - allows Trialware to be easily created.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>ezLicenser#cf_trademarkSymbol# System - allows you to easily create and distribute Runtime Licenses for your 3rd party customers.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', '<b>ezCompiler#cf_trademarkSymbol# System - allows you to easily create "compiled" obfuscated JavaScript payloads for your code using our unique "secure" JavaScript compiler.</b>', qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine provides support for using Hidden &lt;IFRAME&gt; AND XmlHttpRequest dynamically and interchangeably.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine automatically uses Hidden &lt;IFRAME&gt; OR XmlHttpRequest based on the client browser type.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine allows Hidden &lt;IFRAME&gt; OR XmlHttpRequest to be used based on the programmer's preferences.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine provides support for using GET AND POST methods dynamically and interchangeably.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine automatically uses GET OR POST method based on the amount of data being sent to the server.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine automatically handles and reports ColdFusion Errors for AJAX Server Commands.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine automatically allows one ColdFusion Query Object to be returned from the AJAX Server.  The Enterprise Edition is not limited to returning only one ColdFusion Query Object from the AJAX Server.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine handles Server-Side errors such as the server being down with automatic failover to a Call-Back function to allow the client to respond to this type of error in a graceful manner.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX Engine handles Client-Side JavaScript errors in a graceful manner - this reduces your coding effort by allowing you as the developer to focus on correcting errors before your code is deployed.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our JavaScript API supports the ability to cache ColdFusion Query Objects that are returned from the server. Cached Query Objects can be queried from the client using our unique client based JavaScript API.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our AJAX server automatically interfaces with our AJAX Engine running on the client regardless of which options or features are being used by the programmer.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our API provides more than 1 MegaByte of compiled ColdFusion MX 7 code you can reuse and redistribute.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
		QueryAddRow(qFeatures, 1);
		QuerySetCell(qFeatures, 'id', qFeatures.recordCount, qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sFeature', "<b>Our API fully supports the &lt;cfquery&gt; tag for both SQL DBMS Queries and Query of Queries with automatic error recovery and automatic error reporting.</b>", qFeatures.recordCount);
		QuerySetCell(qFeatures, 'sCheck', "<b>X</b>", qFeatures.recordCount);
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
			<p align="justify" class="normalSiteContentTextClass">We give you more than 10,000 lines of code that is already debugged and ready to use.  Our entire Framework is one AJAX Sample App to which you make minor adjustments.  All you need to do after installing ezAJAX is begin coding your application logic.</p>
			<p align="justify" class="normalSiteContentTextClass">When it comes time for you to sell your AJAX App to 3rd parties we can provide you with Runtime Licenses that allow you to redistribute our Framework with your application logic.  This gives you a clear advantage in the marketplace because you are able to easily produce Limited-Use Trial Apps that allow your potential customers to test-drive your applications before they make a purchase.</p>
			<p align="justify" class="normalSiteContentTextClass">Let us do all the work for <u>you</u>!</p>
			<div id="div_linesOfCodeContent">
				<p class="normalSiteContentTextClass">More than 4000 lines of Reusable JavaScript code AND more than 6000 lines of Reusable ColdFusion MX 7 code.  Best of all YOU can Redistribute the whole Reusable Framework with YOUR code using our powerful Runtime Licensing System that protects YOUR Intellectual Property Rights while making it easy for YOU to create Trial Editions of your Applications that can easily be made into Enterprise Editions simply by issuing a Runtime License using our ezLicenser#cf_trademarkSymbol# product.</p>
			</div>
			<p align="justify" class="normalSiteContentTextClass">Work less !  Deploy more AJAX Apps in less time !  We do all the hard work for you !  You do very little work !  Save your boss time and money !  Get your AJAX Apps deployed in less time !  You begin every single project with 10,000 lines of code already written !  How long would it take you to write 10,000 lines of code ?  It takes less than <a href="" onclick="try { installationText(); } catch(e) { } finally { }; return false;">2 minutes to install</a> this product and begin using it.</p>
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
	<br><br>(2b). The first question prompts you for your valid Internet email address.  This is the email address where you will receive the Runtime License we will send to you once the Registration Process has successfully created a Runtime License for your physical server.  There is a limit of one Runtime License per physical server for the Trial period.  You may purchase a Perpetual Runtime Licenses that are less restrictive however each Runtime License will specific one domain name or server name for each physical server.  Contact our Sales Department (sales@ez-ajax.com) for whatever your Runtime Licensing needs may be and we will take care of your specific needs.
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
						<span class="normalSmallPrompt">ezAJAX Community Edition Features</span>
					</td>
				</tr>
				<tr>
					<td>
						<div style="overflow: auto; height: 410px;">
							<table width="100%" cellpadding="-1" cellspacing="-1">
								<cfset colorL = "white">
								<cfset colorR = "white">
								<cfloop query="qFeatures" startrow="1" endrow="#qFeatures.recordCount#">
									<tr>
										<td width="90%" bgcolor="#colorL#" align="left">
											<span class="featuresText">#qFeatures.sFeature#</span>
										</td>
										<td width="10%" bgcolor="#colorR#" align="center">
											<span class="featuresText">#qFeatures.sCheck#</span>
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
																<a href="" title="This site has been determined to be 100% Safe from Hacker intrusions and is protected by our state-of-the-art anti-hacker protection system known as 'Hacker Dog'#cf_trademarkSymbol#." onmouseover="handleOnMouseOverLinkSpan('span_hackerSafe');" onmouseout="handleOnMouseOutLinkSpan('span_hackerSafe');" onclick="popUpWindowForURL(window.location.protocol + '//' + window.location.hostname + '/app/hackerSafe.html', 'hackerSafe', 700, 550, false, true); return false;" style="color: black;"><span id="span_hackerSafe"><img src="app/images/Hacker Dog (small).gif" width="113" height="56" border="0"><br>(#DateFormat(Now(), "medium")# #TimeFormat(Now(), "short")#)</span></a>
																</span>
															</td>
															<td>
																<!-- Begin Official PayPal Seal --><a href="" onclick="popUpWindowForURL('https://www.paypal.com/us/verified/pal=sales%40ez%2dajax%2ecom', 'paypalVerification', 700, 550, false, true); return false;"><span id="span_verifiedPaypal"><img src="http://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal"></span></A><!-- End Official PayPal Seal -->
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

	<cfsavecontent variable="content_107_1"> <!--- 107.1 --->
		<cfoutput>
			<div id="div_WhatsNewContentContainer" style="margin: 5px 5px 5px 5px;">
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td>
							<h6 style="color: blue; margin-bottom: 15px;">What's New ?</h6>
							<span class="normalPrompt"><b>ezAJAX has an expanded <a href="" onclick="try { downloadsDocsText(); } catch(e) { } finally { }; return false;">Programmer's Guide with a Tutorial Primer</a> that explains how to use ezAJAX after it has been installed.</b></span>
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
							<p align="justify" class="normalPrompt"><b>ezAJAX Version 0.93 is now ready for downloads and is 100% compatible with <a href="" onclick="try { sampleAppsText(); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a></b>&nbsp;
							You can <a href="" onclick="#cf_urlDojoMailSample#; return false;">view our Dojo Sample - the Mail Sample Application</a> as taken from <a href="" onclick="try { sampleAppsText(); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a>.<cfif (ezIsBrowserIE())><br><cfelse>&nbsp;&nbsp;</cfif>
							It was quite easy to integrate ezAJAX with <a href="" onclick="try { sampleAppsText(); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a> - ezAJAX offers a superior AJAX Engine that compliments the slick GUI effects found in <a href="" onclick="try { sampleAppsText(); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a>.
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<h6 style="color: blue; margin-bottom: 15px;">Ready Now !</h6>
							<span class="normalPrompt"><b>ezAJAX Version 0.93 includes the following:</b><br>
							<b>GUI Support for Tabbed Interfaces like the one you are interacting with now.</b></span>
							<cfset tb_width = 190>
							<cfif (ezIsBrowserFF())>
								<cfset tb_width = 240>
							</cfif>
							#showThoughtBubbleUsingCF('<font size="1">This is an exmaple of a static Thought Bubble...</font>', tb_width)#
							<span class="normalPrompt"><b>GUI Support for Thought Bubbles like the one you can see here or the one that appears when your mouse hovers over <a id="anchor_thoughtBubbleSample" name="anchor_thoughtBubbleSample" href="" title="This is a sample of a thought bubble that appears dynamically." onmouseover="ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, 220, -100, ((ezAJAXEngine.browser_is_ff) ? -15 : -10)); return false;" onmouseout="ezThoughtBubbleObj.dismissThoughtBubbleForAnchor(this.id); return false;">this anchor</a>.</b></span>
							<br><br>
							<span class="normalPrompt"><b>Both the Enterprise and Community Editions are combined for easier upgrading to allow those who want to use the Trial Edition move up to the Enterprise Edition simply by purchasing a new Runtime License.</b></span></span>
						</td>
					</tr>
					<tr>
						<td>
							<br>
							<h6 style="color: blue; margin-bottom: 15px;">Coming Soon...</h6>
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
																		<span class="titlex14BoldClass">Product Info</span>
																		&nbsp;&nbsp;&nbsp;&nbsp;
																		<span class="normalx11TextClass">There are 2 ezAJAX Framework Editions you may use.  The Community Edition Annual License and the Community Edition Perpetual License.  The Community Edition Annual License cannot be used for Commercial purposes and it has some limitations.  The Community Edition Perpetual License can be used for certain Commercial purposes but without the limitations in the Community Edition Annual License.</span>
																	</td>
																</tr>
																<tr>
																	<td>
																		<table width="100%" cellpadding="1" cellspacing="1">
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass">Community Edition 30-Day Trial:</span>
																				</td>
																				<td valign="top">
																					<span class="normalx11TextClass">Free for personal use<br>(Personal Use requires a server name of <i>localhost</i> or <i>127.0.0.1</i><br><a href="" onclick="popUpWindowForURL(js_urlCommunityEditionLicenseAgreement, 'CommunityEditionLicenseAgreement', 800, 550, true); return false;">Community Edition License Agreement</a>).</span><br>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass">Community Edition Annual License:</span>
																				</td>
																				<td valign="top">
																					<span class="normalx11TextClass"><b>$195</b>/Server&nbsp;<b>&sect;</b></span>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass">Enterprise Edition Annual License:</span>
																				</td>
																				<td valign="top">
																					<span class="normalx11TextClass"><b>$495</b>/Server&nbsp;<b>&sect;</b></span>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass">Community Edition Perpetual License:</span>
																				</td>
																				<td valign="top">
																					<span class="normalx11TextClass"><b>$995</b>/Server&nbsp;<b>&sect;</b></span>
																				</td>
																			</tr>
																			<tr>
																				<td valign="top">
																					<span class="titlex12BlackBoldClass">Enterprise Edition Perpetual License:</span>
																				</td>
																				<td valign="top">
																					<span class="normalx11TextClass"><b>$1995</b>/Server&nbsp;<b>&sect;</b></span>
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
															<span class="titlex14BoldClass">Demos & Tutorials</span>
															<br>
															<span class="normalx12StatusBoldClass"><a href="" onclick="#cf_CodeDemoWaferAnalysis#; return false;">Semiconductor Wafer Analysis Prototype</a></span>
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

		<cfset var _urlDojoMailSample = 'http://#CGI.SERVER_NAME#/dojo-0.3.1-ajax/demos/widget/mail.html'>
		<cfset var cf_urlDojoMailSample = "window.open('#_urlDojoMailSample#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')">

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
														<b>Sample Dojo Apps powered by ezAJAX</b>
													</td>
												</tr>
												<tr>
													<td align="center">
														<span class="normalPrompt"><a href="" onclick="#cf_urlDojoMailSample#; return false;">Dojo Mail Sample</a></span>
													</td>
												</tr>
												<tr>
													<td align="center">
														<span class="normalPrompt"><a href="" onclick="oAJAXEngine.doAJAX('performRetrieveSourceCodeFromURL', 'handleRetrieveSourceCodeFromURL', 'filename', '#_urlDojoMailSample#'); return false;">Dojo Mail Sample (Source)</a></span>
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
														<span class="normalPrompt"><a href="" onclick="#cf_CodeDemoWaferAnalysis#; return false;">Semiconductor Wafer Analysis<cfif (NOT ezIsBrowserIE())> (Works best with IE 6.x or later)</cfif></a></span>
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

	<cfscript>
		function _userDefinedAJAXFunctions(qryStruct) {
			try {
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
								
								case 'Features':
									QuerySetCell(qObj, 'CONTENT', content_105_1, qObj.recordCount);
								break;
								
								case 'Installation':
									QuerySetCell(qObj, 'CONTENT', content_102_3, qObj.recordCount);
								break;
								
								case 'content_104_1':
									QuerySetCell(qObj, 'CONTENT', content_104_1, qObj.recordCount);
								break;
								
								case 'content_104_2':
									QuerySetCell(qObj, 'CONTENT', content_104_2, qObj.recordCount);
								break;
								
								case 'content_104_3':
									QuerySetCell(qObj, 'CONTENT', content_104_3, qObj.recordCount);
								break;
								
								case 'Runtime Licenses':
									QuerySetCell(qObj, 'CONTENT', content_106_1, qObj.recordCount);
								break;
								
								case 'Support Forum':
									QuerySetCell(qObj, 'CONTENT', content_underConstruction1, qObj.recordCount);
								break;
								
								case 'Contact Us':
									QuerySetCell(qObj, 'CONTENT', content_underConstruction2, qObj.recordCount);
								break;
								
								case 'Under Logo':
									QuerySetCell(qObj, 'CONTENT', content_underLogo, qObj.recordCount);
								break;
								
								case 'Download Docs':
									if ( (IsDefined("qryStruct.namedArgs._fqServerName")) AND (IsDefined("qryStruct.namedArgs.js_CF_TEMPLATE_PATH")) ) {
										QuerySetCell(qObj, 'CONTENT', downloadsDocs(qryStruct.namedArgs._fqServerName, qryStruct.namedArgs.js_CF_TEMPLATE_PATH, 'downloads_433611211010024813'), qObj.recordCount);
									} else {
										writeOutput(ezCfDump(qryStruct, 'qryStruct', false));
										QuerySetCell(qObj, 'CONTENT', '*** ERROR ***', qObj.recordCount);
									}
								break;
								
								case 'Downloads':
									if ( (IsDefined("qryStruct.namedArgs._fqServerName")) AND (IsDefined("qryStruct.namedArgs.sCommunityEditionDownloadHref")) ) {
										QuerySetCell(qObj, 'CONTENT', content_108_1(qryStruct.namedArgs._fqServerName, qryStruct.namedArgs.sCommunityEditionDownloadHref), qObj.recordCount);
									} else {
										writeOutput(ezCfDump(qryStruct, 'qryStruct', false));
										QuerySetCell(qObj, 'CONTENT', '*** ERROR ***', qObj.recordCount);
									}
								break;
								
								case 'Sample Apps':
									if ( (IsDefined("qryStruct.namedArgs._fqServerName")) AND (IsDefined("qryStruct.namedArgs.sCommunityEditionDownloadHref")) ) {
										QuerySetCell(qObj, 'CONTENT', contentSampleApps(qryStruct.namedArgs._fqServerName), qObj.recordCount);
									} else {
										writeOutput(ezCfDump(qryStruct, 'qryStruct', false));
										QuerySetCell(qObj, 'CONTENT', '*** ERROR ***', qObj.recordCount);
									}
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
