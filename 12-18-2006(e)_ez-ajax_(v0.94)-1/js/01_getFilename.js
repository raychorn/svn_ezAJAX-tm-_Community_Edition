// 01_getFilename.js

function ezGetFilename() {
	var ar = window.location.href.split('?');
	var ar2 = ar[0].split('#');
	var ar3 = ar2[0].split('/');
	var f = ar3[ar3.length - 1];
	return ((f.length == 0) ? '/' : f);
}

