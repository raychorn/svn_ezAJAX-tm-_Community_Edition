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
        $ezClusterLink = "ezCluster&#8482";
        $ezAJAXLink = "ezAJAX&#8482";
        $today = getdate();
        $todayYYYY = $today["year"];
        $_poweredHTML = '<p align="justify"><small>This Site is being redesigned to use PHP 5.2.0 instead of ColdFusion MX 7.&nbsp;Our apologies for any problems you may encounter at this time.&nbsp;&nbsp;<cfif (NOT Request.commonCode.ezIsBrowserIE())><b><i>This site is best when viewed using IE 7.x (1024x768) resolution.</i></b></cfif>&nbsp;The contents of this Site are protected under U.S. and International Copyright Laws. &copy 1990-' . $todayYYYY . ' Hierarchical Applications Limited, All Rights Reserved.</small></p>';
   ?>

  <?php
       if (stristr($_SERVER['HTTP_REFERER'], $_SERVER['HTTP_HOST']) == false) {
          	$ar = splitStringToArray($_SERVER['SCRIPT_NAME']);
            redirectBrowser('/index.cfm?linkname=' . $ar[count($ar) - 1]);
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
      			<p align="justify">This site displays some of the many Flash components Ray C. Horn has created over the years.<br><br>This site was architected to use a new product called <?php print_r($ezAJAXLink); ?>; ezAJAX provides a standardized reusable AJAX Framework that is composed of more than 15000 lines of JavaScript and ColdFusion.<br><br>In addition to ezAJAX this site uses another product called <?php print_r($ezClusterLink); ?>; ezCluster provides support for web server clustering that allows AJAX Server Commands to be spread-out among a number of separate web servers each of which has identical web content.  ezCluster make it possible for AJAX Web Apps to leverage the power of many web servers rather than a single web server.  ezCluster is built into ezAJAX Enterprise 1.0.<br><br>As you can see, Ray C Horn has done a lot of work to make this site happen; the ability to make this site happen with all of its subtle complexities must surely mean whatever work you may need done could also be done with just as much professionalism and dedication.<br><br>As you look at the various Flash components hat have been posted to this site keep in mind the fact that the best Flash components will leave you with the feeling that they may not have been coded using Flash at-all.<br><br>Over the years Flash Development has eveolved from very simplistic "animations" that took a lot of time to create into more complex components that can be easily programmed using far less time, in most cases.<br><br>Notice the fact that each page of content can be linked to.  Each page of content that appears by clicking on a Tab or SubTab displays a page header that allows the user to click on it in order to link to that page of content.  This same technique can be used to link to content that is delivered via AJAX.</p><br>
      		</td>
      	</tr>
      	<tr>
      		<td><?php print_r($_poweredHTML); ?></td>
      	</tr>
      </table>
 </body>
</html>
