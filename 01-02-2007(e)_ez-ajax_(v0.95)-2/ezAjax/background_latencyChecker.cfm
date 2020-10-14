<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfparam name="url.count" type="string" default="10">
<cfoutput>
<html>
<head>
	<title>Latency Checker</title>
</head>

<body>
	<cftry>
		<cfset DSN = "ClusterDB">
		<cfset const_ClusterStats_sumbol = 'ClusterStatsHits'>
		
		<cfscript>
			serverNames = ArrayNew(1);
			latencyThreshold = 100;

			if (FindNoCase('.ez-ajax.com', CGI.SERVER_NAME) gt 0) {
				serverNames[1] = 'www.1.ez-ajax.com';
				serverNames[2] = 'www.2.ez-ajax.com';
			} else {
				serverNames[1] = 'ezajax1.halsmalltalker.com';
				serverNames[2] = 'ezajax2.halsmalltalker.com';
			}

			if (0) {
				myURL = "ezAjax/viewAppScope.cfm";
			} else {
				myURL = "app/cfinclude_userDefinedAJAXFunctions.cfm";
			}

			iniPath = ExpandPath("ezCluster.INI");
			if (FileExists(iniPath)) {
				serverNames = ArrayNew(1);
				_serverCount = Trim(GetProfileString(iniPath, 'Servers', 'serverCount'));
				for (i = 1; i lte _serverCount; i = i + 1) {
					serverNames[ArrayLen(serverNames) + 1] = Trim(GetProfileString(iniPath, 'Servers', 'serverName' & i));
				}
				latencyThreshold = Trim(GetProfileString(iniPath, 'Servers', 'latencyWindow'));
				myURL = Trim(GetProfileString(iniPath, 'Servers', 'url'));

				if ( (IsDefined("Application.ezCluster")) AND (IsStruct(Application.ezCluster)) ) {
	//				StructDelete(Application, 'ezCluster');
				}
			}
			
			beginMS = GetTickCount();
			threadObj = CreateObject("java", "java.lang.Thread");

			try {
				if (NOT IsDefined("Application.ezCluster")) {
				}
				if ( (NOT IsDefined("Application.ezCluster")) OR (NOT IsStruct(Application.ezCluster)) ) {
					Application.ezCluster = StructNew();
				}
			} catch (Any e) { Application.ezCluster = StructNew(); };
			
			try {
				if (NOT IsDefined("Application.ezCluster.aStruct")) {
				}
				if ( (NOT IsDefined("Application.ezCluster.aStruct")) OR (NOT IsStruct(Application.ezCluster.aStruct)) ) {
					Application.ezCluster.aStruct = StructNew();
				}
			} catch (Any e) { Application.ezCluster.aStruct = StructNew(); };

			_iN = ArrayLen(serverNames);
			for (_i = 1; _i lte _iN; _i = _i + 1) {
				Application.ezCluster.aStruct[serverNames[_i]] = StructNew();
				try {
					if (NOT IsDefined("Application.ezCluster.aStruct[serverNames[_i]]['ISONLINE']")) {
						Application.ezCluster.aStruct[serverNames[_i]]['ISONLINE'] = true;
					}
				} catch (Any e) { Application.ezCluster.aStruct[serverNames[_i]]['ISONLINE'] = true; };
				Application.ezCluster.aStruct[serverNames[_i]]['latency'] = StructNew();
			}
		</cfscript>
	
		<cfloop index="_ii" from="1" to="#url.count#">
			<cfloop index="_i" from="1" to="#ArrayLen(serverNames)#">
				<cfif (Application.ezCluster.aStruct[serverNames[_i]]['ISONLINE'])>
					<cfscript>
						Application.ezCluster.aStruct[serverNames[_i]]['latency'].isError = false;
						Application.ezCluster.aStruct[serverNames[_i]]['latency'].beginMs = GetTickCount();
					</cfscript>
					<cftry>
						<cfscript>
		//					writeOutput("1.1 http://#serverNames[_i]#/#myURL#<br>");
						</cfscript>
						<cfhttp url="http://#serverNames[_i]#/#myURL#" method="GET" port="#CGI.SERVER_PORT#" result="rHTTP1" resolveurl="yes"></cfhttp>
						<cfscript>
							Application.ezCluster.aStruct[serverNames[_i]]['latency'].cfhttp = rHTTP1;
							Application.ezCluster.aStruct[serverNames[_i]]['ISONLINE'] = ( (FindNoCase("200", rHTTP1.Statuscode) gt 0) AND (FindNoCase("OK", rHTTP1.Statuscode) gt 0) );
						</cfscript>
				
						<cfcatch type="Any">
							<cfscript>
								Application.ezCluster.aStruct[serverNames[_i]]['latency'].isError = true;
								Application.ezCluster.aStruct[serverNames[_i]]['latency'].cfcatch = cfcatch;
							</cfscript>
						</cfcatch>
					</cftry>
				
					<cfscript>
						Application.ezCluster.aStruct[serverNames[_i]]['latency'].etMs = -1;
						Application.ezCluster.aStruct[serverNames[_i]]['latency'].endMs = GetTickCount();
						Application.ezCluster.aStruct[serverNames[_i]]['latency'].etMs = Application.ezCluster.aStruct[serverNames[_i]]['latency'].endMs - Application.ezCluster.aStruct[serverNames[_i]]['latency'].beginMs;
						writeOutput('etMs = [#Application.ezCluster.aStruct[serverNames[_i]]['latency'].etMs#]<br>');
						writeOutput('beginMs = [#Application.ezCluster.aStruct[serverNames[_i]]['latency'].beginMs#]<br>');
						writeOutput('endMs = [#Application.ezCluster.aStruct[serverNames[_i]]['latency'].endMs#]<br>');

						threadObj.sleep(2500);
					</cfscript>
				<cfelse>
					<cfscript>
						Application.ezCluster.aStruct[serverNames[_i]]['latency'].etMs = 2^31;
					</cfscript>
				</cfif>
			</cfloop>

			<cfscript>
				if (NOT IsDefined("Application.ezCluster.latencyCheckAR")) {
					Application.ezCluster.latencyCheckAR = ArrayNew(1);
					
					for (_i = 1; _i lte _iN; _i = _i + 1) {
						Application.ezCluster.latencyCheckAR[_i] = 2^31;
					}
				}
				
				if (NOT IsDefined("Application.ezCluster.latencyHistoryAR")) {
					Application.ezCluster.latencyHistoryAR = ArrayNew(1);
				}
				
				Application.ezCluster.latencyHistoryAR[ArrayLen(Application.ezCluster.latencyHistoryAR) + 1] = Application.ezCluster.aStruct;

				for (_i = 1; _i lte _iN; _i = _i + 1) {
					Application.ezCluster.latencyCheckAR[_i] = 0;
					xN = ArrayLen(Application.ezCluster.latencyHistoryAR);
					for (x = 1; x lte xN; x = x + 1) {
						Application.ezCluster.latencyCheckAR[_i] = Application.ezCluster.latencyCheckAR[_i] + Application.ezCluster.latencyHistoryAR[x][serverNames[_i]]['latency'].etMs;
					}
					Application.ezCluster.latencyCheckAR[_i] = Application.ezCluster.latencyCheckAR[_i] / xN;
				}
				
				if (ArrayLen(Application.ezCluster.latencyHistoryAR) gt latencyThreshold) {
					kN = (ArrayLen(Application.ezCluster.latencyHistoryAR) - latencyThreshold);
					writeOutput('kN = [#kN#]<br>');
					while (kN gt 0) {
						ArrayDeleteAt( Application.ezCluster.latencyHistoryAR, 1);
						kN = (ArrayLen(Application.ezCluster.latencyHistoryAR) - latencyThreshold);
						writeOutput('Removed Application.ezCluster.latencyHistoryAR item at index 1. [#kN#]<br>');
					}
				}

				serverNum = -1;
				latency = 2^31;
				jN = ArrayLen(serverNames);
				for (j = 1; j lte jN; j = j + 1) {
					if (Application.ezCluster.latencyCheckAR[j] lt latency) {
						latency = Application.ezCluster.latencyCheckAR[j];
						serverNum = j;
					}
				}
				Application.ezCluster.latencyCheckServerNum = serverNum;
			</cfscript>
		</cfloop>

		<cfcatch type="Any">
			<cfdump var="#cfcatch#" label="CF Error" expand="No">
		</cfcatch>
	</cftry>

<cfif 0>
	<cfdump var="#Application.latencyCheckAR#" label="Application.latencyCheckAR, serverNum = [#serverNum#]" expand="No">
	<cfdump var="#Application.latencyHistoryAR#" label="Application.latencyHistoryAR" expand="No">
	<cfdump var="#Application#" label="App Scope" expand="No">
</cfif>	

<cfscript>
	endMS = GetTickCount();
	
	writeOutput('etMS = [#(endMS - beginMS)#]');
</cfscript>

</body>
</html>
</cfoutput>
