// 01_ezFullyQualifiedAppUrl.js

function ezFullyQualifiedAppUrl() {
	var ar = window.location.href.split('?');
	var ar2 = ar[0].split('/');
	ar2.pop();
	return ar2.join('/');
}
