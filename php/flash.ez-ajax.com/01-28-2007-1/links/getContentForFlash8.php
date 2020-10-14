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
      			<p align="justify"><a href="/php/links/getContentForFlash8.php" target="_self">Flash 8</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<p align="justify">Flash 8 is the latest Flash version and these are the latest Flash 8 Components that are on file:</p>
				<ul>
					<li><a href="/php/links/getContentForFlash8Promo.php" target="_self">Flash 8 Promo for www.ez-ajax.com</a></li>
				</ul>
			</td>
		</tr>
	</table>

 </body>
</html>
