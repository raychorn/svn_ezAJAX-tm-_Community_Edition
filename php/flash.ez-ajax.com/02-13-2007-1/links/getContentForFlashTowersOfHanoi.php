<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <?php
       include_once("..\includes\documentHeader.php");
	   print_r(docHeader('../..'));
  ?>
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
      			<p align="justify"><a href="/php/links/getContentForFlashTowersOfHanoi.php" target="_self">Flash Towers Of Hanoi :: Classic Computer Science Project</a></p>
      		</td>
      	</tr>
		<tr>
			<td valign="top">
				<p align="justify">The Towers of Hanoi is a Classic Computer Science problem.  Almost every single Computer Science textbook on the planet has this problem fully explained along with the pseudo-code for the solution set.  These Flash Clips simply allow the Towers of Hanoi problem to be solved for up to 10 discs.</p>
				<p align="justify">The Towers of Hanoi would be a far more interesting problem to code if the problem domain required the discs to be randomly shuffled and the solution set required for an AI (Artificial Intelligence) approach to reach a solution within a reasonable timeframe.  Coding the variation of the Towers of Hanoi I would personally find interesting would require far more programming skill than the version that is presented here however it would be a fun problem to study assuming one had the time to write the code and fully develop the programmatic solution set.</p>
				<p align="justify"><a href="/php/links/getContentForFlashTowersOfHanoiV1.php" target="_self">Flash Towers Of Hanoi Version 1 :: The original version.</a></p>
				<p align="justify"><a href="/php/links/getContentForFlashTowersOfHanoiV2.php" target="_self">Flash Towers Of Hanoi Version 2 :: with Variable Runtime Speed.</a></p>
			</td>
		</tr>
	</table>

 </body>
</html>
