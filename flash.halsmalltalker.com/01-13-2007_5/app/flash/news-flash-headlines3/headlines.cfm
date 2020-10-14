<cfsetting enablecfoutputonly="Yes" showdebugoutput="No">
<cfset debugMode = false>
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

<cfscript>
	if ( (IsDefined("Session.qDynamicNewsData.qObj")) AND (IsQuery(Session.qDynamicNewsData.qObj)) ) {
		_sql_statement = "SELECT * FROM Session.qDynamicNewsData.qObj WHERE (ID IS NOT NULL) AND (ID <> '') AND (CAT IS NOT NULL) AND (CAT <> '') AND (SUBCAT IS NOT NULL) AND (SUBCAT <> '') AND (URL IS NOT NULL) AND (URL <> '')";
		Request.commonCode.ezExecSQL('Request.qObj', '', _sql_statement);
		if ( (IsDefined("Request.qObj")) AND (IsQuery(Request.qObj)) ) {
			cat_mm = "#DateFormat(NOW(), "mm")#";
			cat_yyyy = "#DateFormat(NOW(), "yyyy")#";
			for (i = 1; i lte Request.qObj.recordCount; i = i + 1) {
				if (ListLen(Request.qObj.cat[i], '@') lt 2) {
					Request.qObj.cat[i] = cat_mm & '-' & cat_yyyy & '@' & Request.qObj.cat[i];
				}
			}
		}
	}
</cfscript>

<cfif (debugMode)>
	<cfdump var="#Request#" label="Request" expand="No">
	<cfdump var="#Request.qObj#" label="Request.qObj" expand="No">
</cfif>

<cfif (IsDefined("Request.qObj")) AND (IsQuery(Request.qObj))>
	<cfloop query="Request.qObj" startrow="1" endrow="#Request.qObj.recordCount#">
		<cfset aCategory = Request.qObj.cat>
		<cfif ListFindNoCase(cats_list, aCategory, "|") EQ 0>
			<cfset cats_list = ListAppend(cats_list, aCategory, "|")>
		</cfif>
	</cfloop>

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
		<cfquery name="qData" dbtype="query">
			SELECT * FROM Request.qObj WHERE (cat LIKE '%@#theCategory#')
		</cfquery>
		<cfscript>
			if ( (IsDefined("qData")) AND (IsQuery(qData)) ) {
				for (i = 1; i lte qData.recordCount; i = i + 1) {
					subcat = qData.subcat[i];
					subcats = ListAppend(subcats,subcat,"|");
					urls = ListAppend(urls,qData.url[i],"|");
					result = "#result#&subcats#count#=#subcats#&urls#count#=#Trim(urls)#";
					count = IncrementValue(count);
				}
			}
		</cfscript>
	</cfloop>
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
		<cfset subcat = "News Flash Updated !">
		<cfset subcats=ListAppend(subcats,subcat,"|")>
		<cfset urls=ListAppend(urls,1,"|")>
		<!--- end sub categories loop --->
		<!--- output the subcats and the urls --->
		<cfset result = "#result#&subcats#count#=#subcats#&urls#count#=#Trim(urls)#">
		<cfset count = IncrementValue(count)>
	</cfloop>
</cfif>

<cfloop index="v" list="#result#" delimiters="&">
	<cfset varName = GetToken(v, 1, "=")>
	<cfset varValue = GetToken(v, 2, "=")>
	<cfset "#varName#" = "#varValue#">
</cfloop>

<cfset x_result = "">
<cfset x_cats = "">

<cfset xi = 0>
<cfset xj = 0>
<cfset xx = 0>
<cfset xi_len = ListLen(cats, "|")>
<cfif xi_len GT max_subcats>
	<cfset xi_len = max_subcats>
</cfif>
<cfloop index="c" list="#cats#" delimiters="|">
	<cfset subcats = Evaluate("subcats#xi#")>
	<cfset urls = Evaluate("urls#xi#")>
	<cfset xlen = ListLen(subcats, "|")>
	<cfif xlen GT max_subcats>
		<cfset x_maxnum = Int(Ceiling(xlen / max_subcats))>
		<cfset x_subcats = "">
		<cfset x_urls = "">
		<cfset x_i = 1>
		<cfset x_j = 1>
		<cfloop index="x" list="#subcats#" delimiters="|">
			<cfset x_subcats = "#x_subcats##x#">
			<cfset x_urls = '#x_urls##ListGetAt(urls, x_j, "|")#'>
			<cfif x_i EQ max_subcats>
				<cfif xx LT max_subcats>
					<cfset x_result = "#x_result#&subcats#xx#=#x_subcats#&urls#xx#=#Trim(x_urls)#">
				</cfif>
				<cfset xx = IncrementValue(xx)>
				<cfset xj = IncrementValue(xj)>
				<cfset x_cats = "#x_cats##c# (#xj# of #x_maxnum#)">
				<cfset x_subcats = "">
				<cfset x_urls = "">
				<cfset x_i = 1>
			<cfelseif x_j LT xlen>
				<cfset x_subcats = "#x_subcats#|">
				<cfset x_urls = '#x_urls#|'>
			</cfif>
			<cfset x_i = IncrementValue(x_i)>
			<cfset x_j = IncrementValue(x_j)>
		</cfloop>
		<cfif x_i GT 0>
			<cfset x_cats = "#x_cats#|">
			<cfif xx LT max_subcats>
				<cfset x_result = "#x_result#&subcats#xx#=#x_subcats#&urls#xx#=#Trim(x_urls)#">
			</cfif>
			<cfset xx = IncrementValue(xx)>
			<cfset xj = IncrementValue(xj)>
			<cfset x_cats = "#x_cats##c# (#xj# of #x_maxnum#)">
		</cfif>
	<cfelse>
		<cfif xx LT max_subcats>
			<cfset x_result = "#x_result#&subcats#xx#=#subcats#&urls#xx#=#Trim(urls)#">
		</cfif>
		<cfset xx = IncrementValue(xx)>
		<cfset x_cats = "#x_cats##c#">
	</cfif>
	<cfset xi = IncrementValue(xi)>
	<cfif xi LT xi_len>
		<cfset x_cats = "#x_cats#|">
	</cfif>
</cfloop>

<!--- output the cats --->
<cfoutput>#x_result#&cats=#x_cats#&loaded=1&</cfoutput>

