<cfoutput>
	<cfscript>
		Randomize(Left('#GetTickCount()#', 10), 'SHA1PRNG');
		bool_useAbsoluteServerBusyPositioning = false; // version 0.93 is now able to handle non-absolute positioning for the activity indicator...
	</cfscript>

	<cfsavecontent variable="ezClusterLink"><cfoutput>ezCluster&##8482</cfoutput></cfsavecontent>

	<cfsavecontent variable="ezAJAXLink"><cfoutput>ezAJAX&##8482</cfoutput></cfsavecontent>

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
		
		var global_flashDivInFocus = '';
		
		function getFlashContent(id, fName, w, h, _bgcolor, _quality, divStyles) {
			var _html = '';
			id = (((typeof id) == const_string_symbol) ? id : 'undefined_' + ezUUID$());
			fName = (((typeof fName) == const_string_symbol) ? fName : 'undefined_' + ezUUID$());
			w = (((typeof w) == const_number_symbol) ? w : parseInt(w.toString()));
			h = (((typeof h) == const_number_symbol) ? h : parseInt(h.toString()));
			_bgcolor = (((typeof _bgcolor) == const_string_symbol) ? _bgcolor : '##ffffff');
			_quality = (((typeof _quality) == const_string_symbol) ? _quality : 'medium');
			divStyles = (((typeof divStyles) == const_string_symbol) ? ' ' + divStyles : '');
			global_flashDivInFocus = 'div_flashContent_' + id;
			_html += '<div id="' + global_flashDivInFocus + '" style="z-index: 32767;' + divStyles + '"><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=8,0,0,0" width="' + w + '" height="' + h + '" id="' + id + '" align="middle"><param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="' + fName + '?nocache=' + ezUUID$() + '" /><param name="loop" value="false" /><param name="menu" value="false" /><param name="quality" value="' + _quality + '" /><param name="bgcolor" value="' + _bgcolor + '" /><embed src="' + fName + '?nocache=' + ezUUID$() + '" loop="false" menu="false" quality="' + _quality + '" bgcolor="' + _bgcolor + '" width="' + w + '" height="' + h + '" name="' + id + '" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object></div>';
			return _html;
		}
		
		function getTab1Content() {
			var _html = '';
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Site Background</p></td></tr><tr><td><p align="justify" style="font-size: medium;">This site displays some of the many Flash components Ray C. Horn has created over the years.</p><br></td></tr><tr><td><p align="justify" style="font-size: medium;">This site was architected to use a new product called "#ezAJAXLink#"; ezAJAX provides a standardized reusable AJAX Framework that is composed of more than 15000 lines of JavaScript and ColdFusion.</p><br></td></tr><tr><td><p align="justify" style="font-size: medium;">In addition to ezAJAX this site uses another product called "#ezClusterLink#"; ezCluster provides support for web server clustering that allows AJAX Server Commands to be spread-out among a number of separate web servers each of which has identical web content.  ezCluster make it possible for AJAX Web Apps to leverage the power of many web servers rather than a single web server.  ezCluster is built into ezAJAX Enterprise 1.0.</p><br></td></tr><tr><td><p align="justify" style="font-size: medium;">As you can see, Ray C Horn has done a lot of work to make this site happen; the ability to make this site happen with all of its subtle complexities must surely mean whatever work you may need done could also be done with just as much professionalism and dedication.</p><br></td></tr></table>';
			return _html;
		}

		function getTab2Content() {
			var _html = '';
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 Emailer Demo</p></td></tr><tr><td valign="top">' + getFlashContent('emailerForm', '/app/flash/emailerForm/emailerForm.swf', 400, 300, '##ffffff', 'high') + '</td><td valign="top"><small>This Flash 4 Demo is not functional at this time other than to serve as a sample of the work that was done way back whenever this particular Flash 4 component was functional.<br><br>This Flash 4 component could have been brought up to date and made functional however doing so would have required a complete redesign using the latest Flash 8 coding techniques that did not exist when this original Flash 4 component was created.<br><br>Additionally this Flash 4 component required an email server in order to function.</small></td></tr></table>';
			return _html;
		}

		function getTab1SubTab1Content() {
			var _html = '';
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 Menu Demo</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="600" height="350" src="/app/flash/myIssueTrack/issueTrackOpening.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"><iframe frameborder="0" scrolling="Auto" width="250" height="350" src="/app/flash/3.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td></tr></table>';
			return _html;
		}

		function getTab1SubTab2Content() {
			var _html = '';
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 NavBar Demo</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="200" height="850" src="/app/flash/simpleNavBar/simpleNavBar.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top">This Flash 4 Demo was designed originally to serve as a Nav Bar for a web site that no longer exists.<br><br>The value of this Demo is to show how directions and information can be conveyed to an end-user as they are using the functions of the Flash component.<br><br>Keep in mind this was done originally with Flash 4.</td></tr></table>';
			return _html;
		}

		function getTab1SubTab3Content() {
			var _html = '';
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 Project Plan Demo</p></td></tr><tr><td valign="top">This Flash 4 project Plan was originally designed to demonstrate how a set of images could be wrapped-up into a Flash component.<br><br>Flash provides a nice way to stream content in a manner that tends to reduce the amount of bandwidth that is used to display traditional images.</td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="900" height="700" src="/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-Plan.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td></tr></table>';
			return _html;
		}

		function getTab1SubTab4Content() {
			var _html = '';
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 Project Plan Demo 2</p></td></tr><tr><td valign="top">This Flash 4 project Plan was originally designed to demonstrate how a set of images could be wrapped-up into a Flash component.<br><br>Flash provides a nice way to stream content in a manner that tends to reduce the amount of bandwidth that is used to display traditional images.</td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="900" height="700" src="/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-PlanA.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td></tr></table>';
			return _html;
		}

		function getTabbedContent() {
			var oTab = -1;
			var oTab1 = -1;
			var iTabs = [];
			var iSubTab = -1;
			var iContent = -1;
	
			oTabSystem1 = ezTabsObj.get$(-1, -1, 500, 100);
			
			oTabSystem1.onActivateTabsCallback = function(iTab) { var _id = this.contentsCollection[this.tabsDict.getValueFor(iTab) - 1]; var oDiv = _$(_id); if (!!oDiv) { var s = ''; switch (iTab) { case 2: s = getTab2Content(); break; }; if (s.length > 0) { oDiv.innerHTML = s; }; }; };
			oTabSystem1.onShowSubTabsCallback = function(iTab, oStyle, oParent, anchorPos, anchorPosL, anchorPosR){ var w = (anchorPosR.x - anchorPosL.x) + 20; oStyle.top = ezElementPositonY(oParent) - 70; oStyle.left = ezElementPositonX(oParent); oStyle.width = w; oStyle.zIndex = 1000; };
			oTabSystem1.onClickSubTabCallback = function(iSubTab, iTab){ var _id = this.contentsCollection[this.subTabsContentDict.getValueFor(iSubTab) - 1]; this.isSubTabClicked = true; var oDiv = _$(_id); if (!!oDiv) { var s = ''; switch (iSubTab) { case 1: s = getTab1SubTab1Content(); break; case 2: s = getTab1SubTab2Content(); break; case 3: s = getTab1SubTab3Content(); break; case 4: s = getTab1SubTab4Content(); break; }; if (s.length > 0) { oDiv.innerHTML = s; }; }; };
			oTabSystem1.onHideSubTabsCallback = function(iTab) { };

			oTabSystem1.minSubTabWidth = 150;
	//		oTabSystem1.isSubTabsAbsolutePositioned = true;
	//		oTabSystem1.isDebugMode = true;
	//		oTabSystem1.debugHeight(200);

			iTabs = oTabSystem1.addTab('Site Background');
			oTab1 = oTab = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(oTab, getTab1Content());
	
			iTabs = oTabSystem1.addTab('Flash 4 Emailer Demo');
			oTab = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(oTab, '');
	
			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Flash 4 Menu Demo</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Flash 4 NavBar Demo</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Flash 4 Project Plan Demo</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Flash 4 Project Plan Demo 2</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

	//		iTabs = oTabSystem1.addTab('Flash 4 Menu Demo');
	//		iContent = oTabSystem1.addContentForTab(iTabs.pop(), '');
	
	//		iTabs = oTabSystem1.addTab('Flash 4 NavBar Demo');
	//		iContent = oTabSystem1.addContentForTab(iTabs.pop(), '');
	
	//		ezAlert(oTabSystem1);
			oTabSystem1.activateTab(oTab1);
		}
		</cfoutput>
	</cfsavecontent>
	
	<cfsavecontent variable="jsCodeStore1">
		<cfoutput>
		</cfoutput>
	</cfsavecontent>
	
	<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(jsCodeStore0 & jsCodeStore1)#</script>
	
	<cfsavecontent variable="_poweredHTML">
		<cfoutput>
			<p align="justify" class="normalPrompt">This Site is powered by #ezClusterLink# Patents Pending and <a href="http://www.ez-ajax.com" target="_blank">#ezAJAXLink# Enterprise Edition v1.0</a>.&nbsp;
			#ezClusterLink# makes 2 or more web servers into a single coherent web server using low-cost techniques.&nbsp;
			#ezAJAXLink# shortens time to market for AJAX Apps.&nbsp;&nbsp;Let us do all the work for you.&nbsp;&nbsp;<cfif (NOT Request.commonCode.ezIsBrowserIE())><b><i>This site is best when viewed using IE 7.x (1024x768) resolution.</i></b></cfif>
			&nbsp;
			The contents of this Site are protected under U.S. and International Copyright Laws. &copy 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.</p>
		</cfoutput>
	</cfsavecontent>
	
	<div id="table_outerContentWrapper" style="position: absolute; width: 900px; top: 0px; left: 0px; background-color: white;">
		<table width="900" align="center" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td>
					<div id="TabSystemContainer" class="TabSystem1"<cfif (NOT bool_isServerProduction)> style="position: absolute; top: 80px; left: 0px;"</cfif>></div>
				</td>
			</tr>
			<cfif 0>
				<tr>
					<td valign="top" align="left">
						<cfinclude template="_index.html">
					</td>
				</tr>
			</cfif>
			<tr>
				<td valign="top" align="left">
					<br>
					#_poweredHTML#
				</td>
			</tr>
		</table>
	</div>
	
	<script language="JavaScript1.2" type="text/javascript">
		getTabbedContent();
	</script>
</cfoutput>

