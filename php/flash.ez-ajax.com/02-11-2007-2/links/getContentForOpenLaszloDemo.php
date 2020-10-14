<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <?php
       include_once("..\includes\documentHeader.php");
	   print_r(docHeader('../..'));
  ?>
  <link href="/commonStyles.css" rel="stylesheet" type="text/css">
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
				<td bgcolor="white">
					<ul id="navigation" style="list-style: none outside none;">
					<li><a id="tab_1" href="" onClick="clickTabsForPage(1); return false;"><span id="span_tab_1">Page 1</span></a></li>
					<li><a id="tab_2" href="" onClick="clickTabsForPage(2); return false;"><span id="span_tab_2">Page 2</span></a></li>
					<li><a id="tab_3" href="" onClick="clickTabsForPage(3); return false;"><span id="span_tab_3">Page 3</span></a></li>
					<li><a id="tab_4" href="" onClick="clickTabsForPage(4); return false;"><span id="span_tab_4">Page 4</span></a></li>
					<li><a id="tab_5" href="" onClick="clickTabsForPage(5); return false;"><span id="span_tab_5">Page 5</span></a></li>
					<li><a id="tab_6" href="" onClick="clickTabsForPage(6); return false;"><span id="span_tab_6">Page 6</span></a></li>
					</ul> 
				</td>
			</tr>
			<?php
				$_html = '&lt;!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"&gt;';
				$_html = $_html . '&lt;html&gt;';
				$_html = $_html . '&lt;head&gt;';
				$_html = $_html . '&lt;meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"&gt;';
				$_html = $_html . '&lt;title&gt;Untitled Document&lt;/title&gt;';
				$_html = $_html . '&lt;/head&gt;';
				$_html = $_html . '&lt;body&gt;';
				$_html = $_html . '&lt;/body&gt;';
				$_html = $_html . '&lt;/html&gt;';
				$rHtml = str_replace('&lt;','<',str_replace('&gt;','>',$_html));
				$_eHtml = rawurlencode($rHtml);
				$diff = max(strlen($_eHtml), strlen($rHtml)) - min(strlen($_eHtml), strlen($rHtml));
				$pcent = ($diff / min(strlen($_eHtml), strlen($rHtml))) * 100.0;

				$_html2 = '<b>This is another example.</b>';
				$pHtml2 = str_replace('<','&lt;',str_replace('>','&gt;',$_html2));

				$_eHtml2 = rawurlencode($_html2);
				$diff2 = max(strlen($_eHtml2), strlen($_html2)) - min(strlen($_eHtml2), strlen($_html2));
				$pcent2 = ($diff2 / min(strlen($_eHtml2), strlen($_html2))) * 100.0;
			?>
      	<tr>
      		<td class="primaryContentContainerHeader">
					<table width="100%">
						<tr>
							<td width="50%" align="left">
								<p align="justify"><a href="/php/links/getContentForOpenLaszloDemo.php" target="_self">OpenLaszlo 4 Demo</a></p>
							</td>
							<td width="50%" align="right">
								<p align="justify"><a href="" onClick="parent.popUpWindowForURL('launchContentForOpenLaszloDemo.php', 'OpenLaszloDemo', 810, 620, 'toolbar=no,location=no'); return false;">Click here to Launch the OpenLaszlo 4 Demo</a></p>
							</td>
						</tr>
					</table>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<div id="div_contentPage1" style="display: inline;">
					<table width="100%">
						<tr>
							<td height="400" valign="top">
								<p align="justify">This OpenLaszlo 4 Demo is not functional at this time other than to serve as a sample of the some work that was done using the Open Source product known as OpenLaszlo.<br><br>OpenLaszlo 4 is an interesting tool.  The nice thing about OpenLaszlo 4 is that it is possible to create Flash based applets quickly using Tomcat 5.5.20 and JSP's.  The inconvenient thing about OpenLaszlo is that there are no real visual tools one could use to create or craft OpenLaszlo Applets which means one must explore while coding an OpenLaszlo Applet and doing so can take some extra time.<br><br>Keep in mind when you are looking at this OpenLaszlo Applet you are looking at a Tomcat 5.5.20 based Applet that interfaces with an Apache 2.0.55 based PHP Web App all on the same physical web server.</p>
								<p align="justify">OpenLaszlo could be an interesting Flash Development Platform if only the folks who are developing
								  OpenLaszlo would spend some time and focus on the development tools one might use when developing code for the OpenLaszlo
								  Platform.</p>
								<p align="justify">The problem with OpenLaszlo is that there are no visual development tools for OpenLaszlo.  There are no OpenLaszlo-aware Editors, for instance.  There is no OpenLaszlo plug-in for Eclipse, for instance.  This means if you wanted to develop and OpenLaszlo Application, at this time, you would have to spend a fair amount of time exploring the syntax for OpenLaszlo through a trial-and-error process.  Additionally there is sparse documentation for the OpenLaszlo syntax and the documentation that does exists does not have much detail.</p>
								<p align="justify">Another problem with OpenLaszlo is the lack of support for traditional HTML content.  For instance, let's say you wanted to use OpenLaszlo to create a Flash-only site but you also wanted to be able to create HTML content you also wanted to publish at your site.  Could you use OpenLaszlo to do this ?</p>
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
								<p align="justify">The resounding answer would be "No" you cannot use OpenLaszlo to display standard HTML content in a Flash-only site.</p>
								<p align="justify">Now let me cover the bases a bit here by saying, it may be possible to display HTML using OpenLaszlo in a Flash-only mode but the technique and the underlying code was not immediately obvious after spending several hours of research.</p>
								<p align="justify">The other problem that must be resolved when delivering HTML content to an OpenLaszlo Flash-only site is the mechanics of delivering HTML content from a JSP using XML.</p>
								<p align="justify">OpenLaszlo uses XML as the technique or protocol for transferring data from an application server to the OpenLaszlo Flash component at runtime.  XML is a fine way to package data for delivery from one computer to another.  The problem with XML is that it uses tags to convey data.  Well the use of tags is not a problem for XML encoded data but it may be a problem when using XML to package data that is itself composed of tags such as HTML.</p>
								<p align="justify">When using XML to transmit HTML tags one might be tempted to use the CDATA coding technique.</p>
								<div class="codePrintWidthConstrained"><a href="" onClick="popUpWindowForURL('http://www.w3schools.com/xml/xml_cdata.asp', 'cdataWindow', 800, 600); return false;"><img src="/app/flash/images/icons/16x16/help.gif" width="17" height="17" border="0" align="bottom"></a>&nbsp;A CDATA section starts with "&lt;![CDATA[" and ends with "]]&gt;":<br>&nbsp;</div>
								<p align="justify">Oddly enough OpenLaszlo was not constructed to handle the CDATA coding technique as a way to transmit raw HTML code from an application server, such as Tomcat 5.5.20 to OpenLaszlo 4.01b.</p>
								<p align="justify">What other techniques might one use to package HTML code within an XML envelope ?</p>
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
								<p align="justify">What about using URLEncoding ?</p>
								<p align="justify">What is URLEncoding ?</p>
								<p align="justify"><a href="" onClick="popUpWindowForURL('http://en.wikipedia.org/wiki/Urlencode', 'urlEncodeWindow', 800, 600); return false;"><img src="/app/flash/images/icons/16x16/help.gif" width="17" height="17" border="0" align="bottom"></a>&nbsp;URLEncoding is a technique that converts special characters into codes that consist of "%" plus two hex digits.</p>
								<p align="justify">How can URLEncoding be used to encode raw HTML so it can be packaged into an XML envelope ?</p>
								<p align="justify">Consider the following chunk of raw HTML.</p>
								<div class="codePrintWidthConstrained">
									<?php
									echo $_html;
									?>
								</div>
								<p align="justify">This is a standard chunk of HTML code.</p>
								<p align="justify">Let's encode this chunk of raw HTML code using URLEncoding to see how it might look.  PHP 5.2.0 was used for this sample using the PHP function "rawurlencode()".</p>
								<div class="codePrintWidthConstrained">
									<?php
									echo splitStringUsingChar($_eHtml,92);
									?>
								</div>
								<p align="justify">As you can see the URLEncoded HTML looks quite different from the original raw HTML.</p>
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
								<p align="justify">The goal here was to make it possible to package HTML into an XML envelope such that the HTML content can be transmitted using XML.</p>
								<p align="justify">Let's consider the relative efficiency of the URLEncoding technique.</p>
								<p align="justify">The original raw HTML consists of <?php echo strlen($rHtml); ?> bytes as compared with the URLEncoded HTML that consists of <?php echo strlen($_eHtml); ?> bytes for a difference of <?php echo $diff; ?> bytes or <?php printf("%2.2f", $pcent); ?>%.</p>
								<p align="justify">The real quesiton is, does URLEncoding represent a usable technique given the <?php printf("%2.2f", $pcent); ?>% overhead for this example ?</p>
								<p align="justify">In the real world, under real conditions one would not want to encode the sample we used for our first example for this technique because it would not be necessary to encode the HTML document header.</p>
								<p align="justify">Consider the following chunk of raw HTML.</p>
								<div class="codePrintWidthConstrained">
									<br>
									<?php
									echo $pHtml2;
									?>
									<br>
									<br>
								</div>
								<p align="justify">Let's encode this chunk of raw HTML code using URLEncoding to see how it might look.</p>
								<div class="codePrintWidthConstrained">
									<br>
									<?php
									echo $_eHtml2;
									?>
									<br>
									<br>
								</div>
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
								<p align="justify">Let's consider the relative efficiency of this URLEncoding example.</p>
								<p align="justify">The original raw HTML consists of <?php echo strlen($_html2); ?> bytes as compared with the URLEncoded HTML that consists of <?php echo strlen($_eHtml2); ?> bytes for a difference of <?php echo $diff2; ?> bytes or <?php printf("%2.2f", $pcent2); ?>%.</p>
								<p align="justify">Okay, so what's wrong with this picture so far ?</p>
								<p align="justify">The problem with URLEncoding is that too many special characters are being encoded.  There is no need to encode whitespace or other punctuation characters since those characters do not contribute to the XML parsing errors that may arise when the XML envelope is opened by the receiving process.</p>
								<p align="justify">So let's try this again using a modified encoding technique that only encodes the &lt; and &gt; characters rather than the rest of the special characters the typical URLEncoding technique might encode.</p>
								<p align="justify">Here is the original chunk of HTML code that represents our sample worst-case scenario.</p>
								<div class="codePrintWidthConstrained">
									<?php
									echo $_html;
									?>
								</div>
								<?php
									$_encHtml = str_replace('&lt;','&amp;lt;',str_replace('&gt;','&amp;gt;',$_html));
				
									$_min = min(strlen($_html), strlen($rHtml));
									$_max = max(strlen($_html), strlen($rHtml));
									$_diff = max(strlen($_html), strlen($rHtml)) - min(strlen($_html), strlen($rHtml));
									$_pcent = ($_diff / $_min) * 100.0;
								?>
								<p align="justify">Now we encode only the &lt; and &gt; as &amp;amp;lt; and &amp;amp;gt; characters and nothing more than this.</p>
								<div class="codePrintWidthConstrained">
									<?php
									echo $_encHtml;
									?>
								</div>
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
								<p align="justify">How efficient is this Encoding example.</p>
								<p align="justify">The original raw HTML consists of <?php echo strlen($rHtml); ?> bytes as compared with the Encoded HTML that consists of <?php echo strlen($_html); ?> bytes for a difference of <?php echo $_diff; ?> bytes or <?php printf("%2.2f", $_pcent); ?>%. The bottom line here is the fact that <?php printf("%2.2f", $_pcent); ?>% is <b><u><?php print(($_pcent < $pcent) ? 'less' : 'more'); ?></u> than</b> <?php printf("%2.2f", $pcent); ?>% therefore even when a worst case scenario is being considered the second encoding method is <b><u><?php print(($_pcent < $pcent) ? 'more' : 'less'); ?></u></b> efficient than the first; <?php printf("%2.2f", max($_pcent, $pcent) - min($_pcent, $pcent)); ?>% <b><u><?php print(($_pcent < $pcent) ? 'more' : 'less'); ?></u></b> efficient to be exact.  To put this another way, the <?php print(($_pcent < $pcent) ? 'second' : 'first'); ?> method is <?php printf("%2.2f", ((max($_pcent, $pcent) - min($_pcent, $pcent)) / max($_pcent, $pcent)) * 100.0); ?>% <b><u><?php print(($_pcent < $pcent) ? 'more' : 'less'); ?></u></b> efficient than the <?php print(($_pcent > $pcent) ? 'second' : 'first'); ?> for a ratio of <?php printf("%1d", max($_pcent, $pcent) / min($_pcent, $pcent)); ?>:1 which means the <?php print(($_pcent < $pcent) ? 'second' : 'first'); ?> method is <?php printf("%1d", max($_pcent, $pcent) / min($_pcent, $pcent)); ?> times <b><u><?php print(($_pcent < $pcent) ? 'more' : 'less'); ?></u></b> efficient than <?php print(($_pcent > $pcent) ? 'second' : 'first'); ?> method.</p>
								<p align="justify">Now that we have developed an efficient HTML encoding technique, how might this fit into OpenLaszlo ?</p>
								<p align="justify">Even after the HTML code has been transmitted back to OpenLaszlo using our relatively efficient encoding technique and we have created a function for OpenLaszo to unencode the encoded HTML we are still left with the need to display the HTML using OpenLaszlo and again the published API documentation is too sparse to allow us to immediately determine if OpenLaszlo can support the ability to display HTML at-all.</p>
								<p align="justify">We know Flash provides some support for displaying HTML through the use of a TextField. So why doesn't OpenLaszlo support this standard Flash 8 feature also ?</p>
							</td>
						</tr>
						<tr>
							<td>
								<?php echo prevNextButtonsForPage(6, 6); ?>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<script language="javascript1.2" type="text/javascript">
		clickTabsForPage(1);
	</script>
 </body>
</html>
