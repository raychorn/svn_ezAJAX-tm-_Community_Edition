// 01_getCookie.js

function getCookie(name) {
	var dc=document.cookie;
	var prefix=name+"=";
	var begin=dc.lastIndexOf(prefix);
	if(begin==-1) return null;
	var end=dc.indexOf(";", begin);
	if(end==-1) end=dc.length;
	return unescape(dc.substring(begin+prefix.length, end));
}

