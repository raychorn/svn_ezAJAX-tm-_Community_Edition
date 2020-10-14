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
      <table width="590">
      	<tr>
      		<td class="primaryContentContainerHeader">
					<table width="100%">
						<tr>
							<td align="left">
								<p align="justify"><a href="/php/links/getContentForFlashMediaServer2.php" target="_self">Flash Media Server 2 :: Cisco Presentation</a></p>
							</td>
							<td align="right">
								<p align="justify"><small><a href="/app/flash/Flash Media Server Presentation to Cisco 1-10-2007a/Flash Media Server Presentation to Cisco 1-10-2007a.zip" target="_blank">Download</a></small></p>
							</td>
						</tr>
					</table>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<p align="justify">This Presentation was delivered to Cisco Systems on 01-10-2007,<br><a href="" onClick="parent.popUpWindowForURL('/app/flash/Flash Media Server Presentation to Cisco 1-10-2007a/Flash Media Server Presentation to Cisco 1-10-2007a.htm', 'CiscoDemo'); return false;">Click HERE to Launch the Presentation</a></p>
			</td>
		</tr>
	</table>

 </body>
</html>
