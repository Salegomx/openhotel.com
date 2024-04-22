<!--- Begin: Header Definition --->
<CFSET title            = REQUEST.site_name>
<CFSET meta_description = "">
<CFSET meta_keywords    = "">
<!--- End: Header Definition --->

<!--- Begin: Start Application --->
<CFINCLUDE TEMPLATE="#start#">
<CFSET REQUEST.templateKey = true>
<!--- End: Start Application --->

<!--- I'm currently adding CMS boxes --->
<CFIF 1 EQ 1>
	<CFINVOKE COMPONENT="website.main" METHOD="getSwitchPage" TEMPLATE="login.cfm" />
<CFELSE>
	<CFINCLUDE TEMPLATE="#REQUEST.templates#/header.cfm">
	<CFINCLUDE TEMPLATE="#REQUEST.templates#/homepage/index_main.cfm">
	<CFINCLUDE TEMPLATE="#REQUEST.templates#/footer.cfm">
</CFIF>