<cfparam name="bool_isServerLocal" type="boolean" default="#Request.commonCode.isServerLocal()#">

<cfset bool_canDebugHappen = bool_isServerLocal AND 0>  <!---  AND isDebugMode() --->
