<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
      			<p align="justify"><a href="/php/links/getContentForFlash5Demo.php" target="_self">Flash 5 Adverts Demo</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<?php print_r(flashContent("AdvertsClip1", 468, 80, "/app/flash/Adverts Movie/AdvertsClip1.swf?nocache=" . rand(1, 32767), "#164f9f")); ?>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify">This Flash 5 Demo is not functional at this time other than to serve as a sample of the work that was done way back whenever this particular Flash 5 component was functional.<br><br>This Flash 5 component could have been brought up to date and made to work with the Flash Media Server 2.<br><br>The Flash Media Server could have provided the ability to track stats on the Adverts that were displayed as well as those Adverts that were clicked.<br><br>Flash Media Server could have been also used to pick the next Advert to be shown.<br><br><a href="/app/flash/Adverts Movie/AdvertsClip1.fla" target="_blank">Click here to download the Flash Source File.</a></p>
			</td>
		</tr>
	</table>

 </body>
</html>
