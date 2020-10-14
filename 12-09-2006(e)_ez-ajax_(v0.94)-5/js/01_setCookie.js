// 01_setCookie.js

function setCookie(name, value, path) {
	return document.cookie=name+"="+escape(value)+"; path="+path;
}

