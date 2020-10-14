<cfcomponent displayname="userDefinedAJAXFunctions" output="No" extends="ezAjaxCode">

	<cffunction name="retrievePodContentByName" access="public" returntype="string">
		<cfargument name="_aPodName_" type="any" required="yes">

		<cfsavecontent variable="_html">
			<cfoutput>
				<cftry>
					<cfinclude template="/#ListFirst(CGI.SCRIPT_NAME, '/')#/includes/pods/#_aPodName_#">
					<cfcatch type="Any">
					</cfcatch>
				</cftry>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn _html>
	</cffunction>

	<cffunction name="do_resentProductRegistrationNotice" access="public" returntype="string">
		<cfset var _html = "">

		<cfsavecontent variable="_html">
			<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>&copy; Hierarchical Applications Limited, All Rights Reserved.</title>
	</head>
	
	<body>
	
	<H3 style="color: blue;">Congratulations Again on successfully Registering your copy of exAJAX&##8482 Community Edition Framework</H3>
	
	<small>Your Runtime License file is attached.  Be sure you save this file as "runtimeLicense.dat" and place it in the root folder where you installed exAJAX&##8482 Community Edition Framework.</small><br>
	<small>If you encounter any problems or you cannot find the attached file then contact our Support Department at support@ez-ajax.com for help with your issues.</small>
	
	</body>
	</html>
			</cfoutput>
		</cfsavecontent>
		
		<cfreturn _html>
	</cffunction>
	
	<cfsavecontent variable="dojoEmailContent1">
		<cfoutput>
<table width=100% style="border: 1px;">
<tr class="header"><td>Sender</td><td>Subject</td><td>Date</td></tr>
<tr onClick='displayMessage("Meeting");'><td>Arlen Adams</td><td>today's meeting</td><td>2006-02-15</td></tr>
<tr onClick='displayMessage("RemainingWork");'><td>Bobby Baxter</td><td>remaining work</td><td>2004-11-13</td></tr>
<tr onClick='displayMessage("Lunch");'><td>Cory Crown</td><td>lunch</td><td>2003-10-10</td></tr>
<tr onClick='displayMessage("Paint");'><td>Miles Davis</td><td>paint</td><td>2002-07-14</td></tr>
</table>
		</cfoutput>
	</cfsavecontent>

	<cfscript>
		cf_trademarkSymbol = '&##8482';
		_urlDojoMailSample = 'http://#CGI.SERVER_NAME#/dojo-0.3.1-ajax/demos/widget/mail.html';
		cf_urlDojoMailSample = "window.open('#_urlDojoMailSample#','samples1','width=' + ezClientWidth() + ',height=' + ezClientHeight() + ',resizeable=yes,scrollbars=1')";
	</cfscript>

	<cfsavecontent variable="content_107_1"> <!--- 107.1 --->
		<cfoutput>
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
						You can <a href="" onclick="#cf_urlDojoMailSample#; return false;">view our Dojo Sample - the Mail Sample Application</a> as taken from <a href="" onclick="try { oTabSystem1.activateTab(sampleAppsTab); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a>.<cfif (ezIsBrowserIE())><br><cfelse>&nbsp;&nbsp;</cfif>
						It was quite easy to integrate ezAJAX#cf_trademarkSymbol# with <a href="" onclick="try { oTabSystem1.activateTab(sampleAppsTab); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a> - ezAJAX#cf_trademarkSymbol# offers a superior AJAX Engine that compliments the slick GUI effects found in <a href="" onclick="try { oTabSystem1.activateTab(sampleAppsTab); } catch(e) { } finally { }; return false;">Dojo 0.3.1</a>.
						</p>
					</td>
				</tr>
			<cfif 0>
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
						#showThoughtBubbleUsingCF('<font size="1">This is an exmaple of a static Thought Bubble...</font>', tb_width)#
						<span class="normalPrompt"><b>GUI Support for Thought Bubbles like the one you can see here or the one that appears when your mouse hovers over <a id="anchor_thoughtBubbleSample" name="anchor_thoughtBubbleSample" href="" title="This is a sample of a thought bubble that appears dynamically." onmouseover="ezThoughtBubbleObj.showThoughtBubbleForAnchor(this.id, 220, -100, ((ezAJAXEngine.browser_is_ff) ? -15 : -10)); return false;" onmouseout="ezThoughtBubbleObj.dismissThoughtBubbleForAnchor(this.id); return false;">this anchor</a>.</b></span>
					</td>
				</tr>
			</cfif>
			</table>
		</cfoutput>
	</cfsavecontent>

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
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
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
			ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
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
			ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
		}

		Request.ezAJAX_DSN = 'ezAJAX-Registrations';
		Request.ezAJAX_Newsletters_DSN = 'ezAJAX-Newsletters';

		function ConstructListOfUniqueCustomers(inQ) {
			var i = -1;
			var n = -1;
			var j = -1;
			var m = -1;
			var ar = ArrayNew(1);
			var ar2 = -1;
			var outQ = -1;
			if ( (IsDefined("inQ")) AND (IsQuery(inQ)) ) {
				outQ = QueryNew(inQ.columnList);
				ar2 = ListToArray(inQ.columnList, ',');
				m = ArrayLen(ar2);
				n = inQ.recordCount;
				for (i = 1; i lte n; i = i + 1) {
					if (ListFindNoCase(ArrayToList(ar, ','), inQ.username[i], ',') eq 0) {
						QueryAddRow(outQ, 1);
						for (j = 1; j lte m; j = j + 1) {
							QuerySetCell(outQ, ar2[j], inQ[ar2[j]][i], outQ.recordCount);
						}
						ar[ArrayLen(ar) + 1] = inQ.username[i];
					}
				}
			}
			return outQ;
		}
				
		function monthNameAbbrev(mmm) {
			var mmmAR = ArrayNew(1);
			mmmAR[1] = 'Jan';
			mmmAR[2] = 'Feb';
			mmmAR[3] = 'Mar';
			mmmAR[4] = 'April';
			mmmAR[5] = 'May';
			mmmAR[6] = 'June';
			mmmAR[7] = 'July';
			mmmAR[8] = 'Aug';
			mmmAR[9] = 'Sept';
			mmmAR[10] = 'Oct';
			mmmAR[11] = 'Nov';
			mmmAR[12] = 'Dec';
			if ( (mmm gte 1) AND (mmm lte 12) ) {
				return mmmAR[mmm];
			}
			return '';
		}
		
		function getFirstWeekPAD(firstDOW) {
			var firstWeekPad = 0;
			var weekStartsOn = application.localeutils.weekStarts();
			switch (weekStartsON) {
				case 1:
					firstWeekPAD = firstDOW - 1;
				break;
				case 2:
					firstWeekPAD = firstDOW - 2;
					if (firstWeekPAD LT 0) firstWeekPAD = firstWeekPAD + 7; // handle leap years
				break;
				case 7:
					firstWeekPAD = 7 - abs(firstDOW - 7);
					if (firstWeekPAD EQ 7) firstWeekPAD = 0;
				break;
			}
			return firstWeekPAD;
		}
		
		function getCategoryIDFromName(catName) {
			sqlStatement = "select categoryid from tblblogcategories where categoryname = '#catName#' and blog = '#application.blog.instance.name#'";
			ezExecSQL('Request.getCatID', application.blog.instance.dsn, sqlStatement);

			if (NOT Request.dbError) {
				return Request.getCatID.categoryid;
			} else {
				return '';
			}
		}
		
		function getBlogArticles(params, qryStruct) {
			var i = -1;
			var sMsg = '';
			var qObj = -1;
			var allowTB = -1;
			var postedat = -1;
			var postedby = -1;
			var ar_ROWID = -1;
			var maxEntries = -1;
			var sqlStatement = -1;
			var ar_POSTEDLONG = -1;
			var relatedcategories = -1;
			
			if ( (IsStruct(params)) AND (IsStruct(qryStruct)) ) {
				if (IsDefined("params.lastXDays")) {
					try {
						Request.articles = application.blog.getEntries(params);
						while (Request.articles.recordCount eq 0) {
							params.lastXDays = params.lastXDays + 30;
							if (params.lastXDays gt 360) {
								break;
							}
							Request.articles = application.blog.getEntries(params);
						}
					} catch (Any e) {
					}
				} else {
					Request.articles = application.blog.getEntries(params);
				}
				maxEntries = -1;
				if ( (IsDefined("qryStruct.namedArgs.maxEntries")) AND (IsNumeric(qryStruct.namedArgs.maxEntries)) ) {
					maxEntries = qryStruct.namedArgs.maxEntries;
				}
	
				ar_POSTEDLONG = ArrayNew(1);
				for (i = 1; i lte Request.articles.recordCount; i = i + 1) {
					ar_POSTEDLONG[ArrayLen(ar_POSTEDLONG) + 1] = application.localeUtils.datetimeLocaleFormat(Request.articles.POSTED[i], "long", "long");
				}
				QueryAddColumn(Request.articles, 'POSTEDLONG', 'Time', ar_POSTEDLONG);
					
				if ( (maxEntries gt -1) AND (Request.articles.recordCount gt maxEntries) ) {
					ar_ROWID = ArrayNew(1);
					for (i = 1; i lte Request.articles.recordCount; i = i + 1) {
						ar_ROWID[ArrayLen(ar_ROWID) + 1] = i;
					}
					QueryAddColumn(Request.articles, 'ROWID', 'integer', ar_ROWID);
	
					sqlStatement = "SELECT * FROM Request.articles WHERE (ROWID <= #maxEntries#)";
					ezExecSQL('Request.articles2', '', sqlStatement);
	
					if (NOT Request.dbError) {
						for (i = 1; i lte Request.articles2.recordCount; i = i + 1) {
							Request.articles2.posted[i] = application.localeUtils.dateLocaleFormat(Request.articles2.posted[i]);
							Request.articles2.body[i] = application.blog.renderEntry(Request.articles2.body[i]);
						}
						ezRegisterQueryFromAJAX(Request.articles2); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
					} else {
						qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
						QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
						QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
						QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
					}
				} else {
					for (i = 1; i lte Request.articles.recordCount; i = i + 1) {
						Request.articles.posted[i] = application.localeUtils.dateLocaleFormat(Request.articles.posted[i]);
						Request.articles.body[i] = application.blog.renderEntry(Request.articles.body[i]);
					}
					ezRegisterQueryFromAJAX(Request.articles); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
				}
	
				allowTB = application.blog.getProperty("allowtrackbacks");
				postedat = application.resourceBundle.getResource("postedat");
				postedby = application.resourceBundle.getResource("postedby");
				relatedcategories = application.resourceBundle.getResource("relatedcategories");
	
				qObj = QueryNew('id, allowTB, postedat, postedby, relatedcategories');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				QuerySetCell(qObj, 'allowTB', allowTB, qObj.recordCount);
				QuerySetCell(qObj, 'postedat', postedat, qObj.recordCount);
				QuerySetCell(qObj, 'postedby', postedby, qObj.recordCount);
				QuerySetCell(qObj, 'relatedcategories', relatedcategories, qObj.recordCount);
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
			} else {
				qObj = QueryNew('id, errorMsg');
				QueryAddRow(qObj, 1);
				QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
				sMsg = '';
				if (NOT IsStruct(params)) {
					sMsg = sMsg & 'params';
				}
				if (NOT IsStruct(qryStruct)) {
					if (Len(sMsg) gt 0) {
						sMsg = sMsg & ' and ';
					}
					sMsg = sMsg & 'qryStruct';
				}
				QuerySetCell(qObj, 'errorMsg', 'Invalid parm (#sMsg#) for getBlogArticles() in #CGI.SCRIPT_NAME#.', qObj.recordCount);
				ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
			}
		}
		
		function getBlogArticleComments(id) {
			var i = -1;
			var _http = -1;
			var ar_ISURLVALID = -1;
			var ar_POSTEDSHORT = -1;
			
			Request.comments = application.blog.getComments(id);
			for (i = 1; i lte Request.comments.recordCount; i = i + 1) {
				Request.comments.comment[i] = paragraphFormat2(Request.comments.comment[i]);
				Request.comments.posted[i] = application.localeUtils.timeLocaleFormat(Request.comments.posted[i]);
			}
			ar_ISURLVALID = ArrayNew(1);
			ar_POSTEDSHORT = ArrayNew(1);
			for (i = 1; i lte Request.comments.recordCount; i = i + 1) {
				_http = cf_http(Request.comments.website[i]);
				ar_ISURLVALID[ArrayLen(ar_ISURLVALID) + 1] = (Trim(_http.Statuscode) IS "200 OK");
				ar_POSTEDSHORT[ArrayLen(ar_POSTEDSHORT) + 1] = application.localeUtils.dateLocaleFormat(Request.comments.posted[i],"short");
			}
			QueryAddColumn(Request.comments, 'ISURLVALID', 'Bit', ar_ISURLVALID);
			QueryAddColumn(Request.comments, 'POSTEDSHORT', 'VarChar', ar_POSTEDSHORT);
			ezRegisterQueryFromAJAX(Request.comments); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
		}
		
		function getBlogArticleTrackbacks(id) {
			var i = -1;
			var ar_CREATEDSHORT  = -1;
			
			Request.trackbacks = application.blog.getTrackBacks(id);
			for (i = 1; i lte Request.trackbacks.recordCount; i = i + 1) {
				Request.trackbacks.EXCERPT[i] = paragraphFormat2(Request.trackbacks.EXCERPT[i]);
				Request.trackbacks.CREATED[i] = application.localeUtils.timeLocaleFormat(Request.trackbacks.CREATED[i]);
			}
			ar_CREATEDSHORT = ArrayNew(1);
			for (i = 1; i lte Request.trackbacks.recordCount; i = i + 1) {
				ar_CREATEDSHORT[ArrayLen(ar_CREATEDSHORT) + 1] = application.localeUtils.dateLocaleFormat(Request.trackbacks.CREATED[i],"short");
			}
			QueryAddColumn(Request.trackbacks, 'CREATEDSHORT', 'VarChar', ar_CREATEDSHORT);
			ezRegisterQueryFromAJAX(Request.trackbacks); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
		}

		function userDefinedAJAXFunctions(qryStruct) {
			if ( (IsDefined("qryStruct.ezSessid")) AND (NOT err_primitiveCode) ) {
				Request.primitiveCode.readSessionFromDb(qryStruct.ezSessid);
			}

			try {
				switch (qryStruct.ezCFM) {
					case 'performActivateTabContent':
						if ( (IsDefined("qryStruct.namedArgs.iTab")) AND (Len(qryStruct.namedArgs.iTab) gt 0) ) { 
							qObj = QueryNew('ID, status, content');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'STATUS', qryStruct.namedArgs.iTab, qObj.recordCount);
							QuerySetCell(qObj, 'content', content_107_1, qObj.recordCount);
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
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performGetContentForTab':
						if ( (IsDefined("qryStruct.namedArgs.iTab")) AND (Len(qryStruct.namedArgs.iTab) gt 0) ) { 
							qObj = QueryNew('ID, status, content');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'STATUS', 'qryStruct.namedArgs.iTab = [#qryStruct.namedArgs.iTab#]', qObj.recordCount);
							QuerySetCell(qObj, 'content', '', qObj.recordCount);
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
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performOptOutAction':
						_opt_bit_setting = 0;
					case 'performOptInAction':
						if (NOT IsDefined("_opt_bit_setting")) {
							_opt_bit_setting = 1;
						}
						if ( (IsDefined("qryStruct.namedArgs.emailAddress")) AND (Len(qryStruct.namedArgs.emailAddress) gt 0) ) { 
							_sql_statement = "INSERT INTO OptInNewsletters (emailAddress, isOptIn) VALUES ('#ezFilterQuotesForSQL(qryStruct.namedArgs.EmailAddress)#', #_opt_bit_setting#)";
							ezExecSQL('Request.qPutNewsletterSubscribers', Request.ezAJAX_DSN, _sql_statement);
							if ( (Request.dbError) OR (Request.isPKviolation) ) {
								_sql_statement = "UPDATE OptInNewsletters SET isOptIn = #_opt_bit_setting# WHERE (emailAddress = '#ezFilterQuotesForSQL(qryStruct.namedArgs.EmailAddress)#')";
								ezExecSQL('Request.qPutNewsletterSubscribers', Request.ezAJAX_DSN, _sql_statement);
							}
							if ( (NOT Request.dbError) OR (Request.isPKviolation) ) {
								qObj = QueryNew('ID, status, optFlag');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'STATUS', 1, qObj.recordCount);
								QuerySetCell(qObj, 'optFlag', _opt_bit_setting, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.emailAddress")) {
								errorDetails = errorDetails & 'emailAddress';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performEmailNewsletters':
						_sql_statement = "SELECT DISTINCT UserNames.username, Newsletters.dtSent, DATEDIFF(d, Newsletters.dtSent, GETDATE()) AS 'days', OptInNewsletters.isOptIn FROM UserNames LEFT OUTER JOIN OptInNewsletters ON UserNames.username = OptInNewsletters.emailAddress LEFT OUTER JOIN Newsletters ON UserNames.id = Newsletters.uid WHERE ((Newsletters.dtSent IS NULL) OR (Newsletters.removed IS NULL) OR (DATEDIFF(d, Newsletters.dtSent, GETDATE()) > 30)) AND ( (OptInNewsletters.isOptIn IS NULL) OR (OptInNewsletters.isOptIn <> 0) ) ORDER BY UserNames.username, Newsletters.dtSent";
					//	_dsn = Request.ezAJAX_DSN;
						_dsn = Request.ezAJAX_Newsletters_DSN;
						ezExecSQL('Request.qGetNewsletterSubscribers0', _dsn, _sql_statement);
						if (NOT Request.dbError) {
							if (Request.qGetNewsletterSubscribers0.recordCount gt 0) {
								folderName = monthNameAbbrev(Month(Now())) & DateFormat(Now(), 'yyyy');
								cfmFolder = ExpandPath('/app/NewsLetters/' & folderName & '/index.html');
								bool_FileExists = false;
								if (FileExists(cfmFolder)) {
									bool_FileExists = true;
								} else {
									folderName = monthNameAbbrev(Month(Now()) - 1) & DateFormat(Now(), 'yyyy');
									cfmFolder = ExpandPath('/app/NewsLetters/' & folderName & '/index.html');
									if (FileExists(cfmFolder)) {
										bool_FileExists = true;
									}
								}
								
								if (bool_FileExists) {
									ezCfFileRead(cfmFolder, 'Request.sContent');
									if (NOT Request.fileError) {
										bool_failedEmails = false;
										bool_failedDBUpdates = false;
										_statusMsg = 'Newsletter for #folderName# sent to: ';
										_statusMsg2 = 'Newsletter for #folderName# was not sent to: ';
										_statusDBMsg = 'Newsletter status was not updated for : ';
										Request.qGetNewsletterSubscribers = ConstructListOfUniqueCustomers(Request.qGetNewsletterSubscribers0);
										if ( (IsDefined("Request.qGetNewsletterSubscribers")) AND (IsQuery(Request.qGetNewsletterSubscribers)) ) {
											for (i = 1; i lte Request.qGetNewsletterSubscribers.recordCount; i = i + 1) {
												ezCfMail(Request.qGetNewsletterSubscribers.username[i], 'do-not-respond@ez-ajax.com', 'ezAJAX(tm) Newsletter for #folderName#', Request.sContent);
												if (NOT Request.anError) {
													_statusMsg = ListAppend(_statusMsg, Request.qGetNewsletterSubscribers.username[i], ',');
	
													_sql_statement = "DECLARE @uid as integer; SELECT @uid = (SELECT id FROM UserNames WHERE (username = '#Request.qGetNewsletterSubscribers.username[i]#')); if @uid IS NOT NULL BEGIN INSERT INTO Newsletters (uid, dtSent) VALUES (@uid,GETDATE()); END;";
													ezExecSQL('Request.qUpdateNewsletterSubscribers', _dsn, _sql_statement);
													if ( (Request.dbError) OR (Request.isPKviolation) ) {
														bool_failedDBUpdates = true;
														_statusDBMsg = ListAppend(_statusDBMsg, Request.qGetNewsletterSubscribers.username[i], ',');
													}
												} else {
													bool_failedEmails = true;
													_statusMsg2 = ListAppend(_statusMsg2, Request.qGetNewsletterSubscribers.username[i], ',');
												}
											}
	
											qObj = QueryNew('id, statusMsg');
											QueryAddRow(qObj, 1);
											QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
											_statusMsg = _statusMsg & '.';
											if (bool_failedEmails) {
												_statusMsg = _statusMsg & _statusMsg2 & '.';
											}
											if (bool_failedDBUpdates) {
												_statusMsg = _statusMsg & _statusDBMsg & '.';
											}
											QuerySetCell(qObj, 'statusMsg', _statusMsg, qObj.recordCount);
											ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
										} else {
											qObj = QueryNew('id, statusMsg');
											QueryAddRow(qObj, 1);
											QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
											QuerySetCell(qObj, 'statusMsg', 'System Error :: Unable to process "ConstructListOfUniqueCustomers" - back to the drawing board gang.', qObj.recordCount);
											ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
										}
									} else {
										qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
										QueryAddRow(qObj, 1);
										QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
										QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
										QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
										QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
										QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
										QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
										ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
									}
								} else {
									qObj = QueryNew('id, statusMsg');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'statusMsg', 'Unable to locate the Newsletter for (#cfmFolder#).', qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								}
							} else {
								qObj = QueryNew('id, statusMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'statusMsg', 'There are no customers to whom Newsletters can be sent at this time.', qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
					
					case 'performRetrieveSourceCodeFromURL':
						if ( (IsDefined("qryStruct.namedArgs.filename")) AND (Len(qryStruct.namedArgs.filename) gt 0) ) {
							cName = CGI.SERVER_NAME;
							fName = ezFilePathFromUrlUsingCommonFolder(qryStruct.namedArgs.filename, CGI.CF_TEMPLATE_PATH, cName);
							if (FileExists(fName)) {
								ezCfFileRead(fName, 'Request.sContent');
								if (NOT Request.fileError) {
									qObj = QueryNew('id, statusMsg');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'statusMsg', URLEncodedFormat(Request.sContent), qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								} else {
									qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
									QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
									QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
									QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
									QuerySetCell(qObj, 'isHTML', 1, qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								}
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', 'Unable to read the request source file (#fName#) (#cName#).', qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
								QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.filename")) {
								errorDetails = errorDetails & 'filename';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
					
					case 'performGetMailContent':
						qObj = QueryNew('id, dojoContent');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'dojoContent', URLEncodedFormat(dojoEmailContent1), qObj.recordCount);
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
					break;
					
					case 'performResendRuntimeLicense':
						if ( (IsDefined("qryStruct.namedArgs.id")) AND (Len(qryStruct.namedArgs.id) gt 0) ) {
							_sql_statement = "SELECT RuntimeLicenses.id, RuntimeLicenses.sid, RuntimeLicenses.expirationDate, RuntimeLicenses.computerID, RuntimeLicenses.ProductName, RuntimeLicenses.productVersion, RuntimeLicenses.ServerName, RuntimeLicenses.ColdfusionID, RuntimeLicenses.osID, RuntimeLicenses.isCommunityEdition, RuntimeLicenses.copyrightNotice, RuntimeLicenses.RuntimeLicenseData, UserNames.username, ServerNames.uid FROM RuntimeLicenses INNER JOIN ServerNames ON RuntimeLicenses.sid = ServerNames.id INNER JOIN UserNames ON ServerNames.uid = UserNames.id WHERE (RuntimeLicenses.id = #qryStruct.namedArgs.id#)";
							ezExecSQL('Request.qGetLicenseFromDb', Request.ezAJAX_DSN, _sql_statement);
							if (NOT Request.dbError) {
								_statusMsg = '';
								if (Request.qGetLicenseFromDb.recordCount gt 0) {
									aFilePath = CreateUUID() & "_" & Request.qGetLicenseFromDb.ServerName & '_runtimeLicense.dat';
									ezCfFileWrite(ExpandPath(aFilePath), Request.qGetLicenseFromDb.RuntimeLicenseData);
									if (NOT Request.fileError) {
										optionsStruct = StructNew();
										optionsStruct.bcc = 'support@ez-ajax.com';
										optionsStruct.cfmailparam = StructNew();
										optionsStruct.cfmailparam.type = 'text/plain';
										optionsStruct.cfmailparam.file = 'http:' & '/' & '/' & CGI.SERVER_NAME & ListSetAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, '/'), aFilePath, '/');
										ezCfMail(Request.qGetLicenseFromDb.username, 'do-not-respond@ez-ajax.com', 'Attached is your Runtime License for ezAJAX(tm) for #Request.qGetLicenseFromDb.username# / #Request.qGetLicenseFromDb.ServerName#', do_resentProductRegistrationNotice(), optionsStruct);
										if (NOT Request.anError) {
											_statusMsg = 'Your Runtime License, which was previously created for you, has been resent to your email address.';	
										} else {
											_statusMsg = '<font color="red"><b>It was not possible to resend your Runtime License file to your email address at this time due to a technical issue that is being resolved.  Kindly contact our Support Department at support@ez-ajax.com to get this problem resolved.</b></font>';
										}
									} else {
										_statusMsg = '<font color="red"><b>Cannot resend your Runtime License to your email address at this time due to a technical issue that is being resolved. Kindly contact our Support Department at support@ez-ajax.com to get this problem resolved.</b></font>';
									}
									ezCfMail('support@ez-ajax.com', 'do-not-respond@ez-ajax.com', 'Resent Runtime License for ezAJAX(tm) for #Request.qGetLicenseFromDb.username# / #Request.qGetLicenseFromDb.ServerName#', _statusMsg);
								}

								qObj = QueryNew('id, statusMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'statusMsg', _statusMsg, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.id")) {
								errorDetails = errorDetails & 'id';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
					
					case 'performSubmitEditedEmailAddress':
						if ( (IsDefined("qryStruct.namedArgs.EmailAddress")) AND (Len(qryStruct.namedArgs.emailAddress) gt 0) AND (IsDefined("qryStruct.namedArgs.id")) AND (Len(qryStruct.namedArgs.id) gt 0) AND (IsDefined("qryStruct.namedArgs.sid")) AND (Len(qryStruct.namedArgs.sid) gt 0) ) {
							_sql_statement = "SELECT id FROM UserNames WHERE (username = '#ezFilterQuotesForSQL(qryStruct.namedArgs.EmailAddress)#')";
							ezExecSQL('Request.qGetEmailAddress', Request.ezAJAX_DSN, _sql_statement);
							if (NOT Request.dbError) {
								if (Request.qGetEmailAddress.recordCount eq 0) {
									_sql_statement = "INSERT INTO UserNames (username) VALUES ('#ezFilterQuotesForSQL(qryStruct.namedArgs.EmailAddress)#'); SELECT @@IDENTITY as 'id';";
									ezExecSQL('Request.qGetEmailAddress', Request.ezAJAX_DSN, _sql_statement);
								}
							}
							if (NOT Request.dbError) {
								_sql_statement = "UPDATE ServerNames SET uid = #Request.qGetEmailAddress.id# WHERE (id = #qryStruct.namedArgs.sid#)";
								ezExecSQL('Request.qUpdateEmailAddressLinkageToServerName', Request.ezAJAX_DSN, _sql_statement);
								if (NOT Request.dbError) {
									qObj = QueryNew('id, statusMsg');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'statusMsg', 'INFO: The requested changes have been made, next time you must use the updated Email Address when accessing the specific Runtime License that belongs to you.', qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								} else {
									qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
									QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
									QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
									QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								}
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.emailAddress")) {
								errorDetails = errorDetails & 'emailAddress';
							}
							if (NOT IsDefined("qryStruct.namedArgs.id")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'id';
							}
							if (NOT IsDefined("qryStruct.namedArgs.sid")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'sid';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performGetRegistrationData':
						if ( (IsDefined("qryStruct.namedArgs.emailAddress")) AND (Len(qryStruct.namedArgs.emailAddress) gt 0) AND (IsDefined("qryStruct.namedArgs.serverName")) AND (Len(qryStruct.namedArgs.serverName) gt 0) ) {
							_sql_statement = "SELECT 0 as 'id', ServerNames.id AS 'sid', ServerNames.uid, UserNames.username, ServerNames.serverName, 0 as 'hasLicense', 0 as 'isCommunityEdition', '' as 'expirationDate' FROM UserNames INNER JOIN ServerNames ON UserNames.id = ServerNames.uid WHERE (UserNames.username = '#ezFilterQuotesForSQL(qryStruct.namedArgs.emailAddress)#') AND (ServerNames.serverName = '#ezFilterQuotesForSQL(qryStruct.namedArgs.serverName)#')";
							ezExecSQL('Request.qGetRegistrationData', Request.ezAJAX_DSN, _sql_statement);
							if (NOT Request.dbError) {
								if (Request.qGetRegistrationData.recordCount gt 0) {
									_sql_statement = "SELECT id, sid, expirationDate, ProductName, productVersion, ServerName, isCommunityEdition FROM RuntimeLicenses WHERE (sid = #Request.qGetRegistrationData.sid#)";
									ezExecSQL('Request.qGetLicenseData', Request.ezAJAX_DSN, _sql_statement);
									if (NOT Request.dbError) {
										if (Request.qGetLicenseData.recordCount gt 0) {
											Request.qGetRegistrationData.id[1] = Request.qGetLicenseData.id[1];
											Request.qGetRegistrationData.hasLicense[1] = 1;
											Request.qGetRegistrationData.isCommunityEdition[1] = Request.qGetLicenseData.isCommunityEdition[1];
											Request.qGetRegistrationData.expirationDate[1] = DateFormat(Request.qGetLicenseData.expirationDate[1], 'mm/dd/yyyy') & ' ' & TimeFormat(Request.qGetLicenseData.expirationDate[1], 'hh:mm:ss tt') & '';
										}
										ezRegisterQueryFromAJAX(Request.qGetRegistrationData); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
									} else {
										qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
										QueryAddRow(qObj, 1);
										QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
										QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
										QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
										QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
										QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
										ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
									}
								} else {
									qObj = QueryNew('id, statusMsg');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'statusMsg', 'Warning: Invalid data provided for the Email Address (#qryStruct.namedArgs.emailAddress#) and/or Server Name (#qryStruct.namedArgs.serverName#).', qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								}
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.emailAddress")) {
								errorDetails = errorDetails & 'emailAddress';
							}
							if (NOT IsDefined("qryStruct.namedArgs.serverName")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'serverName';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performBlogCategoryReassignment':
						if ( (IsDefined("qryStruct.namedArgs.id")) AND (IsValid('UUID', qryStruct.namedArgs.id)) AND (IsDefined("qryStruct.namedArgs.catID")) AND (IsValid('UUID', qryStruct.namedArgs.catID)) AND (IsDefined("qryStruct.namedArgs.isChecked")) AND (IsValid('boolean', qryStruct.namedArgs.isChecked)) ) {
							isError = false;
							sErrorMsg = '';
							try {
								if (qryStruct.namedArgs.isChecked) {
									application.blog.removeCategory(qryStruct.namedArgs.id, qryStruct.namedArgs.catID);
								} else {
									application.blog.assignCategory(qryStruct.namedArgs.id, qryStruct.namedArgs.catID);
								}
							} catch (Any e) {
								isError = true;
								sErrorMsg = ezExplainError(e, false);
							}
							if (NOT isError) {
								qObj = QueryNew('id, status');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'status', 1, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', sErrorMsg, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.id")) {
								errorDetails = errorDetails & 'id';
							} else {
								if (NOT IsValid('UUID', qryStruct.namedArgs.id)) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The entry id value is invalid because it is not a valid UUID value.';
								}
							}
							if (NOT IsDefined("qryStruct.namedArgs.catID")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'catID';
							} else {
								if (NOT IsValid('UUID', qryStruct.namedArgs.catID)) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The category id value is invalid because it is not a valid UUID value.';
								}
							}
							if (NOT IsDefined("qryStruct.namedArgs.isChecked")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'isChecked';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performPopulateBlogCategoryReassignment':
						if ( (IsDefined("qryStruct.namedArgs.id")) AND (IsValid('UUID', qryStruct.namedArgs.id)) AND (IsDefined("qryStruct.namedArgs.catIds")) AND (isListOfValidItems(qryStruct.namedArgs.catIds, 'UUID')) ) {
							isError = false;
							sErrorMsg = '';
							try {
								qryStruct.namedArgs.catIds = URLDecode(qryStruct.namedArgs.catIds);
								qCategories = application.blog.getCategories();
							} catch (Any e) {
								isError = true;
								sErrorMsg = ezExplainError(e, false);
							}
							if (NOT isError) {
								ezRegisterQueryFromAJAX(qCategories); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', sErrorMsg, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.id")) {
								errorDetails = errorDetails & 'id';
							} else {
								if (NOT IsValid('UUID', qryStruct.namedArgs.id)) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The entry id value is invalid because it is not a valid UUID value.';
								}
							}
							if (NOT IsDefined("qryStruct.namedArgs.catIds")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'catIds';
							} else {
								if (isListOfValidItems(qryStruct.namedArgs.catIds, 'UUID')) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									isPlural = (ListLen(qryStruct.namedArgs.catIds, ',') gt 1);
									if (isPlural) {
										_valuesSuffix = '(s)';
										_isAre = 'are';
										_itThey = 'they';
										_a = '';
									} else {
										_valuesSuffix = '';
										_isAre = 'is';
										_itThey = 'it';
										_a = 'a';
									}
									errorReasons = errorReasons & 'The category id value#_valuesSuffix# #_isAre# invalid because #_itThey# #_isAre# not #_a# valid UUID value#_valuesSuffix#.';
								}
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performCommitBlogCategory':
						if ( (IsDefined("qryStruct.namedArgs.catID")) AND ( (IsValid('UUID', qryStruct.namedArgs.catID)) OR (qryStruct.namedArgs.catID is '-1') ) AND (IsDefined("qryStruct.namedArgs.catName")) ) {
							isError = false;
							sErrorMsg = '';
							try {
								qryStruct.namedArgs.catName = URLDecode(qryStruct.namedArgs.catName);
								if (qryStruct.namedArgs.catID eq -1) {
									application.blog.addCategory(qryStruct.namedArgs.catName);
								} else {
									application.blog.saveCategory(qryStruct.namedArgs.catID, qryStruct.namedArgs.catName);
								}
							} catch (Any e) {
								isError = true;
								sErrorMsg = ezExplainError(e, false);
							}
							if (NOT isError) {
								qObj = QueryNew('ID, status');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'STATUS', 1, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', sErrorMsg, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.catID")) {
								errorDetails = errorDetails & 'catID';
							} else {
								if (NOT IsValid('UUID', qryStruct.namedArgs.catID)) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The category id value is invalid because it is not a valid UUID value.';
								}
							}
							if (NOT IsDefined("qryStruct.namedArgs.catName")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'catName';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performDeleteBlogCategory':
						if ( (IsDefined("qryStruct.namedArgs.catID")) AND (IsValid('UUID', qryStruct.namedArgs.catID)) ) {
							isError = false;
							sErrorMsg = '';
							try {
								application.blog.deleteCategory(qryStruct.namedArgs.catID);
							} catch (Any e) {
								isError = true;
								sErrorMsg = ezExplainError(e, false);
							}
							if (NOT isError) {
								qObj = QueryNew('ID, status');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'STATUS', 1, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', sErrorMsg, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.catID")) {
								errorDetails = errorDetails & 'catID';
							} else {
								if (NOT IsValid('UUID', qryStruct.namedArgs.catID)) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The category id value is invalid because it is not a valid UUID value.';
								}
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performAdminAddEntry':
						id = -1;
						if (IsStruct(qryStruct.namedArgs)) {
							keysAR = StructKeyArray(qryStruct.namedArgs);
							for (i = 1; i lte ArrayLen(keysAR); i = i + 1) {
								qryStruct.namedArgs[keysAR[i]] = Trim(URLDecode(qryStruct.namedArgs[keysAR[i]]));
							}
						}
						if ( (IsDefined("qryStruct.namedArgs.title")) AND (IsDefined("qryStruct.namedArgs.body")) AND (IsDefined("qryStruct.namedArgs.allowComments")) ) {
							isError = false;
							sErrorMsg = '';
							try {
								errorStr = "";
	
								if (NOT IsDate(qryStruct.namedArgs.postedAt)) {
						//			errorStr = errorStr & application.resourceBundle.getResource("invaliddate");
									qryStruct.namedArgs.postedAt = dateAdd("h", application.blog.getProperty("offset"), now());
								} else {
									qryStruct.namedArgs.postedAt = ParseDateTime(qryStruct.namedArgs.postedAt);
								}
	
								if (not len(trim(qryStruct.namedArgs.title))) {
									errorStr = errorStr & application.resourceBundle.getResource("mustincludetitle");
								} else {
									qryStruct.namedArgs.title = trim(qryStruct.namedArgs.title);
								}
	
								if (not len(trim(qryStruct.namedArgs.body))) {
									errorStr = errorStr & application.resourceBundle.getResource("mustincludebody");
									origbody = "";
								} else {
									qryStruct.namedArgs.body = trim(qryStruct.namedArgs.body);
									origbody = qryStruct.namedArgs.body;
									
									strMoreTag = "<more/>";
									moreStart = findNoCase(strMoreTag,qryStruct.namedArgs.body);
									if (moreStart gt 1) {
										moreText = trim(mid(qryStruct.namedArgs.body,(moreStart+len(strMoreTag)),len(qryStruct.namedArgs.body)));
										qryStruct.namedArgs.body = trim(left(qryStruct.namedArgs.body,moreStart-1));
									} else if (moreStart is 1) {
										errorStr = errorStr & application.resourceBundle.getResource("mustincludebody");
									} else {
										moreText = "";
									}
								}
								
								if ( (NOT isDefined("qryStruct.namedArgs.categories")) OR (Len(Trim(qryStruct.namedArgs.categories)) eq 0) AND (Len(Trim(qryStruct.namedArgs.newCategory)) eq 0) ) {
									errorStr = errorStr & application.resourceBundle.getResource("mustincludecategory");
								} else {
									qryStruct.namedArgs.newCategory = trim(htmlEditFormat(qryStruct.namedArgs.newCategory));
								}
							
								Request.isAssignCategoriesError = false;
								
								if (Len(qryStruct.namedArgs.alias) gt 0) {
									qryStruct.namedArgs.alias = trim(htmlEditFormat(qryStruct.namedArgs.alias));
								} else {
									qryStruct.namedArgs.alias = application.blog.makeTitle(qryStruct.namedArgs.title);
								}
								
								if (Request.isAssignCategoriesError) {
									errorStr = errorStr & ', ' & Request.AssignCategoriesErrorMsg;
								}
	
								if (Len(errorStr) eq 0) {
									qryStruct.namedArgs.postedAt = dateAdd("h", -1 * application.blog.getProperty("offset"), qryStruct.namedArgs.postedAt);
									if (isDefined("qryStruct.namedArgs.id")) {
										id = qryStruct.namedArgs.id;
										application.blog.saveEntry(id, qryStruct.namedArgs.title, qryStruct.namedArgs.body, moreText, qryStruct.namedArgs.alias, qryStruct.namedArgs.postedAt, qryStruct.namedArgs.allowComments, '', 0, '');
									} else {
										id = application.blog.addEntry(qryStruct.namedArgs.title, qryStruct.namedArgs.body, moreText, qryStruct.namedArgs.alias, qryStruct.namedArgs.postedAt, qryStruct.namedArgs.allowComments, '', 0, '');
										application.blog.removeCategories(id);
									}
									if (Len(Trim(qryStruct.namedArgs.newCategory)) gt 0) {
										qryStruct.namedArgs.categories = Replace(qryStruct.namedArgs.categories, '|', ',', 'all');
										newCatID = application.blog.addCategory(qryStruct.namedArgs.newCategory);
										qryStruct.namedArgs.categories = ListAppend(qryStruct.namedArgs.categories, newCatID, ',');
									}
									application.blog.assignCategories(id, qryStruct.namedArgs.categories);
								} else {
									qryStruct.namedArgs.body = origbody;
								}
	
								if (lsIsDate(qryStruct.namedArgs.postedAt)) {
									qryStruct.namedArgs.postedAt = createODBCDateTime(qryStruct.namedArgs.postedAt);
									qryStruct.namedArgs.postedAt = application.localeUtils.dateLocaleFormat(qryStruct.namedArgs.postedAt,"short") & " " & application.localeUtils.timeLocaleFormat(qryStruct.namedArgs.postedAt);
								}
							} catch (Any e) {
								id = -1;
								isError = true;
								sErrorMsg = errorStr & ', ' & ezExplainError(e, false);
							}
	
							if ( (NOT isError) AND (Len(errorStr) eq 0) ) {
								qObj = QueryNew('ID, entryID, title, body, postedAt, categories, newCategory, alias, allowComments');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'entryID', id, qObj.recordCount);
								QuerySetCell(qObj, 'title', qryStruct.namedArgs.title, qObj.recordCount);
								QuerySetCell(qObj, 'body', qryStruct.namedArgs.body, qObj.recordCount);
								QuerySetCell(qObj, 'postedAt', qryStruct.namedArgs.postedAt, qObj.recordCount);
								QuerySetCell(qObj, 'categories', qryStruct.namedArgs.categories, qObj.recordCount);
								QuerySetCell(qObj, 'newCategory', qryStruct.namedArgs.newCategory, qObj.recordCount);
								QuerySetCell(qObj, 'alias', qryStruct.namedArgs.alias, qObj.recordCount);
								QuerySetCell(qObj, 'allowComments', qryStruct.namedArgs.allowComments, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', errorStr & ', ' & sErrorMsg, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.title")) {
								errorDetails = errorDetails & 'title';
							}
							if (NOT IsDefined("qryStruct.namedArgs.body")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'body';
							}
							if (NOT IsDefined("qryStruct.namedArgs.postedAt")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'postedAt';
							}
							if (NOT IsDefined("qryStruct.namedArgs.categories")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'categories';
							}
							if (NOT IsDefined("qryStruct.namedArgs.newCategory")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'newCategory';
							}
							if (NOT IsDefined("qryStruct.namedArgs.alias")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'alias';
							}
							if (NOT IsDefined("qryStruct.namedArgs.allowComments")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'allowComments';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performAdminDeleteEntry':
						if ( (IsDefined("qryStruct.namedArgs.id")) AND (IsValid('UUID', qryStruct.namedArgs.id)) ) {
							isError = false;
							sErrorMsg = '';
							try {
								application.blog.deleteEntry(qryStruct.namedArgs.id);
							} catch (Any e) {
								isError = true;
								sErrorMsg = ezExplainError(e, false);
							}
							if (NOT isError) {
								qObj = QueryNew('ID, status');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'STATUS', 1, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', sErrorMsg, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.id")) {
								errorDetails = errorDetails & 'id';
							} else {
								if (NOT IsValid('UUID', qryStruct.namedArgs.id)) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The entry id value is invalid because it is not a valid UUID value.';
								}
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'performContactUsAction':
						if ( (IsDefined("qryStruct.namedArgs.emailAddress")) AND (IsDefined("qryStruct.namedArgs.emailMessage")) AND (IsDefined("qryStruct.namedArgs.toEmailAddrs")) AND (ListLen(qryStruct.namedArgs.toEmailAddrs, '@') eq 2) AND (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.toEmailAddrs, 2, '@'), ',') eq 0) ) { 
							ezCfMail(qryStruct.namedArgs.toEmailAddrs, qryStruct.namedArgs.emailAddress, 'ezAJAX(tm) Site Visitor EMail from (#qryStruct.namedArgs.emailAddress#)', qryStruct.namedArgs.emailMessage);
							if (NOT Request.anError) {
								qObj = QueryNew('ID, status');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'STATUS', 1, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.emailAddress")) {
								errorDetails = errorDetails & 'emailAddress';
							}
							if (NOT IsDefined("qryStruct.namedArgs.emailMessage")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'emailMessage';
							}
							if (NOT IsDefined("qryStruct.namedArgs.toEmailAddrs")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'toEmailAddrs';
							} else {
								if ( (ListLen(qryStruct.namedArgs.toEmailAddrs, '@') neq 2) OR (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.toEmailAddrs, 2, '@'), ',') neq 0) ) {
									if (ListLen(qryStruct.namedArgs.toEmailAddrs, '@') neq 2) {
										if (Len(errorReasons) gt 0) {
											errorReasons = errorReasons & ' ';
										}
										errorReasons = errorReasons & 'The email address value is invalid because it is not an email address.';
									}
									if (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.toEmailAddrs, 2, '@'), ',') neq 0) {
										if (Len(errorReasons) gt 0) {
											errorReasons = errorReasons & ' ';
										}
										errorReasons = errorReasons & 'The email address value is invalid because it uses a domain name that violates the EULA because it is for a known anonymous email service. Users may not construct their email addresses using domains that provide anonymous email services.';
									}
								}
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'changeBlogDesignation':
						if (IsDefined("qryStruct.namedArgs.blogname")) { 
							bool_isError = false;
							errorMsg = '';
							try {
								application.blog = application.blog.init(qryStruct.namedArgs.blogname);
							} catch (Any e) {
								bool_isError = true;
								errorMsg = ezExplainError(e, false);
							}
							if (NOT bool_isError) {
								Session.persistData.blogname = qryStruct.namedArgs.blogname;
								Request.primitiveCode.commitSessionToDb();
	
								qObj = QueryNew('ID, BLOGNAME');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'BLOGNAME', qryStruct.namedArgs.blogname, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', errorMsg, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.blogname")) {
								errorDetails = errorDetails & 'blogname';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
				
					case 'getActualUsersOnline':
						diffT = 1;
						periodT = (Minute(Now()) / 10);
						if ((periodT MOD 2) eq 0) {
							diffT = -1;
						}
						
						instance = application.blog.instance;
						
						usersNowOnline = 0;
						_sqlStatement = "SELECT COUNT(id) as cnt FROM tblUsersSession";
						ezExecSQL('Request.qCountUsersSessions', instance.dsn, _sqlStatement);
	
						if ( (NOT Request.dbError) AND (IsQuery(Request.qCountUsersSessions)) AND (Request.qCountUsersSessions.recordCount gt 0) AND (Request.qCountUsersSessions.cnt gt 0) ) {
							usersNowOnline = Request.qCountUsersSessions.cnt;
						}
						
						xx1 = 'There are currently #Ceiling((Hour(Now()) * 60) + ((diffT * 5) * periodT))#/#usersNowOnline# Users Online as of ';
						xx2 = '<div id="div_actualUsersOnlineStats0">#DateFormat(Now(), "full")# #TimeFormat(Now(), "full")#</div>';
	
						qObj = QueryNew('ID, actualUsersOnline');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'actualUsersOnline', xx1 & xx2, qObj.recordCount);
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
					break;
				
					case 'performSubmitForgotPasswordForm':
						if ( (IsDefined("qryStruct.namedArgs.username")) AND (ListLen(qryStruct.namedArgs.username, '@') eq 2) AND (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.username, 2, '@'), ',') eq 0) ) { 
							_bool = performForgotPasswordAction(qryStruct.namedArgs.username);
							bool = 0;
							if (_bool) {
								bool = 1;
							}
							if ( (NOT Request.dbError) AND (NOT Request.anError) ) {
								qObj = QueryNew('ID, ISFORGOTPASSWORD');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'ISFORGOTPASSWORD', bool, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else if (Request.dbError) {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else if (Request.anError) {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', '', qObj.recordCount);
								QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', '', qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.username")) {
								errorDetails = errorDetails & 'username';
							} else if ( (ListLen(qryStruct.namedArgs.username, '@') neq 2) OR (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.username, 2, '@'), ',') neq 0) ) {
								if (ListLen(qryStruct.namedArgs.username, '@') neq 2) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The username value is invalid because it is not an email address.';
								}
								if (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.username, 2, '@'), ',') neq 0) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The username value is invalid because it uses a domain name that violates the EULA because it is for a known anonymous email service. Users may not construct their user names using domains that provide anonymous email services.';
								}
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;

					case 'performUserLogoffAction':
						Request.primitiveCode.retireUserSessionUponLogoff();
						structDelete(session,"loggedin");
						StructDelete(Session.persistData, 'qAuthUser');
						Session.persistData.loginFailure = 0;
						session.persistData.loggedin = cf_userlogout();
						Request.primitiveCode.commitSessionToDb();
						
						_loggedin = 1;
						if (NOT session.persistData.loggedin) {
							_loggedin = 0;
						}
	
						qObj = QueryNew('ID, ISVALID, PASSWORD, PREMIUMDATE, RENEWALFEE, UNAME, UROLE, USERNAME, LOGGEDIN');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'ISVALID', 0, qObj.recordCount);
						QuerySetCell(qObj, 'PASSWORD', '', qObj.recordCount);
						QuerySetCell(qObj, 'PREMIUMDATE', '', qObj.recordCount);
						QuerySetCell(qObj, 'RENEWALFEE', 0, qObj.recordCount);
						QuerySetCell(qObj, 'UNAME', '', qObj.recordCount);
						QuerySetCell(qObj, 'UROLE', '', qObj.recordCount);
						QuerySetCell(qObj, 'USERNAME', '', qObj.recordCount);
						QuerySetCell(qObj, 'LOGGEDIN', _loggedin, qObj.recordCount);
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
					break;

					case 'performSubmitLoginForm':
						if ( (IsDefined("qryStruct.namedArgs.username")) AND (ListLen(qryStruct.namedArgs.username, '@') eq 2) AND (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.username, 2, '@'), ',') eq 0) AND (IsDefined("qryStruct.namedArgs.password")) ) { 
							performUserLogin(qryStruct.namedArgs.username, qryStruct.namedArgs.password);
	
							if (NOT Request.dbError) {
								if (IsDefined("Session.persistdata.QAUTHUSER")) {
									Request.primitiveCode.commitSessionToDb();
	
									sqlStatement = "select *, 0 as LOGGEDIN from Session.persistdata.QAUTHUSER where ISVALID = 1";
									ezExecSQL('Request.QAUTHUSER', '', sqlStatement);
						
									if (NOT Request.dbError) {
										Request.QAUTHUSER.LOGGEDIN[1] = 0;
										if ( (IsDefined("Session.persistdata.LOGGEDIN")) AND (IsBoolean(Session.persistdata.LOGGEDIN)) ) {
											if (Session.persistdata.LOGGEDIN) {
												Request.QAUTHUSER.LOGGEDIN[1] = 1;
											}
										}
										ezRegisterQueryFromAJAX(Request.QAUTHUSER); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
									} else {
										qObj = QueryNew('ID, ISVALID, PASSWORD, PREMIUMDATE, RENEWALFEE, UNAME, UROLE, USERNAME, LOGGEDIN');
										QueryAddRow(qObj, 1);
										QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
										QuerySetCell(qObj, 'ISVALID', -1, qObj.recordCount);
										QuerySetCell(qObj, 'PASSWORD', '', qObj.recordCount);
										QuerySetCell(qObj, 'PREMIUMDATE', '', qObj.recordCount);
										QuerySetCell(qObj, 'RENEWALFEE', 0, qObj.recordCount);
										QuerySetCell(qObj, 'UNAME', '', qObj.recordCount);
										QuerySetCell(qObj, 'UROLE', '', qObj.recordCount);
										QuerySetCell(qObj, 'USERNAME', '', qObj.recordCount);
										QuerySetCell(qObj, 'LOGGEDIN', 0, qObj.recordCount);
										ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
									}
								} else {
									qObj = QueryNew('ID, ISVALID, PASSWORD, PREMIUMDATE, RENEWALFEE, UNAME, UROLE, USERNAME, LOGGEDIN');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'ISVALID', -2, qObj.recordCount);
									QuerySetCell(qObj, 'PASSWORD', '', qObj.recordCount);
									QuerySetCell(qObj, 'PREMIUMDATE', '', qObj.recordCount);
									QuerySetCell(qObj, 'RENEWALFEE', 0, qObj.recordCount);
									QuerySetCell(qObj, 'UNAME', '', qObj.recordCount);
									QuerySetCell(qObj, 'UROLE', '', qObj.recordCount);
									QuerySetCell(qObj, 'USERNAME', '', qObj.recordCount);
									QuerySetCell(qObj, 'LOGGEDIN', 0, qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								}
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.username")) {
								errorDetails = errorDetails & 'username';
							} else if ( (ListLen(qryStruct.namedArgs.username, '@') neq 2) OR (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.username, 2, '@'), ',') neq 0) ) {
								if (ListLen(qryStruct.namedArgs.username, '@') neq 2) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The username value is invalid because it is not an email address.';
								}
								if (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.username, 2, '@'), ',') neq 0) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The username value is invalid because it uses a domain name that violates the EULA because it is for a known anonymous email service. Users may not construct their user names using domains that provide anonymous email services.';
								}
							}
							if (NOT IsDefined("qryStruct.namedArgs.password")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'password';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;

					case 'performSubmitRegisterForm':
						if ( (IsDefined("qryStruct.namedArgs.username")) AND (ListLen(qryStruct.namedArgs.username, '@') eq 2) AND (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.username, 2, '@'), ',') eq 0) AND (IsDefined("qryStruct.namedArgs.yourname")) AND (IsDefined("qryStruct.namedArgs.password")) AND (IsDefined("qryStruct.namedArgs.confirmpassword")) ) { 
							if (qryStruct.namedArgs.password eq qryStruct.namedArgs.confirmpassword) {
								performUserRegistration(qryStruct.namedArgs.username, qryStruct.namedArgs.yourname, qryStruct.namedArgs.password);
								
								if (NOT Request.dbError) {
									qObj = QueryNew('id, statusMsg');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'statusMsg', 'Your Registration was successful.' & Chr(13) & 'You will receive an email from us shortly with additional instructions you must follow to get your new User Account Activated.' & Chr(13) & 'Make sure you upgrade your User Account to a Premium Account so you can take full advantage of all the feature this site has to offer you.', qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								} else {
									qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
									QueryAddRow(qObj, 1);
									QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
									QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
									QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
									QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
									QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
									ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
								}
							} else {
								qObj = QueryNew('id, errorMsg');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', 'The passwords you entered do not match, kindly try again.', qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							errorReasons = '';
							if (NOT IsDefined("qryStruct.namedArgs.username")) {
								errorDetails = errorDetails & 'username';
							} else if ( (ListLen(qryStruct.namedArgs.username, '@') neq 2) OR (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.username, 2, '@'), ',') neq 0) ) {
								if (ListLen(qryStruct.namedArgs.username, '@') neq 2) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The username value is invalid because it is not an email address.';
								}
								if (ListFindNoCase(Request.invalidEmailDomains, '@' & ezGetToken(qryStruct.namedArgs.username, 2, '@'), ',') neq 0) {
									if (Len(errorReasons) gt 0) {
										errorReasons = errorReasons & ' ';
									}
									errorReasons = errorReasons & 'The username value is invalid because it uses a domain name that violates the EULA because it is for a known anonymous email service. Users may not construct their user names using domains that provide anonymous email services.';
								}
							}
							if (NOT IsDefined("qryStruct.namedArgs.yourname")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'yourname';
							}
							if (NOT IsDefined("qryStruct.namedArgs.password")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'password';
							}
							if (NOT IsDefined("qryStruct.namedArgs.confirmpassword")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'confirmpassword';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm(s) (#errorDetails# / #errorReasons#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getDirectoryContents':
						if ( (IsDefined("qryStruct.namedArgs.levelNum")) AND (IsDefined("qryStruct.namedArgs.buttonID")) AND (IsDefined("qryStruct.namedArgs.folderName")) ) { 
	
							_folderName = qryStruct.namedArgs.folderName;
							if (FindNoCase('.1.', CGI.SERVER_NAME) gt 0) {
								_folderName = 'D' & ':' & ListLast(_folderName, ':');
							} else if (FindNoCase('.2.', CGI.SERVER_NAME) gt 0) {
								_folderName = 'C' & ':' & ListLast(_folderName, ':');
							}
							ezCfDirectory('Request.qDir', _folderName, '*', false);
	
							if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) ) {
								ezRegisterQueryFromAJAX(Request.qDir); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else if (Request.directoryError) {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.directoryErrorMsg & ',' & Request.directoryFullErrorMsg & ',' & Request.directoryPlainErrorMsg & ', directoryError = [#Request.directoryError#], folderName = [#qryStruct.namedArgs.folderName#]', qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.directoryFullErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', false, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.levelNum")) {
								errorDetails = errorDetails & 'levelNum';
							}
							if (NOT IsDefined("qryStruct.namedArgs.folderName")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'folderName';
							}
							if (NOT IsDefined("qryStruct.namedArgs.buttonID")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'buttonID';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'performGetArticleByEntry':
						if (IsDefined("qryStruct.namedArgs.id")) {
							params = structNew();
							params.byEntry = qryStruct.namedArgs.id;
							getBlogArticles(params, qryStruct);
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (id)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'performSubscribePodAction':
						if ( (IsDefined("qryStruct.namedArgs.emailAddress")) AND (Len(qryStruct.namedArgs.emailAddress) gt 0) ) {
							bool = 1;
							try {
								application.blog.addSubscriber(trim(qryStruct.namedArgs.emailAddress));
							} catch (Any e) {
								bool = 0;
							}
	
							qObj = QueryNew('ID, ISBLOGSUBSCRIBED');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'ID', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'ISBLOGSUBSCRIBED', bool, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (emailAddress)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'performSearchPodAction':
						params = structNew();
						if ( (IsDefined("qryStruct.namedArgs.keyword")) AND (Len(qryStruct.namedArgs.keyword) gt 0) ) {
							params.searchTerms = htmlEditFormat(qryStruct.namedArgs.keyword);
						}
						getBlogArticles(params, qryStruct);
					break;
	
					case 'getBlogArticleComments':
						if (IsDefined("qryStruct.namedArgs.id")) {
							getBlogArticleComments(qryStruct.namedArgs.id);
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (id)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getBlogArticleTrackbacks':
						if (IsDefined("qryStruct.namedArgs.id")) {
							getBlogArticleTrackbacks(qryStruct.namedArgs.id);
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (id)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getBlogArticlesByCategory':
						if ( (IsDefined("qryStruct.namedArgs.catid")) OR (IsDefined("qryStruct.namedArgs.catName")) ) {
							params = structNew();
							if (IsDefined("qryStruct.namedArgs.catid")) {
								params.byCat = qryStruct.namedArgs.catid;
							} else if (IsDefined("qryStruct.namedArgs.catName")) {
								params.byCat = getCategoryIDFromName(qryStruct.namedArgs.catName);
							}
							getBlogArticles(params, qryStruct);
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.catid")) {
								errorDetails = errorDetails & 'catid';
							}
							if (NOT IsDefined("qryStruct.namedArgs.catName")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' OR ';
								}
								errorDetails = errorDetails & 'catName';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getBlogArticlesByDay':
						if ( (IsDefined("qryStruct.namedArgs.month")) AND (IsDefined("qryStruct.namedArgs.year")) ) {
							params = structNew();
							if (IsDefined("qryStruct.namedArgs.day")) {
								params.byDay = val(qryStruct.namedArgs.day);
							}
							params.byMonth = val(qryStruct.namedArgs.month) + 1;
							params.byYear = val(qryStruct.namedArgs.year);
							getBlogArticles(params, qryStruct);
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
	
							if (NOT IsDefined("qryStruct.namedArgs.month")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'month';
							}
							if (NOT IsDefined("qryStruct.namedArgs.year")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'year';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getDefaultBlogArticles':
						if (IsDefined("qryStruct.namedArgs.maxEntries")) {
							params = structNew();
							params.lastXDays = 30;
							getBlogArticles(params, qryStruct);
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (maxEntries)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getBlogArchives':
						Request.cats = application.blog.getCategories();
						sqlStatement = "SELECT * FROM Request.cats ORDER BY CATEGORYNAME, entryCount DESC";
						ezExecSQL('Request.qGetMaxEntryCount', '', sqlStatement);
	
						if (NOT Request.dbError) {
							ezRegisterQueryFromAJAX(Request.qGetMaxEntryCount); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getCalendarMetaData':
						month = Month(Now());
						if ( (IsDefined("qryStruct.namedArgs.month")) AND (IsNumeric(qryStruct.namedArgs.month)) ) {
							month = Int(qryStruct.namedArgs.month + 1);
						}
	
						year = Year(Now());
						if ( (IsDefined("qryStruct.namedArgs.year")) AND (IsNumeric(qryStruct.namedArgs.year)) ) {
							year = Int(qryStruct.namedArgs.year);
						}
						
						localizedDays = application.localeutils.getLocalizedDays();
						localizedMonth = application.localeutils.getLocalizedMonth(month);
						localizedYear = application.localeutils.getLocalizedYear(year);
						firstDay = createDate(year,month,1);
						firstDOW = dayOfWeek(firstDay);
						dim = daysInMonth(firstDay);
						firstWeekPAD = getFirstWeekPAD(firstDOW);
						lastMonth = dateAdd("m",-1,firstDay);
						nextMonth = dateAdd("m",1,firstDay);	
						dayList = application.blog.getActiveDays(year,month);
						dayCounter = 1;
						rowCounter = 1;
	
						qObj = QueryNew('id, dim, localizedDays, localizedMonth, localizedYear, firstDay, firstDOW, daysInMonth, firstWeekPAD, lastMonth, nextMonth, dayList, dayCounter, rowCounter, isBIDI, statusMsg');
						QueryAddRow(qObj, 1);
						QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
						QuerySetCell(qObj, 'dim', dim, qObj.recordCount);
						QuerySetCell(qObj, 'localizedDays', ArrayToList(localizedDays, ','), qObj.recordCount);
						QuerySetCell(qObj, 'localizedMonth', localizedMonth, qObj.recordCount);
						QuerySetCell(qObj, 'localizedYear', localizedYear, qObj.recordCount);
						QuerySetCell(qObj, 'firstDay', DateFormat(firstDay, 'mmmm d, yyyy') & ' ' & TimeFormat(firstDay, 'HH:mm:ss'), qObj.recordCount); // "December 17, 1995 03:24:00"
						QuerySetCell(qObj, 'firstDOW', firstDOW, qObj.recordCount);
						QuerySetCell(qObj, 'daysInMonth', dim, qObj.recordCount);
						QuerySetCell(qObj, 'firstWeekPAD', firstWeekPAD, qObj.recordCount);
						QuerySetCell(qObj, 'lastMonth', DateFormat(lastMonth, 'mmmm d, yyyy') & ' ' & TimeFormat(lastMonth, 'HH:mm:ss'), qObj.recordCount);
						QuerySetCell(qObj, 'nextMonth', DateFormat(nextMonth, 'mmmm d, yyyy') & ' ' & TimeFormat(nextMonth, 'HH:mm:ss'), qObj.recordCount);
						QuerySetCell(qObj, 'dayList', dayList, qObj.recordCount);
						QuerySetCell(qObj, 'dayCounter', dayCounter, qObj.recordCount);
						QuerySetCell(qObj, 'rowCounter', rowCounter, qObj.recordCount);
						QuerySetCell(qObj, 'isBIDI', application.localeutils.isBIDI(), qObj.recordCount);
						if ( (IsDefined("Request.sqlResult.sql")) AND (IsDefined("Request.sqlParms")) ) {
							QuerySetCell(qObj, 'statusMsg', Request.sqlResult.sql & ',' & Request.sqlParms, qObj.recordCount);
						} else {
							QuerySetCell(qObj, 'statusMsg', '-1', qObj.recordCount);
						}
						ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
					break;
	
					case 'getDownloadsFolder':
						if (IsDefined("qryStruct.namedArgs.folderName")) {
							_folderName = qryStruct.namedArgs.folderName;
							if (FindNoCase('.1.', CGI.SERVER_NAME) gt 0) {
								_folderName = 'D' & ':' & ListLast(_folderName, ':');
							} else if (FindNoCase('.2.', CGI.SERVER_NAME) gt 0) {
								_folderName = 'C' & ':' & ListLast(_folderName, ':');
							}
							ezCfDirectory('Request.qDir', _folderName, '*.*', false);
	
							if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) ) {
								ezRegisterQueryFromAJAX(Request.qDir); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else if (Request.directoryError) {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.directoryErrorMsg & ',' & Request.directoryFullErrorMsg & ',' & Request.directoryPlainErrorMsg & ', directoryError = [#Request.directoryError#], folderName = [#qryStruct.namedArgs.folderName#]', qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.directoryFullErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', false, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (folderName)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getDownloadsMetaData':
						_errorMsg = '';
						path = GetDirectoryFromPath(CGI.CF_TEMPLATE_PATH);
						while (NOT (ListLast(path, '\') IS ListFirst(CGI.SCRIPT_NAME, '/'))) {
							path = ListDeleteAt(path, ListLen(path, '\'), '\');
							if (ListLen(path, '\') eq 1) {
								break;
							}
						}
	
						while (1) {
							fileMask = 'downloads_433511201010924803';
							if (NOT (cf_currentBlogName is 'default')) {	// downloads_433511201010924803 for default
								fileMask = 'downloads_433611211010024813';	// downloads_433611211010024813 for ezajax
							}					
							
							ezCfDirectory('Request.qDir', path, fileMask, false);
							if ( (Request.directoryError) OR ( (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) ) {
								break;
							}
							path = ListDeleteAt(path, ListLen(path, '\'), '\');
							if (ListLen(path, '\') eq 1) {
								break;
							}
						}

						if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
							_sql_statement = "SELECT * FROM Request.qDir WHERE (TYPE = 'Dir') AND (NAME LIKE 'downloads_%')";
							ezExecSQL('Request.qDir2', '', _sql_statement);
							if (NOT Request.dbError) {
								ezRegisterQueryFromAJAX(Request.qDir2); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							_errorMsg = _errorMsg & '|No files were found using the path of "#path#".';
							if (Request.directoryError) {
								_errorMsg = Request.directoryErrorMsg & ', ' & Request.directoryFullErrorMsg;
							}
							QuerySetCell(qObj, 'errorMsg', _errorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.directoryFullErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', false, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getRecentArticles':
						params = structNew();
						params.maxEntries = 10;
						params.lastXDays = 20;
						_i = 1;
						_k = -1;
						recentIDs = "";
						for (_iCount = 1; _iCount lte 15; _iCount = _iCount + 1) {
							Request.entries = application.blog.getEntries(duplicate(params));
							for (_k = 1; _k lte Request.entries.recordCount; _k = _k + 1) {
								if (ListFindNoCase(recentIDs, Request.entries.id[_k], ",") eq 0) {
									recentIDs = ListAppend(recentIDs, Request.entries.id[_k], ",");
									_i = _i + 1;
									if (_i gte params.maxEntries) {
										break;
									}
								}
							}
							if ( (Request.entries.recordCount gt 5) OR (_i gte params.maxEntries) ) {
								break;
							}
							params.lastXDays = params.lastXDays + 20;
						}
	
						_sql_statement = "SELECT ID, TITLE, '' as URL FROM Request.entries";
						ezExecSQL('Request.entries2', '', _sql_statement);
						if (NOT Request.dbError) {
							for (i = 1; i lte Request.entries2.recordCount; i = i + 1) {
								Request.entries2.URL[i] = Request.primitiveCode._clusterizeURLForSessionOnly(application.blog.makeLink(Request.entries2.id[i]));
							}
							ezRegisterQueryFromAJAX(Request.entries2); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getPodByName':
						if ( (IsDefined("qryStruct.namedArgs.podNum")) AND (IsDefined("qryStruct.namedArgs.podName")) ) {
							_html = retrievePodContentByName(qryStruct.namedArgs.podName);
	
							qObj = QueryNew('id, podNum, podName, podContent');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'podNum', qryStruct.namedArgs.podNum, qObj.recordCount);
							QuerySetCell(qObj, 'podName', qryStruct.namedArgs.podName, qObj.recordCount);
							QuerySetCell(qObj, 'podContent', _html, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						} else {
							qObj = QueryNew('id, errorMsg');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							errorDetails = '';
							if (NOT IsDefined("qryStruct.namedArgs.podNum")) {
								errorDetails = errorDetails & 'podNum';
							}
							if (NOT IsDefined("qryStruct.namedArgs.podName")) {
								if (Len(errorDetails) gt 0) {
									errorDetails = errorDetails & ' and ';
								}
								errorDetails = errorDetails & 'podName';
							}
							extraErrorMsg = '';
							if ( (isDebugMode()) OR (isServerLocal()) ) {
								extraErrorMsg = ' for #qryStruct.CFM# in #CGI.SCRIPT_NAME#';
							}
							QuerySetCell(qObj, 'errorMsg', 'Missing or Invalid ezAJAX(tm) parm (#errorDetails#)#extraErrorMsg#.', qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
						}
					break;
	
					case 'getPodCount':
						pName = GetDirectoryFromPath(ExpandPath('/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/includes/pods/' & '*.*'));
						ezCfDirectory('Request.qDir', pName, '*.cfm', false);
						if ( (NOT Request.directoryError) AND (IsQuery(Request.qDir)) AND (Request.qDir.recordCount gt 0) ) {
							qObj = QueryNew('id, podCount');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'podCount', Request.qDir.recordCount, qObj.recordCount);
							ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
	
							_sql_statement = "SELECT NAME FROM Request.qDir ORDER BY NAME";
							ezExecSQL('Request.qDir2', '', _sql_statement);
							if (NOT Request.dbError) {
								ezRegisterQueryFromAJAX(Request.qDir2); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							} else {
								qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
								QueryAddRow(qObj, 1);
								QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
								QuerySetCell(qObj, 'errorMsg', Request.errorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'moreErrorMsg', Request.moreErrorMsg, qObj.recordCount);
								QuerySetCell(qObj, 'explainError', Request.explainError, qObj.recordCount);
								QuerySetCell(qObj, 'isPKviolation', Request.isPKviolation, qObj.recordCount);
								ezRegisterQueryFromAJAX(qObj); // this function is used to tell the ezAJAX(tm) system what Query(s) you wish to communicate back to JavaScript - you can register as many Query Objects as you wish... the CF Var named Request.qryData is used to hold an array of Query Objects...
							}
						} else {
							qObj = QueryNew('id, errorMsg, moreErrorMsg, explainError, isPKviolation');
							QueryAddRow(qObj, 1);
							QuerySetCell(qObj, 'id', qObj.recordCount, qObj.recordCount);
							QuerySetCell(qObj, 'errorMsg', Request.directoryErrorMsg & ',' & Request.directoryFullErrorMsg & ', pName = [#pName#]', qObj.recordCount);
							QuerySetCell(qObj, 'moreErrorMsg', Request.directoryFullErrorMsg, qObj.recordCount);
							QuerySetCell(qObj, 'explainError', '', qObj.recordCount);
							QuerySetCell(qObj, 'isPKviolation', false, qObj.recordCount);
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
