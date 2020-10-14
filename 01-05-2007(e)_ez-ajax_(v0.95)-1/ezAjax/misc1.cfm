<cffunction name="isFoldable" access="private" returntype="string">
	<cfargument name="inStr" required="Yes" type="string">
	<cfscript>
		return ((Len(inStr) MOD 2) eq 0);
	</cfscript>
</cffunction>
