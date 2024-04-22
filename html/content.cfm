<!--- Begin: Header Definition --->
<CFSET title            = REQUEST.site_name>
<CFSET meta_description = "">
<CFSET meta_keywords    = "">
<!--- End: Header Definition --->

<!--- Begin: Start Application --->
<CFINCLUDE TEMPLATE="#start#">
<CFSET REQUEST.templateKey = true>
<!--- End: Start Application --->

<CFINVOKE COMPONENT="website.main" METHOD="getSwitchPage" TEMPLATE="content.cfm" />






