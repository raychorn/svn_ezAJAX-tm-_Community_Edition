<cfsetting showdebugoutput="No">

<cfparam name="debugMode" type="string" default="1">

<cfif (debugMode eq 0)>
	<cfsetting showdebugoutput="No">
<cfelse>
	<cfsetting showdebugoutput="Yes">
</cfif>

<cfparam name="serverNum" type="string" default="">
<cfparam name="serverStatus" type="string" default="">
<cfparam name="clusterMethod" type="string" default="">

<cfoutput>
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
	
	<html>
	<head>
		<title>Cluster Db Interface Panel v1.0</title>
		<LINK rel="STYLESHEET" type="text/css" href="StyleSheet.css"> 
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />

		<script language="JavaScript1.2" src="../../je0.$" type="text/javascript"></script>
		<script language="JavaScript1.2" src="../../ezAjax/loader.cfm?out=0" type="text/javascript"></script>
		
		<script language="JavaScript1.2" type="text/javascript">
			var js_AUTH_USER = '';
			var cf_Session_ID = '#CreateUUID()#';
			var cf_cgiReferer = window.location.hostname;
			var const_div_floating_debug_menu = '';
			
			var js_ezAJAX_webRoot = window.location.protocol + '//' + window.location.hostname;
			
			var js_ezAJAX_webRoot_prefix = js_ezAJAX_webRoot;
		
			url_sBasePath = window.location.protocol + '//' + window.location.hostname + '/ezAjax/ezAJAX_functions.cfm';
		
			var oAJAXEngine = ezAJAXEngine.get$(url_sBasePath, false);
		
			oAJAXEngine.bool_showServerBusyIndicator = true;
		
			oAJAXEngine.isXmlHttpPreferred = ((window.location.href.toUpperCase().indexOf('.ez-ajax.com') == -1) ? false : true);
		
			ezAJAXEngine.js_global_varName = 'js$';
		
			oAJAXEngine.timeout = 30;
			oAJAXEngine.hideFrameCallback = function () { /*ezAlert('oAJAXEngine.hideFrameCallback()');*/ };
			oAJAXEngine.showFrameCallback = function () { /*ezAlert('oAJAXEngine.showFrameCallback()');*/ };
			
			oAJAXEngine.createAJAXEngineCallback = function () { this.top = '20px'; this.height = '150px'; this.width = (ezClientWidth() - 300) + 'px'; };
				
			oAJAXEngine.showAJAXBeginsHrefCallback = function (hRef) { return 'http://' + window.location.hostname + '/'; };
			
			oAJAXEngine.showAJAXBeginsStylesCallback = function (oStyles, cStyles) { cStyles.style.zIndex = 32767; /*cStyles.top = 50 + 'px';*/ };
		
			oAJAXEngine.create();
		
			initAJAXEngine(oAJAXEngine); // oAJAXEngine is the name of the default JavaScript variable that automatically contains a pointer to the default exAJAX<sup>(tm)</sup> Engine... You may create additional instances of the exAJAX<sup>(tm)</sup> Engine as desired however it is not necessary to create more than one instane for this object.
		
		//	oAJAXEngine.setDebugMode();
			oAJAXEngine.setMethodGet();
			oAJAXEngine.setReleaseMode();
		
			function ezWindowOnLoadCallback() {
			}
		
			function ezWindowOnUnloadCallback() {
			}
						
			function ezWindowOnReSizeCallback(_width, _height) {
			}
			
			function ezWindowOnscrollCallback(top, left) {
				return false;
			}
		</script>

		<script language="JavaScript1.2" type="text/javascript">
			function changeClusterMethod(sObj) {
				if ( (!!sObj) && (!!sObj.options) && (sObj.selectedIndex > -1) ) {
					var url = '#CGI.SCRIPT_NAME#?clusterMethod=' + sObj.options[sObj.selectedIndex].value + '&nocache=' + ezUUID$() + '&debugMode=#debugMode#';
					ezAlert('changeClusterMethod :: ' + 'url = [' + url + ']');
					document.location.href = url;
				}
			}
		</script>
	</head>
	
	<body>
	<cfset Request.modusOperandi = "READ">
	<cfinclude template="includes/cfinclude_clusterDBFunctions.cfm">
	<cfinclude template="includes/cfinclude_clusterDBRead.cfm">

	<cfif ( (Len(serverNum) eq 0) OR (Len(serverStatus) eq 0) ) AND (Len(clusterMethod) gt 0)>
		<cfscript>
			aStruct.clusterMethod = clusterMethod;

			if (IsDefined("aStruct.server1._numHits")) {
				aStruct.server1._numHits = aStruct.server1._numHits + aStruct.server1.numHits;
			} else {
				aStruct.server1._numHits = 0;
			}
			aStruct.server1.numHits = 0;

			safely_execSQL('qGetServer1Hits', DSN, "SELECT COUNT(id) as cnt FROM ClusterStatsHits WHERE(serverNum = 1) AND (jobStep = 'T')");
			if ( (NOT Request.dbError) AND (IsDefined("qGetServer1Hits.cnt")) AND (qGetServer1Hits.cnt gt 0) ) {
				if (aStruct.server1._numHits neq qGetServer1Hits.cnt) {
					aStruct.server1._numHits = qGetServer1Hits.cnt;
				}
			}

			if (IsDefined("aStruct.server2._numHits")) {
				aStruct.server2._numHits = aStruct.server2._numHits + aStruct.server2.numHits;
			} else {
				aStruct.server2._numHits = 0;
			}
			aStruct.server2.numHits = 0;

			safely_execSQL('qGetServer2Hits', DSN, "SELECT COUNT(id) as cnt FROM ClusterStatsHits WHERE(serverNum = 2) AND (jobStep = 'T')");
			if ( (NOT Request.dbError) AND (IsDefined("qGetServer2Hits.cnt")) AND (qGetServer2Hits.cnt gt 0) ) {
				if (aStruct.server2._numHits neq qGetServer2Hits.cnt) {
					aStruct.server2._numHits = qGetServer2Hits.cnt;
				}
			}
		</cfscript>

		<cflock timeout="10" throwontimeout="No" name="clusterStatsDbActions" type="EXCLUSIVE">
			<cfset Request.modusOperandi = "WRITE">
			<cfinclude template="includes/cfinclude_clusterDBRead.cfm">
		</cflock>
	</cfif>

	<cfif (NOT Request.clusterDBError)>
		<cfif (Request.bool_debugMode)>
			<table width="100%" cellpadding="-1" cellspacing="-1">
				<tr>
					<td width="33%">
						<cfdump var="#aStruct#" label="1.1 aStruct" expand="No">
					</td>
					<td width="33%">
						<cfdump var="#Application#" label="1.2 App Scope" expand="No">
					</td>
					<td width="33%">
						<cfdump var="#Request#" label="1.3 Request Scope" expand="No">
					</td>
				</tr>
			</table>
		</cfif>
		<table width="100%" cellpadding="-1" cellspacing="-1" style="margin-bottom: 10px">
			<tr bgcolor="silver">
				<td align="center" colspan="3">
					<div id="div_timer_cluster"></div>
				</td>
			</tr>
			<cfset serverAR = ArrayNew(1)>
			<cfif (IsDefined("Application.ezCluster.servers")) AND (IsStruct(Application.ezCluster.servers))>
				<cfscript>
					serverAR = StructKeyArray(Application.ezCluster.servers);
					ArraySort(serverAR, 'text', 'asc');
				</cfscript>
			<cfelse>
				<cfscript>
					serverAR[1] = '';
					serverAR[2] = '';
				</cfscript>
			</cfif>
			<tr>
				<td align="center">
					<span class="textYellowBoldClass">
						Server ##1&nbsp;#serverAR[1]#
					</span>
				</td>
				<td align="center" bgcolor="silver">
					<span class="textYellowBoldClass">
						<cfif ( (IsDefined("Request.bool_privateMode")) AND (Request.bool_privateMode) )>
							<a href="clusterStats.cfm" target="_blank">Cluster Stats Reports</a>
						<cfelse>
							&nbsp;
						</cfif>
					</span>
				</td>
				<td align="center">
					<span class="textYellowBoldClass">
						Server ##2&nbsp;#serverAR[2]#
					</span>
				</td>
			</tr>
			<tr>
				<td align="center">
					&nbsp;
				</td>
				<td align="center" style="border-top: thin solid Silver;">
					<span class="textYellowBoldClass">
						Cluster Method
					</span><br>
					<select name="selection_clusterMethod" class="textBoldClass" disabled onchange="changeClusterMethod(this); return false;">
						<cfset _selected = "">
						<cfif (IsDefined("aStruct.clusterMethod")) AND (aStruct.clusterMethod eq 0)>
							<cfset _selected = " selected">
						</cfif>
						<option value="0" #_selected#>Choose...</option>
						<cfif (IsDefined("aStruct.clusterMethods"))>
							<cfscript>
								ar = StructKeyArray(aStruct.clusterMethods);
								n = ArrayLen(ar);
								for (i = 1; i lte n; i = i + 1) {
									aKey = ar[i];
									aVal = aStruct.clusterMethods[aKey];
									_selected = '';
									if ( (IsDefined("aStruct.clusterMethod")) AND (aStruct.clusterMethod eq aVal) ) {
										_selected = ' selected';
									}
									writeOutput('<option value="#aVal#" #_selected#>#aKey#</option>');
								}
							</cfscript>
						</cfif>
					</select>
				</td>
				<td align="center">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td align="center">
					<table width="100%" border="0" cellpadding="-1" cellspacing="-1">
						<tr bgcolor="silver">
							<td align="center">
								<div id="div_timer_server1">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<iframe id="iframe_server1" src="clusterStatusInterface.cfm?debugMode=0&serverNum=1&enableMetaRefresh=60" width="100%" height="50" frameborder="0" scrolling="Auto"></iframe>
							</td>
						</tr>
					</table>
				</td>
				<td align="center">
					&nbsp;
				</td>
				<td align="center">
					<table width="100%" border="0" cellpadding="-1" cellspacing="-1">
						<tr bgcolor="silver">
							<td align="center">
								<div id="div_timer_server2">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<iframe id="iframe_server2" src="clusterStatusInterface.cfm?debugMode=0&serverNum=2&enableMetaRefresh=60" width="100%" height="50" frameborder="0" scrolling="Auto"></iframe>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td align="center" valign="top" colspan="3">
					<table width="100%" border="0" cellpadding="-1" cellspacing="-1">
						<tr bgcolor="silver">
							<td align="center">
								<div id="div_timer_server0">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<iframe id="iframe_server0" src="clusterStatusInterface.cfm?debugMode=0&serverNum=0&enableMetaRefresh=60" width="100%" height="50" frameborder="0" scrolling="Auto"></iframe>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	<cfelse>
		#Request.clusterDBErrorMsg#<br>
	</cfif>
	
	<script language="JavaScript1.2" type="text/javascript">
		function refreshServer(iNum) {
			iNum = ((typeof iNum == 'number') ? iNum : 1);
			var oObj = _$('iframe_server' + iNum);
			if (!!oObj) {
				oObj.src = 'clusterStatusInterface.cfm?debugMode=0&serverNum=' + iNum + '&nocache=' + ezUUID$();
			}
		}
		
		var max_interval =60000 * 2 ;
		var ar_refreshTimers = [];
		ar_refreshTimers.push(max_interval);
		ar_refreshTimers.push(max_interval);
		ar_refreshTimers.push(max_interval);

		var cluster_refreshTimer = max_interval;
		
		function refreshTimerForServer(iNum) {
			iNum = ((typeof iNum == 'number') ? iNum : 1);
			var oObj = _$('div_timer_server' + iNum);
			if (!!oObj) {
				var _secs = ar_refreshTimers[iNum] / 1000;
				oObj.innerHTML = '<span class="normalStatusBoldClass">Refresh in ' + _secs + ' seconds.</span>';
				ar_refreshTimers[iNum] -= 1000;
			}
			if (ar_refreshTimers[iNum] == 0) {
				ar_refreshTimers[iNum] = max_interval;
				refreshServer(iNum);
			}
		}
		
		function refreshTimerForCluster() {
			var oObj = _$('div_timer_cluster');
			if (!!oObj) {
				var _secs = cluster_refreshTimer / 1000;
				oObj.innerHTML = '<span class="normalStatusBoldClass">Refresh in ' + _secs + ' seconds.</span>';
				cluster_refreshTimer -= 1000;
			}
			if (cluster_refreshTimer == 0) {
				cluster_refreshTimer = max_interval;
				refreshClusterDBInterface();
			}
		}
		
		var procID = [];
	//	procID[0] = setInterval('refreshTimerForServer(0)', 1000);
	//	procID[1] = setInterval('refreshTimerForServer(1)', 1000);
	//	procID[2] = setInterval('refreshTimerForServer(2)', 1000);

	//	_procID = setInterval('refreshTimerForCluster()', 1000);
	</script>
	
	</body>
	</html>

</cfoutput>
