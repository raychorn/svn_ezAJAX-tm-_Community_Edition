function clickTabsForPage(pg) {
	pg = ((pg == null) ? -1 : pg);
	var i = -1;
	var oDiv = -1;
	var oTab = -1;
	var oSpan = -1;
	for (i = 1; i <= 10; i++) {
		oDiv = document.getElementById('div_contentPage' + i);
		if (!!oDiv) {
			oTab = document.getElementById('tabSelected');
			oSpan = document.getElementById('spanTabSelected');
			if ( (!!oTab) && (!!oSpan) ) {
				oTab.id = oTab.name;
				oTab.name = null;
				oSpan.id = oSpan.name;
				oSpan.name = null;
			}
			oDiv.style.display = 'none';
		}
	}
	oDiv = document.getElementById('div_contentPage' + pg);
	if (!!oDiv) {
		oTab = document.getElementById('tab_' + pg);
		oSpan = document.getElementById('span_tab_' + pg);
		if ( (!!oTab) && (!!oSpan) ) {
			oTab.name = oTab.id;
			oTab.id = 'tabSelected';
			oSpan.name = oSpan.id;
			oSpan.id = 'spanTabSelected';
		}
		oDiv.style.display = 'inline';
	}
}
