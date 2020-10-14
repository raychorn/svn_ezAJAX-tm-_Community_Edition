<?php
	 include_once("..\includes\documentHeader.php");
?>
<?php
	$ip = $_SERVER['REMOTE_ADDR'];

	$db = new MSSQLDB('FlashGames');
//	print('<pre>$db :: <br>'); print_r($db); print('<br><br></pre>');
	$query = "SELECT id, ip FROM FlashIPs WHERE (ip = '$ip');";
	$x = $db->query_database($query);
	if (count($x) == 0) {
		$query = "INSERT INTO FlashIPs (ip) VALUES ('$ip');";
		$IP_recID = $db->query_database($query);
	} else {
		$IP_recID = $x[0]->id;
	}

	$referer = $_SERVER['HTTP_REFERER'];
	if (strlen($referer) > 0) {
		$query = "SELECT id, referer FROM FlashReferers WHERE (referer = '$referer');";
		$x = $db->query_database($query);
		if (count($x) == 0) {
			$query = "INSERT INTO FlashReferers (referer) VALUES ('$referer');";
			$REF_recID = $db->query_database($query);
		} else {
			$REF_recID = $x[0]->id;
		}

		$query = "INSERT INTO FlashActivityLog (ipID, refID) VALUES ($IP_recID,$REF_recID);";
		$x = $db->query_database($query);
	}
?>
<?php
$xmlstr = <<<XML
<?xml version="1.0" encoding="iso-8859-1"?>
<vendor name="yahoo">
<appid value="U9TAVP_V34F9rFr0mJ.J_oQxVasFN2twn_s6AYF5rAwTpDwpLK7buZJGskvRpR.dItB2SZJRfFv3.WYktw--"/>
<REMOTE_ADDR value="+++REMOTE_ADDR+++"/>
<HTTP_REFERER value="+++HTTP_REFERER+++"/>
</vendor>
XML;
$xmlstr = str_replace("+++REMOTE_ADDR+++", $_SERVER['REMOTE_ADDR'], $xmlstr);
$xmlstr = str_replace("+++HTTP_REFERER+++", $_SERVER['HTTP_REFERER'], $xmlstr);
echo $xmlstr;
?> 

