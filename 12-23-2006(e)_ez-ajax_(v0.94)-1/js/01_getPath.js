// 01_getPath.js

function ezGetPath() {
	var path = location.pathname;
	return path.substring(0, path.lastIndexOf("/")+1);
}