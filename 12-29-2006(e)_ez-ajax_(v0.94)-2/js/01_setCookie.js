// 01_setCookie.js

function ezSetCookie(name, value, path) {
	return document.cookie=name+"="+escape(value)+"; path="+path;
}

