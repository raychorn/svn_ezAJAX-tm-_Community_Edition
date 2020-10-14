// 01_getFilename.js

function getFilename() {
	var href=window.location.href;
	var file=href.substring(href.lastIndexOf("/")+1);
	return file.substring(0,file.indexOf("#")).substring(0,file.indexOf("?"));
}

