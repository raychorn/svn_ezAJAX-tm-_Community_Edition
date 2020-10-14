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

	if (IsDefined("URL.sessid")) {
		Request.primitiveCode.readSessionFromDb(URL.sessid);
	} else {
		Request.primitiveCode.readSessionFromDb();
	}

</cfscript>