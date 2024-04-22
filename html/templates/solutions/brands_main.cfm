<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="9">Hotel Groups and Brands</H1>
			<BR>
			<P DATA-SIZE="3">
				One point of management for any size hotel portfolio.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer solutionContainer">

		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="7">Your Multi-Property Technology Solution</H2>
			<BR>
			<P DATA-SIZE="3">
				Login to an enterprise portal to manage your entire portfolio of properties in one place.
			</P>
		</DIV>

		<BR>

		<!--- TABS CONTAINER --->
		<DIV CLASS="tabsGrid">
			<DIV CLASS="tabsContainer">
				<UL ROLE="tablist">
					<LI ROLE="presentation"><A ROLE="tab" ID="tab1" HREF="#multiFrontEnd" TITLE="Multi-Property Front End"><SPAN CLASS="ohIcon" DATA-ICON="PMSSystem"></SPAN>Multi-Property Front End</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab2" HREF="#enterpriseSystem" TITLE="Enterprise System"><SPAN CLASS="ohIcon" DATA-ICON="enterpriseManagement"></SPAN>Enterprise System</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab3" HREF="#reportingTagging" TITLE="Reporting & Tagging"><SPAN CLASS="ohIcon" DATA-ICON="channels"></SPAN>Reporting & Tagging</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab4" HREF="#technicalAdvancements" TITLE="Technical Advancements"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Technical Advancements</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab5" HREF="#experiencedSupport" TITLE="Experienced Support"><SPAN CLASS="ohIcon" DATA-ICON="support"></SPAN>Experienced Support</A></LI>
				</UL>
			</DIV>

			<!--- TAB PANELS CONTAINER --->
			<DIV CLASS="tabPanelsContainer">
				<!--- MULTI-PROPERTY FRONT END --->
				<DIV ID="multiFrontEnd" ARIA-LABELLEDBY="#tab1" CLASS="tabPanel" DATA-BACKGROUND="white">
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="PMSSystem"></SPAN>Multi-Property Front End</H3>
						<P DATA-SIZE="2">Guests can book stays across all properties using our custom-built multi-property booking engine and results page. Choose by location or amenities to show property segmentation. Showcase property descriptions, rooms and rates on your own website or a website we design for you. Seamless reservation delivery to each individual property booked. Our guest sharing feature allows for a common guest database for all properties to include notes, repeat stays and personal guest information, enhancing the guest experience.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/websitesPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- ENTERPRISE SYSTEM --->
				<DIV ID="enterpriseSystem" ARIA-LABELLEDBY="#tab2" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="enterpriseManagement"></SPAN>Enterprise System</H3>
						<P DATA-SIZE="2">Manage your portfolio from the top down. Login to your Enterprise System to create standardized brand rooms, discounts, rates, even OTA channel mappings from one point of management.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/enterprisePic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- REPORTING & TAGGING --->
				<DIV ID="reportingTagging" ARIA-LABELLEDBY="#tab3" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="channels"></SPAN>Reporting & Tagging</H3>
						<P DATA-SIZE="2">Access comprehensive multi-property reports and revenue management tools to optimize your business strategies. View individual hotels or in aggregate to help make management decisions accurately. Other reports include performance, occupancy and pickup. With tagging you can segregate properties by market type, price categories, ownership, revenue manager or other.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/reportsPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- TECHNICAL ADVANCEMENTS --->
				<DIV ID="technicalAdvancements" ARIA-LABELLEDBY="#tab4" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Technical Advancements</H3>
						<P DATA-SIZE="2">
							OpenHotel systems are always looking to offer the hospitality industry the most technical advancements while not sacrificing service and system integrity.
							<BR>Our well-documented API allows for easy integration with any existing system, to ensure a positive experience with staff and guests. We work with any company to give you the best technology available.
						</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/toolsPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- EXPERIENCED SUPPORT --->
				<DIV ID="experiencedSupport" ARIA-LABELLEDBY="#tab5" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="support"></SPAN>Experienced Support</H3>
						<P DATA-SIZE="2">Available 24/7 experienced personal support with critical hours. Free live trainings each week. Robust support portal full of articles and videos, always up-to-date. In-house support ticketing system with a 2–4-day turnaround. Proudly, our systems have 100% uptime and the highest-rated channel manager connection to set your mind at ease.</P>
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