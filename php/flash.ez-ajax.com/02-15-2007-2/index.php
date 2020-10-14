<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <title>flash.ez-ajax.com (c). Copyright 1990-<?php date_default_timezone_set ("America/Los_Angeles"); $today = getdate(); print_r($today["year"]);?>, Hierarchical Applications Limited, Inc., All Rights Reserved.</title>
  <?php
       include_once("includes\documentHeader.php");
  ?>
 </head>
 <body>
   <?php
		print('<pre>$_SERVER :: <br>'); print_r($_SERVER); print('<br><br></pre>');
		print('<pre>$_GET :: <br>'); print_r($_GET); print('<br><br></pre>');
		print('<pre>$_POST :: <br>'); print_r($_POST); print('<br><br></pre>');
		print('<pre>$_REQUEST :: <br>'); print_r($_REQUEST); print('<br><br></pre>');
		print('<pre>$_FILES :: <br>'); print_r($_FILES); print('<br><br></pre>');
		print('<pre>$_COOKIE :: <br>'); print_r($_COOKIE); print('<br><br></pre>');
		print('<pre>$_ENV :: <br>'); print_r($_ENV); print('<br><br></pre>');
		
   ?>
 </body>
</html>
