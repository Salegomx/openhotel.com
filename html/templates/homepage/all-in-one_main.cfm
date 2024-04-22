<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION ID="all-in-one" CLASS="topWaves bottomWaves" DATA-BACKGROUND="darkBlue">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 ID="all-in-oneTitle" CLASS="heading"><CF_EDIT ID="allInOneTitle"><SPAN DATA-SIZE="8">All-In-One Enterprise Hotel and PMS<BR> Software as a Service</SPAN></CF_EDIT></H2>
		</DIV>

		<BR>

		<!--- TABS SYSTEM --->
		<DIV CLASS="tabsGrid">
			<!--- TABS --->
			<DIV CLASS="tabsContainer">
				<UL ROLE="tablist" ARIA-LABELLEDBY="#all-in-oneTitle">
					<LI ROLE="presentation"><A ROLE="tab" ID="all-in-oneTab1" HREF="#pms" TITLE="Hotel PMS"><SPAN CLASS="ohIcon" DATA-ICON="PMSSystem"></SPAN>Hotel PMS</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="all-in-oneTab2" HREF="#channelManagement" TITLE="Channel Management"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Channel Management</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="all-in-oneTab3" HREF="#yieldManagementTab" TITLE="Yield Management"><SPAN CLASS="ohIcon" DATA-ICON="yieldManagement"></SPAN>Yield Management</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="all-in-oneTab4" HREF="#enterpriseManagement" TITLE="Enterprise Management"><SPAN CLASS="ohIcon" DATA-ICON="enterpriseManagement"></SPAN>Enterprise Management</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="all-in-oneTab5" HREF="#websites" TITLE="Website & Booking Engine"><SPAN CLASS="ohIcon" DATA-ICON="websiteAndBookingEngine"></SPAN>Website &amp; Booking Engine</A></LI>
				</UL>
			</DIV>

			<!--- TAB PANELS --->
			<DIV CLASS="tabPanelsContainer">
				<!--- PMS SYSTEM --->
				<DIV ID="pms" ARIA-LABELLEDBY="#all-in-oneTab1" CLASS="tabPanel" DATA-BACKGROUND="white">
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="PMSSystem"></SPAN>Hotel PMS System</H3>
						<P DATA-SIZE="2">A system that aligns with your unique needs and simplifies your processes giving you the freedom to focus on your guests. Powerful and full-featured but easy to learn. Works seamlessly with all OpenHotel products.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/checkinPic.png" ALT="" LOADING="lazy">
						</DIV>
						<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/pms.cfm" CLASS="button" DATA-COLOR="teal" DATA-WIDTH="100%" ALT="Learn More" TITLE="Learn More">Learn More</A>
					</DIV>
				</DIV>

				<!--- CHANNEL MANAGER --->
				<DIV ID="channelManagement" ARIA-LABELLEDBY="#all-in-oneTab2" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Channel Management</H3>
						<P DATA-SIZE="2">A robust and highly-integrated channel management platform. Direct connection with rates and inventory built into the PMS for one point of management. Full suite of Content API’s integrated throughout the PMS, such as policies, promotions, reviews and descriptions.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/channelsPic.png" ALT="">
						</DIV>
						<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/channels.cfm" CLASS="button" DATA-COLOR="teal" DATA-WIDTH="100%" ALT="Learn More" TITLE="Learn More">Learn More</A>
					</DIV>
				</DIV>

				<!--- YIELD MANAGER --->
				<DIV ID="yieldManagementTab" ARIA-LABELLEDBY="#all-in-oneTab3" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="yieldManagement"></SPAN>Yield Management</H3>
						<P DATA-SIZE="2">Achieve greater ADR and occupancy levels with this dynamic automation tool. Seamlessly control inventory opens and closes, ensuring the right price at the right time, in perfect harmony with the Channel Manager and PMS to implement strategic channel segmentation.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/yieldPic.png" ALT="">
						</DIV>
						<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/yield.cfm" CLASS="button" DATA-COLOR="teal" DATA-WIDTH="100%" ALT="Learn More" TITLE="Learn More">Learn More</A>
					</DIV>
				</DIV>

				<!--- ENTERPRISE MANAGER --->
				<DIV ID="enterpriseManagement" ARIA-LABELLEDBY="#all-in-oneTab4" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="enterpriseManagement"></SPAN>Enterprise Management</H3>
						<P DATA-SIZE="2">Experience the next level of multi-property management with a versatile toolkit designed for owners, management companies, and brands. Segment properties to optimize rates, manage channels, and view dynamic reporting from a single dashboard. Promote properties collectively through a multi-property booking engine portal.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/enterprisePic.png" ALT="">
						</DIV>
						<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/enterprise.cfm" CLASS="button" DATA-COLOR="teal" DATA-WIDTH="100%" ALT="Learn More" TITLE="Learn More">Learn More</A>
					</DIV>
				</DIV>

				<!--- WEBSITES AND BE --->
				<DIV ID="websites" ARIA-LABELLEDBY="#all-in-oneTab5" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="websiteAndBookingEngine"></SPAN>Website & Booking Engine</H3>
						<P DATA-SIZE="2">Choose from dozens of designs that integrate with the Booking Engine and PMS. A one-time setup fee and free hosting make this an easy choice.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/websitesPic.png" ALT="">
						</DIV>
						<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/bookingengine.cfm" CLASS="button" DATA-COLOR="teal" DATA-WIDTH="100%" ALT="Learn More" TITLE="Learn More">Learn More</A>
					</DIV>
				</DIV>
			</DIV>
		</DIV>

		<!--- BUTTON --->
		<!---<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products.cfm" CLASS="button" DATA-COLOR="purple" DATA-WIDTH="100%" ALT="View All Products" TITLE="View All Products">
			View All Products
		</A>--->
	</DIV>
</SECTION>