<cfoutput>
	<script language="JavaScript1.2" type="text/javascript">
	<!--
		oAJAXEngine.timeout = 120;
		oAJAXEngine.hideFrameCallback = function () { /*_alert('oAJAXEngine.hideFrameCallback()');*/ };
		oAJAXEngine.showFrameCallback = function () { /*_alert('oAJAXEngine.showFrameCallback()');*/ };
		
		oAJAXEngine.createAJAXEngineCallback = function () { this.top = '120px'; /*_alert('oAJAXEngine.createAJAXEngineCallback()');*/ };
			
		oAJAXEngine.create();

		function windowOnLoadCallback() {
			initAJAXEngine(oAJAXEngine); // oAJAXEngine is the name of the default JavaScript variable that automatically contains a pointer to the default exAJAX<sup>(tm)</sup> Engine... You may create additional instances of the exAJAX<sup>(tm)</sup> Engine as desired however it is not necessary to create more than one instane for this object.
	//		_alert('windowOnLoadCallback() - This is the exAJAX<sup>(tm)</sup> Community Framework callback that tells you that the exAJAX<sup>(tm)</sup> Engine has been initialized and is ready to process commands.');
		}

		function windowOnUnloadCallback() {
	//		_alert('windowOnUnloadCallback()');
		}
				
		function windowOnReSizeCallback(_width, _height) {
	//		_alert('windowOnReSizeCallback(' + _width + ', ' + _height + ')');
		}
	
		function windowOnscrollCallback(top, left) {
			var bool_isDebugPanelRepositionable = false;
	//		_alert('windowOnscrollCallback(' + top + ', ' + left + ')' + ', bool_isDebugPanelRepositionable = [' + bool_isDebugPanelRepositionable + ']');
			return bool_isDebugPanelRepositionable;
		}
		
		function handleSampleAJAXCommand(qObj) {
			var nRecs = -1;
			var oParms = -1;
			var argsDict = DictObj.get$();
			var aDict = -1;
			var html = '';

			function searchForArgRecs(_ri, _dict, _rowCntName) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.trim().toUpperCase().indexOf('ARG') != -1) {
					argsDict.push(n.trim(), v);
				}
			};

			function searchForStatusRecs(_ri, _dict, _rowCntName) {
				if (aDict == -1) {
					aDict = DictObj.get$(_dict.asQueryString());
				}
			};
	_alert('qObj = [' + qObj + ']');
			var qStats = qObj.named('qDataNum');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}
			if (nRecs > 0) {
				var qData1 = qObj.named('qData1');
				if (!!qData1) {
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						qData1.iterateRecObjs(anyErrorRecords);

						if (!bool_isAnyErrorRecords) {
							argsDict.intoNamedArgs();

							qData1.iterateRecObjs(searchForStatusRecs);

							if (aDict != -1) {
								_alert('aDict = [' + aDict + ']');
							}
						} else {
							if (bool_isHTMLErrorRecords) {
								_alertHTMLError(s_explainError);
							} else {
								_alertError(s_explainError);
							}
						}
					}
				}
			}
			DictObj.remove$(argsDict.id);
		}
	// -->
	</script>
	
	<table width="100%" align="left" border="0">
		<tr>
			<td align="left" valign="middle">
				<button class="buttonMenuClass<cfif (Request.commonCode.isBrowserFF() OR Request.commonCode.isBrowserNS())>FF</cfif>" onclick="oAJAXEngine.doAJAX('sampleAJAXCommand', 'handleSampleAJAXCommand(' + oAJAXEngine.js_global_varName + ')', 'parm1', 'parm1-value', 'parm2', 'parm2-value', 'parm3', 'parm3-value', 'parm4', 'parm4-value'); return false;">Click to Test the exAJAX#cf_trademarkSymbol# Community Framework</button>
			</td>
			<td align="left" valign="top">
				<p align="justify" style="font-size: 10px">When you press the button to the left the exAJAX#cf_trademarkSymbol# Community Framework will engage and process the AJAX Command stream and then return a Query Object from the ColdFusion AJAX Server.  You will see a pop-up window with the title of "DEBUG" that shows a typical debugging display for the Query Objects that are returned from the exAJAX#cf_trademarkSymbol# Community Framework.</p>
				<p align="justify" style="font-size: 10px">The exAJAX#cf_trademarkSymbol# Community Framework is limited by the number of ColdFusion Query Objects that can be returned from the AJAX Server.  You may purchase a Runtime License for the exAJAX#cf_trademarkSymbol# Community Framework to remove this and other limitations.  Upgrade to the exAJAX#cf_trademarkSymbol# Enterprise Framework to achieve greater performance than is possible using the exAJAX#cf_trademarkSymbol# Community Framework.</p>
				<p align="justify" style="font-size: 10px">The Trial version of the exAJAX#cf_trademarkSymbol# Community Framework will time-out and cease to function when your trial period ends however you may simply purchase a Runtime License from us to unlock the full functionality of the exAJAX#cf_trademarkSymbol# Community Framework.</p>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2"><p align="justify" style="font-size: 10px"><a href="#_urlCommunityEditionLicenseAgreement#" target="_blank">exAJAX#cf_trademarkSymbol# Community Edition License Agreement</a></p></td>
		</tr>
	</table>

</cfoutput>
