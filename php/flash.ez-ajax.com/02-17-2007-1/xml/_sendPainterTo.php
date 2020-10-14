  <?php
	 include_once("..\includes\documentHeader.php");
  ?>
   <?php
		$dbNum = 101;
		$myFile = "debug.txt";
		if (file_exists($myFile)) {
			unlink($myFile);
		}

		$dbNum++;
		$fHand = fopen($myFile, "w") or die("Error $dbNum!!");
		fwrite($fHand, "\$_SERVER(1) :: " . count($_SERVER) . "\n" . var_print_r($_SERVER) . "\n\n");
		fclose($fHand);
		
		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_SERVER(2) :: " . count($_SERVER) . "\n" . var_dump_ret($_SERVER) . "\n\n");
		fclose($fHand);
		
		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$HTTP_POST_VARS(1) :: \n" . var_print_r($HTTP_POST_VARS) . "\n\n");
		fclose($fHand);
		
		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$HTTP_POST_VARS(2) :: \n" . var_dump_ret($HTTP_POST_VARS) . "\n\n");
		fclose($fHand);
		
		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$HTTP_RAW_POST_DATA(1) :: \n" . var_print_r($HTTP_RAW_POST_DATA) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$HTTP_RAW_POST_DATA(2) :: \n" . var_dump_ret($HTTP_RAW_POST_DATA) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$ServerPacketSend = getXMLPacket($HTTP_POST_VARS);
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$ServerPacketSend(1) :: \n" . var_print_r($ServerPacketSend) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$ServerPacketSend = getXMLPacket($HTTP_RAW_POST_DATA);
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$ServerPacketSend(2) :: \n" . var_print_r($ServerPacketSend) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_GET(1) :: " . count($_GET) . "\n" . var_print_r($_GET) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_GET(2) :: " . count($_GET) . "\n" . var_dump_ret($_GET) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_POST(1) :: " . count($_POST) . "\n" . var_print_r($_POST) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_POST(2) :: " . count($_POST) . "\n" . var_dump_ret($_POST) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_REQUEST(1) :: " . count($_REQUEST) . "\n" . var_print_r($_REQUEST) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_REQUEST(2) :: " . count($_REQUEST) . "\n" . var_dump_ret($_REQUEST) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_FILES(1) :: " . count($_FILES) . "\n" . var_print_r($_FILES) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_FILES(2) :: " . count($_FILES) . "\n" . var_dump_ret($_FILES) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_COOKIE(1) :: " . count($_COOKIE) . "\n" . var_print_r($_COOKIE) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_COOKIE(2) :: " . count($_COOKIE) . "\n" . var_dump_ret($_COOKIE) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_ENV(1) :: " . count($_ENV) . "\n" . var_print_r($_ENV) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_ENV(2) :: " . count($_ENV) . "\n" . var_dump_ret($_ENV) . "\n\n");
		fclose($fHand);
		
		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$GLOBALS(1) :: " . count($GLOBALS) . "\n" . var_print_r($GLOBALS) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$GLOBALS(2) :: " . count($GLOBALS) . "\n" . var_dump_ret($GLOBALS) . "\n\n");
		fclose($fHand);
		
		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_SESSION(1) :: " . count($_SESSION) . "\n" . var_print_r($_SESSION) . "\n\n");
		fclose($fHand);

		$dbNum++;
		$fHand = fopen($myFile, "a") or die("Error $dbNum!!");
		fwrite($fHand, "\$_SESSION(2) :: " . count($_SESSION) . "\n" . var_dump_ret($_SESSION) . "\n\n");
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
