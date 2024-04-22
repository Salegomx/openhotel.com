<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="9">Independent Hotels</H1>
			<BR>
			<P DATA-SIZE="3">
				The smartest thing you can do for your property. Intuitive, Flexible and Dependable.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer solutionContainer">

		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="7">Your Complete<BR>Technology Solution</H2>
			<BR>
			<P DATA-SIZE="3">
				Simplify your hotel operations with a one-stop shop.<BR>
				Ala Carte applications to integrate even more and to cater to each hotel's needs.
			</P>
		</DIV>

		<BR>

		<!--- TABS CONTAINER --->
		<DIV CLASS="tabsGrid">
			<DIV CLASS="tabsContainer">
				<UL ROLE="tablist">
					<LI ROLE="presentation"><A ROLE="tab" ID="tab1" HREF="#systems" TITLE="Systems"><SPAN CLASS="ohIcon" DATA-ICON="PMSSystem"></SPAN>Systems</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab2" HREF="#guestEngagement" TITLE="Guest Engagement"><SPAN CLASS="ohIcon" DATA-ICON="guestMessaging"></SPAN>Guest Engagement</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab3" HREF="#flexibleFeatures" TITLE="Flexible Features"><SPAN CLASS="ohIcon" DATA-ICON="yieldManagement"></SPAN>Flexible Features</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab4" HREF="#advancedTools" TITLE="Advanced Tools"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Advanced Tools</A></LI>
					<LI ROLE="presentation"><A ROLE="tab" ID="tab5" HREF="#experiencedSupport" TITLE="Experienced Support"><SPAN CLASS="ohIcon" DATA-ICON="support"></SPAN>Experienced Support</A></LI>
				</UL>
			</DIV>

			<!--- TAB PANELS CONTAINER --->
			<DIV CLASS="tabPanelsContainer">

				<!--- SYSTEMS --->
				<DIV ID="systems" ARIA-LABELLEDBY="#tab1" CLASS="tabPanel" DATA-BACKGROUND="white">
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="PMSSystem"></SPAN>Systems</H3>
						<P DATA-SIZE="2">This is the only system you will need and is designed for independent hoteliers like you! From building and managing your booking engine and website to streamlining operations with our PMS, Channel Manager and Yield Management tools, we've got you covered. Say goodbye to juggling between multiple vendors; with us, you have a single dedicated partner for all your technological needs. Empowering you to enhance your online presence, boost bookings and maximize revenue effortlessly.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/systemsPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- GUEST ENGAGEMENT --->
				<DIV ID="guestEngagement" ARIA-LABELLEDBY="#tab2" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="guestMessaging"></SPAN>Guest Engagement</H3>
						<P DATA-SIZE="2">Provide the guest with an experience through guest messaging and seamless communication. Allowing the guest flexibility to check-in using our guest express contactless process. Personalize pre-arrival emails or messaging with relevant information about their stay, local attractions and promotions. Empower guest interaction to provide the best service possible.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/expressPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- FLEXIBLE FEATURES --->
				<DIV ID="flexibleFeatures" ARIA-LABELLEDBY="#tab3" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="yieldManagement"></SPAN>Flexible Features</H3>
						<P DATA-SIZE="2">Flexible enough to do the things specifically for your hotel. Modify reservations, multi-room receipts, built-in payments, integrated reviews and responses, tax reporting made easy, detailed audit and revenue reports, strategic custom rate plans, group setup with holds, and so much more!</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/reportsPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- ADVANCED TOOLS --->
				<DIV ID="advancedTools" ARIA-LABELLEDBY="#tab4" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>Advanced Tools</H3>
						<P DATA-SIZE="2">Unlock the full potential with our advanced tools such as Yield Management, daily rate overview adjustments, direct billing for accounts or groups, automated audit reports, product sales, and an interactive housekeeping dashboard. When fully integrated each service is not only powerful on its own but seamlessly complements the performance of all our applications.</P>
						<DIV CLASS="tabPanelPic">
							<IMG SRC="/images/template/toolsPic.png" ALT="">
						</DIV>
					</DIV>
				</DIV>

				<!--- EXPERIENCED SUPPORT --->
				<DIV ID="experiencedSupport" ARIA-LABELLEDBY="#tab5" CLASS="tabPanel" DATA-BACKGROUND="white" HIDDEN>
					<DIV CLASS="innerGrid">
						<H3 CLASS="heading" DATA-SIZE="7"><SPAN CLASS="ohIcon" DATA-ICON="support"></SPAN>Experienced Support</H3>
						<P DATA-SIZE="2">Available 24/7 experienced personal support with critical hours. Free live trainings each week. Robust support portal full of articles and videos, always up-to-date.<BR>In-house support ticketing system with a 2–4-day turnaround. Proudly, our systems have 100% uptime and the highest-rated channel manager connection to set your mind at ease.</P>
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