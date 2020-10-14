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
      			<p align="justify"><a href="/php/links/getContentForOpenLaszloDemo.php" target="_self">OpenLaszlo 4 Demo</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<p align="justify">This OpenLaszlo 4 Demo is not functional at this time other than to serve as a sample of the some work that was done using the Open Source product known as OpenLaszlo.<br><br>OpenLaszlo 4 is an interesting tool.  The nice thing about OpenLaszlo 4 is that it is possible to create Flash based applets quickly using Tomcat 5.5.20 and JSP's.  The inconvenient thing about OpenLaszlo is that there are no real visual tools one could use to create or craft OpenLaszlo Applets which means one must explore while coding an OpenLaszlo Applet and doing so can take some extra time.<br><br>Keep in mind when you are looking at this OpenLaszlo Applet you are looking at a Tomcat 5.5.20 based Applet that interfaces with an Apache 2.0.55 based PHP Web App all on the same physical web server.</p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify"><a href="" onClick="parent.popUpWindowForURL('launchContentForOpenLaszloDemo.php', 'OpenLaszloDemo', 810, 620, 'toolbar=no,location=no'); return false;">Click here to Launch the OpenLaszlo 4 Demo</a></p>
			</td>
		</tr>
	</table>
 </body>
</html>
