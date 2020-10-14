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
		
		function handlePopulateDynamicNewsDataSet(qObj, nRecs, qStats, argsDict, qData1) {
			var nRecs = -1;
			var _argsDict = ezDictObj.get$();
			var _ID = '';
			var _STATUS = '';
		
			function searchForArgRecs(_ri, _dict) {
				var n = _dict.getValueFor('NAME');
				var v = _dict.getValueFor('VAL');
				if (n.ezTrim().toUpperCase().indexOf('ARG') != -1) {
					_argsDict.push(n.ezTrim(), v);
				}
			};
			
			function searchForContent(_ri, _dict) {
				var sID = _dict.getValueFor('ID');
				var sSTATUS = _dict.getValueFor('STATUS');

				if ( (!!sSTATUS) && (!!sID) ) {
					_STATUS = sSTATUS;
					_ID = sID;
				}
			};
			
			function handleSpecificContent() {
				var oDiv = _$('div_Flash5_DynamicNewsDemo_with_AJAX');
				if ( (!!oDiv) && (_STATUS.indexOf('Dataset has been created') > -1) ) {
					oDiv.innerHTML = getFlashContent('news-flash-headlines2', '/app/flash/news-flash-headlines2/news-flash-headlines.swf', 150, 600, '##ffffff', 'high');
				}
				var oDiv = _$('div_Flash5_DynamicNewsDemo_with_AJAX_desc');
				if (!!oDiv) {
					oDiv.innerHTML = '<p align="justify"><small>You should notice there is one main heading displayed which is <b>Cat-1</b>. Click on the <b>Cat-1</b> button to reveal the <b>SubCat-1</b> button. This would allow a fairly deep menu to be displayed dynamically - the menu could be composed of a number of main categories each of which could have many sub-categories with each sub-category having a link to a URL the end-user can click.<br><br>You should also notice the button you pressed was dynamically disabled while the AJAX Server Command was being executed by the Server.  As soon as the AJAX Server Command terminated the button was dynamically enabled and the Flash component was created with the dataset that was created using AJAX.<br><br>What you have just experienced was a Flash 5 component that performed a type of Flash Remoting using nothing more than HTTP.  HTTP might not be as efficient as Flash Remoting but back in the day when this particular Flash component was created there was no such thing as Flash Remoting so HTTP was the only method for getting data into a Flash 5 component.</small></p>';
				}
				var oBtn = _$('btn_populateDynamicNewsDataSet');
				if (!!oBtn) {
					oBtn.disabled = false;;
				}
			}
		
			if (argsDict != null) {
				argsDict.intoNamedArgs();
				qData1.iterateRecObjs(searchForContent);
				handleSpecificContent();
				ezDictObj.remove$(argsDict.id);
			} else {
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
								qData1.iterateRecObjs(searchForContent);
								_argsDict.intoNamedArgs();
								handleSpecificContent();
							} else {
								if (bool_isHTMLErrorRecords) {
									ezAlertHTMLError(s_explainError);
								} else {
									ezAlertError(s_explainError);
								}
							}
						}
					}
				}
				ezDictObj.remove$(_argsDict.id);
			}
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
			_html += '<div id="' + global_flashDivInFocus + '" style="border: solid thin silver; z-index: 32767;' + divStyles + '"><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=8,0,0,0" width="' + w + '" height="' + h + '" id="' + id + '" align="middle"><param name="allowScriptAccess" value="sameDomain" /><param name="movie" value="' + fName + '?nocache=' + ezUUID$() + '" /><param name="loop" value="false" /><param name="menu" value="false" /><param name="quality" value="' + _quality + '" /><param name="bgcolor" value="' + _bgcolor + '" /><embed src="' + fName + '?nocache=' + ezUUID$() + '" loop="false" menu="false" quality="' + _quality + '" bgcolor="' + _bgcolor + '" width="' + w + '" height="' + h + '" name="' + id + '" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object></div>';
			return _html;
		}
		
		function getTab1Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Site Background</p></td></tr><tr><td><p align="justify" style="font-size: medium;">This site displays some of the many Flash components Ray C. Horn has created over the years.</p><br></td></tr><tr><td><p align="justify" style="font-size: medium;">This site was architected to use a new product called "#ezAJAXLink#"; ezAJAX provides a standardized reusable AJAX Framework that is composed of more than 15000 lines of JavaScript and ColdFusion.</p><br></td></tr><tr><td><p align="justify" style="font-size: medium;">In addition to ezAJAX this site uses another product called "#ezClusterLink#"; ezCluster provides support for web server clustering that allows AJAX Server Commands to be spread-out among a number of separate web servers each of which has identical web content.  ezCluster make it possible for AJAX Web Apps to leverage the power of many web servers rather than a single web server.  ezCluster is built into ezAJAX Enterprise 1.0.</p><br></td></tr><tr><td><p align="justify" style="font-size: medium;">As you can see, Ray C Horn has done a lot of work to make this site happen; the ability to make this site happen with all of its subtle complexities must surely mean whatever work you may need done could also be done with just as much professionalism and dedication.</p><br></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTab2Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 Emailer Demo</p></td></tr><tr><td valign="top">' + getFlashContent('emailerForm', '/app/flash/emailerForm/emailerForm.swf', 400, 300, '##ffffff', 'high') + '</td><td valign="top"><small>This Flash 4 Demo is not functional at this time other than to serve as a sample of the work that was done way back whenever this particular Flash 4 component was functional.<br><br>This Flash 4 component could have been brought up to date and made functional however doing so would have required a complete redesign using the latest Flash 8 coding techniques that did not exist when this original Flash 4 component was created.<br><br>Additionally this Flash 4 component required an email server in order to function.</small></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTab2SubTab1Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 Menu Demo</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="600" height="350" src="/app/flash/myIssueTrack/issueTrackOpening.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"><iframe frameborder="0" scrolling="Auto" width="250" height="350" src="/app/flash/3.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTab2SubTab2Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 NavBar Demo</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="200" height="850" src="/app/flash/simpleNavBar/simpleNavBar.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top">This Flash 4 Demo was designed originally to serve as a Nav Bar for a web site that no longer exists.<br><br>The value of this Demo is to show how directions and information can be conveyed to an end-user as they are using the functions of the Flash component.<br><br>Keep in mind this was done originally with Flash 4.</td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTab2SubTab3Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 Project Plan Demo</p></td></tr><tr><td valign="top">This Flash 4 project Plan was originally designed to demonstrate how a set of images could be wrapped-up into a Flash component.<br><br>Flash provides a nice way to stream content in a manner that tends to reduce the amount of bandwidth that is used to display traditional images.</td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="900" height="700" src="/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-Plan.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTab2SubTab4Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 4 Project Plan Demo 2</p></td></tr><tr><td valign="top">Keep in mind this Flash 4 Demo was originally designed for a specific purpose that no longer exists.</td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="900" height="700" src="/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-PlanA.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTab3Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td align="center" bgcolor="silver"><p align="justify" style="font-size: medium;">Flash 5 Adverts Demo</p></td></tr><tr><td valign="top">' + getFlashContent('AdvertsClip1', '/app/flash/Adverts Movie/AdvertsClip1.swf', 468, 80, '##ffffff', 'high') + '</td></tr><tr><td valign="top"><small>This Flash 5 Demo is not functional at this time other than to serve as a sample of the work that was done way back whenever this particular Flash 5 component was functional.<br><br>This Flash 5 component could have been brought up to date and made to work with the Flash Media Server 2.<br><br>The Flash Media Server could have provided the ability to track stats on the Adverts that were displayed as well as those Adverts that were clicked.<br><br>Flash Media Server could have been also used to pick the next Advert to be shown.</small></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTab3SubTab5Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;"><NOBR>Flash 5 Dynamic News Demo</NOBR></p></td></tr><tr><td valign="top">' + getFlashContent('news-flash-headlines', '/app/flash/news-flash-headlines/news-flash-headlines.swf', 150, 600, '##ffffff', 'high') + '</td><td valign="top"><small>This Flash 5 component is completely dynamic.  It reads the data that is displayed using a technique that was used long before Flash Remoting ever existed.<br><br>This proves the fact that Flash 5 was able to be data-driven using nothing more than the HTTP protocol which was quite inefficient as compared with Flash Media Server 2, for instance.<br><br>As you can see this instance of this Demo shows nothing more than the current Month and Year with no other data.</small></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getTab3SubTab6Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;"><NOBR>Flash 5 Dynamic News Demo with AJAX</NOBR></p></td></tr><tr><td valign="top"><div id="div_Flash5_DynamicNewsDemo_with_AJAX"></div></td><td valign="top"><small>This Flash 5 component is completely dynamic however this time we shall populate a data set via an AJAX Server Command.<br><br>Click this button --> <button id="btn_populateDynamicNewsDataSet" class="buttonClass" onclick="this.disabled = true; ezAJAXEngine.$[0].doAJAX(\'populateDynamicNewsDataSet\', \'handlePopulateDynamicNewsDataSet\', \'method\', 1); return false;">[Populate Data Set]</button> to populate the dataset and trigger the Flash instance so it will appear with the data that was just created.<br><br>Once the data set has been created and the Flash component has been displayed this will prove it is possible to use AJAX with Flash to dynamically create data for a data-driven Flash component.<br><br>Also keep in mind this Demo will use DHTML to populate a &lt;DIV&gt;&lt;/DIV&gt; tag with a live Flash component.</small><br><br><div id="div_Flash5_DynamicNewsDemo_with_AJAX_desc" style="border: solid thin silver;">This block of text will be replaced dynamically AFTER you click that button.</div></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getTab4Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash Game Demo :: Asteroids</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/insaneroids/asteroids.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getTab4SubTab7Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash Game Demo :: Pacman</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/pacman/pacman.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getTab4SubTab8Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash Game Demo :: Road Safety</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/roadSafety/car_game.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTab4SubTab9Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash Game Demo :: Crusader</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/crusader/crusader.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTab4SubTab10Content() {
			var _html = '';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '')
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: medium;">Flash Game Demo :: Arrive Alive</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/arrive alive/big_day_out.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getTabbedContent() {
			var oTab = -1;
			var oTab1 = -1;
			var iTabs = [];
			var iSubTab = -1;
			var iContent = -1;
	
			oTabSystem1 = ezTabsObj.get$(-1, -1, -1, -1);
			
			oTabSystem1.onActivateTabsCallback = function(iTab) { var _id = this.contentsCollection[this.tabsDict.getValueFor(iTab) - 1]; var oDiv = _$(_id); if (!!oDiv) { var s = ''; var xFunc = -1; sFunc = 'getTab' + iTab + 'Content'; try { xFunc = eval(sFunc); s = xFunc(); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; if (s.length > 0) { oDiv.innerHTML = s; }; }; };
			oTabSystem1.onShowSubTabsCallback = function(iTab, oStyle, oParent, anchorPos, anchorPosL, anchorPosR){ var w = (anchorPosR.x - anchorPosL.x) + 20; oStyle.top = ezElementPositonY(oParent) - ((!ezAJAXEngine.browser_is_ie) ? -16 : 70); oStyle.left = ((!ezAJAXEngine.browser_is_ie) ? anchorPosL.x - 15 : ezElementPositonX(oParent)); oStyle.width = w + ((!ezAJAXEngine.browser_is_ie) ? 50 : 0); oStyle.zIndex = 1000; };
			oTabSystem1.onClickSubTabCallback = function(iSubTab, iTab){ iTab = (((typeof iTab) != 'undefined') ? parseInt(iTab.toString()) : 0); iSubTab = (((typeof iSubTab) != 'undefined') ? parseInt(iSubTab.toString()) : 0); var _id = this.contentsCollection[this.subTabsContentDict.getValueFor(iSubTab) - 1]; this.isSubTabClicked = true; var oDiv = _$(_id); if (!!oDiv) { s = ''; var xFunc = -1; sFunc = 'getTab' + iTab + 'SubTab' + iSubTab + 'Content'; try { xFunc = eval(sFunc); s = xFunc(); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; if (s.length > 0) { oDiv.innerHTML = s; }; }; };
			oTabSystem1.onHideSubTabsCallback = function(iTab) { };

			oTabSystem1.minSubTabWidth = 150;
			oTabSystem1.isSubTabsAbsolutePositioned = (!ezAJAXEngine.browser_is_ie);
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

			iTabs = oTabSystem1.addTab('Flash 5 Advertising Demo');
			oTab = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(oTab, '');
	
			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Flash 5 Dynamic News Demo</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Flash 5 Dynamic News Demo with AJAX</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iTabs = oTabSystem1.addTab('Flash Asteroids Game');
			oTab = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(oTab, '');

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Pacman Game</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Road Safety Game</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Crusader Game</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Arrive Alive Game</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			oTabSystem1.activateTab(oTab1);
			
			var oDiv = _$('TabSystem' + oTabSystem1.id);
			if (!!oDiv) {
				oDiv.style.backgroundColor = 'silver';
			}
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

