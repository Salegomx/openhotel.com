<CFTRY>
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
	
<!-- Begin Switches -->
<CFSWITCH EXPRESSION="#mode#">

	<CFCASE VALUE="submit">
		<CFSCRIPT>localObj.contact().submit();</CFSCRIPT>
	</CFCASE>

	<CFDEFAULTCASE>
		<CFINCLUDE TEMPLATE="#REQUEST.templates#/contact_main.cfm">
	</CFDEFAULTCASE>

</CFSWITCH>

<CFINCLUDE TEMPLATE="#REQUEST.templates#/footer.cfm">

	<CFCATCH type="any">
		<CFDUMP VAR="#CFCATCH#">
	</CFCATCH>

</CFTRY>