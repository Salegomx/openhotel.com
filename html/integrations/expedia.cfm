<!--- Begin: Header Definition --->
<CFSET title = "Hotel Property Management System and Channel Manager - OpenHotel">
<CFSET meta_description = "One platform for PMS, channel management and yield management. Direct connection to OTAs. Serving independent properties since 2001.">
<CFSET meta_keywords = "">
<!--- End: Header Definition --->

<!--- Begin: Start Application --->
<CFINCLUDE TEMPLATE="#start#">
<CFSET REQUEST.templateKey = true>
<!--- End: Start Application --->

<CFINCLUDE TEMPLATE="#REQUEST.templates#/header.cfm">
<CFINCLUDE TEMPLATE="#REQUEST.templates#/integrations/expedia_main.cfm">
<CFINCLUDE TEMPLATE="#REQUEST.templates#/footer.cfm">