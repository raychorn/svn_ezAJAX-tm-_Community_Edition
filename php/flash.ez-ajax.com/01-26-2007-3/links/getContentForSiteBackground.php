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
      			<p align="justify"><a href="/php/links/getContentForSiteBackground.php" target="_self">Site Background</a></p>
      		</td>
      	</tr>
      	<tr>
      		<td>
					<table width="100%">
						<tr>
							<td colspan="2">
								<p align="justify">This site displays some of the many Flash components Ray C. Horn has created over the years.<br><br>These selected Flash components are only a few of the many that were created since 1995.  Many Flash components were created to be data-driven with specific URLs that are no longer valid or active therefore only those Flash components that did not have such dependencies have been posted to this site.<br><br>As you look at the various Flash components hat have been posted to this site keep in mind the fact that the best Flash components will leave you with the feeling that they may not have been coded using Flash at-all.<br><br>
								Over the years Flash Development has evolved from very simplistic "animations" that took a lot of time to create into more complex components that can be easily programmed using far less time, in most cases.<br>
								<br>The Future Splash Animator was the first Flash Version that Ray C. Horn bought and used.
							</p>
							</td>
						</tr>
						<tr>
							<td valign="top">
								<img src="../../app/flash/images/futuresplash.jpg" height="273"><br>
								<center><span style="font-size:10px">Trial Version Logo</span></center>
							</td>
							<td valign="top">
								<img src="../../app/flash/images/futuresplash-disc.jpg" width="271" height="273"><br>
								<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
							</td>
						</tr>
						<tr>
							<td valign="top" align="center">
								<img src="../../app/flash/images/flash4-disc.jpg" height="273"><br>
								<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
							</td>
							<td valign="top" align="center">
								<img src="../../app/flash/images/flash5-disc.jpg" height="273"><br>
								<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
							</td>
						</tr>
						<tr>
							<td valign="top" align="center">
								<img src="../../app/flash/images/flash8-disc1.jpg" height="273"><br>
								<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
							</td>
							<td valign="top" align="center">
								<img src="../../app/flash/images/flash8-disc2.jpg" height="273"><br>
								<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
							</td>
						</tr>
						<tr>
							<td valign="top" align="center" colspan="2">
								<img src="../../app/flash/images/flash-comm-server-disc.jpg" height="273"><br>
								<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
							</td>
						</tr>
					</table>
      		</td>
      	</tr>
      	<tr>
      		<td><?php print_r($_poweredHTML); ?></td>
      	</tr>
      </table>
 </body>
</html>
