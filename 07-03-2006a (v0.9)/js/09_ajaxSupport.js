function initJSQ(qryObjName, columnList) {
	var s_code = qryObjName + ' = -1;';
	var qryObj = eval(s_code);
	try { eval(qryObjName + ' = ((' + qryObjName + ') ? object_destructor(' + qryObjName + ') : null)'); } catch(e) { } finally { };
	eval(qryObjName + " = QObj.get$((columnList) ? columnList : '')");
}

