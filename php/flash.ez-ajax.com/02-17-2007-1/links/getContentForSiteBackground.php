<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <?php
       include_once("..\includes\documentHeader.php");
	   print_r(docHeader('../..'));
  ?>
  <script language="javascript1.2" type="text/javascript">
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
					<ul id="navigation" style="list-style: none outside none;">
					<li><a id="tab_1" href="" onClick="clickTabsForPage(1); return false;"><span id="span_tab_1">Page 1</span></a></li>
					<li><a id="tab_2" href="" onClick="clickTabsForPage(2); return false;"><span id="span_tab_2">Page 2</span></a></li>
					<li><a id="tab_3" href="" onClick="clickTabsForPage(3); return false;"><span id="span_tab_3">Page 3</span></a></li>
					<li><a id="tab_4" href="" onClick="clickTabsForPage(4); return false;"><span id="span_tab_4">Page 4</span></a></li>
					<li><a id="tab_5" href="" onClick="clickTabsForPage(5); return false;"><span id="span_tab_5">Page 5</span></a></li>
					<li><a id="tab_6" href="" onClick="clickTabsForPage(6); return false;"><span id="span_tab_6">Page 6</span></a></li>
					<li><a id="tab_7" href="" onClick="clickTabsForPage(7); return false;"><span id="span_tab_7">Flex 2</span></a></li>
					<li><a id="tab_8" href="" onClick="clickTabsForPage(8); return false;"><span id="span_tab_8">C#</span></a></li>
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
								<td height="400" valign="top">
									<p align="justify">This site displays some of the many Flash components Ray C. Horn has created over the years.<br><br>These selected Flash components are only a few of the many that were created since 1995.  Many Flash components were created to be data-driven with specific URLs that are no longer valid or active therefore only those Flash components that did not have such dependencies have been posted to this site.<br><br>As you look at the various Flash components that have been posted to this site keep in mind the fact that the best Flash components will leave you with the feeling that they may not have been coded using Flash at-all.<br><br>
									Over the years Flash Development has evolved from very simplistic "animations" that took a lot of time to create into more complex components that can be easily programmed using far less time, in most cases.<br>
								</p>
								<p align="justify">The design of this site may be somewhat "eclectic" for some tastes but it appeals to the Author.</p>
								<p align="justify">This site displays things that are called "Demos".  Demos don't necessarily need to be extremely professional-looking.  Demos are generally also known as "Prototypes".  Prototypes certainly do not need to be all that professional-looking.  The value of Prototypes and Demos is that they exist at-all as opposed to whether or not they appear to be professional quality or even highly-polished.</p>
								<p align="justify">Those who demand "proof" will never be satisfied with however much proof they might get.</p>
								<p align="justify">Those who believe in good things will get GREAT things.</p>
								</td>
							</tr>
							<tr>
								<td>
									<?php echo prevNextButtonsForPage(1, 6); ?>
								</td>
							</tr>
						</table>
					</div>
					<div id="div_contentPage2" style="display: none;">
						<table width="100%">
							<tr>
								<td height="400" valign="top">
								<p align="justify">Take a look at the wide array of Flash-based technologies and techniques that are displayed at this site.  Consider the person who found all these techniques and is able to use them at-will whenever he wishes.  Consider the fact that all this stuff, regardless of how it looks, is a lot of stuff and it is growing all the time.  Most of this stuff came together using very little development time.  Keep in mind the Author is very busy with the rest of his life apart from creating Demos and Prototypes - he is also attending Online College and earning his B.S. Degree in Business Information Systems, not that he really needs to do this in order to be an accomplished software engineer - some employers require their candidates to have college degrees but keep in mind the fact that a college degree alone does not a software engineer make - it takes experience and dedication to one's craft and this site demonstrates experience and dedication to the craft of creating Flash components of all kinds and colors.</p>
								<p align="justify">Those who can "see" and "appreciate" the potential this site represents are those who "get" what Flash is all about.  The specific embodiments of any particular concept is not the point of this site.  This site is an abstract statement of the kinds of things Flash can be used to create when Ray Horn is the one doing the creating.  Obviously if months had been spent on every aspect of this site then everything published here might look far more professional than it seems to but that's not the point now is it.  This site proves Ray Horn is able to use these various technologies to create meaningful Flash components however this site does not exist to prove how professionally Flash work can be done.  Professional-looking work takes some time to accomplish.  The more time one spends the more polished one can make any work look. 
								</p>
								</td>
							</tr>
							<tr>
								<td>
									<?php echo prevNextButtonsForPage(2, 6); ?>
								</td>
							</tr>
						</table>
					</div>
					<div id="div_contentPage3" style="display: none;">
						<table width="100%">
							<tr>
								<td height="400" valign="top">
									<p align="justify">
										The Future Splash Animator was the first Flash Version that Ray C. Horn bought and used.
									</p>
									<img src="../../app/flash/images/futuresplash-disc.jpg" width="271" height="273"><br>
									<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
								</td>
							</tr>
							<tr>
								<td>
									<?php echo prevNextButtonsForPage(3, 6); ?>
								</td>
							</tr>
						</table>
					</div>
					<div id="div_contentPage4" style="display: none;">
						<table width="100%">
							<tr>
								<td height="400" valign="top">
									<table width="100%">
										<tr>
											<td colspan="2">
												<p align="justify">These are actual CD-ROM images from my personal library.  Imagine watching me sit around coding all those hours away with both of these products.  Imagine the rather intense Flash projects I was able to work on during all that time.  Imagine what I can do once you hire me to work on your Flash projects.  There is no need to imagine - just hire me !</p>
											</td>
										</tr>
										<tr>
											<td>
												<img src="../../app/flash/images/flash4-disc.jpg" height="273"><br>
												<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
											</td>
											<td>
												<img src="../../app/flash/images/flash5-disc.jpg" height="273"><br>
												<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<?php echo prevNextButtonsForPage(4, 6); ?>
								</td>
							</tr>
						</table>
					</div>
					<div id="div_contentPage5" style="display: none;">
						<table width="100%">
							<tr>
								<td height="400" valign="top">
									<table width="100%">
										<tr>
											<td colspan="2">
												<p align="justify">Flash 8 is a GREAT product !  ActionScript 2.0 added a whole host of new capabilities to Flash.  In addition to Flash 8 I also use a set of proprietary tools that can make it possible to prototype Flash Movies very quickly with less effort than if Flash 8 alone was being used to do all that work.</p>
											</td>
										</tr>
										<tr>
											<td>
												<img src="../../app/flash/images/flash8-disc1.jpg" height="273"><br>
												<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
											</td>
											<td>
												<img src="../../app/flash/images/flash8-disc2.jpg" height="273"><br>
												<center><span style="font-size:10px">Actual CD-ROM Cover</span></center>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<?php echo prevNextButtonsForPage(5, 6); ?>
								</td>
							</tr>
						</table>
					</div>
					<div id="div_contentPage6" style="display: none;">
						<table width="100%">
							<tr>
								<td height="400" valign="top">
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
								</td>
							</tr>
							<tr>
								<td>
									<?php echo prevNextButtonsForPage(6, 6); ?>
								</td>
							</tr>
						</table>
					</div>
					<div id="div_contentPage7" style="display: none;">
						<table width="100%">
							<tr>
								<td height="400" valign="top">
									<table width="100%">
										<tr>
											<td>
												<p align="justify">Flex 2 is an amazing Flash Development Platform that can be used to create stunning visually compelling Flash-based GUI's.</p>
												<p align="justify">The first Flex 2 Application will be a rather simplistic Painter that functions like the ezPainter "Composer" App that is also posted at this site under the Menu item called "Composer".</p>
												<p align="justify">The Flex 2 version of ezPainter will look and run slicker than the original version due to the higher-quality nature of Flex 2 versus that of the proprietary platform that was used to create the original ezPainter Composer.</p>
												<p align="justify">The Flex 2 version of ezPainter will also support the ability to place completed "doodles" into a commonly accessible Library other users will be able to access and use.  This will demonstrate the ability for Flash to be used as a collaboration platform multiple users can use to share ideas via a common electronic whiteboard.</p>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<?php echo prevNextButtonsForPage(1, 1); ?>
								</td>
							</tr>
						</table>
					</div>
					<div id="div_contentPage8" style="display: none;">
						<table width="100%">
							<tr>
								<td height="400" valign="top">
									<table width="100%">
										<tr>
											<td>
												<p align="justify">C# (C-Sharp) is a fantastic tool for creating high-powered desktop apps but now C# can be used to create stunning Flash Apps.</p>
												<p align="justify">Most dyed-in-the-wool Flash Developers may not even know that C# can be used to create Flash Apps.</p>
												<p align="justify">But did you know that the .Net Framework can be used to create C# based Flash Apps ?</p>
												<p align="justify">Well it is 100% true !</p>
												<p align="justify">The .Net Framework can be used to create C# based Flash Apps using an amazing C# Development Platform.</p>
												<p align="justify">Very shortly you will be able to see some sample C# powered .Net Flash Apps posted at this site.</p>
												<p align="justify">Stay tuned.</p>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<?php echo prevNextButtonsForPage(1, 1); ?>
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
