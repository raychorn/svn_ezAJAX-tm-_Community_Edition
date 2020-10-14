<cfscript>
	Request.const_Cr = Chr(13);
	Request.const_Lf = Chr(10);
	Request.const_Tab = Chr(9);
	Request.const_CrLf = Request.const_Cr & Request.const_Lf;

	cf_const_Objects_symbol = '[?Objects]';
	cf_const_getCLASSES_symbol = 'getCLASSES';
	cf_const_chgAttrsForObject_symbol = 'chgAttrsForObject';
	cf_const_chgDataForObject_symbol = 'chgDataForObject';
	cf_const_getOBJECTS_symbol = 'getOBJECTS';
	cf_const_addClassDef_symbol = 'addClassDef';
	cf_const_dropClassDef_symbol = 'dropClassDef';
	cf_const_addObject_symbol = 'addObject';
	cf_const_dropObject_symbol = 'dropObject';
	cf_const_addAttribute_symbol = 'addAttribute';
	cf_const_dropAttribute_symbol = 'dropAttribute';
	cf_const_getAttributesForOBJECT_symbol = 'getAttributesForOBJECT';
	cf_const_getLinkedObjects_symbol = 'getLinkedObjects';
	cf_const_checkLinkedObjects_symbol = 'checkLinkedObjects';
</cfscript>