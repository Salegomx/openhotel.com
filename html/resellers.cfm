<CFTRY>
<!-- Begin: Header Definition -->
<CFSET title = "Reseller opportunities for OpenHotel PMS and Channel Manager">
<CFSET meta_description = "If you have a client base of hotels and are interested expanding your offerings with a Property Management System, Channel management and yield management, please contact us to see if we are a fit.">
<CFSET meta_keywords = "">
<!-- End: Header Definition -->

<!-- Begin: Start Application -->
<CFINCLUDE TEMPLATE="#start#">
<CFSET REQUEST.templateKey = true>
<!-- End: Start Application -->

<CFINCLUDE TEMPLATE="#REQUEST.templates#/header.cfm">

<!-- Begin Switches -->
<CFSWITCH EXPRESSION="#mode#">

	<CFCASE VALUE="submit">
		<CFSCRIPT>localObj.resellers().submit();</CFSCRIPT>
	</CFCASE>

	<CFDEFAULTCASE>
		<CFINCLUDE TEMPLATE="#REQUEST.templates#/reseller_main.cfm">
	</CFDEFAULTCASE>

</CFSWITCH>
<!-- End Switches -->
<CFINCLUDE TEMPLATE="#REQUEST.templates#/footer.cfm">

	<CFCATCH type="any">
		<CFDUMP VAR="#CFCATCH#">
	</CFCATCH>
</CFTRY>
