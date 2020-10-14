<cfsetting enablecfoutputonly="Yes">
<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>Asteroids Dispatcher</title>
	</head>
	
	<body>
	
	<table width="100%" cellpadding="-1" cellspacing="-1">
	<cfif ( (NOT IsDefined("Session.flashUser")) OR (Len(Session.flashUser) eq 0) )>
		<tr>
			<td>
				<div id="div_bypassLoginRegister" style="margin-left: 10px; margin-right: 10px;">
					<small>Register only once for this site and play all our games.  In fact, you will only be asked to Login after you Register only once per day unless you switch computers or switch browser types or you close your browser and reopen your browser.</small><br><br>
					<center><small><a href="/app/flash/insaneroids/asteroids.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#" target="iframe_loginRegister" onclick="var oDiv = document.getElementById('div_bypassLoginRegister'); if (!!oDiv) { oDiv.style.display = 'none'; }; return true;">[I do not care about my High Score, just let me play !]</a></small></center>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<iframe src="/app/flash/flash/loginRegister/login+register_01-17-2007-1.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#" name="iframe_loginRegister" id="iframe_loginRegister" width="900" height="600" scrolling="no" frameborder="0"></iframe>
			</td>
		</tr>
	<cfelse>
		<tr>
			<td>
				<iframe frameborder="0" scrolling="No" width="820" height="650" src="/app/flash/insaneroids/asteroids.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe>
			</td>
		</tr>
	</cfif>	
	</table>
	
	</body>
	</html>
</cfoutput>
