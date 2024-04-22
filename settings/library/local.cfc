<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = THIS>
</CFIF>

<!--- ------------------------------------------- --->
<!--- Wrapper For All Other Domain Specific CFC's --->
<!--- ------------------------------------------- --->

<CFFUNCTION NAME="websites" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/websites.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="resellers" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/resellers.cfc")>

</CFFUNCTION>

<CFFUNCTION NAME="contact" ACCESS="public">

	<CFRETURN createCFC(path="#REQUEST.domainRoot#/settings/library/contact.cfc")>

</CFFUNCTION>

</CFCOMPONENT>