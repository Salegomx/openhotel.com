<!-- secure the template -->
<CF_SECURETEMPLATE>

<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_main_config.cfm">

<CFIF 1 EQ 1>
	<DIV CLASS="rotate backPricing" STYLE="background:url('/images/headers/pricing.jpg')">
		<DIV CLASS="headNew" STYLE="top:auto;text-align:center;">
			<BR>
			<IMG SRC="/images/pricing_arrow_header.png" HEIGHT="100">
			<BR>
			Simple. Affordable. No Contract.
			<SPAN>
				We provide all around service and assistance according to your size and needs.
				<BR>
				Let's Talk. We can put you in the right place for bigger goals.
			</SPAN>
			<DIV STYLE="position:absolute;" ID="pricingPropertyBlock">
				<DIV STYLE="font-size:12px;padding:6px;position:relative;float:left;border-radius:4px;opacity:.8;background-color:#1BD2F0;">CocoBay Resort, Antigua <BR>Client Since 2013</DIV>
			</DIV>
		</DIV>
	</DIV>
<CFELSE>
	<DIV CLASS="rotate backPricing">
		<DIV CLASS="headNew">
			OpenHotel Pricing
			<SPAN><DIV></DIV></SPAN>
			<DIV></DIV>
		</DIV>
	</DIV>
</CFIF>

<DIV STYLE="position: relative;">
    <DIV CLASS="grid pricingTable">
        <SECTION CLASS="pricingColOne" ID="colOne">
            <CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_form.cfm">
        </SECTION>
        <SECTION CLASS="pricingCol">
            <SPAN>PMS</SPAN>
            Everything you need to grow your business<BR><BR><BR><BR><BR>
            <DIV CLASS="pricingVal" ID="calcPlan_basic">Calculating...</DIV>
            <A CLASS="pricingButton" HREF="https://calendly.com/d/gq3-px5-gwd/pms-demo" TARGET="_blank">Schedule Walk-through</A>
            <A CLASS="pricingButtonTwo" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/signup.cfm">Sign Up Now</A>
        </SECTION>
        <SECTION CLASS="pricingCol" ID="selectedCol">
            <B CLASS="mostPopular">Most Popular</B>
            <SPAN>PMS and Channel Manager</SPAN>
            If connectivity is important to you this is your plan
            <DIV CLASS="pricingVal" ID="calcPlan_avg">Calculating...</DIV>
            <A CLASS="pricingButton" HREF="https://calendly.com/d/gq3-px5-gwd/pms-demo" TARGET="_blank">Schedule Walk-through</A>
            <A CLASS="pricingButtonTwo" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/signup.cfm">Sign Up Now</A>
        </SECTION>
        <SECTION CLASS="pricingCol">
            <SPAN>PMS, Channel Manager and Yield Manager</SPAN>
            Includes rate management based on your rules
            <DIV CLASS="pricingVal" ID="calcPlan_works">Calculating...</DIV>
            <A CLASS="pricingButton" HREF="https://calendly.com/d/gq3-px5-gwd/pms-demo" TARGET="_blank">Schedule Walk-through</A>
            <A CLASS="pricingButtonTwo" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/signup.cfm">Sign Up Now</A>
        </SECTION>
        <SECTION CLASS="pricingCol">
            <SPAN>Multi-property Plan</SPAN>
         	Top down management for 3 or more properties
			<BR><BR><BR>
            <DIV ID="calcPlan_multi">&nbsp;</DIV>
            <A CLASS="pricingButton" HREF="https://calendly.com/d/gq3-px5-gwd/pms-demo" TARGET="_blank">Contact us</A>
            <A CLASS="pricingButtonTwo" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/signup.cfm">Sign Up Now</A>
        </SECTION>
    </DIV>

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_main_features.cfm">

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_main_faqs.cfm">

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_main_footer.cfm">
</DIV>