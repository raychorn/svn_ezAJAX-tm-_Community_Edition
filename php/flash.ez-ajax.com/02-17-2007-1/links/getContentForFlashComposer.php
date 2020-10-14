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
								<p align="justify"><a href="/php/links/getContentForFlashComposer.php" target="_self">Flash Composer</a></p>
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
								<p align="justify">Welcome to the Flash Composer Sample(s).</p>
								<p align="justify">Flash Composer is a concept that seeks to create a Flash-based Content Management System through the use of Flash.</p>
								<p align="justify">The first example of Flash Composer is a rather simple-looking Painter.  The Painter allows you to make a freehand drawing you can dynamically redraw.</p>
								<p align="justify">Keep in mind the Painter stores all the mouse-strokes, color selections and other attributes such as line width selections and it plays them back at-will.</p>
								<p align="justify">Flash-based Electronic Whiteboard Apps have been around for a long time on the web, this is not a new idea but it can be a useful idea.  It only took a few hours to make this sample come to life.  It would be quite easy to enable ezPainter to do any number of functions with the stored mouse-strokes such as but not limited to communicating the drawing to someone else who happens to be connected to the same Media Server, for instance.</p>
							</td>
							<td width="*" valign="top">
								<p align="justify"><NOBR><a href="" onClick="popUpWindowForURL('/app/flash/composer/ezpainter.html', 'ezpainter', 750, 520); return false;">Flash Composer - ezPainter Sample</a></NOBR></p>
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
