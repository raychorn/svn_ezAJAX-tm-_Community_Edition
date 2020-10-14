<cfparam name="bool_isServerLocal" type="boolean" default="False">

<cfset bool_canDebugHappen = false>  <!--- bool_isServerLocal AND 0 --->

<cfscript>
	Request.Geonosis_DSN = 'CMS';
	Request.Geonosis_DBname = 'CMS';
</cfscript>