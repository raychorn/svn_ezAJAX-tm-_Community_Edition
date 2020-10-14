<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <?php
		include_once("..\includes\documentHeader.php");
//		print_r(docHeader('../..'));
  ?>
 </head>
 <body bgcolor="#53a9ff">
      <table width="100%">
		<tr>
			<td valign="top">
				<?php
					$cn = tomcatServerDomain("/my-apps/laszlo.ez-ajax.com/index-tabs.lzx?lzt=swf&debug=false&lzr=swf8&nocache=" . rand(1, 32767));
					print_r(flashContent("OpenLaszloDemo", 770, 590, $cn, "#53a9ff")); 
				?>
			</td>
		</tr>
	</table>
 </body>
</html>
