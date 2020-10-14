/*
 geonosis_obj.js -- GeonosisObj
 
	WARNING:	This object contains or holds onto references to functions that are contained within the body of
				other functions which might result in accidental closures that need to be freed or a memory leak
				may result.  Make sure you are using the destructor method to properly release all objects being
				referenced by every instance of this object in order to avoid any possible memory leak problems.
*/

ezGeonosisObj = function(id){
	this.id = id;				// the id is the position within the global GeonosisObj.$ array
};

ezGeonosisObj.$ = [];

ezGeonosisObj.get$ = function() {
	// the object.id is the position within the array that holds onto the objects...
	var instance = ezGeonosisObj.$[ezGeonosisObj.$.length];
	if(instance == null) {
		instance = ezGeonosisObj.$[ezGeonosisObj.$.length] = new ezGeonosisObj(ezGeonosisObj.$.length);
	}
	return instance;
};

ezGeonosisObj.i = function() {
	return ezGeonosisObj.get$(); // this is an alias that aids the transmission of code from the server to the client...
};

ezGeonosisObj.remove$ = function(id) {
	var ret_val = false;
	if ( (id > -1) && (id < ezGeonosisObj.$.length) ) {
		var instance = ezGeonosisObj.$[id];
		if (!!instance) {
			ezGeonosisObj.$[id] = object_destructor(instance);
			ret_val = (ezGeonosisObj.$[id] == null);
		}
	}
	return ret_val;
};

ezGeonosisObj.remove$s = function() {
	var ret_val = true;
	for (var i = 0; i < ezGeonosisObj.$.length; i++) {
		ezGeonosisObj.remove$(i);
	}
	ezGeonosisObj.$ = [];
	return ret_val;
};

ezGeonosisObj.searchInstancesForObjects = function(datum, selector, use_qData, recNum) {
	var ar = [];
	var oO = -1;
	use_qData = ((use_qData == true) ? use_qData : false);

	function searchRecord(_ri, _dict, _rowCntName) {
		var i = -1;
		var _data = '';
		
		try {
			_data = _dict.getValueFor(selector);
		} catch(e) {
		} finally {
		}

		if (_data == datum) {
			ar.push(_dict.asQueryString());
		}
	};

	var i = -1;
	for (i = 0; i < ezGeonosisObj.$.length; i++) {
		oO = ((use_qData) ? ezGeonosisObj.$[i].qData : ezGeonosisObj.$[i].qAttrs);
		if (!!oO) {
			try {
				oO.iterateRecObjs(anyErrorRecords);
				if (!bool_isAnyErrorRecords) {
					if (recNum != null) {
						oO.QuerySetCell(selector, datum, recNum + 1); // query obj's use row 0 for the column names but data begins on row 1...
					} else {
						oO.iterateRecObjs(searchRecord);
					}
				}
			} catch(e) {
			//	doAJAX_func('performGetAttributesForOBJECT', 'handleGetAttributesForOBJECT(' + oAJAXEngine.js_global_varName + ');', '&' + selector + '=' + datum + '&use_qData=' + use_qData);
			//	alert('Programming Error: (101) Undefined use_qData (' + use_qData + ') for selector (' + selector + ') and datum (' + datum + ').');
			} finally {
			}
		} else {
			alert('Programming Error: (102) Undefined use_qData (' + use_qData + ') for selector (' + selector + ') and datum (' + datum + ').');
		}
	}

	var aDict = ezDictObj.get$();
	aDict.bool_returnArray = true;
	for (i = 0; i < ar.length; i++) {
		aDict.fromSpec(ar[i]);
	}

	return aDict;
};

ezGeonosisObj.searchInstancesForClassName = function(aClassName) {
	return ezGeonosisObj.searchInstancesForObjects(aClassName, 'CLASSNAME', true);
};

ezGeonosisObj.searchInstancesForObjectID = function(anID) {
	return ezGeonosisObj.searchInstancesForObjects(anID, 'OBJECTID', false);
};

ezGeonosisObj.searchInstancesForID = function(anID) {
	return ezGeonosisObj.searchInstancesForObjects(anID, 'ID', true);
};

ezGeonosisObj.prototype = {
	id : -1,
	qData : -1,
	qAttrs : -1,
	toString : function() {
		function toStr() {
			var s = '[';

			s += "qData = {" + this.qData.toString() + "}" + '\n';
			s += "qAttrs = {" + this.qAttrs.toString() + "}" + '\n';

			s += ']';
			return s;
		}
		var s = 'id = [' + this.id + ']\n' + toStr();
		return s;
	},
	init : function() {
		this.qData = -1;
		this.qAttrs = -1;
		return this;
	},
	destructor : function() {
		if (this.qData != -1) this.qData.destructor();
		if (this.qAttrs != -1) this.qAttrs.destructor();
		return (this.id = ezGeonosisObj.$[this.id] = this.qData = this.qAttrs = null);
	},
	dummy : function() {
		return false;
	}
};
