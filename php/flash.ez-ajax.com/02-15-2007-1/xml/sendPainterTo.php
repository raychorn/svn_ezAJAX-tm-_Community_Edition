  <?php
	 include_once("..\includes\documentHeader.php");
  ?>
   <?php
		$x = $_GET["xml"];
		$n = $_GET["n"];
		$m = ($n - intval($n));
		$n = $n - $m;
		$m = $m * 10;
		
		$l = strlen($x);
		
		$dbNum = 101;
		$fAction = "a";
		$myFile = "debug.txt";
		if ($n == 1) {
			if (file_exists($myFile)) {
				$fAction = "w";
				unlink($myFile);
			}
		}

		if ( ($n <> $m) || ( ($n == 1) && ($m == 1) ) ) {
//			$p = new xmlParser();
//			$p->_parse($x, true);
		}

		$dbNum++;
		$fHand = fopen($myFile, $fAction) or die("Error $dbNum!!");
		fwrite($fHand, "\$_GET(1) \$n=[$n] \$m=[$m] \$fAction=[$fAction] \$l=[$l] \$x=[$x]\n" . count($_GET) . "\n" . var_print_r($_GET) . "\n\n");
		fclose($fHand);
   ?>
<?php
$xmlstr = <<<XML
<?xml version="1.0" encoding="iso-8859-1"?>
<response>
	<status>1</status>
</response>
XML;
echo $xmlstr;
?> 
