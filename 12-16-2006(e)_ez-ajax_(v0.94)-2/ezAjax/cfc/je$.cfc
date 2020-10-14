<cfcomponent displayname="javaScriptCode" output="No">
	<cftry>
		<cfinclude template="../../je1.cfm">

		<cfscript>
			this.aStruct = StructNew();
			this._loadStream = '';
			this._isLoaded = '';
			
			function use(aName) {
				var i = -1;
				var j = -1;
				var s = '';
				var sNames = '';
				var ar = ListToArray(aName, ',');
				var n = ArrayLen(ar);
				for (i = 1; i lte n; i = i + 1) {
					sNames = '';
					try {
						sNames = this.aStruct[ar[i]]['required'];
					} catch (Any e) { };
					if (Len(sNames) gt 0) {
	//					writeOutput('2.1 sNames = [#sNames#]<br>');
						this.use(sNames);
					}

					s = '';
					try {
						s = this.aStruct[ar[i]];
						if (IsStruct(s)) {
							sNames = s.modules;
						} else {
							sNames = s;
						}
					} catch (Any e) { };
	//				writeOutput('1.1 aName = [#ar[i]#], i = [#i#]<br>');
					if (ListFindNoCase(this._isLoaded, ar[i], ',') eq 0) {
						if (Len(sNames) gt 0) {
							this._isLoaded = ListAppend(this._isLoaded, ar[i], ',');
						}
						this._loadStream = ListAppend(this._loadStream, sNames, ',');
					}
	//				writeOutput('1.2 this._isLoaded = [#this._isLoaded#], i = [#i#]<br>');
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
				this.aStruct.urlModules = '_01_ezFirstFolderAfterDomainNameFromHref_,_01_ezFullyQualifiedAppPrefix_,_01_ezFullyQualifiedAppUrl_,_01_ezURLPrefixFromHref_';
				this.aStruct.buttonModules = '_01_clickRadioButton_,_01_disableAllButtonsLike_,_01_simulateCheckBoxClick_,_09_getButtonLabelByObj_,_09_labelButtonByObj_';
				this.aStruct.eventModules = '_01_events_';
				this.aStruct.styleModules = '_01_Style2String_,_01_getStyle_,_01_setStyle_,_01_toCamelCase_';
				this.aStruct.selectionModules = '_01_getSelectionsFromObj_';
				this.aStruct.viewportModules = '_01_getScrollLeft_,_01_getScrollTop_,_01_getViewportHeight_,_01_getViewportWidth_';
				this.aStruct.arrayModules = '_01_insertArrayItem_,_01_locateArrayItems_,_01_removeArrayItem_,_01_removeEmptyItemsFromArray_,_02_ArrayPrototypeCfString_';
				this.aStruct.default = '_decontextmenu_,_01__,_01_StringPrototypeClipCaselessReplace_,_01_StringPrototypeFormatForWidth_,_01_StringPrototypeIsAlpha_,_01_StringPrototypeIsNumeric_,_01_StringPrototypeReplaceSubString_,_01_StringPrototypeStripCrLfs_,_01_StringPrototypeStripHTML_,_01_StringPrototypeStripSpacesBy2s_,_01_StringPrototypeStripTabs_,_01_StringPrototypeTrim_,_01_StringPrototypeZeroPadLeading_,_01_URLDecode_,_01_URLEncode_,_01___,_01_clientHt_,_01_clientWid_,_01_ezHex_,_01_int_,_01_misc_,_01_objectExplainer_,_01_object_destructor_,_01_setFocusSafely_,_01_uuid_,_01_ezElementPositonX_,_01_ezElementPositonY_,#this.aStruct.urlModules#,#this.aStruct.buttonModules#,#this.aStruct.eventModules#,#this.aStruct.styleModules#,#this.aStruct.selectionModules#,#this.aStruct.viewportModules#,#this.aStruct.arrayModules#,_02_StringPrototypeFilterInAlpha_,_02_StringPrototypeFilterInNumeric_,_02_StringPrototypeURLDecode_,_02_StringPrototypeURLEncode_,_02_flushCache_,_02_setFocusSafelyById_,_03_StringPrototypeStripIllegalChars_,_03_windowOnresize_,_03_windowOnscroll_,_04_displaySysMessages_,_05_handleEzAJAXDebugButtonClick_,_05_handleEzAJAXUseXmlHttpRequestButtonClick_,_05_handle_ajaxHelper2_onClick_,_05_jsErrorExplainer_,_06_DictObj_,_07_AJAXObj_,_07_AJaxContextObj_,_07_QObj_,_08_AJAXEngine_,_09_ajaxSupport_,_09_anyErrorRecords_,_09_doAJAX_func_,_09_initAJAXEngine_,_09_window_onUnload_,_09_window_onload_,_10_debugMenuSupport_';

				this.aStruct.ezDynamicObjectLoader = '_01_dynamicObjectLoader_';
				this.aStruct.ezAnchorPosition = '_02_AnchorPosition_';
				this.aStruct.ezThoughtBubbleObj = StructNew();
				this.aStruct.ezThoughtBubbleObj.modules = '_11_ThoughtBubbleObj_';
				this.aStruct.ezThoughtBubbleObj.required = 'ezDynamicObjectLoader,ezAnchorPosition'; // the reauired module is the name of the element not the contents of the element...

				this.aStruct.ezGUIActsObj = '_07_GUIActsObj_';
	
				this.aStruct.ezCookies = '_01_deleteCookie_,_01_getCookie_,_01_getFilename_,_01_getPath_,_01_setCookie_';
				this.aStruct.ezcluster = '_01_ezClusterSupport_';

				this.aStruct.ezTabsObj = StructNew();
				this.aStruct.ezTabsObj.modules = '_tabs__09_TabsObj_';
				this.aStruct.ezTabsObj.required = 'ezDynamicObjectLoader,ezAnchorPosition';

				this.aStruct.blogs = '_BlogSupport_09_support_';

				this.aStruct.ezShoppingCartObj = '_11_ShoppingCartObj_';
				this.aStruct.ezGeonosisObj = '_12_geonosis_obj_';
				this.aStruct.ezTables = '_13_ezTable_';

				this._loadStream = '';
				this._isLoaded = '';
				use('default');
				return this;
			}
		</cfscript>
		
		<cfcatch type="Any">
		</cfcatch>
	</cftry>
</cfcomponent>
