<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfparam name="debugMode" type="string" default="false">
<cfif (NOT debugMode)>
	<cfcontent type="text/plain">
</cfif>

<cfset max_subcats = 25>

<cfset subcatLen = 24>

<cfset result = "">

<!--- initialize the category list --->
<cfset cats="">
<!--- initialize the counter --->
<cfset count=0>
<cfset cats_list = "">

<cftry>
	<cfscript>
		if ( (IsDefined("Session.qDynamicNewsData.qObj")) AND (IsQuery(Session.qDynamicNewsData.qObj)) ) {
			_sql_statement = "SELECT * FROM Session.qDynamicNewsData.qObj WHERE (ID IS NOT NULL) AND (CAT IS NOT NULL) AND (SUBCAT IS NOT NULL) AND (URL IS NOT NULL)";
			Request.commonCode.ezExecSQL('Request.qObj', '', _sql_statement);
			if ( (IsDefined("Request.qObj")) AND (IsQuery(Request.qObj)) ) {
				for (i = 1; i lte Request.qObj.recordCount; i = i + 1) {
					ar = ListToArray(Request.qObj.cat[i], '@');
					if (ArrayLen(ar) gt 1) {
						Request.qObj.cat[i] = ar[2];
					} else {
						Request.qObj.cat[i] = ar[1];
					}
				}
			}
		}
	</cfscript>

	<cfcatch type="Any">
		<cfif (debugMode)>
			<cfdump var="#cfcatch#" label="CF Error" expand="No">
		</cfif>
	</cfcatch>
</cftry>

<cfif (debugMode)>
	<cfdump var="#Request#" label="Request" expand="No">
</cfif>

<cfif (IsDefined("Request.qObj")) AND (IsQuery(Request.qObj))>
	<cfloop query="Request.qObj" startrow="1" endrow="#Request.qObj.recordCount#">
		<cfset aCategory = Request.qObj.cat>
		<cfif ListFindNoCase(cats_list, aCategory, "|") EQ 0>
			<cfset cats_list = ListAppend(cats_list, aCategory, "|")>
		</cfif>
	</cfloop>

	<cfloop index="theCategory" list="#cats_list#" delimiters="|">
		<!--- append the category to the category list --->
		<cfset cats=ListAppend(cats,theCategory,"|")>
		<!--- initialize the subcats list --->
		<cfset subcats="">
		<!--- initialize the urls list --->
		<cfset urls="">
		<cfquery name="qData" dbtype="query">
			SELECT * FROM Request.qObj WHERE (cat LIKE '#theCategory#')
		</cfquery>
		<cfscript>
			if ( (IsDefined("qData")) AND (IsQuery(qData)) ) {
				for (i = 1; i lte qData.recordCount; i = i + 1) {
					subcat = qData.subcat[i];
					subcats = ListAppend(subcats,subcat,"|");
					urls = ListAppend(urls,qData.url[i],"|");
				}
				result = "#result#&subcats#count#=#subcats#&urls#count#=#Trim(urls)#";
				count = IncrementValue(count);
			}
		</cfscript>
	</cfloop>
	<cfscript>
		ar = ListToArray(cats_list, '|');
		for (i = 1; i lte ArrayLen(ar); i = i + 1) {
			ar2 = ListToArray(ar[i], '@');
			if (ArrayLen(ar2) gt 1) {
				ar[i] = ar2[2];
			} else {
				ar[i] = ar2[1];
			}
		}
		cats_list = ArrayToList(ar, '|');
	</cfscript>
<cfelse>
	<cfset cat_mm = "#DateFormat(NOW(), "mm")#">
	<cfset cat_yyyy = "#DateFormat(NOW(), "yyyy")#">
	<cfset category = "#cat_mm#-#cat_yyyy#@#DateFormat(NOW(), "mmm yyyy")#">
	<cfif ListFindNoCase(cats_list, category, "|") EQ 0>
		<cfset cats_list = ListAppend(cats_list, category, "|")>
	</cfif>

	<cfloop index="category" list="#cats_list#" delimiters="|">
		<cfset cat_mm = "#GetToken(category, 1, "-")#">
		<cfset cat_yyyy = "#GetToken(GetToken(category, 2, "-"), 1, "@")#">
		<cfset theCategory = GetToken(category, 2, "@")>
		<!--- append the category to the category list --->
		<cfset cats=ListAppend(cats,theCategory,"|")>
		<!--- initialize the subcats list --->
		<cfset subcats="">
		<!--- initialize the urls list --->
		<cfset urls="">
		<!--- create another loop for the subcategories --->
		<cfset subcat = "*** News Flash Updated !">
		<cfset subcats=ListAppend(subcats,subcat,"|")>
		<cfset urls=ListAppend(urls,1,"|")>
		<!--- end sub categories loop --->
		<!--- output the subcats and the urls --->
		<cfset result = "#result#&subcats#count#=#subcats#&urls#count#=#Trim(urls)#">
		<cfset count = IncrementValue(count)>
	</cfloop>
</cfif>

<cfoutput>#result#&cats=#cats_list#&loaded=1</cfoutput>