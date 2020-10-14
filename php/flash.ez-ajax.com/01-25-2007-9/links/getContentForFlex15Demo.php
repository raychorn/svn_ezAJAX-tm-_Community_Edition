<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>flash.ez-ajax.com (c). Copyright 1990-<?php $today = getdate(); print_r($today["year"]);?> , All Rights Reserved.</title>
  <?php
       include_once("..\includes\documentHeader.php");
	   print_r(docHeader('../..'));
  ?>
	<script language="JavaScript1.2" type="text/javascript" src="popUpWindowForURL.js"></script>
 </head>
 <body>
  <?php
       if (stristr($_SERVER['HTTP_REFERER'], $_SERVER['HTTP_HOST']) == false) {
          	$ar = splitStringToArray($_SERVER['SCRIPT_NAME']);
            redirectBrowser('/index.cfm?linkname=' . $ar[count($ar) - 1]);
       }
  ?>
      <table width="590">
      	<tr>
      		<td class="primaryContentContainerHeader">
      			<p align="justify"><a href="/php/links/getContentForFlex15Demo.php" target="_self">Flex 1.5 Demo</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<p align="justify">This Flex 1.5 Demo was originally created for one of my clients and was designed to act as an Intranet portal for their internal operations center.  The Database is brought to you by a 64-bit SQL Server 2005 running on a Dual Core 64-bit AMD 4200+ running 64-bit Windows 2003 R2 with 4 GB RAM.<br><br>This Flex 1.5 Demo makes heavy use of ActionScript which by the by is pretty much the same as JavaScript in terms of programming.  ActionScript code can be interchanged with JavaScript for the code that can be consumed by your typical Flex 1.5 Application and your browser.  The ability to interchange and reuse ActionScript with JavaScript makes it possible to reduce your programming effort and maintenance.   Flex 1.5 programming is not for the weak of heart where ActionScript is concerned as it can take some time to achieve the same levels of complexity and functionality your typical JavaScript programmer may be familiar with for web programming.<br><br>Flex 1.5 is built into ColdFusion MX 7 although for some odd reason almost nobody at Adobe would confirm this.  Take a close look at the API for Flex 1.5 and whether or not the Flex 1.5 API can be used by the flavor of Flash ColdFusion MX 7 knows how to generate for you as well as the tag language one uses to create Flash components using ColdFusion MX 7 and you too may come to realize Flex 1.5 or a variant thereof was embedded into ColdFusion MX 7 because this seems to be the case.</p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify"><a href="" onclick="popUpWindowForURL('http://www.ez-ajax.com/flex-demo/index.html', 'Flex15Demo'); return false;">Click HERE to Launch the Flex 1.5 Demo</a></p>
			</td>
		</tr>
      </table>

 </body>
</html>
