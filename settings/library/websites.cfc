<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateObject("component", "local")>
</CFIF>

<CFFUNCTION NAME="themes_main" ACCESS="public">

	<CFARGUMENT NAME="limit"    TYPE="numeric" REQUIRED="No"  DEFAULT="12" />
	<CFARGUMENT NAME="template" TYPE="string"  REQUIRED="No"  DEFAULT="products/websites/themes_main.cfm" />
	
	<!--- initialize variables --->
	<CFSET var themeResults = 0>
	<CFSET var totalrecords = 0>
	<CFSET var totalArr     = 0>
	<CFSET var sort         = getSort("id","desc")>

	<!--- param variables --->
	<CFSCRIPT>
		param("URL.category_id","numeric",0); // 0 = All, 1 = Standard, 2 = Premium
		param("URL.page","numeric",1);
		param("URL.sort","string","name ASC");
	</CFSCRIPT>

	<CFTRY>
		<CFQUERY NAME="themeResults" DATASOURCE="#dsn_read#">
			SELECT t.id, t.name
			FROM site_templates.template t
			WHERE t.portal_id IS NULL
				AND t.active = <CFQUERYPARAM VALUE="1" CFSQLTYPE="cf_sql_smallint">
			<CFIF URL.category_id GT 0>
				AND t.category_id = <CFQUERYPARAM VALUE="#URL.category_id#" CFSQLTYPE="CF_SQL_INTEGER">
			</CFIF>
			<CFIF sort NEQ "">ORDER BY #sort#</CFIF>
			<CFIF ARGUMENTS.limit GT 0>
				LIMIT #ARGUMENTS.limit#
				<CFIF URL.page GT 1>
					OFFSET #((URL.page - 1) * ARGUMENTS.limit)#
				</CFIF>
			</CFIF>
		</CFQUERY>
	
		<CFSET totalArr = ArrayNew(1)>

		<CFIF themeResults.recordCount GT 0>
			<CFQUERY NAME="totalrecords" DATASOURCE="#dsn_read#">
				SELECT COUNT(t.id) AS totalrecords
				FROM site_templates.template t
				WHERE t.portal_id IS NULL
					AND t.active = <CFQUERYPARAM VALUE="1" CFSQLTYPE="cf_sql_smallint">
				<CFIF URL.category_id GT 0>
					AND t.category_id = <CFQUERYPARAM VALUE="#URL.category_id#" CFSQLTYPE="CF_SQL_INTEGER">
				</CFIF>
			</CFQUERY>

			<CFSET totalArr[1] = totalrecords.totalrecords>
		</CFIF>

		<CFSET QueryAddColumn(themeResults,"totalrecords","integer",totalArr)>

		<CFCATCH TYPE="Any">
			<CFSET themeResults = QueryNew("id,name,totalrecords")>
		</CFCATCH>
	</CFTRY>

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>

<CFFUNCTION NAME="themes_details" ACCESS="public">
	
	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="products/websites/themes_details.cfm" />
	
	<!--- initialize variables --->
	<CFSET var templateResults = 0>
	<CFSET var colorResults    = 0>
	<CFSET var siteResults     = 0>
	<CFSET var colorDir        = "">
	<CFSET var colorList       = "">
	<CFSET var exceptionIdList = "1379">

	<CFSET var lib = StructNew()>
	
	<!--- param variables --->
	<CFSCRIPT>param('URL.id','numeric',0);</CFSCRIPT>
	
	<CFQUERY NAME="templateResults" DATASOURCE="#dsn_read#">
		SELECT id, name, root, '' AS colors, description, price, category_id, meta_title, meta_description, meta_keywords
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
			SELECT ts.id, ts.site_id, ts.color, s.site_url AS website, s.name
			FROM site_templates.template_site ts, site.site s, site_templates.template t
			WHERE ts.site_id           = s.id
				AND s.status = 1
				AND ts.template_id = <CFQUERYPARAM VALUE="#URL.id#" CFSQLTYPE="CF_SQL_INTEGER">
				AND s.id  NOT IN ( <CFQUERYPARAM VALUE="#exceptionIdList#" LIST="Yes" SEPARATOR="," CFSQLTYPE="CF_SQL_INTEGER"> )
				AND t.id = ts.template_id
				AND t.active = <CFQUERYPARAM VALUE="1" CFSQLTYPE="cf_sql_smallint">
			ORDER BY RANDOM()
			LIMIT 5
		</CFQUERY>

		<!--- set metas --->
		<CFSET lib["websiteMain"] = CreateObject("component","website.main")>
		<CFSET lib.websiteMain.setMetas(title=templateResults.meta_title,description=templateResults.meta_description,keywords=templateResults.meta_keywords)>

		<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">
	<CFELSE>
		<CF_DEFINITION TEXT="That theme was not found." TITLE="No Theme Found">
	</CFIF>

</CFFUNCTION>

</CFCOMPONENT>