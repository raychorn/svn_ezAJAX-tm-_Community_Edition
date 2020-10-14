<cfsetting showdebugoutput="No">

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<cfscript>
	_urlPrefix = 'http://#CGI.SERVER_NAME#/' & ListDeleteAt(CGI.SCRIPT_NAME, ListLen(CGI.SCRIPT_NAME, '/'), '/') & '/';
	if (Right(_urlPrefix, 1) eq '/') {
		_urlPrefix = Left(_urlPrefix, Len(_urlPrefix) - 1);
	}
	_urlParentPrefix = 'http://#CGI.SERVER_NAME#/' & ListFirst(CGI.SCRIPT_NAME, '/') & '/';
	if (Right(_urlParentPrefix, 1) eq '/') {
		_urlParentPrefix = Left(_urlParentPrefix, Len(_urlParentPrefix) - 1);
	}
</cfscript>

<cfoutput>
	<html>
	<head>
		<title>ezAJAX(tm) &copy; 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.</title>
	</head>
	
	<body style="background-color: ##027FFF; margin: 0px 0px 0px 0px;">

	<table width="100%" cellpadding="-1" cellspacing="-1">
		<tr>
			<td>
				<table width="100%" cellpadding="-1" cellspacing="-1">
					<tr>
						<td>
							<img src="#URL.image#" border="0">
						</td>
						<td>
							<b>YES !  ezAJAX&##8482 is the right product for YOU !</b><br><br>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>
				<p align="justify">Your payment has been received.<br><br>
				We will check our Paypal Account Transcript to ensure your payment has been processed. Upon payment verification we will create an interim 90-day Runtime License and email it to the email address we have on-file for your original Trial Runtime License.  Near the end of the 90-day period we will issue a permanent Runtime License and email it to the email address we have on-file for your original Trial Runtime License.<br>
				<br>
				You can expect to hear from our Sales Department within 1-2 business days - kindly allow more time if you made your payment during non-business hours or over a weekend or holiday.
				</p>
			</td>
		</tr>
	</table>	

</cfoutput>

</body>
</html>
