<cfoutput>
	<cfscript>
		bool_useAbsoluteServerBusyPositioning = false; // version 0.93 is now able to handle non-absolute positioning for the activity indicator...
	</cfscript>

	<cfsavecontent variable="jsCodeStore0">
		<cfoutput>
		var js_CF_TEMPLATE_PATH = '#JSStringFormat(ListDeleteAt(CGI.CF_TEMPLATE_PATH, ListLen(CGI.CF_TEMPLATE_PATH, '\'), '\'))#';
		
		var bool_isServerProduction = (('#bool_isServerProduction#' == 'true') ? true : false);
		
		var bool_useAbsoluteServerBusyPositioning = (('#bool_useAbsoluteServerBusyPositioning#'.toUpperCase() == 'TRUE') ? true : false);

		oAJAXEngine = ezAJAXEngine.init('#Request.ezAJAX_functions_cfm#', bool_isServerProduction);

		oAJAXEngine.isServerBusy_divName_populated = false;
		if (bool_useAbsoluteServerBusyPositioning) {
			oAJAXEngine.ezAJAX_serverBusyCallback = function (cObj) { 
				var oPos = ezAnchorPosition.get$('anchor_imageLogoRight'); 
				if (!!oPos) { 
					resizeOuterContentWrapper(ezClientWidth()); 
					cObj.style.top = (oPos.y + parseInt(this.ezAJAX_serverBusy_height.toString())) + 'px'; 
					cObj.style.left = (oPos.x - (parseInt(this.ezAJAX_serverBusy_width.toString()) / 4)) + 'px'; 
					cObj.style.zIndex = 1; 
					ezAnchorPosition.remove$(oPos.id); 
				} 
			};
		} else {
			oAJAXEngine.ezAJAX_serverBusy_divName = 'div_ezajax_3d_logo';
			oAJAXEngine.ezAJAX_serverBusyCallback = function (cObj, resp) { 
				var oO = _$('iframe_showAJAXBegins_' + oAJAXEngine.ajaxID); 
				if ( (!!oO) && (!this.isServerBusy_divName_populated) ) { 
					try { oO.contentWindow.document.writeln(resp); } catch (e) { };
					this.isServerBusy_divName_populated = true; 
				}; 
				if (oO.style.display == const_none_style) { 
					oO.style.display = const_inline_style; 
					var oPos = ezAnchorPosition.get$('anchor_imageLogoRight'); 
					if (!!oPos) { 
						oO.style.position = const_absolute_style;
						oO.style.top = (oPos.y + parseInt(this.ezAJAX_serverBusy_height.toString())) + 'px'; 
						oO.style.left = (oPos.x - (parseInt(this.ezAJAX_serverBusy_width.toString()) / 4)) + 'px'; 
						oO.style.width = parseInt(this.ezAJAX_serverBusy_width.toString()) + 'px'; 
						oO.style.height = parseInt(this.ezAJAX_serverBusy_height.toString()) + 'px'; 
						ezAnchorPosition.remove$(oPos.id); 
					}
					oO.style.zIndex = 1; 
					cObj.style.zIndex = 65535; 
				}; 
				resizeOuterContentWrapper(ezClientWidth()); 
			};
		}
		oAJAXEngine.timeout = 120;
		oAJAXEngine.ezAJAX_serverBusy_bgColor = 'white';
		oAJAXEngine.hideFrameCallback = function () { };
		oAJAXEngine.showFrameCallback = function () { };
		
		function adjustFloatingMenuStyles() {
			var dObj = _$(const_div_floating_debug_menu);
			if (!!dObj) {
				dObj.style.backgroundColor = 'cyan';
				dObj.style.width = '500px';
			}
		}
		
		function replaceFloatingDebugMenu() {
			var dObj = _$(const_div_floating_debug_menu_content);
			if (!!dObj) {
			}
		}
		
		function showFloatingMenu() {
			var dObj = _$(const_div_floating_debug_menu);
			if (!!dObj) {
				dObj.style.display = 'inline';
			}
		}
		
		oAJAXEngine.createAJAXEngineCallback = function () { adjustFloatingMenuStyles(); this.top = '400px'; };
		
		oAJAXEngine.showAJAXBeginsHrefCallback = function (hRef) { return oAJAXEngine._url; };
		
		oAJAXEngine.showAJAXDebugMenuCallback = function () { return true; };
		
		oAJAXEngine.showAJAXScopesMenuCallback = function () { return true; };
		
		oAJAXEngine.showAJAXBrowserDebugCallback = function () { return true; };
			
		oAJAXEngine.create();

		oAJAXEngine.isXmlHttpPreferred = ((bool_isServerProduction) ? true : false);
//		oAJAXEngine.isXmlHttpPreferred = true;

		function ezWindowOnLoadCallback() {
			initAJAXEngine(oAJAXEngine);
			resizeOuterContentWrapper();
		}

		function showAlertMessageCallback() {
		}
		
		function dismissAlertMessageCallback() {
		}
		
		function ezWindowOnUnloadCallback() {
		}
		
		function ezWindowOnReSizeCallback(_width, _height) {
			return _width;
		}
	
		function ezWindowOnscrollCallback(top, left) {
			var dObj = _$(const_div_floating_debug_menu);
			if (!!dObj) {
				dObj.style.display = ((bool_isServerProduction) ? const_none_style : const_inline_style);
				dObj.style.position = const_absolute_style;
				dObj.style.top = document.body.scrollTop + 'px';
				dObj.style.left = 0 + 'px';
			}
			return false;
		}

		function refreshClusterDBInterface() {
			var oObj = _$('iframe_clusterDBinterface');
			if (!!oObj) {
				oObj.src = 'app/StatisticsServer/clusterDBinterface.cfm?debugMode=0';
			}
		}
		</cfoutput>
	</cfsavecontent>
	
	<cfsavecontent variable="jsCodeStore1">
		<cfoutput>
		</cfoutput>
	</cfsavecontent>
	
	<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(jsCodeStore0 & jsCodeStore1)#</script>
	
	<cfsavecontent variable="ezClusterLink">
		<cfoutput>
			ezCluster&##8482
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="ezAJAXLink">
		<cfoutput>
			ezAJAX&##8482
		</cfoutput>
	</cfsavecontent>

	<cfsavecontent variable="_poweredHTML">
		<cfoutput>
			<p align="justify" class="normalPrompt">This Site is powered by #ezClusterLink# Patents Pending and #ezAJAXLink# Enterprise Edition v1.0.&nbsp;
			#ezClusterLink# makes 2 or more web servers into a single coherent web server using low-cost techniques.&nbsp;
			#ezAJAXLink# shortens time to market for AJAX Apps.&nbsp;&nbsp;Let us do all the work for you.&nbsp;&nbsp;<cfif (NOT Request.commonCode.ezIsBrowserIE())><b><i>This site is best when viewed using IE 7.x (1024x768) resolution.</i></b></cfif>
			&nbsp;
			The contents of this Site are protected under U.S. and International Copyright Laws. &copy 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.</p>
		</cfoutput>
	</cfsavecontent>
	
	<div id="table_outerContentWrapper" style="position: absolute; width: 900px; top: 0px; left: 0px; background-color: black;">
		<table width="900" align="center" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td valign="top" align="left">
					<div<cfif (NOT bool_isServerProduction)> style="position: absolute; top: 90;"</cfif>>
						<table width="100%" cellpadding="-1" cellspacing="-1">
							<tr>
								<td align="center" valign="top" bgcolor="silver">
									<h4>Cluster Interface v2.0</h4>
								</td>
							</tr>
							<tr>
								<td align="center" valign="top" bgcolor="silver">
									<iframe id="iframe_clusterDBinterface" src="app/StatisticsServer/clusterDBinterface.cfm?debugMode=0" width="100%" height="180" frameborder="1" scrolling="Auto"></iframe>
								</td>
							</tr>
							<cfif ( (IsDefined("Request.bool_privateMode")) AND (Request.bool_privateMode) )>
								<tr>
									<td align="center" valign="top" bgcolor="silver">
										<h4>Statistics Server Interface v2.0</h4>
									</td>
								</tr>
								<tr>
									<td align="center" valign="top" bgcolor="silver">
										<table width="100%" cellpadding="-1" cellspacing="-1" style="margin-bottom: 10px">
											<tr>
												<td align="center">
													<span class="textBoldClass">
														<a href="http://71.133.203.27:8080" target="_blank">Babylon5</a>&nbsp;|&nbsp;
														<a href="http://71.133.203.27:8080/server.htm" target="_blank">Babylon5 Admin</a>
														<br>
														<a href="http://cfide2.contentopia.net/CFIDE/administrator/index.cfm" target="_blank">Babylon5 CFAdmin</a>
													</span>
												</td>
												<td align="center">
													<span class="textBoldClass">
														<a href="http://71.133.203.26:8080" target="_blank">Stayme</a>&nbsp;|&nbsp;
														<a href="http://71.133.203.26:8080/server.htm" target="_blank">Stayme Admin</a>
														<br>
														<a href="http://cfide.contentopia.net/CFIDE/administrator/index.cfm" target="_blank">Stayme CFAdmin</a>
													</span>
												</td>
												<td align="center">
													<span class="textBoldClass">
														<a href="http://71.133.203.28:8080" target="_blank">CFServer2</a>&nbsp;|&nbsp;
														<a href="http://71.133.203.28:8080/server.htm" target="_blank">CFServer2 Admin</a>
														<br>
														<a href="http://cfide2.2.contentopia.net/CFIDE/administrator/index.cfm" target="_blank">CFServer2 CFAdmin</a>
													</span>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</cfif>
							<tr>
								<td align="center" valign="top">
									<table width="100%" cellpadding="-1" cellspacing="-1">
										<tr>
											<td width="10%" align="left" valign="top">
												<!--- 
												<iframe src="http://192.168.1.254/xslt?PAGE=M01" width="255" height="260" frameborder="0" scrolling="No"></iframe>
												 --->
											</td>
											<td width="90%" align="center" valign="middle">
												<div style="margin-top: 50px">
													<img src="app/StatisticsServer/images/ss50logo.gif" alt="" width="208" height="65" border="0">
												</div>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</div>
				</td>
			</tr>
			<tr>
				<td bgcolor="black" valign="top" align="left">
					<br>
					#_poweredHTML#
				</td>
			</tr>
		</table>
	</div>
</cfoutput>

