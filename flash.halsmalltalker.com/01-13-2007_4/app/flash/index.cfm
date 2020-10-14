<cfoutput>
	<cfscript>
		Randomize(Left('#GetTickCount()#', 10), 'SHA1PRNG');
		bool_useAbsoluteServerBusyPositioning = false; // version 0.93 is now able to handle non-absolute positioning for the activity indicator...
	</cfscript>

	<cfsavecontent variable="ezClusterLink"><cfoutput>ezCluster&##8482</cfoutput></cfsavecontent>

	<cfsavecontent variable="ezAJAXLink"><cfoutput>ezAJAX&##8482</cfoutput></cfsavecontent>

	<cfsavecontent variable="_poweredHTML"><cfoutput><p align="justify" class="normalPrompt"><small>This Site is powered by #ezClusterLink# Patents Pending and <a href="http://www.ez-ajax.com" target="_blank">#ezAJAXLink# Enterprise Edition v1.0</a>.&nbsp;#ezClusterLink# makes 2 or more web servers into a single coherent web server using low-cost techniques.&nbsp;#ezAJAXLink# shortens time to market for AJAX Apps.&nbsp;&nbsp;Let us do all the work for you.&nbsp;&nbsp;<cfif (NOT Request.commonCode.ezIsBrowserIE())><b><i>This site is best when viewed using IE 7.x (1024x768) resolution.</i></b></cfif>&nbsp;The contents of this Site are protected under U.S. and International Copyright Laws. &copy 1990-#Year(Now())# Hierarchical Applications Limited, All Rights Reserved.</small></p></cfoutput></cfsavecontent>

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
						oO.style.top = (oPos.y + parseInt(this.ezAJAX_serverBusy_height.toString())) + 80 + 'px'; 
						oO.style.left = (oPos.x - (parseInt(this.ezAJAX_serverBusy_width.toString()) / 4)) + 75 + 'px'; 
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
		oAJAXEngine.ezAJAX_serverBusy_bgColor = '##D8E2F5';
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
				var oDiv2 = _$('div_Flash5_DynamicNewsDemo_with_AJAX2');
				if ( (!!oDiv) && (_STATUS.indexOf('Dataset has been created') > -1) ) {
					oDiv.innerHTML = getFlashContent('news-flash-headlines2', '/app/flash/news-flash-headlines2/news-flash-headlines.swf', 150, 600, '##ffffff', 'high');

					var oDiv = _$('div_Flash5_DynamicNewsDemo_with_AJAX_desc');
					if (!!oDiv) {
						oDiv.innerHTML = '<p align="justify"><small>You should notice there is one main heading displayed which is <b>Cat-1</b>. Click on the <b>Cat-1</b> button to reveal the <b>SubCat-1</b> button. This would allow a fairly deep menu to be displayed dynamically - the menu could be composed of a number of main categories each of which could have many sub-categories with each sub-category having a link to a URL the end-user can click.<br><br>You should also notice the button you pressed was dynamically disabled while the AJAX Server Command was being executed by the Server.  As soon as the AJAX Server Command terminated the button was dynamically enabled and the Flash component was created with the dataset that was created using AJAX.<br><br>What you have just experienced was a Flash 5 component that performed a type of Flash Remoting using nothing more than HTTP.  HTTP might not be as efficient as Flash Remoting but back in the day when this particular Flash component was created there was no such thing as Flash Remoting so HTTP was the only method for getting data into a Flash 5 component.</small></p>';
					}
					var oBtn = _$('btn_populateDynamicNewsDataSet');
					if (!!oBtn) {
						oBtn.disabled = false;;
					}
				} else if ( (!!oDiv2) && (_STATUS.indexOf('Dataset has been created') > -1) ) {
					oDiv2.innerHTML = getFlashContent('news-flash-headlines3', '/app/flash/news-flash-headlines3/news-flash-headlines.swf', 150, 600, '##ffffff', 'high');
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
		
		function getContentForSiteBackground() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Site Background</p></td></tr><tr><td><p align="justify" style="font-size: ' + bodyFontSize + ';">This site displays some of the many Flash components Ray C. Horn has created over the years.<br><br>This site was architected to use a new product called "#ezAJAXLink#"; ezAJAX provides a standardized reusable AJAX Framework that is composed of more than 15000 lines of JavaScript and ColdFusion.<br><br>In addition to ezAJAX this site uses another product called "#ezClusterLink#"; ezCluster provides support for web server clustering that allows AJAX Server Commands to be spread-out among a number of separate web servers each of which has identical web content.  ezCluster make it possible for AJAX Web Apps to leverage the power of many web servers rather than a single web server.  ezCluster is built into ezAJAX Enterprise 1.0.<br><br>As you can see, Ray C Horn has done a lot of work to make this site happen; the ability to make this site happen with all of its subtle complexities must surely mean whatever work you may need done could also be done with just as much professionalism and dedication.<br><br>As you look at the various Flash components hat have been posted to this site keep in mind the fact that the best Flash components will leave you with the feeling that they may not have been coded using Flash at-all.<br><br>Over the years Flash Development has eveolved from very simplistic "animations" that took a lot of time to create into more complex components that can be easily programmed using far less time, in most cases.</p><br></td></tr><tr><td>#_poweredHTML#</td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getContentForFlash4EmailerDemo() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash 4 Emailer Demo</p></td></tr><tr><td valign="top">' + getFlashContent('emailerForm', '/app/flash/emailerForm/emailerForm.swf', 400, 300, '##ffffff', 'high') + '</td><td valign="top"><span style="font-size: ' + bodyFontSize + ';">This Flash 4 Demo is not functional at this time other than to serve as a sample of the work that was done way back whenever this particular Flash 4 component was functional.<br><br>This Flash 4 component could have been brought up to date and made functional however doing so would have required a complete redesign using the latest Flash 8 coding techniques that did not exist when this original Flash 4 component was created.<br><br>Additionally this Flash 4 component required an email server in order to function.</span></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getContentForFlash4MenuDemo() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash 4 Menu Demo</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="600" height="350" src="/app/flash/myIssueTrack/issueTrackOpening.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"><iframe frameborder="0" scrolling="Auto" width="250" height="350" src="/app/flash/3.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getContentForFlash4NavBarDemo() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash 4 NavBar Demo</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="200" height="850" src="/app/flash/simpleNavBar/simpleNavBar.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"><span style="font-size: ' + bodyFontSize + ';">This Flash 4 Demo was designed originally to serve as a Nav Bar for a web site that no longer exists.<br><br>The value of this Demo is to show how directions and information can be conveyed to an end-user as they are using the functions of the Flash component.<br><br>Keep in mind this was done originally with Flash 4.</span></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getContentForFlash4ProjectPlanDemo() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash 4 Project Plan Demo</p></td></tr><tr><td valign="top">This Flash 4 project Plan was originally designed to demonstrate how a set of images could be wrapped-up into a Flash component.<br><br>Flash provides a nice way to stream content in a manner that tends to reduce the amount of bandwidth that is used to display traditional images.</td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="900" height="700" src="/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-Plan.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getContentForFlash4ProjectPlanDemo2() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash 4 Project Plan Demo 2</p></td></tr><tr><td valign="top">Keep in mind this Flash 4 Demo was originally designed for a specific purpose that no longer exists.</td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="900" height="700" src="/app/flash/IssueTrack-Project-Plan/IssueTrack-Project-PlanA.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getContentForFlash5DemosAJAX() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td align="center" bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash 5 Adverts Demo</p></td></tr><tr><td valign="top">' + getFlashContent('AdvertsClip1', '/app/flash/Adverts Movie/AdvertsClip1.swf', 468, 80, '##ffffff', 'high') + '</td></tr><tr><td valign="top"><span style="font-size: ' + bodyFontSize + ';">This Flash 5 Demo is not functional at this time other than to serve as a sample of the work that was done way back whenever this particular Flash 5 component was functional.<br><br>This Flash 5 component could have been brought up to date and made to work with the Flash Media Server 2.<br><br>The Flash Media Server could have provided the ability to track stats on the Adverts that were displayed as well as those Adverts that were clicked.<br><br>Flash Media Server could have been also used to pick the next Advert to be shown.</span></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getContentForFlash5DynamicNewsDemo() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver" colspan="2"><p align="justify" style="font-size: ' + headerFontSize + ';"><NOBR>Flash 5 Dynamic News Demo</NOBR></p></td></tr><tr><td valign="top">' + getFlashContent('news-flash-headlines', '/app/flash/news-flash-headlines/news-flash-headlines.swf', 150, 600, '##ffffff', 'high') + '</td><td valign="top"><span style="font-size: ' + bodyFontSize + ';">This Flash 5 component is completely dynamic.  It reads the data that is displayed using a technique that was used long before Flash Remoting ever existed.<br><br>This proves the fact that Flash 5 was able to be data-driven using nothing more than the HTTP protocol which was quite inefficient as compared with Flash Media Server 2, for instance.<br><br>As you can see this instance of this Demo shows nothing more than the current Month and Year with no other data.</span></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getContentForFlash5DynamicNewsDemoWithAJAX() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver" colspan="2"><p align="justify" style="font-size: ' + headerFontSize + ';"><NOBR>Flash 5 Dynamic News Demo with AJAX</NOBR></p></td></tr><tr><td valign="top"><div id="div_Flash5_DynamicNewsDemo_with_AJAX"></div></td><td valign="top"><span style="font-size: ' + bodyFontSize + ';">This Flash 5 component is completely dynamic however this time we shall populate a data set via an AJAX Server Command.<br><br>Click this button --> <button id="btn_populateDynamicNewsDataSet" class="buttonClass" style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="this.disabled = true; ezAJAXEngine.$[0].doAJAX(\'populateDynamicNewsDataSet\', \'handlePopulateDynamicNewsDataSet\', \'method\', 1); return false;">[Populate Data Set]</button> to populate the dataset and trigger the Flash instance so it will appear with the data that was just created.<br><br>Once the data set has been created and the Flash component has been displayed this will prove it is possible to use AJAX with Flash to dynamically create data for a data-driven Flash component.<br><br>Also keep in mind this Demo will use DHTML to populate a &lt;DIV&gt;&lt;/DIV&gt; tag with a live Flash component.</span><br><br><div id="div_Flash5_DynamicNewsDemo_with_AJAX_desc" style="border: solid thin silver; font-size: ' + bodyFontSize + '">This block of text will be replaced dynamically AFTER you click that button.</div></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function handle_onClick_buildFlashAJAXData2(btnObj) {
			var ar = btnObj.id.split('_');
			var verb = ar[ar.length - 1];
			var row = ar[ar.length - 3];
			var col = ar[ar.length - 2];
			switch (verb) {
				case 'Remove':
					if ((typeof row) != const_number_symbol) {
						row = col;
					}
					ezAJAXEngine.$[0].doAJAX('removeDynamicNewsDataSet2', 'handleAddDynamicNewsDataSet2', 'row', row);
					break;
				case 'Add':
					var oInputCat = _$('input_FlashAJAXData2_CAT_' + row + '_1')
					var oInputSubCat = _$('input_FlashAJAXData2_SUBCAT_' + row + '_2')
					var oInputUrl = _$('input_FlashAJAXData2_URL_' + row + '_3')
					if ( (!!oInputCat) && (!!oInputSubCat) && (!!oInputUrl) ) {
						ezAJAXEngine.$[0].doAJAX('addDynamicNewsDataSet2', 'handleAddDynamicNewsDataSet2', 'row', row, 'col', col, 'category', oInputCat.value, 'subcat', oInputSubCat.value, 'url', oInputUrl.value);
					}
					break;
				case 'Submit':
					btnObj.disabled = true;
					ezAJAXEngine.$[0].doAJAX('flashDynamicNewsDataSet2', 'handlePopulateDynamicNewsDataSet');
					break;
			}
		}

		function handle_onChange_FlashAJAXData2(oInput) {
			var ar = oInput.id.split('_');
			var colName = ar[ar.length - 3];
			var row = ar[ar.length - 2];
			var col = ar[ar.length - 1];
			try { ezAJAXEngine.$[0].doAJAX('updateDynamicNewsDataSet2', 'handleAddDynamicNewsDataSet2', 'row', row, 'col', col, 'colName', colName, 'dataValue', oInput.value); } 
				catch (e) { ezAlertError('row = [' + row + ']' + ', col = [' + col + ']' + ', colName = [' + colName + ']' + ', dataValue = [' + oInput.value + ']' + '\n' + ezErrorExplainer(e)); };
		}
		
		function defaultDynamicNewsDataSet2() {
			var _html = '';
			_html += '<tr>';
			_html += '<td><button id="btn_FlashAJAXData2_1_1_Remove" class="buttonClass" title="Click this button to Remove a row from this table." style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="handle_onClick_buildFlashAJAXData2(this); return false;">[-]</button>&nbsp;<button id="btn_FlashAJAXData2_1_1_Add" class="buttonClass" title="Click this button to Add a row to this table." style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="handle_onClick_buildFlashAJAXData2(this); return false;">[+]</button></td>';
			_html += '<td><input id="input_FlashAJAXData2_CAT_1_1" class="textClass" size="12" maxlength="16" title="Enter the Category here - The Category is the main heading for the group of SubCategories; you may think of the Category as if it were the Main Menu item and the SubCategory as if it were the SubMenu item."></td>';
			_html += '<td><input id="input_FlashAJAXData2_SUBCAT_1_2" class="textClass" size="12" maxlength="16" title="Enter the SubCategory here - The SubCategory is the heading for the URL; you may think of the SubCategory as if it were the SubMenu item that falls under each Category which is the Main Menu item."></td>';
			_html += '<td><input id="input_FlashAJAXData2_URL_1_3" class="textClass" size="12" maxlength="16" title="Enter the URL here - This URL can be any valid Internet URL."></td>';
			_html += '</tr>';
			return _html;
		}
				
		function handleAddDynamicNewsDataSet2(qObj, nRecs, qStats, argsDict, qData1) {
			var i = -1;
			var _ID = '';
			var nRecs = -1;
			var _STATUS = '';
			var _argsDict = ezDictObj.get$();
		
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
			
			function handleSpecificContent(n, qData) {
				var _html = '';
				var numRecs = 0;
				var html = '';

				function searchForDataRecs(_ri, _dict) {
					var sID = _dict.getValueFor('ID');
					var sURL = _dict.getValueFor('URL');
					var sCAT = _dict.getValueFor('CAT');
					var sSUBCAT = _dict.getValueFor('SUBCAT');

					if ( (!!sID) && (!!sURL) && (!!sCAT) && (!!sSUBCAT) ) {
						if ( (sID.length > 0) && (sCAT.length > 0) && (sSUBCAT.length > 0) && (sURL.length > 0) ) {
							var ar = sCAT.split('@');
							sCAT = ar[ar.length - 1];
							_html += '<tr>';
							_html += '<td><button id="btn_FlashAJAXData2_' + sID + '_Remove" class="buttonClass" title="Click this button to Remove a row from this table." style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="handle_onClick_buildFlashAJAXData2(this); return false;">[-]</button>&nbsp;<button id="btn_FlashAJAXData2_' + sID + '_Add" class="buttonClass" title="Click this button to Add a row to this table." style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="handle_onClick_buildFlashAJAXData2(this); return false;">[+]</button></td>';
							_html += '<td><input id="input_FlashAJAXData2_CAT_' + sID + '_1" class="textClass" size="12" maxlength="16" title="Enter the Category here - The Category is the main heading for the group of SubCategories; you may think of the Category as if it were the Main Menu item and the SubCategory as if it were the SubMenu item." value="' + sCAT + '" onchange="handle_onChange_FlashAJAXData2(this);"></td>';
							_html += '<td><input id="input_FlashAJAXData2_SUBCAT_' + sID + '_2" class="textClass" size="12" maxlength="16" title="Enter the SubCategory here - The SubCategory is the heading for the URL; you may think of the SubCategory as if it were the SubMenu item that falls under each Category which is the Main Menu item." value="' + sSUBCAT + '" onchange="handle_onChange_FlashAJAXData2(this);"></td>';
							_html += '<td><input id="input_FlashAJAXData2_URL_' + sID + '_3" class="textClass" size="12" maxlength="16" title="Enter the URL here - This URL can be any valid Internet URL." value="' + sURL + '" onchange="handle_onChange_FlashAJAXData2(this);"></td>';
							_html += '</tr>';
							numRecs++;
						}
					}
				};

				var oDiv = _$('divData_Flash5_DynamicNewsDemo_with_AJAX2');
				if ( (!!oDiv) && (!!qData) && (n > 1) && (qData.recordCount() > 0) ) {
					html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
					html += '<tr bgcolor="silver">';
					html += '<td align="center"><small>Actions</small></td>';
					html += '<td align="center"><small>Category</small></td>';
					html += '<td align="center"><small>Sub-Category</small></td>';
					html += '<td align="center"><small>URL</small></td>';
					html += '</tr>';
					qData.iterateRecObjs(searchForDataRecs);
					_html += defaultDynamicNewsDataSet2();
					_html = html + _html + '</table>';
					oDiv.innerHTML = _html;
					var div = _$('div_Flash5_DynamicNewsDemo_with_AJAX2');
					if (!!div) {
						div.disabled = false;
					}
		//			alert(_STATUS);
				}
			};
		
			var qStats = qObj.named('qStats');
			if (!!qStats) {
				nRecs = qStats.dataRec[1];
			}

			if (argsDict != null) {
				argsDict.intoNamedArgs();
				qData1.iterateRecObjs(searchForContent);
				var qData2 = qObj.named('qData' + nRecs);
				handleSpecificContent(nRecs, qData2);
				ezDictObj.remove$(argsDict.id);
			} else {
				if (nRecs > 0) {
					var qData1 = -1;
					oParms = qObj.named('qParms');
					if (!!oParms) {
						oParms.iterateRecObjs(searchForArgRecs);
						_argsDict.intoNamedArgs();
					}
					for (i = 1; i <= nRecs; i++) {
						qData1 = qObj.named('qData' + i);
						if (!!qData1) {
							qData1.iterateRecObjs(anyErrorRecords);
		
							if (!bool_isAnyErrorRecords) {
								qData1.iterateRecObjs(searchForContent);
								handleSpecificContent(nRecs, ((i == 2) ? qData1 : null));
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

		function buildFlashAJAXData2() {
			var divName = 'div_Flash5_DynamicNewsDemo_with_AJAX2';
			var _html = '';
			_html += ezBeginTable('<NOBR>Data Builder</NOBR>', '&bool=' + 'includeDismissButton=true'.ezURLEncode() + '&div=' + divName.ezURLEncode() + '&table=' + 'border="1"'.ezURLEncode() + '&tr=' + 'bgcolor="cyan"'.ezURLEncode() + '&td=' + 'align="center" colspan="4"'.ezURLEncode() + '&span=' + 'class="boldPromptTextClass"'.ezURLEncode());
			_html += '<td><div id="divData_Flash5_DynamicNewsDemo_with_AJAX2">';
			_html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
			_html += '<tr bgcolor="silver">';
			_html += '<td align="center"><small>Actions</small></td>';
			_html += '<td align="center"><small>Category</small></td>';
			_html += '<td align="center"><small>Sub-Category</small></td>';
			_html += '<td align="center"><small>URL</small></td>';
			_html += '</tr>';
			_html += defaultDynamicNewsDataSet2();
			_html += '</table>';
			_html += '</div></td>';
			_html += '<tr>';
			_html += '</tr>';
			_html += ezEndTable();
			_html += '<br><button id="btn_FlashAJAXData2_Submit" class="buttonClass" title="Click this button to submit this table to the Flash component." style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="handle_onClick_buildFlashAJAXData2(this); return false;">[Submit]</button>';
			_html += '<br><br><small>After you click the Submit button the dataset you have created will be sent back to your client from the Session, your Session, on the Server into a Flash component via AJAX and DHTML.<br><br>The Flash component with the data will be placed into this area and replace the data entry grid.</small>';
			var oDiv = _$(divName);
			if (!!oDiv) {
				oDiv.innerHTML = _html;
				oDiv.style.display = const_inline_style;
				var oInput = _$('input_FlashAJAXData2_1_1');
				if (!!oInput) {
					oInput.focus();
				}
				var oBtn = _$('btn_buildDynamicNewsDataSet2');
				if (!!oBtn) {
					oBtn.disabled = false;
				}
				oDiv.disabled = true;
				ezAJAXEngine.$[0].doAJAX('fetchDynamicNewsDataSet2', 'handleAddDynamicNewsDataSet2');
			}
		}
		
		function getContentForFlash5DynamicNewsDemoWithInteractiveAJAX() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver" colspan="2"><p align="justify" style="font-size: ' + headerFontSize + ';"><NOBR>Flash 5 Dynamic News Demo with Interactive AJAX</NOBR></p></td></tr><tr><td valign="top"><div id="div_Flash5_DynamicNewsDemo_with_AJAX2"></div></td><td valign="top"><span style="font-size: ' + bodyFontSize + ';">This time we will use AJAX to interactively create the dataset that will be transmitted to the Flash 5 component.  We have already seen how a Flash 5 component can grab data from a web server but demo shows how AJAX can be used to create the dataset which will then be fetched by the Flash 5 component.<br><br>Click this button --> <button id="btn_buildDynamicNewsDataSet2" class="buttonClass" style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="this.disabled = true; buildFlashAJAXData2(); return false;">[Build Data Set]</button> to begin the process of interactively building the dataset using AJAX.<br><br>Once the data set has been created and the Flash component has been displayed this will prove it is possible to use AJAX with Flash to dynamically create data for a data-driven Flash component.  The data you will build using AJAX will be stored in the Session, your Session, on the Server.  By using the Session as a temporary storage container we achieve a level of physical security that keeps other users who may be using this same Demo at the same time you are from being able to access your data.<br><br>Also keep in mind this Demo will use DHTML to populate a &lt;DIV&gt;&lt;/DIV&gt; tag with a live Flash component.</span><br><br><div id="div_Flash5_DynamicNewsDemo_with_AJAX_desc" style="border: solid thin silver; font-size: ' + bodyFontSize + '">This block of text will be replaced dynamically AFTER you click that button.</div></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getContentForFlashAsteroidsGame() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash Game Demo :: Asteroids</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/insaneroids/asteroids.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getContentForPacmanGame() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash Game Demo :: Pacman</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/pacman/pacman.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getContentForRoadSafetyGame() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash Game Demo :: Road Safety</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/roadSafety/car_game.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getContentForCrusaderGame() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash Game Demo :: Crusader</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/crusader/crusader.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function getContentForArriveAliveGame() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash Game Demo :: Arrive Alive</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="800" height="500" src="/app/flash/arrive alive/big_day_out.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getContentForFlashMediaServer2() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash Media Server 2 :: Cisco Presentation</p></td></tr><tr><td valign="top"><span style="font-size: ' + bodyFontSize + ';">This Presentation was delivered to Cisco Systems on 01-10-2007, <a href="/app/flash/Flash Media Server Presentation to Cisco 1-10-2007a/Flash Media Server Presentation to Cisco 1-10-2007a.htm" target="_blank">Click Here.</a></span></td><td valign="top"></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getContentForFlash8Promo() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flash 8 Promo for www.ez-ajax.com</p></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="450" height="250" src="/app/flash/ez-ajax-promo/ezajax_logo.html?nocache=#RandRange(1, 65535, 'SHA1PRNG')#"></iframe></td><td valign="top"><span style="font-size: ' + bodyFontSize + ';">This Flash 8 Promo was created to promote the ezAJAX Site.  It was coded using a proprietary technique that allows for Rapid Development of Flash components that can be quite complex using very little development time.  As you can see this is a very professional looking Flash 8 component.<br><br>The games posted to this site were also created using this same proprietary programming technique.  Programmers and non-programmers alike can use this same proprietary programming technique with little effort and very little training.</span></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}
		
		function getContentForFlex15Demo() {
			var _html = '';
			var headerFontSize = ((!ezAJAXEngine.browser_is_ie) ? '15px' : '13px');
			var bodyFontSize = (parseInt(headerFontSize) - 2) + 'px';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '<div style="margin-top: 50px;">' : '');
			_html += '<table width="100%"><tr><td bgcolor="silver"><p align="justify" style="font-size: ' + headerFontSize + ';">Flex 1.5 Demo</p></td></tr><tr><td valign="top"><span style="font-size: ' + bodyFontSize + ';">This Flex 1.5 Demo was originally created for one of my clients and was designed to act as an Intranet portal for their internal operations center.  The Database is brought to you by a 64-bit SQL Server 2005 running on a Dual Core 64-bit AMD 4200+ running 64-bit Windows 2003 R2 with 4 GB RAM.<br><br>This Flex 1.5 Demo makes heavy use of ActionScript which by the by is pretty much the same as JavaScript in terms of programming.  ActionScript code can be interchanged with JavaScript for the code that can be consumed by your typical Flex 1.5 Application and your browser.  The ability to interchange and reuse ActionScript with JavaScript makes it possible to reduce your programming effort and maintenance.   Flex 1.5 programming is not for the weak of heart where ActionScript is concerned as it can take some time to achieve the same levels of complexity and functionality your typical JavaScript programmer may be familiar with for web programming.<br><br>Flex 1.5 is built into ColdFusion MX 7 although for some odd reason almost nobody at Adobe would confirm this.  Take a close look at the API for Flex 1.5 and whether or not the Flex 1.5 API can be used by the flavor of Flash ColdFusion MX 7 knows how to generate for you as well as the tag language one uses to create Flash components using ColdFusion MX 7 and you too may come to realize Flex 1.5 or a variant thereof was embedded into ColdFusion MX 7 because this seems to be the case.</span></td></tr><tr><td valign="top"><iframe frameborder="0" scrolling="Auto" width="900" height="600" src="http://www.ez-ajax.com/flex-demo/index.html"></iframe></td></tr></table>';
			_html += ((!ezAJAXEngine.browser_is_ie) ? '</div>' : '')
			return _html;
		}

		function clearContentFromTabs(oTabs) {
			var i = -1;
			var oDiv = -1;
			for (i = 0; i < oTabs.contentsCollection[i]; i++) {
				oDiv = _$(oTabs.contentsCollection[i]);
				if (!!oDiv) {
					oDiv.innerHTML = '';
				}
			}
		}
		
		var global_tabsContentCallBackDispatchAR = [];
		global_tabsContentCallBackDispatchAR['Site Background'] = getContentForSiteBackground;
		global_tabsContentCallBackDispatchAR['Flash 4 Emailer Demo'] = getContentForFlash4EmailerDemo;

		global_tabsContentCallBackDispatchAR['Flash 4 Menu Demo'] = getContentForFlash4MenuDemo;
		global_tabsContentCallBackDispatchAR['Flash 4 NavBar Demo'] = getContentForFlash4NavBarDemo;
		global_tabsContentCallBackDispatchAR['Flash 4 Project Plan Demo'] = getContentForFlash4ProjectPlanDemo;
		global_tabsContentCallBackDispatchAR['Flash 4 Project Plan Demo 2'] = getContentForFlash4ProjectPlanDemo2;
		
		global_tabsContentCallBackDispatchAR['Flash 5 Demos  AJAX'] = getContentForFlash5DemosAJAX;
		
		global_tabsContentCallBackDispatchAR['Flash 5 Dynamic News Demo'] = getContentForFlash5DynamicNewsDemo;
		global_tabsContentCallBackDispatchAR['Flash 5 Dynamic News Demo with AJAX'] = getContentForFlash5DynamicNewsDemoWithAJAX;
		global_tabsContentCallBackDispatchAR['Flash 5 Dynamic News Demo with Interactive AJAX'] = getContentForFlash5DynamicNewsDemoWithInteractiveAJAX;
		
		global_tabsContentCallBackDispatchAR['Flash Asteroids Game'] = getContentForFlashAsteroidsGame;
		
		global_tabsContentCallBackDispatchAR['Pacman Game'] = getContentForPacmanGame;
		global_tabsContentCallBackDispatchAR['Road Safety Game'] = getContentForRoadSafetyGame;
		global_tabsContentCallBackDispatchAR['Crusader Game'] = getContentForCrusaderGame;
		global_tabsContentCallBackDispatchAR['Arrive Alive Game'] = getContentForArriveAliveGame;
		
		global_tabsContentCallBackDispatchAR['Flash Media Server 2'] = getContentForFlashMediaServer2;
		global_tabsContentCallBackDispatchAR['Flash 8 Promo'] = getContentForFlash8Promo;
		global_tabsContentCallBackDispatchAR['Flex 1.5 Demo'] = getContentForFlex15Demo;

		function dispatchContentCallBackFor(oTabs, iTab, iSubTab) {
			function dispatchForAnchor(oA) {
				var sLabel = '';
				var oFunc = -1;
				if (!!oA) {
					oA = ((oA.length == null) ? oA : oA[0]);
					slabel = oA.innerHTML.ezStripHTML();
					oFunc = global_tabsContentCallBackDispatchAR[slabel];
					if (oFunc == null) {
						ezAlertError('The Content CallBack for the tab labeled "' + slabel + '" cannot be found.  Try again later in the day.');
					} else {
						return oFunc();
					}
				}
			};
			
			if (iSubTab == null) {
				return dispatchForAnchor(_$('anchor_TabSystem' + oTabs.id + '_tab' + iTab));
			} else {
				return dispatchForAnchor(_$('anchor_TabSystem' + oTabs.id + '_subTab' + iSubTab));
			}
		}
				
		function getTabbedContent() {
			var oTab = -1;
			var oTab1 = -1;
			var iTabs = [];
			var iSubTab = -1;
			var iContent = -1;
	
			oTabSystem1 = ezTabsObj.get$(-1, -1, -1, -1);
			
			oTabSystem1.onActivateTabsCallback = function(iTab) { clearContentFromTabs(this); var _id = this.contentsCollection[this.tabsDict.getValueFor(iTab) - 1]; var oDiv = _$(_id); if (!!oDiv) { var s = ''; try { s = dispatchContentCallBackFor(this, iTab); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; if (s.length > 0) { oDiv.innerHTML = s; }; }; };
			oTabSystem1.onShowSubTabsCallback = function(iTab, oStyle, oParent, anchorPos, anchorPosL, anchorPosR){ var w = (anchorPosR.x - anchorPosL.x) + 20; oStyle.top = ezElementPositonY(oParent) - ((!ezAJAXEngine.browser_is_ie) ? -16 : 70); oStyle.left = ((!ezAJAXEngine.browser_is_ie) ? anchorPosL.x - 15 : ezElementPositonX(oParent)); oStyle.width = w + ((!ezAJAXEngine.browser_is_ie) ? 50 : 0); oStyle.zIndex = 1000; };
			oTabSystem1.onClickSubTabCallback = function(iSubTab, iTab){ clearContentFromTabs(this); iTab = (((typeof iTab) != 'undefined') ? parseInt(iTab.toString()) : 0); iSubTab = (((typeof iSubTab) != 'undefined') ? parseInt(iSubTab.toString()) : 0); var _id = this.contentsCollection[this.subTabsContentDict.getValueFor(iSubTab) - 1]; this.isSubTabClicked = true; var oDiv = _$(_id); if (!!oDiv) { s = ''; try { s = dispatchContentCallBackFor(this, iTab, iSubTab); } catch (e) { ezAlertError(ezErrorExplainer(e)); }; if (s.length > 0) { oDiv.innerHTML = s; }; }; };
			oTabSystem1.onHideSubTabsCallback = function(iTab) { };

			oTabSystem1.minSubTabWidth = 150;
			oTabSystem1.isSubTabsAbsolutePositioned = (!ezAJAXEngine.browser_is_ie);
	//		oTabSystem1.isDebugMode = true;
	//		oTabSystem1.debugHeight(200);

			iTabs = oTabSystem1.addTab('Site Background');
			oTab1 = oTab = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(oTab, global_tabsContentCallBackDispatchAR['Site Background']());
	
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

			iTabs = oTabSystem1.addTab('Flash 5 Demos &amp; AJAX');
			oTab = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(oTab, '');
	
			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Flash 5 Dynamic News Demo</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Flash 5 Dynamic News Demo with AJAX</NOBR>');
			iContent = oTabSystem1.addContentForSubTab(iSubTab, '')

			iSubTab = oTabSystem1.addSubTab(oTab, '<NOBR>Flash 5 Dynamic News Demo with Interactive AJAX</NOBR>');
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

			iTabs = oTabSystem1.addTab('Flash Media Server 2');
			oTab = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(oTab, '');

			iTabs = oTabSystem1.addTab('Flash 8 Promo');
			oTab = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(oTab, '');

			iTabs = oTabSystem1.addTab('Flex 1.5 Demo');
			oTab = iTabs.pop();
			iContent = oTabSystem1.addContentForTab(oTab, '');

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
	
	<div id="table_outerContentWrapper" style="position: absolute; width: 900px; top: <cfif (NOT bool_isServerProduction)>25<cfelse>0</cfif>px; left: 0px; background-color: white;">
		<table width="900" align="center" border="0" cellpadding="1" cellspacing="1">
			<tr>
				<td>
					<DIV id=centerwrapper>
						<DIV id=root style="WIDTH: 900px; POSITION: absolute; left: 0px; HEIGHT: 425px">
							<DIV id=e1 style="LEFT: 1px; WIDTH: 335px; POSITION: absolute; TOP: 1px; HEIGHT: 150px">
								<IMG height=150 src="/app/flash/images/blueBoxClearCorner.gif" width=335>
							</DIV>
							<DIV id=e2 style="LEFT: 194px; WIDTH: 765px; POSITION: absolute; TOP: 1px; HEIGHT: 150px">
								<IMG height=150 src="/app/flash/images/neuronMatrix_blue.jpg" width=765>
							</DIV>
							<DIV id=e3 style="LEFT: 32px; WIDTH: 320px; POSITION: absolute; TOP: 23px; HEIGHT: 35px">
								<SPAN class=text><B><FONT color=##ffffff size=5>
								<SPAN style="FONT-SIZE: 24px; LINE-HEIGHT: 29px">http://flash.ez-ajax.com<BR soft></SPAN></FONT></B></SPAN>
							</DIV>
						</DIV>
					</DIV>				
				</td>
			</tr>
			<tr>
				<td>
					<table width="100%" cellpadding="-1" cellspacing="-1">
						<tr>
							<td width="95%">
								<div id="TabSystemContainer" class="TabSystem1" style="position: absolute; top: 100px; left: 0px;"></div>
							</td>
							<td width="*">
								<div id="div_ezajax_3d_logo"></div>
								<a id="anchor_imageLogoRight" name="anchor_imageLogoRight"></a>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	
	<script language="JavaScript1.2" type="text/javascript">
		getTabbedContent();
	</script>
</cfoutput>

