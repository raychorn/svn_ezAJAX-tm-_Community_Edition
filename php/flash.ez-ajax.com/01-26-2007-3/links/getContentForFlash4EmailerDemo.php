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
      			<p align="justify"><a href="/php/links/getContentForFlash4EmailerDemo.php" target="_self">Flash 4 Emailer Demo</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<p align="justify">This Flash 4 Demo is not functional at this time other than to serve as a sample of the work that was done way back whenever this particular Flash 4 component was functional.<br><br>This Flash 4 component could have been brought up to date and made functional however doing so would have required a complete redesign using the latest Flash 8 coding techniques that did not exist when this original Flash 4 component was created.<br><br>Additionally this Flash 4 component required an email server in order to function.<br><br><a href="/app/flash/emailerForm/emailerForm.fla" target="_blank">Click here to download the Flash Source File.</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<?php print_r(flashContent("emailerForm", 400, 300, "/app/flash/emailerForm/emailerForm.swf?nocache=" . rand(1, 32767), "#164f9f")); ?>
			</td>
		</tr>
	</table>
 </body>
</html>
