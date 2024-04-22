<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="9">Yield Manager</H1>
			<BR>
			<P DATA-SIZE="3">
				Automated technology to drive more profitable reservations.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves bottomWaves subHeadingBody" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">

		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="7">Your New Yield Manager<BR>with Proven Results</H2>
			<BR>
			<P DATA-SIZE="3">
				Implement the right price at the right time based on your strategy.
			</P>
		</DIV>

		<BR><BR><BR><BR>

		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="rateChanges"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Rate<BR>Changes</H3>
				<BR>

				<P DATA-SIZE="2">
					Adjust rates based on demand to maximize revenue by increasing ADR or occupancy. Define your pricing strategies based on the market through calculations and triggers to automatically update across all channels and the PMS.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="info"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Inventory Adjustments</H3>
				<BR>

				<P DATA-SIZE="2">
					Increase inventory when occupancy is low. Restrict inventory as demand increases to promote direct bookings. Open and close OTA’s based on your criteria and save on commissions.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="yieldManagement"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Highly<BR>Flexible</H3>
				<BR>

				<P DATA-SIZE="2">
					Build multiple time periods to accommodate peak and low seasons. Relax LOS when occupancy is low to capture last minute reservations. Ability to automate all or specific room types, channels and PMS.
				</P>
			</DIV>
		</DIV>

		<UL CLASS="screenshotsRow">
			<CFOUTPUT>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/rateChanges1.png" REL="prettyPhoto[rateChanges]">
						<FIGURE>
							<IMG SRC="/images/products/rateChanges1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Rate<BR>changes</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR RATE CHANGES --->
					<A HREF="//#REQUEST.domain#/images/products/rateChanges2.png" REL="prettyPhoto[rateChanges]"></A>
					<A HREF="//#REQUEST.domain#/images/products/rateChanges3.png" REL="prettyPhoto[rateChanges]"></A>
					<A HREF="//#REQUEST.domain#/images/products/rateChanges4.png" REL="prettyPhoto[rateChanges]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/inventoryAdjustments1.png" REL="prettyPhoto[inventoryAdjustments]">
						<FIGURE>
							<IMG SRC="/images/products/inventoryAdjustments1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Inventory<BR>adjustments</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR INVENTORY ADJUSTMENTS --->
					<A HREF="//#REQUEST.domain#/images/products/inventoryAdjustments2.png" REL="prettyPhoto[inventoryAdjustments]"></A>
					<A HREF="//#REQUEST.domain#/images/products/inventoryAdjustments3.png" REL="prettyPhoto[inventoryAdjustments]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/highlyFlexible1.png" REL="prettyPhoto[highlyFlexible]">
						<FIGURE>
							<IMG SRC="/images/products/highlyFlexible1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Highly<BR>flexible</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR HIGHLY FLEXIBLE --->
					<A HREF="//#REQUEST.domain#/images/products/highlyFlexible2.png" REL="prettyPhoto[highlyFlexible]"></A>
					<A HREF="//#REQUEST.domain#/images/products/highlyFlexible3.png" REL="prettyPhoto[highlyFlexible]"></A>
					<A HREF="//#REQUEST.domain#/images/products/highlyFlexible4.png" REL="prettyPhoto[highlyFlexible]"></A>
				</LI>

			</CFOUTPUT>
		</UL>

		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="247support"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Incredibly<BR>Easy Setup</H3>
				<BR>

				<P DATA-SIZE="2">
					Create rules with multiple tiers for each time period to easily see your strategy evolve. Save your rules as recipes to use repeatedly without recreating. Create floor and ceiling rates to ensure your yield manager prevents unwanted rates.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="zeroDowntime"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Manage Promotions</H3>
				<BR>

				<P DATA-SIZE="2">
					Yield management will automate opening, closing and adjustments of promotions on the OTA’s in response to demand changes. Factors such as occupancy thresholds, demand trends, or specified dates can trigger these promotions at the right time.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Reporting<BR>and Integration</H3>
				<BR>

				<P DATA-SIZE="2">
					Yielded reservations can be viewed by the front desk to understand the effects of a rate difference. View yielded rules by day, room type and when they are triggered. Compare and pace revenue over time based on the yield rules.
				</P>
			</DIV>
		</DIV>

		<UL CLASS="screenshotsRow">
			<CFOUTPUT>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/easySetup1.png" REL="prettyPhoto[easySetup]">
						<FIGURE>
							<IMG SRC="/images/products/easySetup1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Incredibly<BR>Easy Setup</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALERY FOR EASY SETUP --->
					<A HREF="//#REQUEST.domain#/images/products/easySetup2.png" REL="prettyPhoto[easySetup]"></A>
					<A HREF="//#REQUEST.domain#/images/products/easySetup3.png" REL="prettyPhoto[easySetup]"></A>
					<A HREF="//#REQUEST.domain#/images/products/easySetup4.png" REL="prettyPhoto[easySetup]"></A>
					<A HREF="//#REQUEST.domain#/images/products/easySetup5.png" REL="prettyPhoto[easySetup]"></A>
					<A HREF="//#REQUEST.domain#/images/products/easySetup6.png" REL="prettyPhoto[easySetup]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/promotions1.png" REL="prettyPhoto[managePromotions]">
						<FIGURE>
							<IMG SRC="/images/products/promotions1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves"  DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Manage<BR>promotions</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR MANAGE PROMOTIONS --->
					<A HREF="//#REQUEST.domain#/images/products/promotions2.png" REL="prettyPhoto[managePromotions]"></A>
					<A HREF="//#REQUEST.domain#/images/products/promotions3.png" REL="prettyPhoto[managePromotions]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/yieldReporting1.png" REL="prettyPhoto[yieldReporting]">
						<FIGURE>
							<IMG SRC="/images/products/yieldReporting1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Reporting and integration</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR REPORTING AND INTEGRATION --->
					<A HREF="//#REQUEST.domain#/images/products/yieldReporting2.png" REL="prettyPhoto[yieldReporting]"></A>
					<A HREF="//#REQUEST.domain#/images/products/yieldReporting3.png" REL="prettyPhoto[yieldReporting]"></A>
					<A HREF="//#REQUEST.domain#/images/products/yieldReporting4.png" REL="prettyPhoto[yieldReporting]"></A>
					<A HREF="//#REQUEST.domain#/images/products/yieldReporting5.png" REL="prettyPhoto[yieldReporting]"></A>
				</LI>
			</CFOUTPUT>
		</UL>
	</DIV>
</SECTION>

<SECTION>
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="8">Deep Integration with<BR>PMS and Channel Manager</H2>
			<BR>
			<P DATA-SIZE="3">
				Having developed all OpenHotel products in-house and on the same platform, we unleashed a multiplication effect on features and productivity. Our proprietary rate system seamlessly integrates with the Channel Manager to give you the most control and options with the most ease. Our Yield Manager provides comprehensive data on how rate rules influence revenue, ADR and occupancy, empowering you with the best insights.
			</P>
		</DIV>

		<BR>

		<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm" CLASS="button" DATA-COLOR="pink" DATA-WIDTH="100%" ALT="Book a Demo" TITLE="Book a Demo">
			Book a Demo
		</A>
	</DIV>
</SECTION>