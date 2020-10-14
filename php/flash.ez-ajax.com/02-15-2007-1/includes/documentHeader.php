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
	
	function tomcatServerDomain($u = '', $p = 8080, $sd = '/openlaszlo-4.0b1') {
		$sn = 'http';
		if ($_SERVER['SERVER_PORT'] == 443) {
			$sn = $sn . 's';
		}
		$sn = $sn . '://' . $_SERVER['SERVER_NAME'] . ':' . $p . $sd . $u;
		return $sn;
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
	
	function splitStringUsingChar($s = '', $w = 80, $ch = '<br>') {
		$t = '';
		for ($i = 0; $i < strlen($s); $i += $w) {
			$t = $t . substr($s,$i,$w) . $ch;
		}
		return $t;
	}
	
	function buttonClassNameForBrowser() {
		return 'buttonClass' . (ezIsBrowserIE() ? '' : 'FF');
	}
	  
	function prevNextButtonsForPage($pNum = 1, $pNumMax = 1) {
		return '<button id="btn_prevPage' . sprintf("%d", $pNum) . '"' . (($pNum == 1) ? ' disabled="true"' : '') . ' class="' . buttonClassNameForBrowser() . '" onClick="' . (($pNum > 1) ? 'clickTabsForPage(' . sprintf("%d", $pNum - 1) . '); ' : '') . 'return false;"><img src="/images/prev' . (($pNum == 1) ? '-disabled' : '') . '.gif" width="27" height="19" border="0"></button>&nbsp;<button id="btn_nextPage' . sprintf("%d", $pNum) . '"' . (($pNum == $pNumMax) ? ' disabled="true"' : '') . ' class="' . buttonClassNameForBrowser() . '" onClick="' . (($pNum < $pNumMax) ? 'clickTabsForPage(' . sprintf("%d", $pNum + 1) . '); ' : '') . 'return false;"><img src="/images/next' . (($pNum == $pNumMax) ? '-disabled' : '') . '.gif" width="27" height="19" border="0"></button>';
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
	
	class MSSQLDB {
		var $db_connection;
		var $serverName;
		var $username;
		var $userPassword;
		 
		 // Constructor
		 function __construct($inDatabaseName) {
		 	$this->serverName = ((stristr ( $_SERVER['SERVER_NAME'], ".halsmalltalker.com") != false) ? "localhost" : "SQL2005") . ",1433";
			$this->username = 'sa';
			$this->userPassword = 'sisko@7660$boo';
			$this->db_connection = mssql_connect($this->serverName, $this->username, $this->userPassword)
													or die('Could not connect to ('.$this->serverName.') server as ('.$this->username.')/('.$this->userPassword.')');
						  
			mssql_select_db($inDatabaseName)
					or die('Could not select to '.$inDatabaseName.' database');
		 }
		 
		function sqlEscape($sql) {
			$fix_str = stripslashes($sql);
			$fix_str = str_replace("'","''",$sql);
			$fix_str = str_replace("\0","[NULL]",$fix_str);
			
			return $fix_str;
		}

		 // Generic query function
		 function query_database($inQuery) {
			  // Always include the link identifier (in this case $this->db_connection) in mssql_query
			  $query_result = mssql_query($inQuery, $this->db_connection) or die('Query failed: '.$inQuery);
			  
			  if (stripos($inQuery, 'insert') === false) {
					// fetch the results as an array
					$result = array();
					while ($row = mssql_fetch_object($query_result)) {
						 $result[] = $row;
					}
					
					// dispose of the query
					mssql_free_result($query_result);
			  
					// return result
					return $result;
			  } else {
					// dispose of the query
					mssql_free_result($query_result);
					
					// get the last insert id
					$query = 'select SCOPE_IDENTITY() AS last_insert_id';
					$query_result = mssql_query($query) or die('Query failed: '.$query);
														 
					$query_result    = mssql_fetch_object($query_result);
					
					mssql_free_result($query_result);
					
					return $query_result->last_insert_id;
			  }
		 }
	}

//	#usage:
//	$r = new HTTPRequest('http://www.php.net');
//	echo $r->DownloadToString();
	
	class HTTPRequest	{
		var $_fp;        // HTTP socket
		var $_url;        // full URL
		var $_host;        // HTTP host
		var $_protocol;    // protocol (HTTP/HTTPS)
		var $_uri;        // request URI
		var $_port;        // port
		
		// scan url
		function _scan_url() {
			 $req = $this->_url;
			 
			 $pos = strpos($req, '://');
			 $this->_protocol = strtolower(substr($req, 0, $pos));
			 
			 $req = substr($req, $pos+3);
			 $pos = strpos($req, '/');
			 if($pos === false)
				  $pos = strlen($req);
			 $host = substr($req, 0, $pos);
			 
			 if(strpos($host, ':') !== false) {
				  list($this->_host, $this->_port) = explode(':', $host);
			 } else {
				  $this->_host = $host;
				  $this->_port = ($this->_protocol == 'https') ? 443 : 80;
			 }
			 
			 $this->_uri = substr($req, $pos);
			 if($this->_uri == '')
				  $this->_uri = '/';
		}
		
		// constructor
		function HTTPRequest($url) {
			 $this->_url = $url;
			 $this->_scan_url();
		}
		
		// download URL to string
		function DownloadToString() {
			 $crlf = "\r\n";
			 
			 // generate request
			 $req = 'GET ' . $this->_uri . ' HTTP/1.0' . $crlf
				  .    'Host: ' . $this->_host . $crlf
				  .    $crlf;
			 
			 // fetch
			 $this->_fp = fsockopen(($this->_protocol == 'https' ? 'ssl://' : '') . $this->_host, $this->_port);
			 fwrite($this->_fp, $req);
			 while(is_resource($this->_fp) && $this->_fp && !feof($this->_fp))
				  $response .= fread($this->_fp, 1024);
			 fclose($this->_fp);
			 
			 // split header and body
			 $pos = strpos($response, $crlf . $crlf);
			 if($pos === false)
				  return($response);
			 $header = substr($response, 0, $pos);
			 $body = substr($response, $pos + 2 * strlen($crlf));
			 
			 // parse headers
			 $headers = array();
			 $lines = explode($crlf, $header);
			 foreach($lines as $line)
				  if(($pos = strpos($line, ':')) !== false)
						$headers[strtolower(trim(substr($line, 0, $pos)))] = trim(substr($line, $pos+1));
			 
			 // redirection?
			 if(isset($headers['location'])) {
				  $http = new HTTPRequest($headers['location']);
				  return($http->DownloadToString($http));
			 } else  {
				  return($body);
			 }
		}
	}

	/*
		* @return string
		* @param string $url
		* @desc Return string content from a remote file
		* @author Luiz Miguel Axcar (lmaxcar@yahoo.com.br)
	*/
	
	function get_content($url) {
		$ch = curl_init();
	
		curl_setopt ($ch, CURLOPT_URL, $url);
		curl_setopt ($ch, CURLOPT_HEADER, 0);
	
		ob_start();
	
		curl_exec ($ch);
		curl_close ($ch);
		$string = ob_get_contents();
	
		ob_end_clean();
		
		return $string;    
	}
	
	//	#usage:
	//	$content = get_content ("http://www.php.net");
	//	var_dump ($content);
	
	function getcontent($server, $port, $file) {
		$cont = "";
		$ip = gethostbyname($server);
		$fp = fsockopen($ip, $port);
		if (!$fp) {
			 return "Unknown";
		} else {
			 $com = "GET $file HTTP/1.1\r\nAccept: */*\r\nAccept-Language: de-ch\r\nAccept-Encoding: gzip, deflate\r\nUser-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)\r\nHost: $server:$port\r\nConnection: Keep-Alive\r\n\r\n";
			 fputs($fp, $com);
			 while (!feof($fp)) {
				  $cont .= fread($fp, 500);
			 }
			 fclose($fp);
			 $cont = substr($cont, strpos($cont, "\r\n\r\n") + 4);
			 return $cont;
		}
	}
//	echo getcontent("www.myhost.com", "81", "/"));

	function var_dump_ret($mixed = null) {
	  ob_start();
	  var_dump($mixed);
	  $content = ob_get_contents();
	  ob_end_clean();
	  return $content;
	}

	function var_print_r($mixed = null) {
	  ob_start();
	  print_r($mixed);
	  $content = ob_get_contents();
	  ob_end_clean();
	  return $content;
	}

	function getXMLPacket($v = "") {
		while (list($k,$v) = each($v)) {
			$k1 = strtoupper ( $k );
			$v1 = strtoupper ( $v );
			$n = "$k=$v";
			$data = eregi_replace ( "_", " ", $n );
		}
		$data = str_replace('\"', '"', $data);
		return $data;
	}

//	 $p =& new xmlParser();
//	 $p->parse("/* XML file*/");
//	 echo "<pre>";
//	 print_r($p->output);
//	 echo "</pre>";
	
	class xmlParser{
		var $xml_obj = null;
		var $output = array();
		var $attrs;
	
		function xmlParser(){
			 $this->xml_obj = xml_parser_create();
			 xml_set_object($this->xml_obj,$this);
			 xml_set_character_data_handler($this->xml_obj, 'dataHandler');
			 xml_set_element_handler($this->xml_obj, "startHandler", "endHandler");
		}
	
		function _parse($d = "", $bool = false) {
			$retCode = xml_parse($this->xml_obj, $d, $bool);
			if (!$retCode) {
				die(sprintf("XML error: %s at line %d",
				xml_error_string(xml_get_error_code($this->xml_obj)),
				xml_get_current_line_number($this->xml_obj)));
				xml_parser_free($this->xml_obj);
			}
			return $retCode;
		}
		
		function parse($path){
			 if (!($fp = fopen($path, "r"))) {
				  die("Cannot open XML data file: $path");
				  return false;
			 }
	
			 while ($data = fread($fp, 4096)) {
			 	$this->_parse($data, feof($fp));
			 }
	
			 return true;
		}
	
		function startHandler($parser, $name, $attribs){
			 $_content = array();
			 $_content['name'] = $name;
			 if(!empty($attribs))
				  $_content['attrs'] = $attribs;
			 array_push($this->output, $_content);
	}
	
		function dataHandler($parser, $data){
			 if(!empty($data) && $data!="\n") {
				  $_output_idx = count($this->output) - 1;
				  $this->output[$_output_idx]['content'] .= $data;
			 }
		}
	
		function endHandler($parser, $name){
			 if(count($this->output) > 1) {
				  $_data = array_pop($this->output);
				  $_output_idx = count($this->output) - 1;
				  $add = array();
				  if(!$this->output[$_output_idx]['child'])
						$this->output[$_output_idx]['child'] = array();
				  array_push($this->output[$_output_idx]['child'], $_data);
			 }  
		}
	}

	function docHeader($p, $boolUseCommonStyles = true) {
		$content = '';
		$btype = ((ezIsBrowserFF()) ? 'FF' : '');
		$today = getdate();
		$content = $content . '<title>flash.ez-ajax.com (c). Copyright 1990-' . $today["year"] . ', Hierarchical Applications Limited, Inc., All Rights Reserved.</title>';
		$content = $content . '<LINK rel="STYLESHEET" type="text/css" href="' . $p . '/StyleSheet' . $btype . '.css">';
		$content = $content . '<link href="' . $p . '/favicon.ico" rel="shortcut icon">';
		if ($boolUseCommonStyles) $content = $content . '<LINK rel="STYLESHEET" type="text/css" href="' . $p . '/commonStyles.css">';
		$content = $content . '<LINK rel="STYLESHEET" type="text/css" href="' . $p . '/app/styles.css">';
		$content = $content . '<LINK rel="STYLESHEET" type="text/css" href="' . $p . '/app/flash/stylesheet.css">';
		$content = $content . '<link rel="STYLESHEET" type="text/css" href="' . $p . '/roundedTabs.css">';
		$content = $content . '<META http-equiv=Content-Type content="text/html; charset=windows-1252">';
		$content = $content . '<META content="MSHTML 6.00.2900.3020" name=GENERATOR>';
		$content = $content . '<script language="javascript1.2" type="text/javascript" src="' . $p . '/php/links/popUpWindowForURL.js"></script>';
		$content = $content . '<script language="javascript1.2" type="text/javascript" src="' . $p . '/roundedTabs.js"></script>';
		return $content;
	}
	
	function handleNoScript() {
		$content = '<noscript>You must enable JavaScript to use this site.<br>Please adjust your browser\'s settings to enable JavaScript or use a browser that supports JavaScript.<br><a href="http://flash.ez-ajax.com" target="_blank">Enable JavaScript and then Click HERE to try again...</a></noscript>';
		return $content;
	}
?>

