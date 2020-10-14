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
            redirectBrowser('/?linkname=' . $ar[count($ar) - 1]);
       }
  ?>
      <table width="590">
      	<tr>
      		<td class="primaryContentContainerHeader">
      			<p align="justify"><a href="/php/links/getContentForFlashTowersOfHanoi.php" target="_self">Flash Towers Of Hanoi :: Classic Computer Science Project</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<p align="justify"><a href="/php/links/getContentForFlashTowersOfHanoiV1.php" target="_self">Flash Towers Of Hanoi Version 1 :: The original version.</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify"><a href="/php/links/getContentForFlashTowersOfHanoiV2.php" target="_self">Flash Towers Of Hanoi Version 2 :: with Variable Runtime Speed.</a></p>
			</td>
		</tr>
	</table>

 </body>
</html>
