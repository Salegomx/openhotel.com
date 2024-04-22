<!--- SECURE THE TEMPLATE --->
<CF_SECURETEMPLATE>

<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_config.cfm">

<SECTION CLASS="subHeading needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="8">Simple. Affordable. No Contract.</H2>
			<BR>
			<P DATA-SIZE="4">
				Our proprietary software is designed to work together<BR>seamlessly to give you the most success.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION ID="pricing" CLASS="topWaves" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">
		<!--- FIRST ROW --->
		<DIV CLASS="pricingGrid firstRow">
			<DIV aria-labelledby="#startHere">
				<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_form.cfm">
			</DIV>
			<DIV ID="scrollHere" aria-labelledby="#pmsPlan">
				<SPAN ID="pmsPlan" CLASS="heading planName" DATA-SIZE="5">Property Management System</SPAN>
				<SPAN CLASS="planDescription">Everything you need to grow your business.</SPAN>
				<SPAN CLASS="pricingVal" ID="calcPlan_basic" DATA-SIZE="4">Calculating...</SPAN>
				<A CLASS="button pricingButton" DATA-COLOR="purple" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm">Book a Demo</A>
			</DIV>
			<DIV aria-labelledby="#cmPlan">
				<SPAN ID="cmPlan" CLASS="heading planName" DATA-SIZE="5">PMS and Channel Manager</SPAN>
				<SPAN CLASS="planDescription">If connectivity is important to you, this is your plan.</SPAN>
				<SPAN CLASS="pricingVal" ID="calcPlan_avg" DATA-SIZE="4">Calculating...</SPAN>
				<A CLASS="button pricingButton" DATA-COLOR="purple" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm">Book a Demo</A>
			</DIV>
			<DIV aria-labelledby="#ymPlan" CLASS="selectedCol">
				<SPAN ID="ymPlan" CLASS="heading planName" DATA-SIZE="5">PMS, Channel Manager and Yield Manager</SPAN>
				<SPAN CLASS="planDescription">Includes rate management across all systems.</SPAN>
				<SPAN CLASS="pricingVal" ID="calcPlan_works" DATA-SIZE="4">Calculating...</SPAN>
				<A CLASS="button pricingButton" DATA-COLOR="pink" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm">Book a Demo</A>
			</DIV>
			<DIV aria-labelledby="#multiPlan">
				<SPAN ID="multiPlan" CLASS="heading planName" DATA-SIZE="5">Enterprise Management</SPAN>
				<SPAN CLASS="planDescription">Top down management for 3 or more properties.</SPAN>
				<SPAN CLASS="pricingVal" ID="calcPlan_multi" DATA-SIZE="4">Call for Pricing</SPAN>
				<A CLASS="button pricingButton" DATA-COLOR="purple" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm">Book a Demo</A>
			</DIV>
		</DIV>

		<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_features.cfm">

		<!--- LAST ROW --->
		<DIV CLASS="pricingGrid pricingHeadingsRow lastRow">
			<DIV></DIV>
			<DIV>
				<SPAN CLASS="heading planName" DATA-SIZE="4">Property Management System</SPAN>
				<A CLASS="button pricingButton" DATA-COLOR="purple" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm">Book a Demo</A>
			</DIV>
			<DIV>
				<SPAN CLASS="heading planName" DATA-SIZE="4">PMS and<BR>Channel<BR>Manager</SPAN>
				<A CLASS="button pricingButton" DATA-COLOR="purple" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm">Book a Demo</A>
			</DIV>
			<DIV CLASS="selectedCol">
				<SPAN CLASS="heading planName" DATA-SIZE="4">PMS, Channel<BR>Manager and<BR>Yield Manager</SPAN>
				<A CLASS="button pricingButton" DATA-COLOR="pink" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm">Book a Demo</A>
			</DIV>
			<DIV>
				<SPAN CLASS="heading planName" DATA-SIZE="4">Enterprise<BR>Management</SPAN>
				<A CLASS="button pricingButton" DATA-COLOR="purple" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm">Book a Demo</A>
			</DIV>
		</DIV>
	</DIV>
</SECTION>

<!---<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_faqs.cfm">--->