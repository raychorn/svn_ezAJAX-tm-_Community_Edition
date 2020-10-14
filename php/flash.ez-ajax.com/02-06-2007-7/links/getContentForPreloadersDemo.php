<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <?php
       include_once("..\includes\documentHeader.php");
	   print_r(docHeader('../..'));
  ?>
  <script language="JavaScript1.2" type="text/javascript">
		function clickPreloaderOneButton() {
			var oBtn = document.getElementById('btn_preloaderOne');
			var oDiv = document.getElementById('div_preloaderContent');
			var oDivText = document.getElementById('div_preloaderContentText');
			if ( (!!oDiv) && (!!oBtn) && (!!oDivText) ) {
				oDiv.innerHTML = '<?php print_r(flashContent('loadingGearsPreloader', 200, 100, '/app/flash/preloaders/loading-gears-preloader.swf', '#164f9f')); ?>';
				oDivText.innerHTML = 'You may notice that this Preloader displays it has reached 100% right away; this means the whole Clip has loaded.  Preloaders work differently when they are running within the context of a larger Flash Movie Clip.  On the other hand, if your Internet connection is faster than a dial-up you may never see a Preloader like this unless the size of the Flash Movie Clip is sufficiently large enough to cause the Preloader to be visible.';
				oBtn.disabled = true;
			}
		}
  </script>
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
      			<p align="justify"><a href="/php/links/getContentForPreloadersDemo.php" target="_self">Flash Preloaders Demo Clips</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<p align="justify">Flash Preloader Clips are designed to display while the Flash component is being downloaded before there is enough content to allow the Flash to being playing.<br><br>Some Flash Preloaders display the preloading activity via a display of the percentage of bytes that have been downloaded and other preloaders simply show some kind of animation that indicates how much of the movie has been downloaded.</p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<table width="100%">
					<tr>
						<td>
							<button id="btn_preloaderOne" class="buttonClass<?php print_r(ezIsBrowserIE() ? '' : 'FF'); ?>" onClick="clickPreloaderOneButton(); return false;">Preloader 1</button>
						</td>
					</tr>
					<tr>
						<td>
							<div id="div_preloaderContent"></div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="div_preloaderContentText"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
 </body>
</html>
