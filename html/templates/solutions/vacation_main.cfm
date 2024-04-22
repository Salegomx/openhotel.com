<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="9">Vacation Home Rentals</H1>
			<BR>
			<P DATA-SIZE="3">
				Providing a robust system for any alternative accommodation.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer solutionContainer">

		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="7">A Solution for all types of Properties</H2>
			<BR>
			<P DATA-SIZE="3">
				Our all-in-one software solution allows you to improve<BR>and become successful in the most efficient way.
			</P>
		</DIV>

		<BR>

		<!--- TABS CONTAINER --->
		<DIV CLASS="tabsGrid">
			<DIV CLASS="tabsContainer">
				<UL ROLE="tablist">
					<LI ROLE="presentation"><A ROLE="tab" ID="tab1" HREF="#pms" TITLE="Hotel PMS"><SPAN CLASS="ohIcon" DATA-ICON="PMSSystem"></SPAN>Hotel PMS</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab2" HREF="#guestEngagement" TITLE="Guest Engagement"><SPAN CLASS="ohIcon" DATA-ICON="guestMessaging"></SPAN>Guest Engagement</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab3" HREF="#channelManager" TITLE="Channel Manager"><SPAN CLASS="ohIcon" DATA-ICON="channels"></SPAN>Channel Manager</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab4" HREF="#advancedTools" TITLE="Advanced Tools"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Advanced Tools</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab5" HREF="#experiencedSupport" TITLE="Experienced Support"><SPAN CLASS="ohIcon" DATA-ICON="support"></SPAN>Available Support</A></LI>
				</UL>
			</DIV>

			<!--- TAB PANELS CONTAINER --->
			<DIV CLASS="tabPanelsContainer">
				<!--- PMS --->
				<DIV ID="pms" ARIA-LABELLEDBY="#tab1" CLASS="tabPanel" DATA-BACKGROUND="white">
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="PMSSystem"></SPAN>Hotel PMS</H3>
						<P DATA-SIZE="2">Use our all-in-one cloud-based platform for all your bookings, whether they are from external channels or booked directly from your website. Our interactive dashboard displays bookings with notes, housekeeping requests, pet-friendly and multi-room units, frequent guests, and balances owed. Manage bookings from anywhere, mobile responsive and user-friendly.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/checkinPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- GUEST ENGAGEMENT --->
				<DIV ID="guestEngagement" ARIA-LABELLEDBY="#tab2" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="guestMessaging"></SPAN>Guest Engagement</H3>
						<P DATA-SIZE="2">OpenHotel offers many options for guest communication, from custom emails and responses to automated text messages based on date, time, and frequency.  Allow us to automate your guest reviews through reputation management. Use our advanced technology to be efficient and to provide your guests with a personalized experience they will never forget.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/expressPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- CHANNEL MANAGER --->
				<DIV ID="channelManager" ARIA-LABELLEDBY="#tab3" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="channels"></SPAN>Channel Manager</H3>
						<P DATA-SIZE="2">Connections to Booking.com, Expedia, Tripadvisor, Airbnb, Vrbo and others.  Quickly and easily adjust unit inventory and rates on a daily or weekly basis. Supports multi-room, multi-unit, and multi-account setups, all while integrated with the Openhotel PMS. No need to login to several accounts, we provide a central place for managing all.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/channelsPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- ADVANCED TOOLS --->
				<DIV ID="advancedTools" ARIA-LABELLEDBY="#tab4" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Advanced Tools</H3>
						<P DATA-SIZE="2">Advanced tools include a housekeeping dashboard with status updates and requests, maintenance, notes and assignment. Integrated payment options for any merchant. Yield Management for automating your rates and inventory based on season, or close channels to save on commissions. Comprehensive reports including audit, revenue, occupancy, taxes, and payments all in one system.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/toolsPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- EXPERIENCED SUPPORT --->
				<DIV ID="experiencedSupport" ARIA-LABELLEDBY="#tab5" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="support"></SPAN>Available Support</H3>
						<P DATA-SIZE="2">24/7 experienced personal support with critical hours. Free live trainings each week. Robust support portal full of articles and videos, always up-to-date.<BR>In-house support ticketing system with a 2–4-day turnaround. Proudly, our systems have 100% uptime and the highest-rated channel manager connection to set your mind at ease.</P>
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