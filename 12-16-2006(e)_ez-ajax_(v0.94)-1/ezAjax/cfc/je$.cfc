<cfcomponent displayname="javaScriptCode" output="No">
	<cftry>
		<cfinclude template="../../je1.cfm">

		<cfscript>
			aStruct = StructNew();
			aStruct.default = '_decontextmenu_,_01__,_01_StringPrototypeClipCaselessReplace_,_01_StringPrototypeFormatForWidth_,_01_StringPrototypeIsAlpha_,_01_StringPrototypeIsNumeric_,_01_StringPrototypeReplaceSubString_,_01_StringPrototypeStripCrLfs_,_01_StringPrototypeStripHTML_,_01_StringPrototypeStripSpacesBy2s_,_01_StringPrototypeStripTabs_,_01_StringPrototypeTrim_,_01_StringPrototypeZeroPadLeading_,_01_URLDecode_,_01_URLEncode_,_01___,_01_clientHt_,_01_clientWid_,_01_ezHex_,_01_int_,_01_misc_,_01_objectExplainer_,_01_object_destructor_,_01_setFocusSafely_,_01_uuid_,_01_ezElementPositonX_,_01_ezElementPositonY_,_02_StringPrototypeFilterInAlpha_,_02_StringPrototypeFilterInNumeric_,_02_StringPrototypeURLDecode_,_02_StringPrototypeURLEncode_,_02_flushCache_,_02_setFocusSafelyById_,_03_StringPrototypeStripIllegalChars_,_03_windowOnresize_,_03_windowOnscroll_,_04_displaySysMessages_,_05_handleEzAJAXDebugButtonClick_,_05_handleEzAJAXUseXmlHttpRequestButtonClick_,_05_handle_ajaxHelper2_onClick_,_05_jsErrorExplainer_,_06_DictObj_,_07_AJAXObj_,_07_AJaxContextObj_,_07_QObj_,_08_AJAXEngine_,_09_ajaxSupport_,_09_anyErrorRecords_,_09_doAJAX_func_,_09_initAJAXEngine_,_09_window_onUnload_,_09_window_onload_,_10_debugMenuSupport_';
			aStruct.styles = '_01_Style2String_,_01_getStyle_,_01_setStyle_,_01_toCamelCase_';
			aStruct.buttons = '_01_clickRadioButton_,_01_disableAllButtonsLike_,_01_simulateCheckBoxClick_,_09_getButtonLabelByObj_,_09_labelButtonByObj_';
			aStruct.selections = '_01_getSelectionsFromObj_';
			aStruct.cookies = '_01_deleteCookie_,_01_getCookie_,_01_getFilename_,_01_getPath_,_01_setCookie_';
			aStruct.loader = '_01_dynamicObjectLoader_';
			aStruct.events = '_01_events_';
			aStruct.ezcluster = '_01_ezClusterSupport_';
			aStruct.viewport = '_01_getScrollLeft_,_01_getScrollTop_,_01_getViewportHeight_,_01_getViewportWidth_';
			aStruct.urls = '_01_ezFirstFolderAfterDomainNameFromHref_,_01_ezFullyQualifiedAppPrefix_,_01_ezFullyQualifiedAppUrl_,_01_ezURLPrefixFromHref_';
			aStruct.arrays = '_01_insertArrayItem_,_01_locateArrayItems_,_01_removeArrayItem_,_01_removeEmptyItemsFromArray_,_02_ArrayPrototypeCfString_';
			aStruct.anchorPosition = '_02_AnchorPosition_';
			aStruct.guiActions = '_07_GUIActsObj_';
			aStruct.tabs = '_tabs__09_TabsObj_';
			aStruct.tabs_required = '#aStruct.loader#,#aStruct.anchorPosition#';
			aStruct.blogs = '_BlogSupport_09_support_';
			aStruct.shoppingCart = '_11_ShoppingCartObj_';
			aStruct.thoughtBubble = '_11_ThoughtBubbleObj_';
			aStruct.geonosis = '_12_geonosis_obj_';
			aStruct.tables = '_13_ezTable_';
			
			this._loadStream = '';
			
			function use(aName) {
				var i = -1;
				var s = '';
				var ar = ListToArray(aName, ',');
				var n = ArrayLen(ar);
				for (i = 1; i lte n; i = i + 1) {
					s = '';
					try {
						s = aStruct[aName];
					} catch (Any e) { };
					this._loadStream = ListAppend(this._loadStream, s, ',');
				}
				return this;
			}
			
			function getCode() {
				var i = -1;
				var ar = ListToArray(this._loadStream, ',');
				var n = ArrayLen(ar);
				var _code = '';
				for (i = 1; i lte n; i = i + 1) {
					try {
						_code = _code & ' /* ar[#i#] = [#ar[i]#] */ ';
						_code = _code & Trim(Evaluate( ar[i] & '()'));
					} catch (Any e) { };
				}
				return _code;
			}

			function init() {
				this._loadStream = '';
				use('default');
				return this;
			}
		</cfscript>
		
		<cfcatch type="Any">
		</cfcatch>
	</cftry>
</cfcomponent>
