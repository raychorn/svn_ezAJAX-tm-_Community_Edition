<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlash5DynamicNewsDemoWithInteractiveAJAX.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<cfscript>
		redirectOnExternalReferer();
	</cfscript>
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader" colspan="2">
				<p align="justify">
					<NOBR><a href="/app/flash/links/getContentForFlash5DynamicNewsDemoWithInteractiveAJAX.cfm" target="_self">Flash 5 Dynamic News Demo with Interactive AJAX</a></NOBR>
				</p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<div id="div_Flash5_DynamicNewsDemo_with_AJAX2"></div>
			</td>
			<td valign="top">
				<p align="justify">This time we will use AJAX to interactively create the dataset that will be transmitted to the Flash 5 component.  We have already seen how a Flash 5 component can grab data from a web server but demo shows how AJAX can be used to create the dataset which will then be fetched by the Flash 5 component.<br><br>Click this button --> <button id="btn_buildDynamicNewsDataSet2" class="buttonClass" style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="this.disabled = true; buildFlashAJAXData2(); return false;">[Build Data Set]</button> to begin the process of interactively building the dataset using AJAX.<br><br>Once the data set has been created and the Flash component has been displayed this will prove it is possible to use AJAX with Flash to dynamically create data for a data-driven Flash component.  The data you will build using AJAX will be stored in the Session, your Session, on the Server.  By using the Session as a temporary storage container we achieve a level of physical security that keeps other users who may be using this same Demo at the same time you are from being able to access your data.<br><br>Also keep in mind this Demo will use DHTML to populate a &lt;DIV&gt;&lt;/DIV&gt; tag with a live Flash component.<br><br><a href="/app/flash/news-flash-headlines3/news-flash-headlines3.fla" target="_blank">Click here to download the Flash Source File.</a></p><br><br><div id="div_Flash5_DynamicNewsDemo_with_AJAX_desc" style="border: solid thin silver; font-size: ' + bodyFontSize + '">This block of text will be replaced dynamically AFTER you click that button.</div>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
</cfoutput>
