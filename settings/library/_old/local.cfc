<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = THIS>
</CFIF>

<!--- ------------------------------------------- --->
<!--- Wrapper For All Other Domain Specific CFC's --->
<!--- ------------------------------------------- --->

<CFFUNCTION NAME="gdsSetup" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/gds_setup.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="setup" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/setup.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="snippet" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/snippet.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="contact" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/contact.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="websites" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/websites.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="smartphone" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/smartphone.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="signup" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/signup.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="reservations" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/reservations.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="showAggregateBlogFeed" ACCESS="public">

	<CFARGUMENT NAME="resultSet" TYPE="any" REQUIRED="Yes" />

	<!--- initialize variables --->
	<CFSET var finalfeed   = "">
	<CFSET var generalrss  = CreateObject("component","components.general.rss")>
	<CFSET var itemResults = ARGUMENTS.resultSet>
	<CFSET var feedResults = QueryNew("headline,body,link","VARCHAR,VARCHAR,VARCHAR")>

	<CFLOOP QUERY="itemResults">
		<CFSET QueryAddRow(feedResults,1)>
		<CFSET QuerySetCell(feedResults,"headline",title,feedResults.recordCount)>
		<CFSET QuerySetCell(feedResults,"body",body,feedResults.recordCount)>
		<CFSET QuerySetCell(feedResults,"link","http://#REQUEST.domain#/post.cfm/post/#id#/#FormatSEOString(title)#",feedResults.recordCount)>
	</CFLOOP>

	<CFSET finalfeed = generalrss.create(title="Open Hotel Online Booking Engine, Websites and Property Management System",description="Open Hotel News, Tips and Information",link="http://#REQUEST.domain#/post.cfm",uri="http://#REQUEST.domain#/post.cfm/mode/rss",resultSet=feedResults)>

	<CFSET generalrss.display(feedxml=finalfeed)>

</CFFUNCTION>

</CFCOMPONENT>