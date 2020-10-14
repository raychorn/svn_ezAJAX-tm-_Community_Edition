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
								<p align="justify"><a href="/php/links/getContentForFlashCSharp.php" target="_self">C# using the .Net Framework</a></p>
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
							<td width="80%" valign="top">
								<p align="justify">Welcome to the C# (C-Sharp) .Net Framework Sample(s).</p>
								<p align="justify">These Flash Samples were NOT created by the Author of this site however they do demonstrate the power of C# and the .Net Framework where Flash is concerned.</p>
								<p align="justify">Unlike traditionally developed Flash Movies these were created without the need to be concerned about any Timelines or tweening or the like.  Physical simulations such as these could perhaps not be created using traditional Flash development techniques since physical simulations require dynamic manipulations of graphical elements.  Traditional Flash development stresses how things happen based on the number of Frames per second of animation.  C# allows the developer to express the solution set using timeline-independent means which means there is no timeline but there are graphical elements that have behaviors and those behaviors are coded using C# and the .Net Framework.</p>
							</td>
							<td width="*" valign="top">
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/neoswiff/bubbles.html', 'bubbles', 750, 520); return false;">Bubbles</a></NOBR></p>
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/neoswiff/grid.html', 'grid', 750, 520); return false;">Grid of Dots</a></NOBR></p>
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/neoswiff/triangles.html', 'triangles', 750, 520); return false;">Cone of Triangles</a></NOBR></p>
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/neoswiff/SlideShow.html', 'SlideShow', 750, 520); return false;">SlideShow</a></NOBR></p>
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
