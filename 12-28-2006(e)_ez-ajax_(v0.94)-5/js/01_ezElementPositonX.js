// 00_ezElementPositonX.js

function ezElementPositonX(obj) {
	var curleft = 0;
	if (!!obj) {
		if(obj.offsetParent)
			while (1) {
				curleft += obj.offsetLeft;
				if (!obj.offsetParent)
					break;
				obj = obj.offsetParent;
			}
		else if (obj.x)
			curleft += obj.x;
	}
	return curleft;
}
