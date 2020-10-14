<cfoutput>
	<script language="JavaScript1.2" type="text/javascript">
	<!--
		oAJAXEngine.timeout = 120;
		oAJAXEngine.hideFrameCallback = function () { };
		oAJAXEngine.showFrameCallback = function () { };
		
		oAJAXEngine.createAJAXEngineCallback = function () { this.top = '400px'; };
			
		oAJAXEngine.create();

		function ezWindowOnLoadCallback() {
			initAJAXEngine(oAJAXEngine);
		}

		function ezWindowOnUnloadCallback() {
		}
				
		function ezWindowOnReSizeCallback(_width, _height) {
		}
	
		function ezWindowOnscrollCallback(top, left) {
			var bool_isDebugPanelRepositionable = false;
			return bool_isDebugPanelRepositionable;
		}
		
		function simplerHandleSampleAJAXCommand(qObj, nRecs, qStats, argsDict, qData1) {
			var aDict = -1;
			
			function searchForStatusRecs(_ri, _dict, _rowCntName) {
				if (aDict == -1) {
					aDict = ezDictObj.get$(_dict.asQueryString()); // This is the easy method for making a copy of a Dictionary Object instance.
				}
			};

			nRecs = ((nRecs != null) ? nRecs : -1);
			ezAlert('simplerHandleSampleAJAXCommand :: nRecs = [' + nRecs + ']');

			if (!!qStats) {
				ezAlert('simplerHandleSampleAJAXCommand :: qStats = [' + qStats + ']');

				if (!!argsDict) {
					ezAlert('simplerHandleSampleAJAXCommand :: argsDict = [' + argsDict + ']');

					if (!!qData1) {
						qData1.iterateRecObjs(searchForStatusRecs);
						ezAlert('simplerHandleSampleAJAXCommand :: qData1 = [' + qData1 + ']');
					} else {
						ezAlertError('Error - qData1 has an invalid value.');
					}
		
					ezDictObj.remove$(argsDict.id);
				} else {
					ezAlertError('Error - argsDict has an invalid value.');
				}
			} else {
				ezAlertError('Error - qStats has an invalid value.');
			}
		}
	// -->
	</script>
	
</cfoutput>
