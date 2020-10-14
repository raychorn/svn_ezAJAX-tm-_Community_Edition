function gamesRequiresUserAccountBlock() {
	alert('Access to our Games requires a valid User Account and the user must be logged-in.  Kindly Register for a User Account or Login to begin playing.');
	var oBtn = _$('btn_registerButton');
	if (!!oBtn) {
		oBtn.onclick();
	}
}

function downloadsRequiresPremiumBlock() {
	alert('Access to Downloads requires a Premium Subscription.');
	var oBtn = _$('btn_purchasePremiumButton');
	if (!!oBtn) {
		oBtn.onclick();
	}
}

function sampleAppsRequiresLoginBlock() {
	alert('Access to Sample Apps requires a User Account and the user to be logged-in.  Kindly Register for a User Account or Login to Demo our Sample AJAX Apps.');
	var oBtn = _$('btn_loginButton');
	if (!!oBtn) {
		oBtn.onclick();
	}
}

function displayPopUpAtForDiv(oObj, anchorPos) {
	if (!!oObj) {
		oObj.style.position = const_absolute_style;
		if ( (!!anchorPos) && (!!anchorPos.x) ) oObj.style.left = (anchorPos.x - 310) + "px";
		if ( (!!anchorPos) && (!!anchorPos.y) ) oObj.style.top = (anchorPos.y - 165) + "px";
		oObj.style.display = ((oObj.style.display.length == 0) ? const_inline_style : ((oObj.style.display == const_none_style) ? const_inline_style : const_none_style));
	}
	return oObj;
}

function _validateUserAccountName(oObj, btnObj) {
	var i = -1;
	var _f2Any = false;
	if (!!oObj) {
		var _f = oObj.value.search(/^[a-zA-Z0-9._%-]+@[a-zA-Z0-9-]+\.(?:[a-zA-Z]{2}|com|org|net|biz|info|cc|ws|us|tv)$/);
		var ar = js_invalidEmailDomains.split(',');
		for (i = 0; i < ar.length; i++) {
			_f2Any = _f2Any || ( (ar[i].length > 0) && (oObj.value.indexOf(ar[i]) != -1) );
		}
		if (!!btnObj) btnObj.disabled = ( (_f == -1) || (_f2Any) ); 
		if ( (_f == -1) || _f2Any ) {
			oObj.style.border = 'thin solid red';
		} else {
			oObj.style.border = 'thin solid lime';
		}
		return (( (_f == -1) || (_f2Any) ) ? true : false); 
	};
	return false;
}

function validateConactUsUserEmailAddrs(oInput, btnID) {
	_validateUserAccountName(oInput,_$(btnID));
}

function isValidatedRegisterUsersName() {
	var i = -1;
	var isValid = true; 
	var obj = $('register_input_yourname'); 
	var otherObj = $('register_input_username');
	var btnObj = $('button_registerSubmit'); 
	var matchObj = $('div_password_matches');
	if ( (!!obj) && (!!btnObj) && (!!otherObj) && (!!matchObj) ) { 
		if (obj.value.length > 0) {
			var ar = obj.value.split(' '); 
			for (i = 0; i < ar.length; i++) {
				ar[i] = ar[i].charAt(0).toUpperCase() + ar[i].substring(1, ar[i].length).toLowerCase();
			}
			obj.value = ar.join(' ');
			isValid = (((ar.length == 2) && (ar[0].ezTrim().length > 0) && (ar[1].ezTrim().length > 0)) ? false : true); 
		}
		var x = otherObj.style.border;
		var b = ( (x.length == 0) || (x.toString().indexOf('red') != -1) || (matchObj.innerHTML.indexOf('Matches') == -1) );
		btnObj.disabled = (((isValid) || (b)) ? true : false); 
		obj.style.border = ((isValid) ? 'thin solid red' : 'thin solid lime'); 
	}; 
	return isValid;
}

var stack_displayContactUsContentIn = [];

function performContactUsAJAXAction(actionID, addrObj, msgObj, toEmailAddrs) {
	actionID = ((actionID != null) ? actionID : '');
	toEmailAddrs = ((toEmailAddrs != null) ? toEmailAddrs : '');
	if ( (!!addrObj) && (!!msgObj) ) {
		displayPopUpAtForDiv(_$(stack_displayContactUsContentIn.pop()));
		if (toEmailAddrs.length > 0) {
			ezAJAXEngine.$[0].doAJAX(actionID, 'handlePerformContactUsAJAXAction', 'emailAddress', addrObj.value, 'emailMessage', msgObj.value, 'toEmailAddrs', toEmailAddrs);
		} else {
			ezAJAXEngine.$[0].doAJAX(actionID, 'handlePerformContactUsAJAXAction', 'emailAddress', addrObj.value);
		}
	}
}

function simulateEnterKeyForContactUsActions(evt, btnID) {
	var oBtn = _$(btnID); 
	if (!!oBtn) { 
		try {
			if ( (evt != null) && ((typeof evt) == const_object_symbol) && (evt.keyCode == 13) ) { 
				if (typeof oBtn.onclick == const_function_symbol) oBtn.onclick(); 
			} 
		} catch(e) {
			if (typeof oBtn.onclick == const_function_symbol) oBtn.onclick(); 
		} finally {
		}
	} else { 
		alert('ERROR: Programming Error - Unable to fetch the submit button object in "simulateEnterKeyForContactUsActions()".'); 
	};
}

function _displayContactUsContentIn(oObj, actionID, toEmailAddrs, bool_optInOnly) {
	var _html = '';
	actionID = ((!!actionID) ? actionID : '');
	bool_optInOnly = ((bool_optInOnly != null) ? bool_optInOnly : false);
	if (!!oObj) {
		var _button_submit_contactUs_panel = 'button_submit_contactUs_panel_' + ezUUID$();
		_html += '<table width="350px" border="1" bgcolor="#FFFFA8" cellpadding="-1" cellspacing="-1">';
		_html += '<tr bgcolor="silver">';
		_html += '<td>';
		_html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
		_html += '<tr>';
		_html += '<td width="90%" align="center" valign="top">';
		_html += ((bool_optInOnly) ? '<span class="normalBoldBluePrompt">Opt-In for Monthly Newsletters</span>' : '<span class="normalBoldBluePrompt">Contact Us at ' + toEmailAddrs + '</span>');
		_html += '</td>';
		_html += '<td width="*" align="center" valign="top">';
		var _button_dismiss_contactUs_panel = 'button_dismiss_contactUs_panel_' + ezUUID$();
		_html += '<input type="Button" id="' + _button_dismiss_contactUs_panel + '" class="buttonClass" value="[X]" onclick="displayPopUpAtForDiv(_$(stack_displayContactUsContentIn.pop())); return false;">';
		_html += '</td>';
		_html += '</tr>';
		_html += '</table>';
		_html += '</td>';
		_html += '</tr>';
		_html += '<tr>';
		_html += '<td>';
		_html += '<table width="100%" cellpadding="-1" cellspacing="-1">';
		_html += '<tr>';
		_html += '<td width="20%" align="left" valign="top">';
		_html += '<span class="normalBoldBluePrompt">Your Email Address:</span>';
		_html += '</td>';
		_html += '<td width="*" align="left" valign="top">';
		var _input_emailAddress = 'input_emailAddress_' + ezUUID$();
		if (bool_optInOnly) {
			_html += '<input id="' + _input_emailAddress + '" value="yourEmail@yourDomain.com" size="50" maxlength="255" onfocus="this.value = \'\';" onkeyup="if (!!validateConactUsUserEmailAddrs) { validateConactUsUserEmailAddrs(this, \'' + _button_submit_contactUs_panel + '\'); }; simulateEnterKeyForContactUsActions(event, \'' + _button_submit_contactUs_panel + '\');">';
		} else {
			_html += '<input id="' + _input_emailAddress + '" value="yourEmail@yourDomain.com" size="50" maxlength="255" onfocus="this.value = \'\';" onkeyup="if (!!validateConactUsUserEmailAddrs) { validateConactUsUserEmailAddrs(this, \'' + _button_submit_contactUs_panel + '\'); };">';
		}
		_html += '</td>';
		_html += '</tr>';

		_html += '<tr>';
		_html += '<td>';
		_html += '<span class="normalBoldBluePrompt" style="display: ' + ((!bool_optInOnly) ? const_inline_style : const_none_style) + '">Your Message:</span>';
		_html += '</td>';
		_html += '<td>';
		var _textarea_yourMessage = 'textarea_yourMessage_' + ezUUID$();
		_html += '<textarea id="' + _textarea_yourMessage + '" cols="50" rows="3" style="display: ' + ((!bool_optInOnly) ? const_inline_style : const_none_style) + '"></textarea>';
		_html += '</td>';
		_html += '</tr>';
		_html += '<tr>';
		_html += '<td colspan="2">';
		_html += '<span class="normalBoldBluePrompt" style="display: ' + ((!bool_optInOnly) ? const_inline_style : const_none_style) + '">Kindly allow 24-48 hours for a response.</span>';
		_html += '</td>';
		_html += '</tr>';
		_html += '<tr>';

		_html += '<td colspan="2">';
		_html += '<input type="Button" id="' + _button_submit_contactUs_panel + '" disabled class="buttonClass" value="[Submit]" onclick="performContactUsAJAXAction(\'' + actionID + '\', _$(\'' + _input_emailAddress + '\'), _$(\'' + _textarea_yourMessage + '\'), \'' + toEmailAddrs + '\'); return false;">';

		_html += '</td>';
		_html += '</tr>';
		_html += '</table>';
		_html += '</td>';
		_html += '</tr>';
		_html += '</table>';
		try {
			if (oObj.innerHTML.length > 0) {
				ezFlushCache$(oObj);
			}
		} catch(e) {
		} finally {
		}
		oObj.innerHTML = _html;
		displayPopUpAtForDiv(_$(stack_displayContactUsContentIn[0]));
	}
}

function _displayContactUsContentIn_(anchorId, id, actionID, toEmailAddrs, yDelta, bool_optInOnly) {
	var oObj = _$(id);
	yDelta = ((yDelta != null) ? yDelta : 0);
	bool_optInOnly = ((bool_optInOnly != null) ? bool_optInOnly : 0);
	if (!!oObj) {
		stack_displayContactUsContentIn.push(id);
		var anchorPos = ezAnchorPosition.get$(anchorId);
		_displayContactUsContentIn(oObj, actionID, toEmailAddrs, bool_optInOnly);
		oObj.style.position = const_absolute_style;
		var _ht = ezClientHeight();
		oObj.style.top = ((((anchorPos.y + 200) > _ht) ? (_ht - 300) : anchorPos.y) + 20) + 'px';
		oObj.style.zIndex = 1;
		if (!browser_is_ie) {
			oObj.style.top = (ezClientHeight() - 150 + yDelta) + 'px';
		}
		var deltaX = 0;
		var oPos = ezAnchorPosition.get$('anchor_imageLogoRight');
		oObj.style.left = (oPos.x - 500) + 'px';
		ezAnchorPosition.remove$(oPos.id);
		ezAnchorPosition.remove$(anchorPos.id);
	}
}

function displayContactUsContentIn(anchorId, id, actionID, toEmailAddrs, yDelta) {
	return _displayContactUsContentIn_(anchorId, id, actionID, toEmailAddrs, yDelta);
}

function displayOptInContentIn(anchorId, id, actionID, toEmailAddrs, yDelta) {
	return _displayContactUsContentIn_(anchorId, id, actionID, toEmailAddrs, yDelta, true);
}

function handlePerformContactUsAJAXAction(qObj, nRecs, qStats, argsDict, qData1) {
	var _id = '';
	var i = -1;
	var n = -1;
	var _OPTFLAG = '';

	function searchForStatusRecs(_ri, _dict, _rowCntName) {
		_OPTFLAG = _dict.getValueFor('OPTFLAG');
		_OPTFLAG = ((_OPTFLAG == null) ? 0 : _OPTFLAG);
	};

	nRecs = ((nRecs != null) ? nRecs : -1);
	if (!!qStats) {
		if (!!argsDict) {
			if (!!qData1) {
				qData1[0].iterateRecObjs(searchForStatusRecs);

				var _toEmailAddrs = argsDict.getValueFor('toEmailAddrs');
				if (_toEmailAddrs == null) {
					alert('Your email address has been ' + ((_OPTFLAG == 1) ? 'added' : 'removed') + ' to our Newsletter Mailing list.');
				} else {
					var toDesc = 'Development Team';
					if (_toEmailAddrs.toLowerCase() == 'sales@ez-ajax.com') {
						toDesc = 'Sales Team';
					} else if (_toEmailAddrs.toLowerCase() == 'investors@ez-ajax.com') {
						toDesc = 'Investor Relations Team';
					} else if (_toEmailAddrs.toLowerCase() == 'affiliates@ez-ajax.com') {
						toDesc = 'Affiliate Relations Team';
					} else if (_toEmailAddrs.toLowerCase() == 'support@ez-ajax.com') {
						toDesc = 'Support Team';
					}
					alert('Your message has been sent to the ezAJAX(tm) ' + toDesc + '.  Kindly allow 24-48 hours for a response.');
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
		
function validateLoginUserName() {
	_validateUserAccountName($('login_input_username'),$('button_loginSubmit'));
}

function validateForgotPasswordUserName() {
	_validateUserAccountName($('input_forgot_username'),$('button_forgotPwdSubmit'));
}

function isValidatedRegisterUserName() {
	return _validateUserAccountName($('register_input_username'));
}

function disableWidget(obj, bool) {
	if (obj != null) {
		obj.disabled = ((bool == true) ? true : false);
	}
}

function disableWidgetByID(id, bool) {
	var obj = -1;
	obj = $(id);
	disableWidget(obj, bool);
}

function analyzePassword(s) {
	var i = -1;
	var ch = -1;
	var alphaCount = 0;
	var numericCount = 0;
	var specialCount = 0;
	var o = new Object();
	
	for (i = 0; i < s.length; i++) {
		ch = s.charCodeAt(i);
		alphaCount += (((ch >= 65) && (ch <= 90)) ? 1 : 0);
		alphaCount += (((ch >= 97) && (ch <= 122)) ? 1 : 0);
		numericCount += (((ch >= 48) && (ch <= 57)) ? 1 : 0);
		specialCount += (((ch >= 33) && (ch <= 47)) ? 1 : 0);
		specialCount += (((ch >= 58) && (ch <= 64)) ? 1 : 0);
		specialCount += (((ch >= 123) && (ch <= 126)) ? 1 : 0);
	}
	o.sInput = s;
	o.alphaCount = alphaCount;
	o.numericCount = numericCount;
	o.specialCount = specialCount;
	return o;
}

function _isWeakPassword(ap) {
	return ( ( (ap.alphaCount == 0) || (ap.numericCount == 0) || (ap.specialCount == 0) ) && (ap.sInput.ezTrim().length < 8) );
}

function isWeakPassword(s) {
	var ap = analyzePassword(s);
	
	return _isWeakPassword(ap);
}

function _isMediumPassword(ap) {
	return ( ( ( (ap.alphaCount > 0) && (ap.numericCount > 0) ) || ( (ap.alphaCount > 0) && (ap.specialCount > 0) ) && (ap.sInput.ezTrim().length > 4) ) || ( (ap.sInput.ezTrim().length >= 8) && (ap.sInput.ezTrim().length < 12) ) );
}

function isMediumPassword(s) {
	var ap = analyzePassword(s);
	
	return (_isWeakPassword(ap) && _isMediumPassword(ap));
}

function _isStrongPassword(ap) {
	return ( ( (ap.alphaCount > 0) || (ap.numericCount > 0) || (ap.specialCount > 0) ) && (ap.sInput.ezTrim().length >= 12) );
}

function isStrongPassword(s) {
	var ap = analyzePassword(s);
	
	return (_isMediumPassword(ap) && _isStrongPassword(ap));
}

function isPasswordValid(s) {
	return (s.ezTrim().length > 0);
}
				
function validatePassword(s, sOther) {
	var bool_isPasswordValid = isPasswordValid(s);
	var bool_isOtherPasswordPresent = (sOther != null);
	var bool_isOtherPasswordValid = (((bool_isOtherPasswordPresent) && (s == sOther)) ? true : false);
	var ap = -1;
	var cObj1 = $('register_input_password');
	var cObj2 = $('register_input_confirmpassword');
	var bool_shallSubmitBtnBeDisabled = true;
	var bool_passwordsMatches = false;

	var cObj = $((bool_isOtherPasswordPresent) ? 'span_password_matches' : 'span_password_rating');
	var tdObj = $((bool_isOtherPasswordPresent) ? 'td_password_matches' : 'td_password_rating');
	try {
		if (bool_isPasswordValid) {
			// rate the password...
			ap = analyzePassword(s);
			// display the rating...
			if ( (cObj != null) && (tdObj != null) ) {
				if (bool_isOtherPasswordPresent) {
					if (s == sOther) {
						if (AJAXEngine.browser_is_ie) {
							tdObj.style.background = 'lime';
						} else {
							tdObj.style.border = 'thin solid lime;';
						}
						cObj.innerHTML = '(Matches)';
						disableWidgetByID('div_password_matches', false);
						bool_passwordsMatches = true;
					} else {
						tdObj.style.background = '';
						cObj.innerHTML = '(Does Not Match)';
						disableWidgetByID('div_password_matches', true);
						bool_passwordsMatches = false;
					}
				} else {
					if (_isStrongPassword(ap)) {
						if (AJAXEngine.browser_is_ie) {
							tdObj.style.background = 'lime';
						} else {
							tdObj.style.border = 'thin solid lime;';
						}
						cObj.innerHTML = '(Strong)';
						disableWidgetByID('div_password_rating', false);
					} else if (_isMediumPassword(ap)) {
						if (AJAXEngine.browser_is_ie) {
							tdObj.style.background = 'cyan';
						} else {
							tdObj.style.border = 'thin solid cyan;';
						}
						cObj.innerHTML = '(Medium)';
						disableWidgetByID('div_password_rating', false);
					} else if (_isWeakPassword(ap)) {
						if (AJAXEngine.browser_is_ie) {
							tdObj.style.background = 'yellow';
						} else {
							tdObj.style.border = 'thin solid yellow;';
						}
						cObj.innerHTML = '(Weak)';
						disableWidgetByID('div_password_rating', false);
					} else {
						tdObj.style.background = '';
						cObj.innerHTML = '(Not Rated)';
						disableWidgetByID('div_password_rating', true);
					}
				}
			}
		} else {
			if ( (cObj != null) && (tdObj != null) ) {
				if (bool_isOtherPasswordPresent) {
					tdObj.style.background = '';
					cObj.innerHTML = '(Does Not Match)';
					disableWidgetByID('div_password_matches', true);
					bool_passwordsMatches = false;
				} else {
					tdObj.style.background = '';
					cObj.innerHTML = '(Not Rated)';
					disableWidgetByID('div_password_rating', true);
				}
			}
		}

		bool_shallSubmitBtnBeDisabled = true;
		if ( (cObj1 != null) && (cObj2 != null) ) {
			bool_shallSubmitBtnBeDisabled = ( (cObj1.value.ezTrim().length > 0) && (cObj2.value.ezTrim().length > 0) );
		}

		if ( (bool_shallSubmitBtnBeDisabled == false) || (bool_passwordsMatches == false) ) {
			var mObj = $('span_register_newUser_status_message');
			if ( (mObj != null) && (cObj1.value.length > 0) && (cObj2.value.length > 0) ) {
				if (bool_isOtherPasswordValid == false) {
					mObj.innerHTML = 'WARNING: Password is not valid because it does not match or it is the first password entered.';
				} else {
					mObj.innerHTML = 'WARNING: Password is not valid because it does not contain the following characters ("a"-"z" or "A"-"Z" and "0"-"9" and any special characters). PLS enter a valid password.';
				}
			}

			disableWidgetByID('button_registerSubmit', true);
			return true;
		} else {
			var mObj = $('span_register_newUser_status_message');
			if (mObj != null) {
				mObj.innerHTML = '';
			}
			
			disableWidgetByID('button_registerSubmit', isValidatedRegisterUserName());
			return false;
		}
	} catch(e) {
	} finally {
	}

	return true;
}

function receiveRegisterData(msg) {
	var i = -1;
	var _html = '';
	var ar2 = [];
	var oObj = $('div_register_newUser_status');
	var fObj = $('body_register_newUser');
	if ( (!!oObj) && (!!fObj) ) {
		var ar = msg.split('&');
		for (i = 0; i < ar.length; i++) {
			ar2 = ar[i].split('=');
			if (ar2.length == 2) {
				if (ar2[0].toUpperCase() == 'statusMsg'.toUpperCase()) {
					_html += unescape(ar2[1]);
				} else if (ar2[0].toUpperCase() == 'showForm'.toUpperCase()) {
					fObj.style.display = ((ar2[1].toUpperCase() == 'true'.toUpperCase()) ? const_inline_style : const_none_style);
				}
			}
		}
		oObj.innerHTML = _html;
	}
}

function performSubmitRegisterForm(username, yourname, password, confirmpassword) {
	if ( (!!username) && (!!yourname) && (!!password) && (!!confirmpassword) ) {
		ezAJAXEngine.$[0].doAJAX('performSubmitRegisterForm', 'handleSubmitRegisterForm', 'username', username, 'yourname', yourname, 'password', password, 'confirmpassword', confirmpassword);
	}
}

function performSubmitLoginForm(username, password) {
	if ( (!!username) && (!!password) ) {
		ezAJAXEngine.$[0].doAJAX('performSubmitLoginForm', 'handleSubmitRegisterForm', 'username', username, 'password', password);
	}
}

function performSubmitForgotPasswordForm(username) {
	if (!!username) {
		ezAJAXEngine.$[0].doAJAX('performSubmitForgotPasswordForm', 'handleSubmitRegisterForm', 'username', username);
	}
}

function performUserLogoffAction() {
	ezAJAXEngine.$[0].doAJAX('performUserLogoffAction', 'handleSubmitRegisterForm');
}

function redirectBrowserToUrl(aURL) {
	if (!!aURL) {
		window.location.href = aURL;
	}
}
