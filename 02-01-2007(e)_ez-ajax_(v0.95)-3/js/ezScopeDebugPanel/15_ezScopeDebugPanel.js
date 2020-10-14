// 15_ezScopeDebugPanel.js

function handle_fetchDebugVariableByName(id) {
	var i = -1;
	var const_more_token = 'more';
	var const_prev_token = 'prev';
	var const_next_token = 'next';
	var const_more_symbol = '_' + const_more_token + '_';
	var const_prev_symbol = '_' + const_prev_token + '_';
	var const_next_symbol = '_' + const_next_token + '_';
	id = (((typeof id) == const_string_symbol) ? id : '');
	var ar = id.split('_');
	var aScopeName = '';
	var iBegin = -1;
	var iEnd = -1;
	if (id.toLowerCase().indexOf(const_more_symbol) > -1) {
		// btn_fetchDebug_Application.resourcebundle.RESOURCEBUNDLE_more_prev_10_147
		// btn_fetchDebug_Application.resourcebundle.RESOURCEBUNDLE_more_next_10_147
		for (i = 0; i < ar.length - 1; i++) {
			if (ar[i].toLowerCase() == const_more_token) {
				aScopeName = ar[i - 1];
				iBegin = parseInt(ar[i + 2]);
				iEnd = parseInt(ar[i + 3]);
				break;
			}
		}
		try {
			oAJAXEngine.doAJAX('ezAJAX_PopulateDebugScope', 'handle_ezAJAXPopulateDebugPanel', 'scopeName', aScopeName, 'iBegin', iBegin);
		} catch (e) { ezAlertHTMLError(ezErrorExplainer(e)); };
	} else {
		ezRemoveArrayItem(ar,0);
		ezRemoveArrayItem(ar,0);
		ar = ezRemoveEmptyItemsFromArray(ar);
		var aName = ar.join('_');
		var ar2 = aName.split('.');
		aScopeName = ar2[0];
		try {
			oAJAXEngine.doAJAX('ezAJAX_PopulateDebugScope', 'handle_ezAJAXPopulateDebugPanel', 'scopeName', aScopeName, 'scopeMember', aName);
		} catch (e) { ezAlertHTMLError(ezErrorExplainer(e)); };
	}
}

function handle_ezAJAXPopulateDebugPanel(qObj, nRecs, qStats, argsDict, qData1) {
	var _CONTENT = '';
	var _scopeName = '';
	var _scopeMember = '';
	var _iBegin = '';
	var _HASSTYLES = '';
	var cObj = -1;
	var dObj = -1;
	var _html = '';
	var divName = '';

	function searchForContentRecs(_ri, _dict, _rowCntName) {
		_CONTENT = _dict.getValueFor('CONTENT');
		_HASSTYLES = _dict.getValueFor('HASSTYLES');
		if (!!_CONTENT) {
			_CONTENT = _CONTENT.ezURLDecode().ezClipCaselessReplace('%[ERROR]', '%');
		}
		_CONTENT = ((_CONTENT == null) ? '' : _CONTENT);
	};
	
	function getContentContainer(aScopeName, sContent) {
		aScopeName = (((typeof aScopeName) == const_string_symbol) ? aScopeName : '');
		sContent = (((typeof sContent) == const_string_symbol) ? sContent : (((typeof sContent) == const_object_symbol) ? sContent : ''));
		var divName = 'div_scopeViewer_' + aScopeName + '_' + ezUUID$();
		var _html = '<div id="' + divName + '" style="display: inline;">';
		_html += ezBeginTable(aScopeName, '&bool=' + 'includeDismissButton=true'.ezURLEncode() + '&div=' + divName.ezURLEncode() + '&table=' + 'border="1"'.ezURLEncode() + '&tr=' + 'bgcolor="cyan"'.ezURLEncode() + '&td=' + 'align="center"'.ezURLEncode() + '&span=' + 'class="boldPromptTextClass"'.ezURLEncode());
		_html += '<tr><td>';
		_html += ((sContent.length > 0) ? sContent : aScopeName);
		_html += '</td></tr>';
		_html += ezEndTable();
		_html += '</div>';
		return _html;
	};

	nRecs = ((nRecs != null) ? nRecs : -1);
	if (!!qStats) {
		if (!!argsDict) {
			if (!!qData1) {
				qData1.iterateRecObjs(searchForContentRecs);
				_scopeName = argsDict.getValueFor('scopeName');
				_scopeMember = argsDict.getValueFor('scopeMember');
				_iBegin = argsDict.getValueFor('iBegin');
				if ( (_scopeName == null) && (_scopeMember == null) && (_iBegin == null) && (_CONTENT.length > 0) ) {
					var oDiv = _$(const_div_floating_debug_menu);
					if (!!oDiv) {
						oDiv.innerHTML = getContentContainer(_scopeName, _CONTENT);
						ezAJAXEngine.initDebugMenu(oAJAXEngine);

						var myURL = ezAJAXEngine.$[0]._url + 'cfdumpStyles.css';
						ezDynamicObjectLoader(myURL);
					}
				} else if (!!_scopeName) {
					var i = -1;
					var bObj = -1;
					var _btns = ['btn_fetchDebugApplication', 'btn_fetchDebugSession', 'btn_fetchDebugCGI', 'btn_fetchDebugRequest'];
					for (i = 0; i < _btns.length; i++) {
						bObj = _$(_btns[i]);
						if (!!bObj) {
							bObj.disabled = false;
						}
					}
					if ( (!!_scopeMember) && (_iBegin == null) ) {
						cObj = _$('btn_fetchDebug_' + _scopeMember);
						if (!!cObj) {
							cObj.disabled = false;
						}
						dObj = _$('div_fetchDebug_' + _scopeMember);
						if (!!dObj) {
							dObj.innerHTML = getContentContainer(_scopeMember, _CONTENT);
						}
					} else if ( (!!_scopeName) && (_scopeMember == null) && (!!_iBegin) ) {
						dObj = _$('div_fetchDebug_' + _scopeName);
						if (!!dObj) {
							dObj.innerHTML = getContentContainer(_scopeName, _CONTENT);
						}
					} else {
						ezAlertHTML(getContentContainer(_scopeName, _CONTENT));
					}
				} else if (false) {
					ezAlert('nRecs = [' + nRecs + ']');
					ezAlert('qStats = [' + qStats + ']');
					ezAlert('argsDict = [' + argsDict + ']');
					ezAlert('qData1 = [' + qData1 + ']');
					ezAlert('qObj = [' + qObj + ']');
				}
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
