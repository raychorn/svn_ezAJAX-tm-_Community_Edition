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
  		var btnIds = ['btn_preloaderOne', 'btn_preloaderTwo'];
		
		function resetAllButtons() {
			var i = -1;
			var oBtn = -1;
			for (i = 0; i < btnIds.length; i++) {
				oBtn = document.getElementById(btnIds[i]);
				if (!!oBtn) {
					oBtn.disabled = false;
					oBtn.style.border = 'thin solid silver';
				}
			}
		}
		
  		function _clickPreloaderButton(btnId, sContent, sInfo) {
			var oBtn = document.getElementById(btnId);
			var oDiv = document.getElementById('div_preloaderContent');
			var oDivText = document.getElementById('div_preloaderContentText');
			var oDivInfo = document.getElementById('div_preloaderContentInfo');
			if ( (!!oDiv) && (!!oBtn) && (!!oDivText) && (!!oDivInfo) ) {
				oDiv.innerHTML = ((sContent == null) ? '' : sContent);
				oDivText.innerHTML = 'You may notice that this Preloader displays it has reached 100% right away; this means the whole Clip has loaded.  Preloaders work differently when they are running within the context of a larger Flash Movie Clip.  On the other hand, if your Internet connection is faster than a dial-up you may never see a Preloader like this unless the size of the Flash Movie Clip is sufficiently large enough to cause the Preloader to be visible.';
				oDivInfo.innerHTML = ((sInfo == null) ? '' : sInfo);
				resetAllButtons();
				oBtn.disabled = true;
				oBtn.style.border = 'medium solid yellow';
			}
		}
		
		function clickPreloaderOneButton() {
			return _clickPreloaderButton('btn_preloaderOne', '<?php print_r(flashContent('loadingGearsPreloader', 200, 100, '/app/flash/preloaders/loading-gears-preloader.swf', '#164f9f')); ?>', 'Preloader 1');
		}

		function clickPreloaderTwoButton() {
			return _clickPreloaderButton('btn_preloaderTwo', '<?php print_r(flashContent('loadingGearsPreloader2', 200, 100, '/app/flash/preloaders/loading-gears-preloader2.swf', '#164f9f')); ?>', 'Preloader 2');
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
							<table width="100%">
								<tr>
									<td>
										<button id="btn_preloaderOne" class="buttonClass<?php print_r(ezIsBrowserIE() ? '' : 'FF'); ?>" onClick="clickPreloaderOneButton(); return false;">Preloader 1</button>
									</td>
									<td>
										<button id="btn_preloaderTwo" class="buttonClass<?php print_r(ezIsBrowserIE() ? '' : 'FF'); ?>" onClick="clickPreloaderTwoButton(); return false;">Preloader 2</button>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table width="100%">
								<tr>
									<td width="50%">
										<div id="div_preloaderContent"></div>
									</td>
									<td width="50%" align="left">
										<div id="div_preloaderContentInfo"></div>
									</td>
								</tr>
							</table>
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
	<script language="javascript1.2" type="text/javascript">
		resetAllButtons();
	</script>
 </body>
</html>
