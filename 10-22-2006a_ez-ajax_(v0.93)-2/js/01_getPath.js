// 01_getPath.js

function _getPath() {
	var path = location.pathname;
	return path.substring(0, path.lastIndexOf("/")+1);
}