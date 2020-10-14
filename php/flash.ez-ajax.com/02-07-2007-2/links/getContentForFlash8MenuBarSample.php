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
      			<p align="justify"><a href="/php/links/getContentForFlash8.php" target="_self"><img src="/app/flash/images/undo.gif" width="33" height="18" border="0" title="Back to the Previous Page."></a>&nbsp;<a href="/php/links/getContentForFlash8MenuBarSample.php" target="_self">Flash 8 Menu Bar Sample for www.ez-ajax.com</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top" bgcolor="#0060E0">
				<?php print_r(flashContent("sampleMenuBar", 760, 120, "/app/flash/sampleMenuBar/main-menu-movie.swf?nocache=" . rand(1, 32767), "#164f9f")); ?>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify">This Flash 8 Menu Bar Sample was created to act as a Menu Bar for www.ez-ajax.com.  It was coded using a proprietary technique that allows for Rapid Development of Flash components that can be quite complex using very little development time.</p>
				<p align="justify">Notice the simulated computer monitor display that seems to be displaying animated text that scrolls from bottom to top; not a bad way to add some realism to a spiffy Flash component, huh ?</p>
			</td>
		</tr>
	</table>

 </body>
</html>
