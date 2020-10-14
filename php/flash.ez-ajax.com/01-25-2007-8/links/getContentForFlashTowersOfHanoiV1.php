<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>flash.ez-ajax.com (c). Copyright 1990-<?php $today = getdate(); print_r($today["year"]);?> , All Rights Reserved.</title>
  <?php
       include_once("..\includes\documentHeader.php");
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
      		<td class="primaryContentContainerHeader">
      			<p align="justify"><a href="/php/links/getContentForFlashTowersOfHanoi.php" target="_self">Flash Towers Of Hanoi v1 :: Classic Computer Science Project</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<iframe frameborder="0" scrolling="No" width="650" height="450" src="/app/flash/towersOfHanoiFlash/towersofhanoi.html?nocache=<?php print_r(rand(1, 32767)); ?>"></iframe>
			</td>
		</tr>
	</table>

 </body>
</html>
