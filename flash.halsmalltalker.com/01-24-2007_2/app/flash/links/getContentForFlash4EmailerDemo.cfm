<cfsetting enablecfoutputonly="Yes">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>getContentForFlash4EmailerDemo.cfm</title>
		<cfinclude template="cfinclude_DocHeader.cfm">
	</head>
	
	<body>
	
	<table width="590">
		<tr>
			<td class="primaryContentContainerHeader">
				<p align="justify"><a href="/app/flash/links/getContentForFlash4EmailerDemo.cfm" target="_self">Flash 4 Emailer Demo</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<p align="justify">This Flash 4 Demo is not functional at this time other than to serve as a sample of the work that was done way back whenever this particular Flash 4 component was functional.<br><br>This Flash 4 component could have been brought up to date and made functional however doing so would have required a complete redesign using the latest Flash 8 coding techniques that did not exist when this original Flash 4 component was created.<br><br>Additionally this Flash 4 component required an email server in order to function.<br><br><a href="/app/flash/emailerForm/emailerForm.fla" target="_blank">Click here to download the Flash Source File.</a></p>
			</td>
		</tr>
		<tr>
			<td valign="top">
				#flashContent("emailerForm", 400, 300, "/app/flash/emailerForm/emailerForm.swf?nocache=#RandRange(1, 65535, 'SHA1PRNG')#", "##164f9f")#
			</td>
		</tr>
	</table>
	
	</body>
	</html>
</cfoutput>

