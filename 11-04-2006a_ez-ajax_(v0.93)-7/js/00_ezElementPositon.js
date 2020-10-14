// 00_ezElementPositon.js

function _ezElementPositonY(obj) {
	var curtop = 0;
	if (!!obj) {
		if (obj.offsetParent)
			while (1) {
				curtop += obj.offsetTop;
				if (!obj.offsetParent)
				  break;
				obj = obj.offsetParent;
			}
		else if (obj.y)
			curtop += obj.y;
	}
	return curtop;
}

