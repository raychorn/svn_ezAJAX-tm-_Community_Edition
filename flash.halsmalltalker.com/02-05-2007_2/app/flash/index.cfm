<cfparam name="linkname" type="string" default="">
<cfoutput>
<cfif 0>
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
					oDiv2.innerHTML = getFlashContent('news-flash-headlines3', '/app/flash/news-flash-headlines3/news-flash-headlines3.swf', 150, 600, '##ffffff', 'high');

					var oDiv = _$('div_Flash5_DynamicNewsDemo_with_AJAX_desc');
					if (!!oDiv) {
						oDiv.innerHTML = '<p align="justify"><small>You should notice the set of data you created interactively now appears in the Flash component that appears to the left of this message.</small></p>';
					}
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
		
		function defaultDynamicNewsDataSet2(id, cat, subcat, url) {
			var _html = '';
			id = ((id == null) ? '1' : parseInt(id.toString()).toString());
			if (id < 1) {
				id = 1;
			}
			cat = ((cat == null) ? '' : cat);
			subcat = ((subcat == null) ? '' : subcat);
			url = ((url == null) ? '' : url);
			_html += '<tr>';
			_html += '<td><button id="btn_FlashAJAXData2_' + id + '_Remove" class="buttonClass" title="Click this button to Remove a row from this table." style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="handle_onClick_buildFlashAJAXData2(this); return false;">[-]</button>&nbsp;<button id="btn_FlashAJAXData2_' + id + '_Add" class="buttonClass" title="Click this button to Add a row to this table." style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="handle_onClick_buildFlashAJAXData2(this); return false;">[+]</button></td>';
			_html += '<td><input id="input_FlashAJAXData2_CAT_' + id + '_1" class="textClass" size="12" maxlength="16" title="Enter the Category here - The Category is the main heading for the group of SubCategories; you may think of the Category as if it were the Main Menu item and the SubCategory as if it were the SubMenu item." value="' + cat + '"' + ((cat.length > 0) ? ' onchange="handle_onChange_FlashAJAXData2(this);"' : '') + '></td>';
			_html += '<td><input id="input_FlashAJAXData2_SUBCAT_' + id + '_2" class="textClass" size="12" maxlength="16" title="Enter the SubCategory here - The SubCategory is the heading for the URL; you may think of the SubCategory as if it were the SubMenu item that falls under each Category which is the Main Menu item." value="' + subcat + '"' + ((subcat.length > 0) ? ' onchange="handle_onChange_FlashAJAXData2(this);"' : '') + '></td>';
			_html += '<td><input id="input_FlashAJAXData2_URL_' + id + '_3" class="textClass" size="12" maxlength="128" title="Enter the URL here - This URL can be any valid Internet URL." value="' + url + '"' + ((url.length > 0) ? ' onchange="handle_onChange_FlashAJAXData2(this);"' : '') + '></td>';
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
							_html += defaultDynamicNewsDataSet2(sID, sCAT, sSUBCAT, sURL);
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
		//			alert(_STATUS);
				}

				var div = _$('div_Flash5_DynamicNewsDemo_with_AJAX2');
				if (!!div) {
					div.disabled = false;
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
			_html += '<br><button id="btn_FlashAJAXData2_Submit" class="buttonClass" title="Click this button to submit this table to the Flash component." style="' + ((!ezAJAXEngine.browser_is_ie) ? 'font-size: 9px;' : '') + '" onclick="handle_onClick_buildFlashAJAXData2(this); return false;">[Submit]</button>&nbsp;<small>Make sure you click the [+] or [-] button after making changes to the data as-needed before you click the [Submit] button to make sure your changes are properly committed to the Server.</small>';
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
		</cfoutput>
	</cfsavecontent>
	
	<cfsavecontent variable="jsCodeStore1">
		<cfoutput>
		</cfoutput>
	</cfsavecontent>
	
	<script language="JavaScript1.2" type="text/javascript">#Request.commonCode._readAndObfuscateJSCode_(jsCodeStore0 & jsCodeStore1)#</script>
</cfif>
	
	<a id="anchor_imageLogoRight" name="anchor_imageLogoRight" style="position: absolute; top: -15px; left: 700px;"></a>
	<div id="table_outerContentWrapper" style="position: absolute; width: 900px; top: 0px; left: 0px;">
		<div class="ContentWrapper">
			<div class="twoColumnLeft">
				<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
				  codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab"
				  id="flashmainmenuclip" width="200" height="1000">
				<param name="movie" value="/app/flash/flash/menu/flashmainmenuclip.swf">
				<param name="quality" value="autohigh">
				<param name="bgcolor" value="##FFFFFF">
				<param name="wmode" value="transparent">
				<embed src="/app/flash/flash/menu/flashmainmenuclip.swf" width="200" height="1000"
				  quality="autohigh" bgcolor="##FFFFFF" wmode="transparent"
				  pluginspage="http://www.macromedia.com/go/getflashplayer"
				  type="application/x-shockwave-flash">
				</embed></object>
			</div>
			<div class="twoColumnRight" style="<cfif (NOT Request.commonCode.ezIsBrowserIE())>margin-left: 30px;</cfif>">
				<img src="/app/flash/images/flashSiteHeader.jpg" width="780" height="100" border="0">
				<div id="div_ezajax_3d_logo"></div>
				<br>
				<div id="div_primaryContentContainer">
					<iframe name="contentFrame" id="contentFrame" frameborder="0" scrolling="No" width="780" height="600" style="background: ##164f9f" src="/php/links/<cfif (Len(linkname) gt 0)>#linkname#<cfelse>getContentForSiteBackground.php</cfif>"></iframe>
				</div>
			</div>
		</div>
	</div>
</cfoutput>

