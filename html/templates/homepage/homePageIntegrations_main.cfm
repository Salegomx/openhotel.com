<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION ID="homePageIntegrations" CLASS="topWaves ohBackgroundContainer" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">

		<BR><BR>

		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 ID="integrationsTitle" CLASS="heading" DATA-SIZE="8">Integrate with Tools You<BR>Know and Use</H2>
		</DIV>

		<!--- TABS SYSTEM --->
		<DIV CLASS="tabsGrid">
			<!--- TABS --->
			<DIV CLASS="tabsContainer">
				<UL ROLE="tablist" ARIA-LABELLEDBY="#integrationsTitle">
					<LI ROLE="presentation"><A ROLE="tab" ID="integrationsTab1" HREF="#payments" ALT="Payments" TITLE="Payments"><SPAN CLASS="ohIcon" DATA-ICON="payments"></SPAN>Payments</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="integrationsTab2" HREF="#guestMessaging" ALT="Guest Messaging" TITLE="Guest Messaging"><SPAN CLASS="ohIcon" DATA-ICON="guestMessaging"></SPAN>Guest Messaging</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="integrationsTab3" HREF="#channels" ALT="Channels" TITLE="Channels"><SPAN CLASS="ohIcon" DATA-ICON="channels"></SPAN>Channels</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="integrationsTab4" HREF="#keyLockSystems" ALT="Key Lock Systems" TITLE="Key Lock Systems"><SPAN CLASS="ohIcon" DATA-ICON="keyLockSystems"></SPAN>Key Lock Systems</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="integrationsTab5" HREF="#POS" ALT="POS" TITLE="POS"><SPAN CLASS="ohIcon" DATA-ICON="POS"></SPAN>POS</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="integrationsTab6" HREF="#marketing" ALT="Marketing" TITLE="Marketing"><SPAN CLASS="ohIcon" DATA-ICON="marketing"></SPAN>Marketing</A></LI>
				</UL>
			</DIV>

			<!--- TAB PANEL --->
			<DIV CLASS="tabPanelsContainer">
				<!--- PAYMENTS --->
				<DIV ID="payments" ARIA-LABELLEDBY="#integrationsTab1" CLASS="tabPanel" DATA-BACKGROUND="white">
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="payments"></SPAN>Payments</H3>
						<P DATA-SIZE="2">OpenHotel's integrated payments processing, with its wide selection of gateways, merchant options, competitive rates, and customer service, can provide hotels with a comprehensive and efficient payment solution that meets their unique needs.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/paymentsPic.png" ALT="" LOADING="lazy">
						</DIV>
					</DIV>
				</DIV>

				<!--- GUEST MESSAGING --->
				<DIV ID="guestMessaging" ARIA-LABELLEDBY="#integrationsTab2" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="guestMessaging"></SPAN>Guest Messaging</H3>
						<P DATA-SIZE="2">OpenHotel's approach of offering a built-in guest messaging platform along with partnerships for advanced systems, provides hotels with a scalable and flexible solution to enhance communication and deliver exceptional guest experiences.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/expressPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- CHANNELS --->
				<DIV ID="channels" ARIA-LABELLEDBY="#integrationsTab3" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="channels"></SPAN>Channels</H3>
						<P DATA-SIZE="2">OpenHotel's abundance of direct channels, including popular platforms such as Expedia, Booking.com and Google, provides hotels with extensive distribution opportunities. Additionally, the Channel Manager Plus product offers connectivity to alternative-home accommodation platforms like Airbnb, VRBO and Hostel World.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/channelsPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- KEY LOCK SYSTEMS --->
				<DIV ID="keyLockSystems" ARIA-LABELLEDBY="#integrationsTab4" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="keyLockSystems"></SPAN>Key Lock Systems</H3>
						<P DATA-SIZE="2">OpenHotel works with both digital key companies and key manufacturing companies to ensure compatibility and integration with any solution. Whether it is contactless or an existing hotel infrastructure system, our goal is to provide a seamless guest experience.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/keylockPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- POS --->
				<DIV ID="POS" ARIA-LABELLEDBY="#integrationsTab5" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="POS"></SPAN>POS</H3>
						<P DATA-SIZE="2">The integration between the POS system and OpenHotel PMS allows for easy posting of charges directly to guests' room accounts. Staff can easily track and manage guest charges and payments, streamlining accounting and reconciliation processes.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/posPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- MARKETING --->
				<DIV ID="marketing" ARIA-LABELLEDBY="#integrationsTab6" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="marketing"></SPAN>Marketing</H3>
						<P DATA-SIZE="2">OpenHotel’s superior marketing partners offer a full suite of digital marketing solutions for hotels of any size is an impressive advantage. With services such as paid media, visual content creation, public relations, and tailored strategies with data analysis, hotels can optimize revenue on any platform.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/marketingPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>
			</DIV>
		</DIV>

		<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/integrations/index.cfm" CLASS="button" DATA-COLOR="purple" DATA-WIDTH="100%" ALT="View All Integrations" TITLE="View All Integrations">
			View All Integrations
		</A>

	</DIV>

	<!--- OH BACKGROUND --->
	<DIV CLASS="bg-oh-integrations">
		<SVG CLASS="svg-oh">
			<USE XLINK:HREF="/images/template/bg-oh.svg#bg-oh"></USE>
		</SVG>
	</DIV>
</SECTION>

