  <?php
	 include_once("..\includes\documentHeader.php");
  ?>
   <?php
		try {
			$sid = $_GET["sid"];
			$x = $_GET["xml"];
			$n = $_GET["n"];
			$m = ($n - intval($n));
			$n = $n - $m;
			$m = $m * 10;
	
			$recID = -1;
			
			$l = strlen($x);
	
			$db = new MSSQLDB('FlashGames');
			$sData = $db->sqlEscape($x);
			$query = "SELECT id, sid, datum FROM SessionData WHERE (sid = '$sid');";
			$xRet = $db->query_database($query);
			if (count($xRet) == 0) {
				$query = "INSERT INTO SessionData (sid, datum) VALUES ('$sid','$sData');";
				$recID = $db->query_database($query);
			} else {
				$recID = $xRet[0]->id;
				$x = $xRet[0]->datum . $x;
				$sData = $db->sqlEscape($x);
				$query = "UPDATE SessionData SET datum = '$sData' WHERE (sid = '$sid');";
				$xRet = $db->query_database($query);
			}

			$dbNum = 101;
			$fAction = "a";
			$myFile = "debug.txt";
			if ($n == 1) {
				if (file_exists($myFile)) {
					$fAction = "w";
					unlink($myFile);
				}
			}
	
			$p = -1;
			if (intval($n) == intval($m)) {
				$p = new xmlParser();
				$p->_parse($x, true);
			}
	
			$dbNum++;
			$fHand = fopen($myFile, $fAction) or die("Error $dbNum!!");
			fwrite($fHand, "\$_GET(1) \$n=[$n] \$m=[$m] \$fAction=[$fAction] \$l=[$l] \$x=[$x]\n" . count($_GET) . "\n" . var_print_r($_GET) . "\n");
			fwrite($fHand, "\$p=" . var_print_r($p) . "\n\n");
			fclose($fHand);
		} catch (Exception $e) {
			echo 'Caught exception: ',  var_print_r($e), "\n";
		}
   ?>
<?php
$xmlstr = <<<XML
<?xml version="1.0" encoding="iso-8859-1"?>
<response>
	<status>1</status>
	<recID>$recID</recID>
</response>
XML;
echo $xmlstr;
?> 
