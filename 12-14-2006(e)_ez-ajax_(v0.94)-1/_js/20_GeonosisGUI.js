var global_dict = ezDictObj.get$();
var objectsMetaDataStack = [];
var objectAttributesMetaDataStack = [];
var objectClassDefinitionsMetDataStack = [];
var stack_addObject_inEdit = [];
var	stack_addAttribute_inEdit = [];

function handle_onChangeClassesBrowser(selObj) {
	if (!!selObj) {
		if (selObj.selectedIndex > -1) {
			var btnObj = _$('btn_objectClass_add');
			var imgObj = _$('image_objectClass_add');
			if ( (!!btnObj) && (!!imgObj) ) {
				btnObj.disabled = false;
				var aa = imgObj.title.split('-');
				aa[aa.length - 1] = null;
				imgObj.title = aa.join('');
			}
		}
		oAJAXEngine.doAJAX('performGetGeonosisObjects', 'handle_ezAJAXCallBack', 'CLASSNAME', selObj.options[selObj.selectedIndex].text.toString().ezURLEncode(), 'hasMetaData', 'false'.ezURLEncode());
	} else {
		alert('ERROR :: Programming Error - Function named "handle_onChangeClassesBrowser" has been passed an invalid object.');
	}
}

function displayClassesBrowser(qObj, argsDict) {
	var i = -1;
	var qData = -1;
	var nRecs = -1;
	var oParms = -1;
	var oGeonosis = -1;
	var _contextName = js_const_Objects_symbol;
	var _html = '';
	var width_of_class_panel = 200;
	var aDict = ezDictObj.get$();
	

	function searchForSomeRecs(_ri, _dict) {
		var _HTMLCONTENT = _dict.getValueFor('HTMLCONTENT');
		if (!!_HTMLCONTENT) {
			aDict.push('HTMLCONTENT', _HTMLCONTENT);
		}
	};
	
	function populateForSomeClasses(_ri, _dict) {
		var _CLASSNAME = _dict.getValueFor('CLASSNAME');
		var _OBJECTCLASSID = _dict.getValueFor('OBJECTCLASSID');
		var anObj = _$('selection_classBrowser');
		if ( (!!_CLASSNAME) && (!!_OBJECTCLASSID) && (!!anObj) ) {
			var opt = new Option(_CLASSNAME, _OBJECTCLASSID);
			try { anObj.add(opt,null); } catch (e) { anObj.add(opt); };
			var n = anObj.options.length;
			anObj.size = ((n > 20) ? 20 : n);
			anObj.selectedIndex = -1;
		}
	};

	if (global_dict == null) {
		global_dict = ezDictObj.get$();
	}
	global_dict.init(); // clear-out the parms from the previous AJAX call otherwise they just build-up and that's not so helpful...

	var qStats = qObj.named('qDataNum');
	if (!!qStats) {
		nRecs = qStats.dataRec[1];
	}
	if (nRecs > 0) {
		var bcAR = [];
		if (!!argsDict) {
			var bc = argsDict.getValueFor('breadCrumbs');
			if (!!bc) {
				if (typeof bc == const_object_symbol) {
					bc = bc[0];
				}
				bc = ((!!bc) ? bc.ezURLDecode() : '').ezURLDecode();
				if (bc.length > 0) {
					bcAR = bc.split(',');
				}
			}
		}

		qData = qObj.named('qData1');
		qData.iterateRecObjs(anyErrorRecords);
		if (!bool_isAnyErrorRecords) {
			var qSchema = qObj.named('qMetaDataForObjectClassDefs');
			if (!!qSchema) {
				if (objectClassDefinitionsMetDataStack == null) {
					objectClassDefinitionsMetDataStack = [];
				}
				objectClassDefinitionsMetDataStack.push(qSchema);
			}

			var cObj = _$('div_contentHome');
			if (!!cObj) {
				cObj.style.width = ezClientWidth();
				cObj.style.height = ezClientHeight();
	
				var qContent = qObj.named('qContent');
				try { qContent.iterateRecObjs(searchForSomeRecs); } catch (e) { ezAlert('211.1 The function "searchForSomeRecs" has failed. ' + ezErrorExplainer(e)); };
				try { aDict.intoNamedArgs(); } catch (e) { ezAlert('211.2 ' + ezErrorExplainer(e)); };
				var someContent = aDict.getValueFor('HTMLCONTENT');
				someContent = ((typeof someContent) == const_string_symbol ? someContent : '');
				cObj.innerHTML = someContent;
				cObj.style.display = const_inline_style;

				var divObj = _$('div_classesBrowser');
				if (!!divObj) {
					var qData1 = qObj.named('qData1');
					divObj.innerHTML = '<select id="selection_classBrowser" onchange="handle_onChangeClassesBrowser(this);" class="textClass" style="width: 400px;"></select>';
					try { qData1.iterateRecObjs(populateForSomeClasses); } catch (e) { ezAlert('211.3 ' + ezErrorExplainer(e)); };
				}
			}
		}
	}
}

// +++
function displayObjectsBrowserGUI() {
	var _html = '';
	var editingMetaDataFor = 'Object';
	var btnObj = -1;
	var cObj = _$('selection_classBrowser');
	var dObj = _$('div_objectsBrowser');

	function displayMetaDataRecord(_ri, _dict, _rowCntName) {
		var i = -1;
		var _COLUMN_NAME = '';
		var _COLUMN_SIZE = '';
		var _TYPE_NAME = '';
		var _rowCnt = -1;
		var idName = '';
		var defaultValue = '';
		var extraSize = 0;
		var todayDt = new Date();
		var defaultDt = '';
		var defaultUserName = '';
		
		try { _COLUMN_NAME = _dict.getValueFor('COLUMN_NAME'); } catch(e) {};
		try { _COLUMN_SIZE = parseInt(_dict.getValueFor('COLUMN_SIZE')); } catch(e) {};
		try { _TYPE_NAME = _dict.getValueFor('TYPE_NAME'); } catch(e) {};
		try { _rowCnt = parseInt(_dict.getValueFor(_rowCntName)); } catch(e) {};

		if (_TYPE_NAME.toUpperCase().indexOf(' identity'.toUpperCase()) == -1) {
			idName = 'input_add' + editingMetaDataFor + '_' + _COLUMN_NAME;
			defaultValue = '';
			defaultUserName = 'raychorn@hotmail.com';
			defaultDt = todayDt.getYear() + '-' + todayDt.getMonth().toString().ezZeroPadLeading(2) + '-' + todayDt.getDay().toString().ezZeroPadLeading(2) + ' ' + todayDt.getHours().toString().ezZeroPadLeading(2) + ':' + todayDt.getMinutes().toString().ezZeroPadLeading(2) + ':' + todayDt.getSeconds().toString().ezZeroPadLeading(2) + '.0';

			switch (_COLUMN_NAME) {
				case 'publishedVersion':
					defaultValue = '0';
				break;

				case 'editVersion':
					defaultValue = '0';
				break;

				case 'created':
					defaultValue = defaultDt;
				break;

				case 'createdBy':
					defaultValue = defaultUserName;
				break;

				case 'updated':
					defaultValue = defaultDt;
				break;

				case 'updatedBy':
					defaultValue = defaultUserName;
				break;
			}

			extraSize = 0;
			switch (_TYPE_NAME) {
				case 'smalldatetime':
					extraSize = 5;
				break;
			}
			_html += '<tr>';

			_html += '<td bgcolor="silver"><span class="boldPromptTextClass">' + _COLUMN_NAME + '</span></td>';

			_html += '<td><input id="' + idName + '" class="normalStatusClass" value="' + defaultValue + '" size="' + ((_COLUMN_SIZE > 50) ? 50 : (_COLUMN_SIZE + extraSize)) + '" maxlength="' + (_COLUMN_SIZE + extraSize) + '" onkeydown="if ( (event.keyCode == 13) || (event.keyCode == 9) || (event.keyCode == 40) || (event.keyCode == 38) ) { processAdd' + editingMetaDataFor + 'InputAction(this.id,\'' + _dict.asQueryString().ezURLEncode() + '\'); }; return true;"></td>';

			_html += '</tr>';

			if (editingMetaDataFor.toUpperCase() == 'Object'.toUpperCase()) {
				stack_addObject_inEdit.push(idName);
			} else if (editingMetaDataFor.toUpperCase() == 'Attribute'.toUpperCase()) {
				stack_addAttribute_inEdit.push(idName);
			}
		}
	};

	if ( (!!dObj) && (!!cObj) ) {
		stack_addObject_inEdit = [];
		stack_addAttribute_inEdit = [];
		
		cObj.disabled = false; // enabled this because it was diabled when the AJAX call began...
		dObj.style.display = const_inline_style; // show this because it was hidden when the AJAX call began...

		var sel = cObj.selectedIndex;

		if (sel > -1) {
			var aDict = ezGeonosisObj.searchInstancesForClassName(cObj.options[sel].text);
			var _OBJECTNAME = aDict.getValueFor('OBJECTNAME');
			var _ID = aDict.getValueFor('ID');
			var oObj = -1;
			if ( (!!_OBJECTNAME) && (typeof _OBJECTNAME == const_object_symbol) && (!!_ID) && (typeof _ID == const_object_symbol) && (_OBJECTNAME.length == _ID.length) ) {
			} else {
				btnObj = $('btn_classes_remove');
				if (!!btnObj) {
					btnObj.disabled = false;
				}
			}
			var _btnHtmlL = '<button id="btn_objects_remove" disabled class="buttonClass" title="Click this button to remove the selected Object.  An Object may only be removed when there are no other objects linked to it such as Attributes or ObjectLinks." onclick="performConfirmDropObjectDialog(); return false;">[-]</button>&nbsp;';
			var _btnHtmlR = '&nbsp;<button id="btn_objects_add" class="buttonClass" title="Click this button to add a new Object." onclick="performShowAddObjectPanel(); return false;">[+]</button>';

			_html += ezBeginTable(_btnHtmlL + 'Objects' + _btnHtmlR, '&tr=' + 'bgcolor="silver"'.ezURLEncode() + '&td=' + 'align="center"'.ezURLEncode() + '&span=' + 'class="boldPromptTextClass"'.ezURLEncode());
			_html += '<tr>' + '<td>';

			var width_of_objects_selection = '200';
			
			var _numRows = 10;
			var oSel = _$('selection_classBrowser');
			if (!!oSel) {
				_numRows = oSel.size - 1;
			}

			_html += '<select id="selection_objectName" size="' + _numRows + '" class="boldPromptTextClass" style="width: ' + width_of_objects_selection + 'px;" onchange="handle_objectName_onChange(this); return true;">';

			btnObj = _$('btn_classes_remove');
			if (!!btnObj) {
				btnObj.disabled = (((!!_OBJECTNAME) && (_OBJECTNAME.length > 0)) ? true : false);
			}

			if (!!_OBJECTNAME) {
				for (var i = 0; i < _OBJECTNAME.length; i++) {
					_html += '<option value="' + _ID[i] + '">' + _OBJECTNAME[i] + '</option>';
				}
			}

			_html += '</select>';
			
			_html += '</td>' + '</tr>';

			_html += ezEndTable();

			_html += '<div id="div_addObject_panel" style="display: none;">';

			_html += ezBeginTable('Add an Object', '&bool=' + 'includeDismissButton=true'.ezURLEncode() + '&div=' + 'dismissDiv=div_addObject_panel'.ezURLEncode() + '&tr=' + 'bgcolor="silver"'.ezURLEncode() + '&td=' + 'align="center"'.ezURLEncode() + '&span=' + 'class="boldPromptTextClass"'.ezURLEncode());

			_html += '<tr>' + '<td>';

			_html += ezBeginTable();

			editingMetaDataFor = 'Object';

			objectsMetaDataStack[0].iterateRecObjs(displayMetaDataRecord);
			
			_html += ezEndTable();
			_html += '</td>' + '</tr>';
			_html += ezEndTable();
			_html += '</div>';

			_html += '<div id="div_addAttr_panel" style="display: none;">';
			var _btnHtmlL = '<button id="btn_attr_submit" disabled class="buttonClass" title="Click this button to save the Attribute being edited." onclick="performSaveAttribute(); return false;">[Save]</button>&nbsp;';
			_html += ezBeginTable(_btnHtmlL + 'Add an Attribute', '&bool=' + 'includeDismissButton=true'.ezURLEncode() + '&div=' + 'dismissDiv=div_addAttr_panel'.ezURLEncode() + '&tr=' + 'bgcolor="silver"'.ezURLEncode() + '&td=' + 'align="center"'.ezURLEncode() + '&span=' + 'class="boldPromptTextClass"'.ezURLEncode());
			_html += '<tr>' + '<td>';
			_html += ezBeginTable();

			editingMetaDataFor = 'Attribute';
			objectAttributesMetaDataStack[0].iterateRecObjs(displayMetaDataRecord);

			_html += ezEndTable();
			_html += '</td>' + '</tr>';
			_html += ezEndTable();
			_html += '</div>';
			
			dObj.innerHTML = _html;
			
			ezDictObj.remove$(aDict.id);
		}
	}
}
// +++

function displayObjectsBrowser(qObj, argsDict) {
	var i = -1;
	var qData = -1;
	var nRecs = -1;
	var oParms = -1;
	var dataDict = -1;

	function searchForDataRecs(_ri, _dict) {
		if (dataDict == -1) {
			dataDict = ezDictObj.get$(_dict.asQueryString());
		}
	};

	global_dict.init(); // clear-out the parms from the previous AJAX call otherwise they just build-up and that's not so helpful...

	var qStats = qObj.named('qDataNum');
	if (!!qStats) {
		nRecs = qStats.dataRec[1];
	}
	if (nRecs > 0) {
		oParms = qObj.named('qParms');
		if (!!oParms) {
		}

		var qSchema = qObj.named('qSchema');
		if (!!qSchema) {
			try {
				dataDict = -1;
				qSchema.iterateRecObjs(searchForDataRecs);
				var qSchema_OBJECTSMETDATARECORD = dataDict.getValueFor('OBJECTSMETDATARECORD');
				if (typeof qSchema_OBJECTSMETDATARECORD == const_object_symbol) {
					qSchema_OBJECTSMETDATARECORD = qSchema_OBJECTSMETDATARECORD.pop();
				}
				if (qSchema_OBJECTSMETDATARECORD > -1) {
					if (objectsMetaDataStack == null) {
						objectsMetaDataStack = [];
					}
					objectsMetaDataStack.push(qObj.named('qObjectsMetDataRecord'));
				}
				var qSchema_OBJECTATTRIBUTESMETDATARECORD = dataDict.getValueFor('OBJECTATTRIBUTESMETDATARECORD');
				if (typeof qSchema_OBJECTATTRIBUTESMETDATARECORD == const_object_symbol) {
					qSchema_OBJECTATTRIBUTESMETDATARECORD = qSchema_OBJECTATTRIBUTESMETDATARECORD.pop();
				}
				if (qSchema_OBJECTATTRIBUTESMETDATARECORD > -1) {
					if (objectAttributesMetaDataStack == null) {
						objectAttributesMetaDataStack = [];
					}
					objectAttributesMetaDataStack.push(qObj.named('qObjectAttributesMetDataRecord'));
				}
				var qSchema_objectCnt = dataDict.getValueFor('OBJECTCNT');
				if (typeof qSchema_objectCnt == const_object_symbol) {
					qSchema_objectCnt = qSchema_objectCnt.pop();
				}
				var qSchema_SCOPESCONTENTQUERY = dataDict.getValueFor('SCOPESCONTENTQUERY');
				if (typeof qSchema_SCOPESCONTENTQUERY == const_object_symbol) {
					qSchema_SCOPESCONTENTQUERY = qSchema_SCOPESCONTENTQUERY.pop();
				}
				if (qSchema_SCOPESCONTENTQUERY > -1) {
					var qScopeContent = qObj.named('qData' + qSchema_SCOPESCONTENTQUERY)
					if (!!qScopeContent) {
						dataDict = -1;
						qScopeContent.iterateRecObjs(searchForDataRecs);
						var scopeName = dataDict.getValueFor('SCOPENAME');
						if (typeof scopeName == const_object_symbol) {
							scopeName = scopeName.pop();
						}
						var scopeContent = dataDict.getValueFor('HTMLCONTENT');
						if (typeof scopeContent == const_object_symbol) {
							scopeContent = scopeContent.pop();
						}

						switch (scopeName.toUpperCase()) {
							case js_const_Session_symbol.toUpperCase():
//								setSessionScopeDebugPanelContent(scopeContent);
							break;

							case js_const_Application_symbol.toUpperCase():
//								setApplicationScopeDebugPanelContent(scopeContent);
							break;

							case js_const_CGI_symbol.toUpperCase():
//								setCgiScopeDebugPanelContent(scopeContent);
							break;

							case js_const_Request_symbol.toUpperCase():
//								setRequestScopeDebugPanelContent(scopeContent);
							break;
						}
					}
				}
			} catch (e) { ezAlertError('212.101\n' + ezErrorExplainer(e)); };

			ezGeonosisObj.remove$s(); // do this because we also use this function to display data after editing actions that may change data...

			try {
				var nn = qSchema_objectCnt;
				for (i = 1; i <= nn; i++) {
					qObject = qObj.named('qObject' + i);
					qObjectAttrs = qObj.named('qAttrs' + i);

					oGeonosis = ezGeonosisObj.get$();
					if (!!qObject) {
						oGeonosis.qData = qObject;
					}
					if (!!qObjectAttrs) {
						oGeonosis.qAttrs = qObjectAttrs;
					}
				}
			} catch (e) { ezAlertError('212.888\n' + ezErrorExplainer(e)); };

			try {
				displayObjectsBrowserGUI();
			} catch (e) { ezAlertError('212.999\n' + ezErrorExplainer(e)); };
		}
	}
}

function handle_ezAJAXCallBack(qObj) {
	var nRecs = -1;
	var oParms = -1;
	var argsDict = ezDictObj.get$();
	var aDict = -1;
	var html = '';
	var i = -1;

	function searchForArgRecs(_ri, _dict) {
		var n = _dict.getValueFor('NAME');
		var v = _dict.getValueFor('VAL');
		if ( (!!n) && (!!v) ) {
			argsDict.push(n.ezTrim(), v);
		}
	};

	function searchForStatusRecs(_ri, _dict) {
		if (aDict == -1) {
			aDict = ezDictObj.get$(_dict.asQueryString());
		}
	};
//			ezAlert('handle_ezAJAXCallBack :: qObj.names = [' + qObj.names + ']');
//			ezAlert('qObj = [' + qObj + ']');
	var qStats = qObj.named('qDataNum');
	if (!!qStats) {
		nRecs = qStats.dataRec[1];
	}
	if (nRecs > 0) {
		oParms = qObj.named('qParms');
		if (!!oParms) {
			oParms.iterateRecObjs(searchForArgRecs);
			try { argsDict.intoNamedArgs(); } catch (e) {};
		}

		var aName = -1;
		var realQueryObjectNames = [];
		var qData1 = -1;
		for (i = 0; i < qObj.names.length; i++) {
			aName = qObj.names[i];
			qData1 = qObj.named(aName);
			if (!!qData1) {
				qData1.iterateRecObjs(anyErrorRecords);
				if ( (aName != 'qDataNum') && (aName != 'qParms') ) {
					realQueryObjectNames.push(aName);
				}
			}
		}
		if (!bool_isAnyErrorRecords) {
			var _ezCFM = argsDict.getValueFor('ezCFM');
			switch (_ezCFM) {
				case 'performGetGeonosisClasses':
					try {
						displayClassesBrowser(qObj, argsDict);
					} catch (e) { ezAlert('112.1 (' + _ezCFM + ') realQueryObjectNames = [' + realQueryObjectNames + ']\n' + ezErrorExplainer(e)); };
				break;
				
				case 'performGetGeonosisObjects':
					try {
						displayObjectsBrowser(qObj, argsDict);
					} catch (e) { ezAlert('212.1 (' + _ezCFM + ') realQueryObjectNames = [' + realQueryObjectNames + ']\n' + ezErrorExplainer(e)); };
//						ezAlert('(' + _ezCFM + ') realQueryObjectNames = [' + realQueryObjectNames + ']');
				break;
				
				default:
					ezAlert('(UNDEFINED) _ezCFM = [' + _ezCFM + ']');
					ezAlert('handle_ezAJAXCallBack :: qObj.names = [' + qObj.names + ']');
					ezAlert('qObj = [' + qObj + ']');
				break;
			}
		} else {
			if (bool_isHTMLErrorRecords) {
				ezAlertHTMLError(s_explainError);
			} else {
				ezAlertError(s_explainError);
			}
		}
	}
	ezDictObj.remove$(argsDict.id);
}

