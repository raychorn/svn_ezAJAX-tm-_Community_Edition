function handleEzAJAXUseXmlHttpRequestButtonClick(oBtn, _oAJAXEngine, boolConfirmOnly) {
	var s = ezButtonLabelByObj(oBtn);
	var bObj = _$('btn_hideShow_iFrame');
	boolConfirmOnly = ((boolConfirmOnly == true) ? boolConfirmOnly : false);
	if ( (!boolConfirmOnly) && (s.toUpperCase().indexOf('XMLHTTPREQUEST') == -1) ) {
		if (!boolConfirmOnly) {
			_oAJAXEngine.isXmlHttpPreferred = false;
		}
		ezLabelButtonByObj(oBtn, labelIFrame2XmlHttpRequestButton);
	} else { 
		if (!boolConfirmOnly) {
			_oAJAXEngine.isXmlHttpPreferred = true; 
			ezLabelButtonByObj(oBtn, labelXmlHttpRequest2IFrameButton); }; 
		}
		if (!!bObj) { 
			bObj.style.display = ((_oAJAXEngine.isXmlHttpPreferred) ? const_none_style : const_inline_style); 
		}
}
