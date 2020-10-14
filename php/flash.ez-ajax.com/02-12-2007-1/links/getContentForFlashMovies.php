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
								<p align="justify"><a href="/php/links/getContentForFlashMovies.php" target="_self">Flash Media Server 2 :: Flash Movies</a></p>
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
							<td colspan="2" align="center">
								 <h6>You will want to view this movie with your Broadband Connection.</h6>
								 <br>
							</td>
						</tr>
						<tr>
							<td width="80%" valign="top">
								<p align="justify">Watch this amazing Movie Clip that streams via the Red5 Open Source Flash Media Server running on Tomcat 5.5.20 !</p>
							</td>
							<td width="*" valign="top">
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/Red5/flvdemo.html', 'spiderMan3', 700, 500); return false;">Spiderman 3</a></NOBR></p>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<br><br>
								 <h6>You will want to view this movie with your Broadband Connection.</h6>
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
