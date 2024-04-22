<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = createObject("component", "local")>
</CFIF>

<CFIF isDefined("reservations") EQ "No">
	<CFSET reservations = THIS>
</CFIF>

<!--- get most recent reservations --->
<CFFUNCTION NAME="getLatest" ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string"  REQUIRED="No" DEFAULT="latest_reservations.cfm" />
	<CFARGUMENT NAME="limit"    TYPE="numeric" REQUIRED="No" DEFAULT="3" />

	<!--- initialize variables --->
	<CFSET var results = "">

	<CFQUERY NAME="results" DATASOURCE="#dsn#">
		SELECT s.name, r.date_made, r.time_made, r.total_final
		FROM site.site s, hotel.reservations r
		WHERE r.hotel_id = s.id
			AND r.status IN (<CFQUERYPARAM VALUE="1,2,3" CFSQLTYPE="CF_SQL_INTEGER" LIST="Yes">)
		ORDER BY r.id DESC
		LIMIT NULLIF(<CFQUERYPARAM VALUE="#ARGUMENTS.limit#" CFSQLTYPE="CF_SQL_INTEGER">,<CFQUERYPARAM VALUE="0" CFSQLTYPE="CF_SQL_INTEGER">);
	</CFQUERY>

	<CFIF Trim(ARGUMENTS.template) NEQ "">
		<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">
	</CFIF>

	<CFRETURN results>

</CFFUNCTION>

</CFCOMPONENT>