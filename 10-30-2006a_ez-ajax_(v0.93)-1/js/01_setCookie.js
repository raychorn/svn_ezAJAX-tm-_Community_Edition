// 01_setCookie.js

function _setCookie(name, value, path) {
	return document.cookie=name+"="+escape(value)+"; path="+path;
}

