// 01_deleteCookie.js

function deleteCookie(name, path) {
	document.cookie=name+"="+"; path="+path+"; expires=Thu, 01-Jan-70 00:00:01 GMT";
	return getCookie(name);
}

