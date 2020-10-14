<!--- cfinclude_application.cfm --->

<!--- Development To-Do List:
	(1). Add the ability to autoload all .CSS from the app root folder.
	(2). Better document the StyleSheet.css file and how it is to be used.
	(3). Autosize the Debug Panel whenever the onresize event is triggered.
 --->

<cfscript>
	err_primitiveCode = false;
	err_primitiveCodeMsg = '';
	try {
		Request.cfcPrefix = '';
		listFirst = ListFirst(CGI.SCRIPT_NAME, '/');
		if (FindNoCase('.cfm', listFirst) eq 0) {
			Request.cfcPrefix = listFirst & '.';
		}
		Request.scriptFirst = ReplaceNoCase(Request.cfcPrefix, '.', '/');
		if (Len(Request.scriptFirst) gt 0) {
			Request.scriptFirst = Request.scriptFirst & '/';
		}
		Request.primitiveCode = CreateObject("component", Request.cfcPrefix & 'app.cfc.commonCode');
	} catch(Any e) {
		err_primitiveCode = true;
		err_primitiveCodeMsg = '(1) The primitive.cfc component has NOT been created.';
		writeOutput('<font color="red"><b>#err_primitiveCodeMsg# | Reason: [#e.message#] [#e.detail#]</b></font><br>');
	}

	if (IsDefined("URL.sessid")) {
		Request.primitiveCode.readSessionFromDb(URL.sessid);
	} else {
		Request.primitiveCode.readSessionFromDb();
	}

	_urlParentPrefix = 'http://#CGI.SERVER_NAME#/' & Request.scriptFirst;
	if (Right(_urlParentPrefix, 1) eq '/') {
		_urlParentPrefix = Left(_urlParentPrefix, Len(_urlParentPrefix) - 1);
	}

	if (NOT IsDefined("blogname")) {
		blogname = 'ezajax';
	}

	try {
		application._fname = expandPath("/" & Request.cfcPrefix & "app/includes/main");
		application.blog = createObject("component", Request.cfcPrefix & "app.org.camden.blog.blog").init(blogname);
		application.resourceBundle = createObject("component", Request.cfcPrefix & "app.org.hastings.locale.resourcebundle");
		application._fname = ReplaceNoCase(application._fname, 'includes\includes\', 'includes\');
		application.resourceBundle.loadResourceBundle(application._fname, application.blog.getProperty("locale"));
		application.localeutils = createObject("component", Request.cfcPrefix & "app.org.hastings.locale.utils");
		application.localeutils.loadLocale(application.blog.getProperty("locale"));
	} catch (Any e) {
	}

	Request.supportEmailAddress = 'support@ez-ajax.com';
	Request.salesEmailAddress = 'sales@ez-ajax.com';
	Request.investorRelationsEmailAddress = 'investors@ez-ajax.com';
	Request.affiliateRelationsEmailAddress = 'affiliates@ez-ajax.com';

	Request.invalidEmailDomains = Request.primitiveCode.getInvalidEmailDomains();

	application.rootURL = application.blog.getProperty("blogURL");
	application.rootURL = reReplace(application.rootURL, "(.*)/index.cfm", "\1");

	ar = ListToArray(application.rooturl, "/");
	ar2 = ListToArray(ar[2], ".");
	ar2a = ArrayNew(1);
	ar2a[ArrayLen(ar2a) + 1] = ar2[1];
	ar2a[ArrayLen(ar2a) + 1] = ar2[ArrayLen(ar2) - 1];
	ar2a[ArrayLen(ar2a) + 1] = ar2[ArrayLen(ar2)];
	ar[2] = ArrayToList(ar2a, ".");
	if ( (UCASE(ar[1]) eq UCASE('http:')) AND (ArrayLen(ar) eq 3) ) {
		application.rootURL = ar[1] & '//' & ar[2] & '/' & ar[3];
	}
</cfscript>

<cfscript>
//	Request.cfincludeCFM = 'cfinclude_index_body.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	Request.cfincludeCFM = 'app/cfinclude_index.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	// Comment out the following lines once you have read the information containd below.
//	writeOutput('<p align="justify"><small>This is the file called "cfinclude_application.cfm" that contains user-defined code that is included during the application.cfm processing cycle.</small></p>');
//	writeOutput('<p align="justify"><small>The purpose of the "cfinclude_application.cfm" file is to allow the end-user to create user-defined code that defines ColdFusion source files via the variable called "Request.cfincludeCFM" that are loaded sequentially during the processing of the index.cfm file.</small></p>');
//	writeOutput('<p align="justify"><small>This allows the end-user to create user-defined code that runs in the client browser from the context of the exAJAX<sup>(tm)</sup> Framework thus allowing ezAJAX<sup>(tm)</sup> Applications to be easily crafted with little effort.</small></p>');
//	writeOutput('<p align="justify"><small>At this time the following list of ColdFusion source files should contain executable source code "#Request.cfincludeCFM#".</small></p>');
	
	Request.DOCTYPE = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';
</cfscript>

<cfsavecontent variable="htmlHeader">
	<cfoutput>
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/app/style.css"> 
		#Request.commonCode.tabsHeader("20px", "120px", "20px", "830", "0px")#
	</cfoutput>
</cfsavecontent>

<cfsetting showdebugoutput="No">
