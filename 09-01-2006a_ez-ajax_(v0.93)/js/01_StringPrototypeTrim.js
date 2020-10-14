function ezTrim() {  
	var s = this.replace(/^[\s]+/,"");  
	s = s.replace(/[\s]+$/,"");  
	return s;
}

String.prototype.ezTrim = ezTrim;

