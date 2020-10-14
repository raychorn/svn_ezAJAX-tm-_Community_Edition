function handleGetRegistrationData(qObj, nRecs, qStats, argsDict, qData1) {
	var _STATUSMSG = '';
	var oDiv = _$('div_manageLicenses_content');
	var _html = '';
	var iRow = 0;
	var _ID = '';
	var _SID = '';
	var _UID = '';
	var _USERNAME = '';
	var _HASLICENSE = '';
	var _SERVERNAME = '';
	var _EXPIRATIONDATE = '';
	var _ISCOMMUNITYEDITION = '';
	var _buttonClass = ((ezAJAXEngine.$[0].browser_is_ie) ? 'buttonClass' : 'buttonClassFF');
	
	function searchForStatusRecs(_ri, _dict, _rowCntName) {
		_STATUSMSG = _dict.getValueFor('STATUSMSG');
		_STATUSMSG = ((_STATUSMSG == null) ? '' : _STATUSMSG);
	};

	function searchForLicenseRecs(_ri, _dict, _rowCntName) {
		_ID = _dict.getValueFor('ID');
		_SID = _dict.getValueFor('SID');
		_UID = _dict.getValueFor('UID');
		_USERNAME = _dict.getValueFor('USERNAME');
		_HASLICENSE = _dict.getValueFor('HASLICENSE');
		_SERVERNAME = _dict.getValueFor('SERVERNAME');
		_EXPIRATIONDATE = _dict.getValueFor('EXPIRATIONDATE');
		_ISCOMMUNITYEDITION = _dict.getValueFor('ISCOMMUNITYEDITION');
		
		_ID = ((_ID == null) ? '' : _ID);
		_SID = ((_SID == null) ? '' : _SID);
		_UID = ((_UID == null) ? '' : _UID);
		_USERNAME = ((_USERNAME == null) ? '' : _USERNAME);
		_HASLICENSE = ((_HASLICENSE == null) ? '' : _HASLICENSE);
		_SERVERNAME = ((_SERVERNAME == null) ? '' : _SERVERNAME);
		_EXPIRATIONDATE = ((_EXPIRATIONDATE == null) ? '' : _EXPIRATIONDATE);
		_ISCOMMUNITYEDITION = ((_ISCOMMUNITYEDITION == null) ? '' : _ISCOMMUNITYEDITION);
		
		if (_HASLICENSE.length > 0) {
			iRow++;
			_html += '<span class="normalSmallStatusBoldClass"><center><NOBR>' + _USERNAME + ' / ' + _SERVERNAME + '</NOBR> <NOBR>Has a ' + ((_ISCOMMUNITYEDITION == 1) ? 'Community Edition' : 'Enterprise Edition') + '</NOBR> Runtime License that expires on <NOBR>' + _EXPIRATIONDATE + '</NOBR>.&nbsp;<button id="btn_manageLicense_resendRuntimeLicense" class="' + _buttonClass + '" onclick="resendRuntimeLicense(\'' + _ID + '\'); return false;">[Resend]</button>&nbsp;<button id="btn_manageLicense_editRuntimeLicense" class="' + _buttonClass + '" onclick="beginEditorLicenseManager(\'' + _ID + '\', \'' + _SID + '\', \'' + _USERNAME + '\'); return false;">[Edit]</button>' + ((_ISCOMMUNITYEDITION == 1) ? '&nbsp;<button id="btn_manageLicense_upgradeRuntimeLicense" class="' + _buttonClass + '" onclick="beginUpgradeRuntimeLicense(\'' + _ID + '\', \'' + _SID + '\', 12); return false;">[Upgrade: Annual]</button>&nbsp;<button id="btn_manageLicense_upgradeRuntimeLicense" class="' + _buttonClass + '" onclick="beginUpgradeRuntimeLicense(\'' + _ID + '\', \'' + _SID + '\', 999); return false;">[Upgrade: Perpetual]</button>' : '') + '</center></span>';
			if (iRow > 1) {
				_html += '<hr width="50%" color="blue">';
			}
		}
	};

	nRecs = ((nRecs != null) ? nRecs : -1);
	if (!!qStats) {
		if (!!argsDict) {
			if (!!qData1) {
				qData1.iterateRecObjs(searchForStatusRecs);
				qData1.iterateRecObjs(searchForLicenseRecs);

				oGuiActions.popAllButtons();
				
				if (!!oDiv) oDiv.innerHTML = '';
				if (_STATUSMSG.length > 0) {
					if (!!oDiv) oDiv.innerHTML = '<span class="errorStatusBoldClass"><br><center>' + _STATUSMSG + '</center></span>';
				} else {
					if (!!oDiv) {
						_html += '<br><div id="div_manageLicense_editorRuntimeLicense" style="display: none;"><b>Email Address:</b>&nbsp;<input type="text" id="input_manageLicense_editorEmailAddress" class="textClass" size="30" maxlength="255" onkeyup="if (!!validateManageLicensesEditEmailAddrs) { validateManageLicensesEditEmailAddrs() }; simulateEnterKeyForEditLicensesActions(event);"><br><button id="btn_manageLicense_editorSubmit" name="btn_manageLicense_editorSubmit" class="' + _buttonClass + '" onclick="performSubmitEditedEmailAddress(\'' + this.name + '\'); return false;">[Submit]</button></div>';
						_html += '<br><div id="div_manageLicense_statusRuntimeLicense" style="display: none;"></div>';
						_html += '<br><div id="div_manageLicense_upgradeRuntimeLicense" style="display: none;"></div>';
						oDiv.innerHTML = '<div style="overflow: auto; height: 200px; max-height: 200px; margin-left: 15px;">' + _html + '</div>';
					}
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
