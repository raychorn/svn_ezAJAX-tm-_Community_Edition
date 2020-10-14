<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>flash.ez-ajax.com (c). Copyright 1990-<?php $today = getdate(); print_r($today["year"]);?> , All Rights Reserved.</title>
  <?php
       include_once("php\includes\documentHeader.php");
	   print_r(docHeader(''));
  ?>
 </head>
 <body>
		<noscript>You must enable JavaScript to use this site.<br>Please adjust your browser's settings to enable JavaScript or use a browser that supports JavaScript.<br>
		<a href="http://flash.ez-ajax.com" target="_blank">ezAJAX&#8482 - AJAX made Easy - Easily Develop your next AJAX Application using this amazing Product !</a>
		</noscript>

	<a id="anchor_imageLogoRight" name="anchor_imageLogoRight" style="position: absolute; top: -15px; left: 700px;"></a>
	<div id="table_outerContentWrapper" style="position: absolute; width: 900px; top: 0px; left: 0px;">
		<div class="ContentWrapper">
			<div class="twoColumnLeft">
				<?php print_r(flashContent('flashmainmenuclip', 200, 1000, '/app/flash/flash/menu/flashmainmenuclip.swf', '#164f9f')); ?>
			</div>
			<div class="twoColumnRight" style="<?php if (!ezIsBrowserIE()) { print_r('margin-left: 30px;'); }; ?>">
				<img src="/app/flash/images/flashSiteHeader.jpg" width="780" height="100" border="0">
				<div id="div_ezajax_3d_logo"></div>
				<br>
				<div id="div_primaryContentContainer">
					<iframe name="contentFrame" id="contentFrame" frameborder="0" scrolling="No" width="780" height="600" style="background: #164f9f" src="/php/links/<?php if ($_REQUEST['linkname'] != '') { print_r($_REQUEST['linkname']); } else { print_r('getContentForSiteBackground.php'); }; ?>"></iframe>
				</div>
			</div>
		</div>
	</div>
 </body>
</html>
