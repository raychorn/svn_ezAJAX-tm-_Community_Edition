<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <?php
       include_once("..\includes\documentHeader.php");
	   print_r(docHeader('../..'));
  ?>
  <LINK rel="STYLESHEET" type="text/css" href="/roundedTabs.css">
  <script language="javascript1.2" type="text/javascript">
  		function clickTabsForPage(pg) {
			pg = ((pg == null) ? -1 : pg);
			var i = -1;
			var oDiv = -1;
			var oTab = -1;
			var oSpan = -1;
			for (i = 1; i <= 10; i++) {
				oDiv = document.getElementById('div_contentPage' + i);
				if (!!oDiv) {
					oTab = document.getElementById('tabSelected');
					oSpan = document.getElementById('spanTabSelected');
					if ( (!!oTab) && (!!oSpan) ) {
						oTab.id = oTab.name;
						oTab.name = null;
						oSpan.id = oSpan.name;
						oSpan.name = null;
					}
					oDiv.style.display = 'none';
				}
			}
			oDiv = document.getElementById('div_contentPage' + pg);
			if (!!oDiv) {
				oTab = document.getElementById('tab_' + pg);
				oSpan = document.getElementById('span_tab_' + pg);
				if ( (!!oTab) && (!!oSpan) ) {
					oTab.name = oTab.id;
					oTab.id = 'tabSelected';
					oSpan.name = oSpan.id;
					oSpan.id = 'spanTabSelected';
				}
				oDiv.style.display = 'inline';
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
	<?php print(handleNoScript()); ?>
      <table width="590">
			<tr>
				<td bgcolor="white">
					<ul id="navigation">
					<li><a id="tab_1" href="" onClick="clickTabsForPage(1); return false;"><span id="span_tab_1">Page 1</span></a></li>
					<li><a id="tab_2" href="" onClick="clickTabsForPage(2); return false;"><span id="span_tab_2">Page 2</span></a></li>
					<li><a id="tab_3" href="" onClick="clickTabsForPage(3); return false;"><span id="span_tab_3">Page 3</span></a></li>
					<li><a id="tab_4" href="" onClick="clickTabsForPage(4); return false;"><span id="span_tab_4">Page 4</span></a></li>
					</ul> 
				</td>
			</tr>
      	<tr>
      		<td class="primaryContentContainerHeader">
      			<p align="justify"><a href="/php/links/getContentForSiteBackground.php" target="_self">Site Background</a></p>
      		</td>
      	</tr>
      	<tr>
      		<td>
					<div id="div_contentPage1" style="display: inline;">
						<table width="100%">
							<tr>
								<td>
									<p align="justify">This site displays some of the many Flash components Ray C. Horn has created over the years.<br><br>These selected Flash components are only a few of the many that were created since 1995.  Many Flash components were created to be data-driven with specific URLs that are no longer valid or active therefore only those Flash components that did not have such dependencies have been posted to this site.<br><br>As you look at the various Flash components that have been posted to this site keep in mind the fact that the best Flash components will leave you with the feeling that they may not have been coded using Flash at-all.<br><br>
									Over the years Flash Development has evolved from very simplistic "animations" that took a lot of time to create into more complex components that can be easily programmed using far less time, in most cases.<br>
									<br>The Future Splash Animator was the first Flash Version that Ray C. Horn bought and used.
								</p>
								</td>
							</tr>
							<tr>
								<td>
									<img src="../../app/flash/images/futuresplash-disc.jpg" width="271" height="273"><br>
									<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
								</td>
							</tr>
						</table>
					</div>
					<div id="div_contentPage2" style="display: none;">
						<table width="100%">
							<tr>
								<td colspan="2">
									<p align="justify">These are actual CD-ROM images from my personal library.  Imagine watching me sit around coding all those hours away with both of these products.  Imagine the rather intense Flash projects I was able to work on during all that time.  Imagine what I can do once you hire me to work on your Flash projects.  There is no need to imagine - just hire me !</p>
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
						</table>
					</div>
					<div id="div_contentPage3" style="display: none;">
						<table width="100%">
							<tr>
								<td colspan="2">
									<p align="justify">Flash 8 is a GREAT product !  ActionScript 2.0 added a whole host of new capabilities to Flash.  In addition to Flash 8 I also use a set of proprietary tools that can make it possible to prototype Flash Movies very quickly with less effort than if Flash 8 alone was being used to do all that work.</p>
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
						</table>
					</div>
					<div id="div_contentPage4" style="display: none;">
						<table width="100%">
							<tr>
								<td>
									<p align="justify">This is the product that became the Flash Media Server 2.  It might surprise you to know there is an Open Source Flash Media Server that runs in a Tomcat 5.5.20 environment and 'yup' I have that one online and running too.</p>
								</td>
							</tr>
							<tr>
								<td valign="top" align="center" colspan="2">
									<img src="../../app/flash/images/flash-comm-server-disc.jpg" height="273"><br>
									<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
								</td>
							</tr>
						</table>
					</div>
      		</td>
      	</tr>
      	<tr>
      		<td><?php print_r($_poweredHTML); ?></td>
      	</tr>
      </table>
		<script language="javascript1.2" type="text/javascript">
			clickTabsForPage(1);
		</script>
 </body>
</html>
