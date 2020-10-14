<!--- cfinclude_application.cfm --->

<cfinclude template="app/cfinclude_application.cfm">

<cfscript>
//	Request.importModules = 'ezThoughtBubbleObj,ezGUIActsObj,ezTables,ezFishEyeMenuObj'; // This can be a comma-delimited list of JavaScript Modules that are loaded in the order specified during the index.cfm processing cycle.  Core Modules are always loaded.
	Request.importModules = 'ezThoughtBubbleObj,ezGUIActsObj,ezTables,ezTabsObj'; // This can be a comma-delimited list of JavaScript Modules that are loaded in the order specified during the index.cfm processing cycle.  Core Modules are always loaded.

//	Request.cfincludeCFM = 'cfinclude_index_body.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	Request.cfincludeCFM = 'app/cfinclude_index_10-20-2006.cfm'; // This can be a comma-delimited list of ColdFusion source files that are included in the order specified during the index.cfm processing cycle.
	// Comment out the following lines once you have read the information containd below.
//	writeOutput('<p align="justify"><small>This is the file called "cfinclude_application.cfm" that contains user-defined code that is included during the application.cfm processing cycle.</small></p>');
//	writeOutput('<p align="justify"><small>The purpose of the "cfinclude_application.cfm" file is to allow the end-user to create user-defined code that defines ColdFusion source files via the variable called "Request.cfincludeCFM" that are loaded sequentially during the processing of the index.cfm file.</small></p>');
//	writeOutput('<p align="justify"><small>This allows the end-user to create user-defined code that runs in the client browser from the context of the exAJAX<sup>(tm)</sup> Framework thus allowing ezAJAX<sup>(tm)</sup> Applications to be easily crafted with little effort.</small></p>');
//	writeOutput('<p align="justify"><small>At this time the following list of ColdFusion source files should contain executable source code "#Request.cfincludeCFM#".</small></p>');
	
	Request.DOCTYPE = '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';
	ezAJAX_title = 'ezAJAX&##8482 - AJAX made Easy !  ';

	cf_productionServerToken = '.ez-ajax.com';
	bool_isServerProduction = (FindNoCase(cf_productionServerToken, CGI.SERVER_NAME) gt 0); // this boolean value tells the framework when your app is running in Production mode versus Development mode - Development mode displays the debugging menu whereas Production mode does not...
//	bool_isServerProduction = true;
</cfscript>

<cfsavecontent variable="htmlHeader">
	<cfoutput>
		<LINK rel="STYLESHEET" type="text/css" href="#ezAJAX_webRoot#/app/style.css"> 
		<link rel="shortcut icon" type="image/x-icon" href="#ezAJAX_webRoot#/favicon.ico">
		<style type="text/css">
		<!--
		A.ssmItems:link		{color:black;text-decoration:none;}
		A.ssmItems:hover	{color:black;text-decoration:none;}
		A.ssmItems:active	{color:black;text-decoration:none;}
		A.ssmItems:visited	{color:black;text-decoration:none;}
		//-->
		</style>
		<cfif 0>
			#Request.commonCode.tabsHeader(10, 100, 5, 700, 0)#
			<cfscript>
				_visible_tabs_begin = 1;
				_visible_tabs_end = 9;
				_num_tabs_max = 9;
			</cfscript>
			<script language="JavaScript1.2" type="text/javascript">
			<!--
			/** TabParams
			 * eventType		- What action activates a tab? "click" | "mouseover" 
			 *                       | "mousedown" | "mouseup" .
			 *
			 * tabTagName	    - "span" | "img" | "*" -- span or img speeds up initialization.
			 *                    use "*" if your have both span and img tabs.
			 * imgOverExt	    - A file name suffix before the extension .
			 *                    if src="calendar.gif" is the normal file and you want it to 
			 *                    be "calendaro.gif" on mouseover, then imgOverExt is "o".
			 *
			 * imgActiveExt	    - A file name suffix before the extension .
			 *                    if src="calendaro.gif" is the normal file and you want it to 
			 *                    be "calendaro.gif" on mouseover, then imgOverExt is "o".
			 *
			 * cookieScope		- "page" | "site" | "none" 
			 *                     -- "page" 
			 *                         page scope (default) saves multiple tab states for different 
			 *                         tabsystems on your site. 
			 *                         Page scope is useful when you want to save the state of
			 *                         different tabsystems on your site. Page scope uses multiple 
			 *                         cookies.
			 *
			 *                    -- "site"
			 *                        site scope saves the state for tabSystems that
			 *                        may be used on multiple pages (such as with included files.
			 *                        This is most useful for using the same tabSystem(s) on 
			 *                        different pages, as with a server side include file. Site scope 
			 *                        uses only 1 cookie.
			 *
			 *                    -- "none"
			 *                        No cookie will be used.
			 */
			 	TabParams = {
					eventType       : "click",
					tabTagName      : "a",
					imgOverExt      : "",
					imgActiveExt    : "",
					cookieScope		: "page"
				};
	
				_vis_tabs_begin = eval(#_visible_tabs_begin#);
				_vis_tabs_end = eval(#_visible_tabs_end#);
	
				_num_vis_tabs_max = (_vis_tabs_end - _vis_tabs_begin) + 1;
				
				_const__tab = "tab";
				_const_cell_tab = "cell_" + _const__tab;
				
				_const_releaseLogSubReport = "_releaseLogSubReport";
				_const_comments_symbol = "_comments_";
				
				_const_releaseLogSubReportRow = "td_releaseLogReportDetail.";
				
				_const_content = "content_areaAboveReports";
				_const__content = "content";
				
				_const_content_loading = "content_loading";
	
				_const_hiliteDiv_id = "xxxxxYYYYYzzzzz";
				_const_hilite_style = "BORDER-RIGHT:black 1px solid;BORDER-TOP:black 1px solid;BORDER-LEFT:black 1px solid;BORDER-BOTTOM:black 1px solid;background-color: White;";
	
				_const_hiliteDiv_begin = "<span id=" + _const_hiliteDiv_id + " style=\"" + _const_hilite_style + "\">";
				_const_hiliteDiv_end = "</span>";
	
				_const_begin_hilite = _const_hiliteDiv_begin + "<font size=\"-1\" color=\"##FF0000\"><B><U><I>";
				_const_end_hilite = "</I></U></B></font>" + _const_hiliteDiv_end;
	
				_const_tr_tag_begin = "<TR";
				_const_id_param_begin = "id=";
				_const_style_param_begin = "style=";
				
				_allow_RefreshVCRControls = true;
				_allow_AutoTabsAdjustment = false;
	
				_deferred_performSearchFor = "";
				
				stack_FocusOnTabWithAnchorText = [];
				stack_performFunctionsOnTabChanged = [];
	
				function tabChanged() {
					var _obj = _$("cell_" + this.activeTab.id);
					var _num = activeTabNumFrom(this);
				
					clearOnTabChangedRegistrations(false);
					registerFunctionsOnTabChanged(_num);
					
					return( _tabChanged(_num));
				}
	
				function tabSystem_onloadWindow() {
					try {
						tabInit();
					} catch (e) { ezAlertError('1.1\n' + ezErrorExplainer(e)); };
					try {
						var ts = TabSystem.list["TabSystem1"];
						
						if (ts != null) {
							ts.addEventListener("onchange", tabChanged);
			
							refreshTabs(ts);
							
							RefreshVCRControls();
						}
					} catch (e) { ezAlertError('1.2\n' + ezErrorExplainer(e)); };
				}
			-->
			</script>
			
			<script language="JavaScript1.2" src="#ezAJAX_webRoot#/app/js/tabs.js/cookie.js" type="text/javascript"></script>
			<script language="JavaScript1.2" src="#ezAJAX_webRoot#/app/js/tabs.js/utils.js" type="text/javascript"></script>
			<script language="JavaScript1.2" src="#ezAJAX_webRoot#/app/js/tabs.js/tabs.js" type="text/javascript"></script>
			<script language="JavaScript1.2" src="#ezAJAX_webRoot#/app/js/tabs.js/tabs_support.js" type="text/javascript"></script>
		</cfif>
		<script language="JavaScript1.2" type="text/javascript">
			var const_whatsNew_menu_symbol = "What's New ?";
			var const_whatsIs_menu_symbol = "What is ezAJAX ?";
			var const_JSONSupport_menu_symbol = "JSON Support";
			var const_Features_menu_symbol = "Features Chart";
			var const_Installation_menu_symbol = "Installation";
			var const_RuntimeLicenses_menu_symbol = "Manage Runtime Licenses";
			var const_Downloads_menu_symbol = "Downloads";
			var const_DocsAndGuides_menu_symbol = "Documentation";
			var const_SampleApps_menu_symbol = "Sample Apps";
			var const_DemosTutorials_menu_symbol = "Demos & Tutorials";
			var const_SupportForum_menu_symbol = "Support Forum";
			var const_ContactUs_menu_symbol = "Contact Us";
			var const_SampleWeb20API_menu_symbol = "Web 2.0 API Sample";
		</script>
		<SCRIPT SRC="#ezAJAX_webRoot#/app/js/menu/ssm.js" language="JavaScript1.2" type="text/javascript"></SCRIPT>
		<SCRIPT SRC="#ezAJAX_webRoot#/app/js/menu/ssmItems.js" language="JavaScript1.2" type="text/javascript"></SCRIPT>
		<cfif 0>
			<script language="JavaScript1.2" src="/app/js/resources/stmenu.js" type="text/javascript"></script>
		</cfif>
	</cfoutput>
</cfsavecontent>

<cfsetting showdebugoutput="No">
