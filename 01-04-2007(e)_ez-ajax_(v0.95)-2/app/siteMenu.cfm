<cfsetting enablecfoutputonly="Yes">
<cfparam name="mode" type="string" default="">
<cfset const_info_symbol = "INFO">
<cfset const_JSON_symbol = "JSON">
<cfset const_install_symbol = "INSTALL">
<cfset const_samples_symbol = "SAMPLES">
<cfset const_downloads_symbol = "DOWNLOADS">
<cfset const_docs_symbol = "DOCS">
<cfset const_licenses_symbol = "LICENSES">
<cfset const_support_symbol = "SUPPORT">
<cfset const_web20_symbol = "WEB20">
<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>

<title>Site Menu for ezAJAX Enterprise Edition using Dojo 0.3.1</title>

<script type="text/javascript">
	var djConfig = {isDebug: true, debugAtAllCosts: false};
</script>
<script src="../dojo-0.3.1-ajax/dojo.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript">
	dojo.require("dojo.widget.FisheyeList");
	dojo.hostenv.writeIncludes();
</script>

<style>

.dojoHtmlFisheyeListBar {
	margin: 0 auto;
	text-align: center;
}

.outerbar {
	background-color: white;
	text-align: center;
	position: absolute;
	left: 0px;
	top: 0px;
	width: 100%;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	padding: 0;
	margin: 0;
}

.page {
	padding: -5px -5px -5px -5px;
}

</style>
</head>
<body>

<div class="outerbar">
	<div class="dojo-FisheyeList"
		dojo:itemWidth="50" dojo:itemHeight="50"
		dojo:itemMaxWidth="100" dojo:itemMaxHeight="100"
		dojo:orientation="horizontal"
		dojo:effectUnits="2"
		dojo:itemPadding="10"
		dojo:attachEdge="top"
		dojo:labelEdge="bottom"
		dojo:enableCrappySvgSupport="false"
	>
		<cfif (Len(mode) eq 0) OR (mode is const_info_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(1); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };" 
				dojo:iconsrc="images/icons/32x32/large-icons.gif" caption="What's New">
			</div>
		</cfif>
	
		<cfif (Len(mode) eq 0) OR (mode is const_JSON_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(2); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/32x32/network-2.gif" caption="JSON Support">
			</div>
		</cfif>
	
		<cfif (Len(mode) eq 0) OR (mode is const_info_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(3); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/32x32/computer.gif" caption="Product Info">
			</div>
		</cfif>
		
		<cfif (Len(mode) eq 0) OR (mode is const_install_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(4); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/32x32/install-software.gif" caption="Installation">
			</div>
		</cfif>

		<cfif (Len(mode) eq 0) OR (mode is const_samples_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(5); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/32x32/test_MoxieThumb.gif" caption="Sample Apps (using the Dojo Toolkit, etc.)">
			</div>
		</cfif>
		
		<cfif (Len(mode) eq 0) OR (mode is const_samples_symbol) OR (mode is const_info_symbol) OR (mode is const_downloads_symbol) OR (mode is const_docs_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(6); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/32x32/run-software.gif" caption="Demos, Tutorials & Product Info">
			</div>
		</cfif>
		
		<cfif (Len(mode) eq 0) OR (mode is const_samples_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(7); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/200x200/wafers.gif" caption="Semiconductor Wafer Analysis Prototype">
			</div>
		</cfif>

		<cfif (Len(mode) eq 0) OR (mode is const_info_symbol) OR (mode is const_web20_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(8); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/yahoo-logo.gif" caption="Yahoo Search V2 API Sample using JSON">
			</div>
		</cfif>

		<cfif (Len(mode) eq 0) OR (mode is const_info_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(9); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/32x32/help.gif" caption="Articles, Whitepapers &amp; Help">
			</div>
		</cfif>

		<cfif (Len(mode) eq 0) OR (mode is const_info_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(10); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/32x32/notes.gif" caption="Features Chart">
			</div>
		</cfif>

		<cfif (Len(mode) eq 0) OR (mode is const_downloads_symbol) OR (mode is const_docs_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(11); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="../dojo-0.3.1-ajax/demos/widget/images/icon_update.png" caption="ezAJAX Downloads">
			</div>
		</cfif>
	
		<cfif (Len(mode) eq 0) OR (mode is const_downloads_symbol) OR (mode is const_info_symbol) OR (mode is const_docs_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(12); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/32x32/documents.gif" caption="Documentation">
			</div>
		</cfif>

		<cfif (Len(mode) eq 0) OR (mode is const_licenses_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(13); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="images/icons/32x32/access-2.gif" caption="Manage/Upgrade Runtime Licenses">
			</div>
		</cfif>

		<cfif (Len(mode) eq 0) OR (mode is const_support_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(14); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="../dojo-0.3.1-ajax/demos/widget/images/icon_email.png" caption="Contact Us">
			</div>
		</cfif>
	
		<cfif (Len(mode) eq 0) OR (mode is const_support_symbol)>
			<div class="dojo-FisheyeListItem" onClick="try { parent.load_app(15); } catch (e) { alert('Unable to access the selected menu item at this time.  Try back later on... Thanks.'); };"
				dojo:iconsrc="../dojo-0.3.1-ajax/demos/widget/images/icon_users.png" dojo:caption="Support Forum">
			</div>
		</cfif>
	</div>
</div>

<div class="page">
</div>

</body>
</html>
</cfoutput>
