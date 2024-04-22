<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="9">Channel Manager</H1>
			<BR>
			<P DATA-SIZE="3">
				Manage more than rates and inventory.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves bottomWaves subHeadingBody" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">

		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="7">Your New Advanced<BR>Channel Manager System</H2>
			<BR>
			<P DATA-SIZE="3">
				Features beyond your expectations. Save time and money, reduce rate errors,<BR>and virtually eliminate overbookings.
			</P>
		</DIV>

		<BR><BR><BR><BR>

		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="premierPartners"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Award<BR>Winning</H3>
				<BR>

				<P DATA-SIZE="2">
					0% Overbookings<BR>
					99.9% Connectivity<BR>
					Top 2% Awarded Worldwide
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="zeroDowntime"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Rapid<BR>Updates</H3>
				<BR>

				<P DATA-SIZE="2">
					Instant rate and inventory updates through one point of management. Automate yield closeouts when specific conditions are met. Eliminate overbookings.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="247support"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Seamless<BR>Onboarding</H3>
				<BR>

				<P DATA-SIZE="2">
					Direct property connection with room and rate mappings. Full content application to help standardize across all channels. Complete integration with all OpenHotel applications suite.
				</P>
			</DIV>
		</DIV>

		<UL CLASS="screenshotsRow">
			<CFOUTPUT>
				<LI>
					<A HREF="//#REQUEST.domain#/images/awards/bcom-2023.jpg" REL="prettyPhoto[awardWinning]">
						<FIGURE>
							<IMG STYLE="object-fit:contain" SRC="/images/awards/bcom-2023.jpg" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Award Winning</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR AWARD WINNING --->
					<A HREF="//#REQUEST.domain#/images/awards/bcom-2024.png" REL="prettyPhoto[awardWinning]"></A>
					<A HREF="//#REQUEST.domain#/images/awards/exp-2021.png" REL="prettyPhoto[awardWinning]"></A>
					<A HREF="//#REQUEST.domain#/images/awards/exp-2022.png" REL="prettyPhoto[awardWinning]"></A>
					<A HREF="//#REQUEST.domain#/images/awards/exp-2023.JPG" REL="prettyPhoto[awardWinning]"></A>
					<A HREF="//#REQUEST.domain#/images/awards/exp-2024.png" REL="prettyPhoto[awardWinning]"></A>
					<A HREF="//#REQUEST.domain#/images/awards/sustentabilityCertificate-small.png" REL="prettyPhoto[awardWinning]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/updates1.png" REL="prettyPhoto[updates]">
						<FIGURE>
							<IMG SRC="/images/products/updates1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Rapid Updates</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR RAPID UPDATES --->
					<A HREF="//#REQUEST.domain#/images/products/updates2.png" REL="prettyPhoto[updates]"></A>
					<A HREF="//#REQUEST.domain#/images/products/updates3.png" REL="prettyPhoto[updates]"></A>
					<A HREF="//#REQUEST.domain#/images/products/updates4.png" REL="prettyPhoto[updates]"></A>
					<A HREF="//#REQUEST.domain#/images/products/updates5.png" REL="prettyPhoto[updates]"></A>
					<A HREF="//#REQUEST.domain#/images/products/updates6.png" REL="prettyPhoto[updates]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/channelsOnboard1.png" REL="prettyPhoto[channelsOnboard]">
						<FIGURE>
							<IMG SRC="/images/products/channelsOnboard1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Seamless Onboarding</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR SEAMLESS ONBOARDING --->
					<A HREF="//#REQUEST.domain#/images/products/channelsOnboard2.png" REL="prettyPhoto[channelsOnboard]"></A>
					<A HREF="//#REQUEST.domain#/images/products/channelsOnboard3.png" REL="prettyPhoto[channelsOnboard]"></A>
					<A HREF="//#REQUEST.domain#/images/products/channelsOnboard4.png" REL="prettyPhoto[channelsOnboard]"></A>
				</LI>
			</CFOUTPUT>
		</UL>

		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="yieldManagement"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Unified<BR>Rate Plans</H3>
				<BR>

				<P DATA-SIZE="2">
					Simply manage a single rate plan with complex strategy while integrated with the PMS. Customize rate variations with derived rate and discount tiers working behind the scenes to maximize revenue.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="channels"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Custom Rate<BR>Interface</H3>
				<BR>

				<P DATA-SIZE="2">
					Customize a rate interface specific to your own rate strategy needs. Combine all channels into one rate line or parse them out. Derive promos and special negotiated rate plans, in one place.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="websiteAndBookingEngine"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Content<BR>API Tools</H3>
				<BR>

				<P DATA-SIZE="2">
					Streamline content across channels using our complete content API tools. Add/edit in real time: policies, promos, rooms, rates, images, reporting, even guest reviews and engagement, displayed throughout the PMS.
				</P>
			</DIV>
		</DIV>

		<UL CLASS="screenshotsRow">
			<CFOUTPUT>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/channelRates1.png" REL="prettyPhoto[channelRates]">
						<FIGURE>
							<IMG SRC="/images/products/channelRates1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Unified Rate Plans</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR UNIFIED RATE PLANS --->
					<A HREF="//#REQUEST.domain#/images/products/channelRates2.png" REL="prettyPhoto[channelRates]"></A>
					<A HREF="//#REQUEST.domain#/images/products/channelRates3.png" REL="prettyPhoto[channelRates]"></A>
					<A HREF="//#REQUEST.domain#/images/products/channelRates4.png" REL="prettyPhoto[channelRates]"></A>
					<A HREF="//#REQUEST.domain#/images/products/channelRates5.png" REL="prettyPhoto[channelRates]"></A>
					<A HREF="//#REQUEST.domain#/images/products/channelRates6.png" REL="prettyPhoto[channelRates]"></A>
					<A HREF="//#REQUEST.domain#/images/products/channelRates7.png" REL="prettyPhoto[channelRates]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/rateInterface1.png" REL="prettyPhoto[rateInterface]">
						<FIGURE>
							<IMG SRC="/images/products/rateInterface1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Custom Rate Interface</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR CUSTOM RATE INTERFACE --->
					<A HREF="//#REQUEST.domain#/images/products/rateInterface2.png" REL="prettyPhoto[rateInterface]"></A>
					<A HREF="//#REQUEST.domain#/images/products/rateInterface3.png" REL="prettyPhoto[rateInterface]"></A>
					<A HREF="//#REQUEST.domain#/images/products/rateInterface4.png" REL="prettyPhoto[rateInterface]"></A>
					<A HREF="//#REQUEST.domain#/images/products/rateInterface5.png" REL="prettyPhoto[rateInterface]"></A>
					<A HREF="//#REQUEST.domain#/images/products/rateInterface6.png" REL="prettyPhoto[rateInterface]"></A>
					<A HREF="//#REQUEST.domain#/images/products/rateInterface7.png" REL="prettyPhoto[rateInterface]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/api1.png" REL="prettyPhoto[api]">
						<FIGURE>
							<IMG SRC="/images/products/api1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves"  DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Content API tools</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR API TOOLS --->
					<A HREF="//#REQUEST.domain#/images/products/api2.png" REL="prettyPhoto[api]"></A>
					<A HREF="//#REQUEST.domain#/images/products/api3.png" REL="prettyPhoto[api]"></A>
					<A HREF="//#REQUEST.domain#/images/products/api4.png" REL="prettyPhoto[api]"></A>
					<A HREF="//#REQUEST.domain#/images/products/api5.png" REL="prettyPhoto[api]"></A>
				</LI>
			</CFOUTPUT>
		</UL>
	</DIV>
</SECTION>

<SECTION>
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="8">Deep Integration with<BR>PMS and Yield Manager</H2>
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