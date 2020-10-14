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
								<p align="justify">Yahoo Maps Sample that features the Yahoo Maps Flash API - this was quite easy to code.</p>
								<p align="justify">Keep in mind the Yahoo Maps API for Flash uses a web based interface that is provided by Yahoo.  Yahoo likes to limit the number of hits any one IP Address can be served per day as a way to limit the bandwidth they have to serve for this API.</p>
								<p align="justify">The Map images are served by Yahoo.  The way the MAP works is handled by Yahoo.  Sometimes the Yahoo API doesn't exactly work the way one might expect.  The author simply used the Yahoo API to whip-up a reasonable looking Map using Flash 8 Pro.</p>
							</td>
							<td width="*" valign="top">
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/maps/ezMapsSample1.html', 'ezMapsSample1', 750, 510); return false;">Yahoo Maps Sample #1</a></NOBR></p>
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
