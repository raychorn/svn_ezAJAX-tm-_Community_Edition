<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<cfsetting enablecfoutputonly="Yes" requesttimeout="120">
<cfoutput>
<html>
<head>
	<title>Latency Checker</title>
</head>

<body>
	<cfset DSN = "ClusterDB">
	<cfset const_ClusterStats_sumbol = 'ClusterStatsHits'>
	
	<cfscript>
		beginMS = GetTickCount();
		threadObj = CreateObject("java", "java.lang.Thread");
	</cfscript>

	<cfset latencyThreshold = 100>

	<cfset serverNames = ArrayNew(1)>
	<cfset serverNames[1] = "ezajax1.halsmalltalker.com">
	<cfset serverNames[2] = "ezajax2.halsmalltalker.com">

	<cfset isError = false>
	<cftry>
		<cfif (IsDefined("Application.ezCluster.aStruct"))>
			<cfset aStruct = StructCopy(Application.ezCluster.aStruct)>
		</cfif>

		<cfcatch type="Any">
			<cfset isError = true>
			<cfset aStruct = StructNew()>
			
			<cfloop index="_i" from="1" to="#ArrayLen(serverNames)#">
				<cfset aStruct[serverNames[_i]] = StructNew()>
				<cfset aStruct[serverNames[_i]]['ISONLINE'] = true>
				<cfset aStruct[serverNames[_i]]['latency'] = StructNew()>
			</cfloop>
		</cfcatch>
	</cftry>
	
	<cfloop index="_ii" from="1" to="10">
		<cfloop index="_i" from="1" to="#ArrayLen(serverNames)#">
			<cfif (aStruct[serverNames[_i]]['ISONLINE'])>
				<cfset aStruct[serverNames[_i]]['latency'].beginMs = GetTickCount( )>
				<cftry>
					<cfhttp url="http://#serverNames[_i]#/index.cfm" method="GET" port="#CGI.SERVER_PORT#" result="rHTTP1" resolveurl="yes"></cfhttp>
			
					<cfcatch type="Any">
					</cfcatch>
				</cftry>
				<cfset aStruct[serverNames[_i]]['latency'].endMs = GetTickCount( )>
			
				<cfscript>
					aStruct[serverNames[_i]]['latency'].etMs = aStruct[serverNames[_i]]['latency'].endMs - aStruct[serverNames[_i]]['latency'].beginMs;
				</cfscript>
			<cfelse>
				<cfscript>
					aStruct[serverNames[_i]]['latency'].etMs = 2^31;
				</cfscript>
			</cfif>
		</cfloop>
		
		<cfif (NOT IsDefined("Application.ezCluster"))>
			<cfset Application.ezCluster = StructNew()>
		</cfif>
	
		<cfif (NOT IsDefined("Application.ezCluster.latencyCheckAR"))>
			<cfset Application.ezCluster.latencyCheckAR = ArrayNew(1)>
	
			<cfloop index="_i" from="1" to="#ArrayLen(serverNames)#">
				<cfset Application.ezCluster.latencyCheckAR[_i] = 2^31>
			</cfloop>
		</cfif>
	
		<cfif (NOT IsDefined("Application.ezCluster.latencyHistoryAR"))>
			<cfset Application.ezCluster.latencyHistoryAR = ArrayNew(1)>
		</cfif>
		<cfset Application.ezCluster.latencyHistoryAR[ArrayLen(Application.ezCluster.latencyHistoryAR) + 1] = StructCopy(aStruct)>
	
		<cfloop index="_i" from="1" to="#ArrayLen(serverNames)#">
			<cfscript>
				Application.ezCluster.latencyCheckAR[_i] = 0;
				xN = ArrayLen(Application.ezCluster.latencyHistoryAR);
				for (x = 1; x lte xN; x = x + 1) {
					Application.ezCluster.latencyCheckAR[_i] = Application.ezCluster.latencyCheckAR[_i] + Application.ezCluster.latencyHistoryAR[x][serverNames[_i]]['latency'].etMs;
				}
				Application.ezCluster.latencyCheckAR[_i] = Application.ezCluster.latencyCheckAR[_i] / xN;
			</cfscript>
		</cfloop>
	
		<cfif (ArrayLen(Application.ezCluster.latencyHistoryAR) gt latencyThreshold)>
			<cfset ArrayDeleteAt( Application.ezCluster.latencyHistoryAR, 1)>
		</cfif>
		
		<cfscript>
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
	
			Application.ezCluster.aStruct = StructCopy(aStruct);
			
			threadObj.sleep(10000);
		</cfscript>
	</cfloop>

<cfif 0>
	<cfdump var="#aStruct#" label="aStruct" expand="No">
	<cfdump var="#Application.latencyCheckAR#" label="Application.latencyCheckAR, serverNum = [#serverNum#]" expand="No">
	<cfdump var="#Application.latencyHistoryAR#" label="Application.latencyHistoryAR" expand="No">
	<cfdump var="#Application#" label="App Scope" expand="No">
</cfif>	

<cfscript>
	endMS = GetTickCount();
	
	writeOutput('etMS = [#(endMS - beginMS)#]');
</cfscript>

<cfdump var="#Application#" label="App Scope" expand="No">

</body>
</html>
</cfoutput>
