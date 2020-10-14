<?php
	// Win Internet Explorer 7.0
	// Win Internet Explorer 6.x or AOL 9.x
	// Win Internet Explorer 5.5
	// Win Internet Explorer 5.0
	// Win Internet Explorer 4.0
	function _isBrowserWinIE($ua_ok) {
		return ( (eregi( "Windows", $ua_ok ) && eregi( "msie", $ua_ok ) && eregi( "[7]\.[0]", $ua_ok ) ) ||
			   (eregi( "Windows", $ua_ok ) && eregi( "msie", $ua_ok ) && eregi( "[6]\.[0-9]", $ua_ok ) ) ||
			   (eregi( "Windows", $ua_ok ) && eregi( "msie", $ua_ok ) && eregi( "[5]\.[5]", $ua_ok ) ) ||
			   (eregi( "Windows", $ua_ok ) && eregi( "msie", $ua_ok ) && eregi( "[5]\.[01]", $ua_ok ) ) ||
			   (eregi( "Windows", $ua_ok ) && eregi( "msie", $ua_ok ) && eregi( "[4]\.[01]", $ua_ok ) )
			   );
	}

	// Win Opera 7.23
	// Win Opera 8.50
	// Win Opera 9
	function _isBrowserWinOP($ua_ok) {
		return ( (eregi( "Windows", $ua_ok ) && eregi( "Opera", $ua_ok ) && eregi( "[7]\.[23]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "Opera", $ua_ok ) && eregi( "[8]\.[50]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "Opera", $ua_ok ) && eregi( "[9]\.[00]", $ua_ok ) )
			   );
	}

	// Win Flock 0.4
	function _isBrowserWinFlock($ua_ok) {
		return (eregi( "Windows", $ua_ok ) && eregi( "flock", $ua_ok ) && eregi( "[0]\.[4]", $ua_ok ) );
	}
	
	// Win Firefox 3.0
	// Win Firefox 2.0
	// Win Firefox 1.5.0
	// Win Firefox 1.0.7
	// Win Mozilla 1.7.12
	// Win Mozilla 1.6
	// Win Netscape 4.78
	// Win Netscape 6.2
	// Win Netscape 7.2
	function _isBrowserWinFF($ua_ok) {
		return ( (eregi( "Windows", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[9]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[8]\.[1]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[5]\.[0]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[0]\.[7]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "mozilla", $ua_ok ) && !eregi( "netscape", $ua_ok ) && eregi( "rv:[1]\.[7]\.[12]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "mozilla", $ua_ok ) && eregi( "rv:[1]\.[6]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "mozilla", $ua_ok ) && eregi( "[4]\.[78]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "netscape", $ua_ok ) && eregi( "[6]", $ua_ok ) ) ||
				 (eregi( "Windows", $ua_ok ) && eregi( "netscape", $ua_ok ) && eregi( "[7]", $ua_ok ) )
			   );
	}
	
	// Mac Camino 1.03
	// Mac Camino 1.1
	// Mac Camino 1.2
	// Mac Camino 1.0
	function _isBrowserMacCamino($ua_ok) {
		return ( (eregi( "Windows", $ua_ok ) && eregi( "flock", $ua_ok ) && eregi( "[0]\.[4]", $ua_ok ) ) ||
				 (eregi( "Macintosh", $ua_ok ) && eregi( "camino", $ua_ok ) && eregi( "[1]\.[8]", $ua_ok ) ) ||
				 (eregi( "Macintosh", $ua_ok ) && eregi( "camino", $ua_ok ) && eregi( "[1]\.[8]\.[1]", $ua_ok ) ) ||
				 (eregi( "Macintosh", $ua_ok ) && eregi( "camino", $ua_ok ) && eregi( "[1]\.[9]", $ua_ok ) ) ||
				 (eregi( "Macintosh", $ua_ok ) && eregi( "camino", $ua_ok ) && eregi( "[1]\.[0]", $ua_ok ) )
			   );
	}
	
	// Mac SeaMonkey 1.0
	// Mac SeaMonkey 1.1
	function _isBrowserMacSeaMonkey($ua_ok) {
		   return ( (eregi( "Macintosh", $ua_ok ) && eregi( "seamonkey", $ua_ok ) && eregi( "[1]\.[8]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "seamonkey", $ua_ok ) && eregi( "[1]\.[8]\.[1]", $ua_ok ) )
				  );
	}
	
	// Mac Firefox 1.0
	// Mac Firefox 1.0.7
	// Mac Firefox 1.5.0
	// Mac Firefox 2.0
	// Mac Firefox 3.0
	// Mac Mozilla 1.7.2
	// Mac Mozilla 1.6
	// Mac Nescape 7.2
	function _isBrowserMacFF($ua_ok) {
		   return ( (eregi( "Macintosh", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "rv:[1]\.[7]\.[5]", $ua_ok ) && eregi( "[1]\.[0]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[0]\.[7]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[5]\.[0]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[8]\.[1]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[9]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "mozilla", $ua_ok ) && eregi( "rv:[1]\.[7]\.[12]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "mozilla", $ua_ok ) && eregi( "rv:[1]\.[6]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "netscape", $ua_ok ) && eregi( "[7]\.[2]", $ua_ok ) )
				  );
	}
	
	// Mac Opera 7.5.4ul
	// Mac Opera 8.5
	// Mac Opera 9
	function _isBrowserMacOP($ua_ok) {
		   return ( (eregi( "Macintosh", $ua_ok ) && eregi( "opera", $ua_ok ) && eregi( "[7]\.[0-9,a-z]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "opera", $ua_ok ) && eregi( "[8]\.[5]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "opera", $ua_ok ) && eregi( "[9]\.[00]", $ua_ok ) )
				  );
	}
	
	// Mac Safari 1.3
	// Mac Safari 2.0
	// Mac Safari 2.0.4
	function _isBrowserMacSafari($ua_ok) {
		   return ( (eregi( "Macintosh", $ua_ok ) && eregi( "safari", $ua_ok ) && eregi( "[312]\.[6]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "safari", $ua_ok ) && eregi( "[417]\.[0-9]\.[0-9]", $ua_ok ) ) ||
					(eregi( "Macintosh", $ua_ok ) && eregi( "safari", $ua_ok ) && eregi( "[419]\.[0-9]", $ua_ok ) )
				  );
	}
	
	// Mac Internet Explorer 5.2
	function _isBrowserMacIE($ua_ok) {
		   return ( eregi( "Mac_PowerPC", $ua_ok ) && eregi( "msie", $ua_ok ) && eregi( "[5]\.[2][0-9]", $ua_ok ) );
	}
	
	// Linux Konqueror 3.4
	function _isBrowserLinuxKonqueror($ua_ok) {
		   return (eregi( "Linux", $ua_ok ) && eregi( "konqueror", $ua_ok ) && eregi( "[3]\.[4]", $ua_ok ) );
	}
	
	// Linux Firefox 1.0 RedHat
	// Linux Firefox 2.0
	// Linux Firefox 1.0.7
	// Linux Firefox 1.5.0
	// Linux Mozilla 1.7.2
	function _isBrowserLinuxFF($ua_ok) {
		   return ( (eregi( "Linux", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "rv:[1]\.[7]\.[5]", $ua_ok ) && eregi( "[1]\.[0]", $ua_ok ) ) ||
					(eregi( "Linux", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[8]\.[1]\.[1]", $ua_ok ) ) ||
					(eregi( "Linux", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[0]\.[7]", $ua_ok ) ) ||
					(eregi( "Linux", $ua_ok ) && eregi( "firefox", $ua_ok ) && eregi( "[1]\.[5]\.[0]", $ua_ok ) ) ||
					(eregi( "Linux", $ua_ok ) && eregi( "mozilla", $ua_ok ) && eregi( "rv:[1]\.[7]\.[12]", $ua_ok ) )
				  );
	}
	
	
	// Linux Opera 9
	function _isBrowserLinuxOP($ua_ok) {
		   return (eregi( "Linux", $ua_ok ) && eregi( "opera", $ua_ok ) && eregi( "[9]\.[00]", $ua_ok ) );
	}
	
	function _isBrowserOP($ua_ok) {
		return ( _isBrowserWinOP($ua_ok) || _isBrowserMacOP($ua_ok) || _isBrowserLinuxOP($ua_ok) );
	}
	
	function _isBrowserNS($ua_ok) {
		return ( _isBrowserWinFF($ua_ok) || _isBrowserMacFF($ua_ok) || _isBrowserLinuxFF($ua_ok) );
	}
	
	function _isBrowserFF($ua_ok) {
		return _isBrowserNS($ua_ok);
	}
	
	function _isBrowserIE($ua_ok) {
		return ( _isBrowserWinIE($ua_ok) || _isBrowserMacIE($ua_ok) );
	}
	
	function ezIsBrowserIE() {
		return (_isBrowserIE($_SERVER['HTTP_USER_AGENT']));
	}
	
	function ezIsBrowserFF() {
		return (_isBrowserFF($_SERVER['HTTP_USER_AGENT']));
	}
	
	function ezIsBrowserNS() {
		return (_isBrowserNS($_SERVER['HTTP_USER_AGENT']));
	}
	
	function ezIsBrowserOP() {
		return (_isBrowserOP($_SERVER['HTTP_USER_AGENT']));
	}

	function redirectBrowser($to,$code=301) {
	$location = null;
	$sn = $_SERVER['SCRIPT_NAME'];
	$cp = dirname($sn);
	if (substr($to,0,4)=='http') {
		$location = $to;
	} else {
	  $schema = $_SERVER['SERVER_PORT']=='443'?'https':'http';
	  $host = strlen($_SERVER['HTTP_HOST'])?$_SERVER['HTTP_HOST']:$_SERVER['SERVER_NAME'];
	  if (substr($to,0,1)=='/') {
		 $location = "$schema://$host$to";
	  } elseif (substr($to,0,1)=='.') {
		$location = "$schema://$host/";
		$pu = parse_url($to);
		$cd = dirname($_SERVER['SCRIPT_FILENAME']).'/';
		$np = realpath($cd.$pu['path']);
		$np = str_replace($_SERVER['DOCUMENT_ROOT'],'',$np);
		$location.= $np;
		if ((isset($pu['query'])) && (strlen($pu['query'])>0)) {
		   $location.= '?'.$pu['query'];
		}
	  }
	}
	
	$hs = headers_sent();
	if ($hs==false) {
	  if ($code==301) header("301 Moved Permanently HTTP/1.1");
	  elseif ($code==302) header("302 Found HTTP/1.1");
	  elseif ($code==303) header("303 See Other HTTP/1.1");
	  elseif ($code==304) header("304 Not Modified HTTP/1.1");
	  elseif ($code==305) header("305 Use Proxy HTTP/1.1");
	  elseif ($code==306) header("306 Not Used HTTP/1.1");
	  elseif ($code==307) header("307 Temorary Redirect HTTP/1.1");
	  else trigger_error("Unhandled redirect() HTTP Code: $code",E_USER_ERROR);
	  header("Location: $location");
	  header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
	} elseif (($hs==true) || ($code==302) || ($code==303)) {
	  $cover_div_style = 'height: 100%; left: 0px; position: absolute; top: 0px; width: 100%;';
	  echo "<noscript>";
	  echo "<div style='$cover_div_style'>\n";
	  $link_div_style = 'background-color: #fff; border: 2px solid #f00; left: 0px; margin: 5px; padding: 3px; ';
	  $link_div_style.= 'position: absolute; text-align: center; top: 0px; width: 95%; z-index: 99;';
	  echo "<div style='$link_div_style'>\n";
	  echo "<p>Please See: <a href='$to'>".htmlspecialchars($location)."</a></p>\n";
	  echo "</div>\n</div>\n";
	  echo "</noscript>";
	  echo '<SCRIPT type="text/javascript" language="JavaScript 1.2">';
	  echo "window.location.href = '$location';";
	  echo "</script>";
	}
	exit(0);
	}
      
	function splitStringToArray($s) {
		$ar = array();
		$tok = strtok($s, "/");
		while ($tok != false) {
			  array_push($ar, $tok);
			  $tok = strtok("/");
		}
		return $ar;
	}
	  
	function flashContent($id, $w, $h, $url, $bgColor) {
		$content = '';
		$content = $content . '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="' . $w . '" height="' . $h . '" id="' . $id . '" align="middle">';
		$content = $content . '<param name="allowScriptAccess" value="sameDomain" />';
		$content = $content . '<param name="movie" value="' . $url . '" />';
		$content = $content . '<param name="loop" value="false" />';
		$content = $content . '<param name="menu" value="false" />';
		$content = $content . '<param name="quality" value="high" />';
		$content = $content . '<param name="bgcolor" value="' . $bgColor . '" />';
		$content = $content . '<embed src="' . $url . '" loop="false" menu="false" quality="high" bgcolor="' . $bgColor . '" width="' . $w . '" height="' . $h . '" name="' . $id . '" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />';
		$content = $content . '</object>';
		return $content;
	}
	
	function docHeader($p) {
		$content = '';
		$btype = ((ezIsBrowserFF()) ? 'FF' : '');
		$content = $content . '<LINK rel="STYLESHEET" type="text/css" href="' . $p . '/StyleSheet' . $btype . '.css">';
		$content = $content . '<link href="' . $p . '/favicon.ico" rel="shortcut icon">';
		$content = $content . '<LINK rel="STYLESHEET" type="text/css" href="' . $p . '/commonStyles.css">';
		$content = $content . '<LINK rel="STYLESHEET" type="text/css" href="' . $p . '/app/styles.css">';
		$content = $content . '<LINK rel="STYLESHEET" type="text/css" href="' . $p . '/app/flash/stylesheet.css">';
		$content = $content . '<META http-equiv=Content-Type content="text/html; charset=windows-1252">';
		$content = $content . '<META content="MSHTML 6.00.2900.3020" name=GENERATOR>';
		return $content;
	}
?>

