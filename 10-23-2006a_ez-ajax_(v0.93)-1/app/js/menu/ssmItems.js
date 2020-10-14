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
if (0) {
	ssmItems[0]=["Menu"] //create header
	ssmItems[1]=["What's New ?", "javascript:alert(999.1);", ""]
	
	ssmItems[2]=["FAQ", "http://www.dynamicdrive.com/faqs.htm", "", 1, "no"] //create two column row
	ssmItems[3]=["Email", "http://www.dynamicdrive.com/contact.htm", "",1]
	
	ssmItems[4]=["External Links", "", ""] //create header
	ssmItems[5]=["JavaScript Kit", "http://www.javascriptkit.com", ""]
	ssmItems[6]=["Freewarejava", "http://www.freewarejava.com", ""]
	ssmItems[7]=["Coding Forums", "http://www.codingforums.com", ""]
} else {
	ssmItems = [];
	ssmItems.push(["Menu"]);
	ssmItems.push(["What's New ?", "javascript:alert(999.1);", ""]);
	ssmItems.push(["FAQ", "http://www.dynamicdrive.com/faqs.htm", "", 1, "no"]); //create two column row
	ssmItems.push(["Email", "http://www.dynamicdrive.com/contact.htm", "",1]);
	ssmItems.push(["External Links", "", ""]);  //create header
	ssmItems.push(["JavaScript Kit", "http://www.javascriptkit.com", ""]);
	ssmItems.push(["Freewarejava", "http://www.freewarejava.com", ""]);
	ssmItems.push(["Coding Forums", "http://www.codingforums.com", ""]);
}

buildMenu();

//-->
