<!--

/*
Configure menu styles below
NOTE: To edit the link colors, go to the STYLE tags and edit the ssm2Items colors
*/
YOffset=150; // no quotes!!
XOffset=0;
staticYOffset=30; // no quotes!!
slideSpeed=20 // no quotes!!
waitTime=100; // no quotes!! this sets the time the menu stays out for after the mouse goes off it.
menuBGColor="black";
menuIsStatic="yes"; //this sets whether menu should stay static on the screen
menuWidth=150; // Must be a multiple of 10! no quotes!!
menuCols=2;
hdrFontFamily="verdana";
hdrFontSize="2";
hdrFontColor="white";
hdrBGColor="#170088";
hdrAlign="left";
hdrVAlign="center";
hdrHeight="15";
linkFontFamily="Verdana";
linkFontSize="2";
linkBGColor="white";
linkOverBGColor="#FFFF99";
linkTarget="_top";
linkAlign="Left";
barBGColor="#444444";
barFontFamily="Verdana";
barFontSize="2";
barFontColor="white";
barVAlign="center";
barWidth=20; // no quotes!!
barText="SITE MENU"; // <IMG> tag supported. Put exact html for an image to show.

///////////////////////////

// ssmItems[...]=[name, link, target, colspan, endrow?] - leave 'link' and 'target' blank to make a header
ssmItems = [];
ssmItems.push(["Menu"]);
ssmItems.push(["What's New ?", "javascript:whatsNewText();", ""]);				// 1
ssmItems.push(["What is ezAJAX ?", "javascript:whatsIsText();", ""]);			// 2
ssmItems.push(["JSON Support", "javascript:jsonSupportText();", ""]);			// 3
ssmItems.push(["Features", "javascript:featuresText();", ""]);					// 4
ssmItems.push(["Installation", "javascript:installationText();", ""]);			// 5
ssmItems.push(["Runtime Licenses", "javascript:runtimeLicensesText();", ""]);	// 6
ssmItems.push(["Downloads", "javascript:downloadsText();", ""]);				// 7
ssmItems.push(["Docs and Guides", "javascript:downloadsDocsText();", ""]);		// 8
ssmItems.push(["Sample Apps", "javascript:sampleAppsText();", ""]);				// 9
ssmItems.push(["Demos & Tutorials", "javascript:downloadsText();", ""]);		// 10
ssmItems.push(["Support Forum", "javascript:supportForumText();", ""]);			// 11
ssmItems.push(["Contact Us", "javascript:contactUsText();", ""]);				// 12
//ssmItems.push(["FAQ", "http://www.dynamicdrive.com/faqs.htm", "", 1, "no"]); //create two column row
//ssmItems.push(["Email", "http://www.dynamicdrive.com/contact.htm", "",1]);
//ssmItems.push(["External Links", "", ""]);  //create header
//ssmItems.push(["JavaScript Kit", "http://www.javascriptkit.com", ""]);
//ssmItems.push(["Freewarejava", "http://www.freewarejava.com", ""]);
//ssmItems.push(["Coding Forums", "http://www.codingforums.com", ""]);

function handleOnClickSsmItems(i) {
	function checkMenuItem(oO, aBool) {
		aBool = ((aBool == true) ? aBool : false);
		if (!!oO) {
			var aStyle = ((!aBool) ? const_none_style : const_inline_style);
			oO.style.display = aStyle;
		}
	}
	var oO = -1;
	var oDiv = _$('div_anchor_ssmItems_' + i);
	if (!!oDiv) {
		var j = -1;
		var n = ssmItems.length;
		for (j = 0; j < n; j++) {
			oO = _$('div_anchor_ssmItems_' + j);
			checkMenuItem(oO, false);
		}
		checkMenuItem(oDiv, true);
	}
}

function handleOnClickSsmItemsByName(aName) {
	var j = -1;
	var n = ssmItems.length;
	for (j = 0; j < n; j++) {
		if (ssmItems[j][0] == aName) {
			return j;
		}
	}
	return -1;
}

buildMenu('/app/images/formz/');

//-->
