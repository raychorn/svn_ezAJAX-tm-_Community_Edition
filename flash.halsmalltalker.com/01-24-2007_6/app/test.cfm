<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>Tabs test</title>
	<LINK rel="STYLESHEET" type="text/css" href="../../StyleSheetFF.css"> 
	<LINK rel="STYLESHEET" type="text/css" href="../../commonStyles.css"> 
	<style type="text/css">
		.TabSystem1 {
			background: transparent;
			border: none;
			margin: 0 0 0 50px;
			padding: 0;
			border: 1px solid #666;
		}
		
		.content {
			position: relative;
			font-family: Trebuchet MS, Arial, sans-serif;
			font-size: xx-small;
			padding: 8px 12px 12px 12px;
			border-top: 1px solid #999;
			/*
			border: 1px solid #666;
			border-bottom: 1px solid #999;
			border-left: 1px solid #666;
			*/
			z-index: 500;
			background-color: #f3f6f9;
		}
		         
		.content .padder{
		}
		    
		div.tabs {
			font-size: medium;
			line-height: 10px;
			white-space: nowrap;
			font-family: Verdana, Arial, sans-serif;
			cursor: default !important;
			font-weight: 700 !important;
			z-index: 10000;
			/* -Moz-User-Select: none;*/
		}
		
		.tab {
			border: 1px solid #347;
			padding: 2px 2px 1px 2px;
			background-color: #bcd;
			color: #303036;
			z-index: 100;
			border-bottom-width: 0;
			text-decoration: none;
		}
		
		.subtab {
			border: 1px solid #347;
			padding: 2px 2px 1px 2px;
			background-color: #bcd;
			color: #303036;
			z-index: 100;
			text-decoration: none;
		}
		
		.tabHover {
			border: 1px solid #347;
			background-color: #46596f;
			padding: 2px 1px 1px 1px;
			color:#fff;
			z-index: 1200;
			border-bottom-width: 0;
		}
		
		.tabActive { 
			padding: 3px 2px 3px 2px;
			color: #060610 ;
			background-color: #f3f6f9;
			z-index: 10000;
		}
		
		.tabHidden { 
			padding: 3px 2px 3px 2px;
			color: #060610 ;
			background-color: #f3f6f9;
			z-index: 10000;
			display: none;
		}
		     
		#viewsrc{
			width: 130px;
			border: 1px solid #003;
			margin: 8px;
			background-color: #f3f6fc;
			position: absolute;
			top: 12px;
			left: 12px;
		}
		    
		#controls {
			position: absolute;
			top: 380px;
			left: 120px;
			width: 550px;
			height: 250px;
			padding: 10px;
			background: #f3f6f9;
			font-family: arial, sans-serif;
			line-height: 20px;
			font-size: xx-small;
		}
		
		#controls a {
			color: #113;
			font-family: "Courier New", courier, monospace;
		}
		
		#controls a:hover {
			background-color: #fff;
			color: #c00;
		}
	</style>
</head>

<body>

<div id="TabSystemContainer" class="TabSystem1" style="position: absolute; top: 80px; left: 0px;">
<div id="TabSystem0" style="width: 100%;"><div id="div_TabSystem0_tabs" class="tabs" style="height: 15px;"><table cellpadding="0" cellspacing="0"><tbody><tr id="tr_tabsLayout_0"><td><div id="div_TabSystem0_tab1" class="tab tabActive" style="display: inline; height: 15px; cursor: pointer;" onclick="ezTabsObj.activateTab(0, 1); return false;" onmouseover="ezTabsObj.openSubTabs(0, 1); return false;" onmouseout="ezTabsObj.deactivateTab(0, 1); return false;"><a id="anchor_TabSystem0_tab1_L" name="anchor_TabSystem0_tab1_L">&nbsp;</a><a id="anchor_TabSystem0_tab1" name="anchor_TabSystem0_tab1" href="#Tab1" accesskey="1" tabindex="1" title="Site Background" onclick="ezTabsObj.activateTab(0, 1); return false;">&nbsp;<font size="1"><small>Site Background</small></font></a><a id="anchor_TabSystem0_tab1_R" name="anchor_TabSystem0_tab1_R">&nbsp;</a><div id="div_TabSystem0_subtabsContainer1"></div></div></td></tr></tbody></table></div><div id="div_TabSystem0_contents" class="content"><div id="div_TabSystem0_content1_1" class="content" style="display: inline;"></div></div></div>
</div>

</body>
</html>
