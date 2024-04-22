<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateObject("component", "local")>
</CFIF>

<CFSET THIS.master_site_id   = 604>
<CFSET THIS.master_domain    = "openhotel.com">
<CFSET THIS.master_templates = "/main/#THIS.master_domain#/html/templates">

<!--- ----------------------- --->
<!---   Dashboard Functions   --->
<!--- ----------------------- --->

<!--- Retrieves the Account Snippets for the Site Dashboard. --->
<CFFUNCTION NAME="main" HINT="Retrieves the Account Snippets for the Site Dashboard." ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="custom/snipapps/dashboard_snippets.cfm" />

	<!--- initialize variables --->
	<CFSET var snippetResults = "">
	<CFSET var columnCount    = 2>
	<CFSET var columnWidth    = (columnCount / 100) & "%">
	<CFSET var snipappsMain   = CreateObject("component","snipapps.main")>
	<CFSET var hotelDomain    = SESSION.domain>

	<!--- loop variables --->
	<CFSET var thisTitle       = "">
	<CFSET var thisPic         = "">
	<CFSET var thisPicLarge    = "">
	<CFSET var thisDescription = "">
	<CFSET var thisAccSnipId   = "">
	<CFSET var thisKey         = "">
	<CFSET var thisCode        = "">
	<CFSET var thisCodeEscape  = "">

	<!--- initialize loop counters --->
	<CFSET var count = 0>

	<!--- must be logged in --->
	<CFSCRIPT>SERVER.framework.security.main.requireLogin();</CFSCRIPT>

	<CFQUERY NAME="snippetResults" DATASOURCE="#dsn#">
		SELECT asn.id, a.id AS account_id, asn.label, asn.data, asn.skin_layout_id, asn.skin_style_id
		FROM appstore.account_snippet asn, appstore.account a, appstore.account_site asi
		WHERE asn.account_id        = a.id
			AND asi.account_id      = a.id
			AND a.site_id           = <CFQUERYPARAM VALUE="#THIS.master_site_id#" CFSQLTYPE="CF_SQL_INTEGER">
			AND asi.site_id         = <CFQUERYPARAM VALUE="#REQUEST.site_id#" CFSQLTYPE="CF_SQL_INTEGER">
			AND asn.skin_section_id = 49
			<CFIF 1 EQ 2>AND asn.data ILIKE <CFQUERYPARAM VALUE="%hoteldomain=#hotelDomain#%" CFSQLTYPE="CF_SQL_VARCHAR"></CFIF>
		ORDER BY skin_layout_id ASC, skin_style_id ASC
	</CFQUERY>

	<CFINCLUDE TEMPLATE="#THIS.master_templates#/#ARGUMENTS.template#">

	<CFSET snipappsMain = "">

</CFFUNCTION>

</CFCOMPONENT>