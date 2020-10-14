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
      		<td class="primaryContentContainerHeader" colspan="2">
      			<p align="justify"><a href="/php/links/getContentForFlash5DynamicNewsDemo.php" target="_self">Flash 5 Dynamic News Demo</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<?php print_r(flashContent("newsFlashHeadlines", 150, 500, "/app/flash/news-flash-headlines/news-flash-headlines.swf?nocache=" . rand(1, 32767), "#164f9f")); ?>
			</td>
			<td valign="top">
				<p align="justify">This Flash 5 component is completely dynamic.  It reads the data that is displayed using a technique that was used long before Flash Remoting ever existed.<br><br>This proves the fact that Flash 5 was able to be data-driven using nothing more than the HTTP protocol which was quite inefficient as compared with Flash Media Server 2, for instance.<br><br>As you can see this instance of this Demo shows nothing more than the current Month and Year with no other data.<br><br><a href="/app/flash/news-flash-headlines/news-flash-headlines.fla" target="_blank">Click here to download the Flash Source File.</a></p>
			</td>
		</tr>
	</table>

 </body>
</html>
