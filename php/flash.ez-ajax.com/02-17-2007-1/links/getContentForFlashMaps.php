<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
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
            redirectBrowser('/?linkname=' . $ar[count($ar) - 1]);
       }
  ?>
	<?php print(handleNoScript()); ?>
      <table width="590">
      	<tr>
      		<td class="primaryContentContainerHeader">
					<table width="100%">
						<tr>
							<td align="left">
								<p align="justify"><a href="/php/links/getContentForFlashMaps.php" target="_self">Flash Maps</a></p>
							</td>
							<td align="right">
							</td>
						</tr>
					</table>
      		</td>
      	</tr>
			<tr>
				<td height="200" valign="middle">
					<table width="100%">
						<tr>
							<td width="80%" valign="top">
								<p align="justify">Yahoo Maps Sample(s) that features the Yahoo Maps Flash API - this was quite easy to code.</p>
								<p align="justify">Yahoo Maps Sample(s) both samples feature City/State/Zip or Full Address Lookup and All 3 Map types plus Local Search that allows business types to be found and displayed on the map.</p>
							</td>
							<td width="*" valign="top">
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/maps/ezMapsSample1.html', 'ezMapsSample1', 750, 510); return false;">Yahoo Maps Sample #1 - Local Search Overlay</a></NOBR></p>
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/maps/ezMapsSample2.html', 'ezMapsSample2', 750, 510); return false;">Yahoo Maps Sample #2 - Traffic Overlay</a></NOBR></p>
							</td>
						</tr>
					</table>
					<!--
					 <h4>Under construction...  Come on back a bit later-on...</h4>
					 -->
				</td>
			</tr>
	</table>

 </body>
</html>
