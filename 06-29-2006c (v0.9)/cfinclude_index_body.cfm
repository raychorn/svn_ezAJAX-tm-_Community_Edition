<cfoutput>
	<script language="JavaScript1.2" type="text/javascript">
	<!--
		oAJAXEngine.timeout = 120;
		oAJAXEngine.hideFrameCallback = function () { _alert('oAJAXEngine.hideFrameCallback()'); };
		oAJAXEngine.showFrameCallback = function () { _alert('oAJAXEngine.showFrameCallback()'); };
		
		oAJAXEngine.createAJAXEngineCallback = function () { this.top = '120px'; _alert('oAJAXEngine.createAJAXEngineCallback()'); };
			
		function windowOnLoadCallback() {
			initAJAXEngine(oAJAXEngine);
			_alert('windowOnLoadCallback()');
		}

		function windowOnUnloadCallback() {
			_alert('windowOnUnloadCallback()');
		}
				
		function windowOnReSizeCallback(_width, _height) {
			_alert('windowOnReSizeCallback(' + _width + ', ' + _height + ')');
		}
	
		function windowOnscrollCallback(top, left) {
			var bool_isDebugPanelRepositionable = false;
			_alert('windowOnscrollCallback(' + top + ', ' + left + ')' + ', bool_isDebugPanelRepositionable = [' + bool_isDebugPanelRepositionable + ']');
			return bool_isDebugPanelRepositionable;
		}
	// -->
	</script>

</cfoutput>
