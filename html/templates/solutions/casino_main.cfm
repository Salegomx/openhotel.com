<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="9">Casino Hotels</H1>
			<BR>
			<P DATA-SIZE="3">
				Complete with full property integration.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer solutionContainer">

		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="7">Your Interconnected Technology Solution</H2>
			<BR>
			<P DATA-SIZE="3">
				Cloud-based system includes everything PMS, POS, Loyalty,<BR>Channel Manager, GDS, CRS, RMS and more.
			</P>
		</DIV>

		<BR>

		<!--- TABS CONTAINER --->
		<DIV CLASS="tabsGrid">
			<DIV CLASS="tabsContainer">
				<UL ROLE="tablist">
					<LI ROLE="presentation"><A ROLE="tab" ID="tab1" HREF="#gamingIntegration" TITLE="Gaming Integration"><SPAN CLASS="ohIcon" DATA-ICON="gaming"></SPAN>Gaming Integration</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab2" HREF="#pebblesPOS" TITLE="Pebbles POS"><SPAN CLASS="ohIcon" DATA-ICON="POS"></SPAN>Pebbles POS</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab3" HREF="#advancedTools" TITLE="Advanced Tools"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Advanced Tools</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab4" HREF="#securityCompliance" TITLE="Security & Compliance"><SPAN CLASS="ohIcon" DATA-ICON="security"></SPAN>Security & Compliance</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab5" HREF="#experiencedSupport" TITLE="Experienced Support"><SPAN CLASS="ohIcon" DATA-ICON="support"></SPAN>Attentive Support</A></LI>
				</UL>
			</DIV>

			<!--- TAB PANELS CONTAINER --->
			<DIV CLASS="tabPanelsContainer">
				<!--- GAMING INTEGRATION --->
				<DIV ID="gamingIntegration" ARIA-LABELLEDBY="#tab1" CLASS="tabPanel" DATA-BACKGROUND="white">
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="gaming"></SPAN>Gaming Integration</H3>
						<P DATA-SIZE="2">OpenHotel Systems connects to major rewards programs through our gaming gateway. Search for Player points, status, balances, and post charges directly in the PMS. Track history and identify VIPs at check-in for staff to personalize the guest experience. View comps and discounts on the daily audit report.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/casinoPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- PEBBLE POS --->
				<DIV ID="pebblesPOS" ARIA-LABELLEDBY="#tab2" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="POS"></SPAN>Pebbles POS</H3>
						<P DATA-SIZE="2">Customize your point-of-sale with QR codes, status updates, food delivery and mobile payment using your own device. Complete integration with PMS where you can post food receipts to rooms for convenient payment at check-out. View detailed items ordered, amounts, taxes even tips.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/posPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- ADVANCED TOOLS --->
				<DIV ID="advancedTools" ARIA-LABELLEDBY="#tab3" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Advanced Tools</H3>
						<P DATA-SIZE="2">Increase revenue using our automated Yield Manager. Communicate with guests and engage with them via email or text through our Guest Messaging to drive ancillary revenue. Competitive lodging payment packages available with Heartland and Global. Cloud based PMS with access anywhere at anyplace and with the highest security. Online Booking engine to increase direct bookings. Complete integration with all other operational systems inside your casino hotel to efficiently work together.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/toolsPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- SECURITY COMPLIANCE --->
				<DIV ID="securityCompliance" ARIA-LABELLEDBY="#tab4" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="security"></SPAN>Security & Compliance</H3>
						<P DATA-SIZE="2">We are PCI compliant. Hosting services are located at Switch Data Center in Las Vegas Nevada, acclaimed best datacenter in the world. We work with a local networking company to maintain and manage all infrastructure to ensure we are safe and secure. We’ve had zero downtime in at least 5 years and counting.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/datacenterPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- EXPERIENCED SUPPORT--->
				<DIV ID="experiencedSupport" ARIA-LABELLEDBY="#tab5" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="support"></SPAN>Attentive Support</H3>
						<P DATA-SIZE="2">Available 24/7 experienced personal support with critical hours. Support portal with videos and articles, always up-to-date, interactive ticketing system with 2-4 days turnaround. High response times and attentive support team to assist you from setup to go live.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/supportPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>
			</DIV>
		</DIV>

		<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm" CLASS="button" DATA-COLOR="pink" DATA-WIDTH="100%" ALT="Book a Demo" TITLE="Book a Demo">
			Book a Demo
		</A>
	</DIV>
</SECTION>