<!-- Begin: Header Definition -->
<CFSET title = "Price and costs of hotel PMS and channel manager by OpenHotel">
<CFSET meta_description = "Pricing is completely transparent and upfront with OpenHotel. No hidden fees. Month to month agreement so we earn your business all the time.">
<CFSET meta_keywords = "">
<!-- End: Header Definition -->

<!-- Begin: Start Application -->
<CFINCLUDE TEMPLATE="#start#">
<CFSET REQUEST.templateKey = true>
<!-- End: Start Application -->

<CFINCLUDE TEMPLATE="#REQUEST.templates#/header.cfm">
<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_main.cfm">
<CFINCLUDE TEMPLATE="#REQUEST.templates#/footer.cfm">

