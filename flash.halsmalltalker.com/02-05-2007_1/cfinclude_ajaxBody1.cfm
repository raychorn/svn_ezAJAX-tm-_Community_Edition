<cfscript>
	cf_REMOTE_ADDR = CGI.REMOTE_ADDR;
	cf_SERVER_NAME = 'http:' & '/' & '/' & CGI.SERVER_NAME & '/' & CGI.SCRIPT_NAME;
	
	cf_isColdFusionMX7 = application.isColdFusionMX7;

	cf_Session_ID = CreateUUID();
</cfscript>
<cfsavecontent variable="jsCodeStoreB">
	<cfoutput>
	var js_AUTH_USER = '#Request.AUTH_USER#';
	var js_ezAJAX_webRoot = '#ezAJAX_webRoot#';
	var js_ezAJAX_webRoot_prefix = '#Request._prefix#';
	var cf_Session_ID = '#cf_Session_ID#';
	var js_isDebugMode = (('#Request.ezAJAX_isDebugMode#'.toUpperCase() == 'YES') ? true : false);
	var js_trademarkSymbol = '#cf_trademarkSymbol#';
	var cf_cgiReferer = '';
	<cfif (IsDefined("CGI.SERVER_NAME"))>cf_cgiReferer = '#CGI.SERVER_NAME#';</cfif>
	var const_div_floating_debug_menu = '#Request.cf_div_floating_debug_menu#';
	var const_div_floating_debug_menu_content = 'div_debugOuterContainer';
	var browser_is_op = false;
	var browser_is_ns = false;
	var browser_is_ff = false;
	var browser_is_ie = false;
	var js_REMOTE_ADDR = '#cf_REMOTE_ADDR#';
	var js_SERVER_NAME = '#cf_SERVER_NAME#';
	var jsBool_isColdFusionMX7 = (('#cf_isColdFusionMX7#'.toUpperCase() == 'YES') ? true : false);
	var jsBool_isDebugMode = (('#Request.ezAJAX_isDebugMode#'.toUpperCase() == 'YES') ? true : false);
	var jsBool_isServerLocal = (('#Request.commonCode.isServerLocal()#'.toUpperCase() == 'YES') ? true : false);
	var bool_isServerProduction = (('#bool_isServerProduction#' == 'true') ? true : false);
	
	var oAJAXEngine = -1;
	</cfoutput>
</cfsavecontent>
<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(jsCodeStoreB)#</script>

<cfset bool_useGeonosis = false>
<cfif (bool_useGeonosis)>
	<script language="JavaScript1.2" src="_js/20_GeonosisGUI.js" type="text/javascript"></script>
</cfif>

<cfif (NOT bool_isServerProduction)>
	<div id="#Request.cf_div_floating_debug_menu#" style="display: none; height: 25px; background-color: ##80FFFF; border: thin solid Black; z-index: 65535;">
		<button id="btn_fetchDebugMenu" class="buttonMenuClass<cfif (Request.commonCode.ezIsBrowserFF() OR Request.commonCode.ezIsBrowserNS())>FF</cfif>" onclick="this.disabled = true; function handle_DynamicCodeInitiator_fetchDebugMenu() { if (cache_processDynamicCodeTracker[handle_DynamicCodeInitiator_fetchDebugMenu] != null) { clearInterval(cache_processDynamicCodeTracker[handle_DynamicCodeInitiator_fetchDebugMenu]); cache_processDynamicCodeTracker[handle_DynamicCodeInitiator_fetchDebugMenu] = null; stack_processDynamicCodeTracker.pop(); }; try { oAJAXEngine.doAJAX('ezAJAX_PopulateDebugPanel', 'handle_ezAJAXPopulateDebugPanel'); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; }; function boolIsModuleLoaded_ezDebugPanel() { return true; }; if (global_previouslyLoadedObjects.indexOf('modules=ezDebugPanel') != -1) { try { oAJAXEngine.doAJAX('ezAJAX_PopulateDebugPanel', 'handle_ezAJAXPopulateDebugPanel'); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; } else { ezDynamicObjectLoader('#ezAJAX_webRoot#/ezAjax/loader.cfm?out=1&dsr=1&modules=ezDebugPanel'); processDynamicCodeTracker(handle_DynamicCodeInitiator_fetchDebugMenu, boolIsModuleLoaded_ezDebugPanel); } return false;" title="Click this button to begin using the Debug menu.">[Open ezAJAX Debug Menu]</button>
	</div>
</cfif>

<div id="ShoppingCartContainer"></div>
<div id="ThoughtBubbleContainer"></div>

<cfsavecontent variable="finaleJavaScriptCode">
	<cfoutput>
		ezAJAXEngine.RuntimeLicenseStatus = '#Request.RuntimeLicenseStatus#'; try { if (ezAJAXEngine.RuntimeLicenseStatus.length > 0) { ezAlertHTMLError(ezAJAXEngine.RuntimeLicenseStatus); ezAJAXEngine.RuntimeLicenseStatus = ''; } } catch(e) { ezAlertError('System Error: Cannot determine Runtime License Status.'); };
	</cfoutput>
</cfsavecontent>		

<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(finaleJavaScriptCode)#</script>

