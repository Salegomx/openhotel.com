<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateObject("component", "local")>
</CFIF>

<CFFUNCTION NAME="main" ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="websites_main.cfm" />
	
	<!--- initialize variables --->
	<CFSET var columnCount     = 4>
	<CFSET var width           = "25%">
	<CFSET var standardResults = "">
	<CFSET var premiumResults  = "">
	
	<CFQUERY NAME="standardResults" DATASOURCE="#dsn#">
		SELECT id, name
		FROM site_templates.template
		WHERE category_id = 1
		ORDER BY name ASC
	</CFQUERY>
	
	<CFQUERY NAME="premiumResults" DATASOURCE="#dsn#">
		SELECT id, name
		FROM site_templates.template
		WHERE category_id = 2
		ORDER BY name ASC
	</CFQUERY>

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>

<CFFUNCTION NAME="templates" ACCESS="public">

	<CFARGUMENT NAME="callId"     TYPE="string"  REQUIRED="Yes" DEFAULT="templates" />
	<CFARGUMENT NAME="categoryId" TYPE="numeric" REQUIRED="No"  DEFAULT="0" />
	<CFARGUMENT NAME="limit"      TYPE="numeric" REQUIRED="No"  DEFAULT="12" />
	<CFARGUMENT NAME="sort"       TYPE="string"  REQUIRED="No"  DEFAULT="name ASC" />
	<CFARGUMENT NAME="page"       TYPE="numeric" REQUIRED="No"  DEFAULT="1" />
	<CFARGUMENT NAME="ajax"       TYPE="boolean" REQUIRED="No"  DEFAULT="No" />
	<CFARGUMENT NAME="template"   TYPE="string"  REQUIRED="No"  DEFAULT="websites_templates_wrapper.cfm" />
	
	<!--- initialize variables --->
	<CFSET var columnCount     = 4>
	<CFSET var columnWidth     = (100 / columnCount)&"%">
	<CFSET var templateResults = 0>
	<CFSET var totalrecords    = 0>
	<CFSET var totalarray      = 0>

	<CFIF ARGUMENTS.ajax EQ "Yes">
		<!--- param variables --->
		<CFSCRIPT>
			param("URL.ajax","numeric",0);
			param("URL.call_id","string",ARGUMENTS.callId);
			param("URL.category_id","numeric",ARGUMENTS.categoryId); // 0 = All, 1 = Standard, 2 = Premium
			param("URL.limit","numeric",ARGUMENTS.limit);
			param("URL.page","numeric",ARGUMENTS.page);
			param("URL.sort","string",ARGUMENTS.sort);
		</CFSCRIPT>

		<CFIF URL.ajax EQ 0>
			<CFLOCATION URL="http://#REQUEST.domain#" ADDTOKEN="No" />
		</CFIF>

		<CFSET ARGUMENTS.callId     = URL.call_id>
		<CFSET ARGUMENTS.categoryId = URL.category_id>
		<CFSET ARGUMENTS.limit      = URL.limit>
		<CFSET ARGUMENTS.sort       = URL.sort>
		<CFSET ARGUMENTS.page       = URL.page>
	</CFIF>

	<CFTRY>
		<CFQUERY NAME="templateResults" DATASOURCE="#dsn_read#">
			SELECT t.id, t.name
			FROM site_templates.template t
			<CFIF ARGUMENTS.categoryId NEQ "">
				WHERE t.category_id = <CFQUERYPARAM VALUE="#ARGUMENTS.categoryId#" CFSQLTYPE="CF_SQL_INTEGER">
			</CFIF>
			<CFIF ARGUMENTS.sort NEQ "">ORDER BY #ARGUMENTS.sort#</CFIF>
			<CFIF ARGUMENTS.limit GT 0>
				LIMIT #ARGUMENTS.limit#
				<CFIF ARGUMENTS.page GT 1>
					OFFSET #((ARGUMENTS.page - 1) * ARGUMENTS.limit)#
				</CFIF>
			</CFIF>
		</CFQUERY>
	
		<CFSET totalarray = ArrayNew(1)>

		<CFIF templateResults.recordCount GT 0>
			<CFQUERY NAME="totalrecords" DATASOURCE="#dsn_read#">
				SELECT COUNT(t.id) AS totalrecords
				FROM site_templates.template t
				<CFIF ARGUMENTS.categoryId NEQ "">
					WHERE t.category_id = <CFQUERYPARAM VALUE="#ARGUMENTS.categoryId#" CFSQLTYPE="CF_SQL_INTEGER">
				</CFIF>
			</CFQUERY>

			<CFSET totalarray[1] = totalrecords.totalrecords>
		</CFIF>

		<CFSET QueryAddColumn(templateResults,"totalrecords","integer",totalarray)>

		<CFCATCH TYPE="Any">
			<CFSET templateResults = QueryNew("id")>
		</CFCATCH>
	</CFTRY>

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>

<CFFUNCTION NAME="details" ACCESS="public">
	
	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="websites_details.cfm" />
	
	<!-- initialize variables -->
	<CFSET var templateResults = 0>
	<CFSET var colorResults    = 0>
	<CFSET var siteResults     = 0>
	<CFSET var colorDir        = "">
	<CFSET var colorList       = "">
	<CFSET var exceptionIdList = "1379">
	
	<!--- param variables --->
	<CFSCRIPT>param('URL.id','numeric',0);</CFSCRIPT>
	
	<CFQUERY NAME="templateResults" DATASOURCE="#dsn_read#">
		SELECT id, name, root, '' AS colors, description, price, category_id
		FROM site_templates.template
		WHERE id = <CFQUERYPARAM VALUE="#URL.id#" CFSQLTYPE="cf_sql_integer">
	</CFQUERY>
	
	<CFIF templateResults.recordCount EQ 1>
		<!--- get colors --->
		<CFDIRECTORY ACTION="list" NAME="colorDir" DIRECTORY="#templateResults.root#">

		<CFQUERY NAME="colorResults" DBTYPE="query">
			SELECT name
			FROM colorDir
			WHERE type    = 'Dir'
				AND name != '_files'
		</CFQUERY>

		<CFSET colorList = ValueList(colorResults.name)>
		<CFSET QuerySetCell(templateResults,"colors",colorList)>
		
		<!--- get sites --->
		<CFQUERY NAME="siteResults" DATASOURCE="#dsn_read#">
			SELECT t.id, t.site_id, t.color, s.site_url AS website, s.name
			FROM site_templates.template_site t, site.site s
			WHERE t.site_id       = s.id
				AND s.status      = 1
				AND t.template_id = <CFQUERYPARAM VALUE="#URL.id#" CFSQLTYPE="CF_SQL_INTEGER">
				AND s.id     NOT IN ( <CFQUERYPARAM VALUE="#exceptionIdList#" LIST="Yes" SEPARATOR="," CFSQLTYPE="CF_SQL_INTEGER"> )
			ORDER BY RANDOM()
			LIMIT 5
		</CFQUERY>
	</CFIF>
	
	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>
	
</CFCOMPONENT>