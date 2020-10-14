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
								<p align="justify"><a href="/php/links/getContentForFlashFlex2.php" target="_self">Flex 2.0.1</a></p>
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
								<p align="justify">Welcome to the Flex 2 Sample(s).</p>
								<p align="justify">ezPainter was my first Flex 2 Sample Applet.  This sort of App is always fun to code but then who doesn't enjoy some recreational doodling anyway ?!?</p>
								<p align="justify">This rendition of ezPainter is a very small 3 Kb Flash Movie.  Compare this with the 45 Kb Composer rendition that was created using a different development platform.  This bodes quite well for Flex 2 assuming this level of optimization is any indication as to the quality of the Flex 2 Flash Development platform.  In all fairness, the larger Composer rendition for ezPainter does have more functionality but it was also created using the more traditional timeline Flash programming model one might use when creating an animated movie clip for a Cartoon or the like.</p>
								<p align="justify">Flex 2 provides a programming model for Flash that is about as far away from the original Flash programming model as can be achived.  Flex 2 allows programmers to ignore the fact that Flash is the end-product and focus instead on the task of writing the code.  Flex 2 programmers do not need to know anything about Flash timelines or frame rates.</p>
								<p align="justify">The Flex 2 programming model is similar to the C#.Net Programming model but Flex 2 provides a better development platform in terms of what can be done with the language out-of-the-box.</p>
								<p align="justify">Someday, time-permitting, the ezPainter Sample may even be empowered to interact with a database to allow people to share their drawings.</p>
							</td>
							<td width="*" valign="top">
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/flex2/ezPainterSample/ezPainterSample.html', 'ezPainterSample', 750, 520); return false;">ezPainter</a></NOBR></p>
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
