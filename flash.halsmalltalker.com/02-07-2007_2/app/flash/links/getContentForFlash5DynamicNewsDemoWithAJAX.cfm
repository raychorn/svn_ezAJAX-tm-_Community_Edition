<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlash5DynamicNewsDemoWithAJAX.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<cfscript>
		redirectOnExternalReferer();
	</cfscript>
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader" colspan="2">
				<p align="justify"><NOBR><a href="/app/flash/links/getContentForFlash5DynamicNewsDemoWithAJAX.cfm" target="_self">Flash 5 Dynamic News Demo with AJAX</a></NOBR></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<div id="div_Flash5_DynamicNewsDemo_with_AJAX"></div>
			</td>
			<td valign="top">
				<p align="justify">This Flash 5 component is completely dynamic however this time we shall populate a data set via an AJAX Server Command.<br><br>Click this button --> <button id="btn_populateDynamicNewsDataSet" class="buttonClass" style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="this.disabled = true; ezAJAXEngine.$[0].doAJAX(\'populateDynamicNewsDataSet\', \'handlePopulateDynamicNewsDataSet\', \'method\', 1); return false;">[Populate Data Set]</button> to populate the dataset and trigger the Flash instance so it will appear with the data that was just created.<br><br>Once the data set has been created and the Flash component has been displayed this will prove it is possible to use AJAX with Flash to dynamically create data for a data-driven Flash component.<br><br>Also keep in mind this Demo will use DHTML to populate a &lt;DIV&gt;&lt;/DIV&gt; tag with a live Flash component.<br><br><a href="/app/flash/news-flash-headlines2/news-flash-headlines.fla" target="_blank">Click here to download the Flash Source File.</a></p><br><br><div id="div_Flash5_DynamicNewsDemo_with_AJAX_desc" style="border: solid thin silver; font-size: ' + bodyFontSize + '">This block of text will be replaced dynamically AFTER you click that button.</div>
			</td>
		</tr>
	</table>	
	
	</body>
	</html>
</cfoutput>
