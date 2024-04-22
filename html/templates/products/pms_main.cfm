<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="9">Property Management System</H1>
			<BR>
			<P DATA-SIZE="3">
				Access anywhere. Always up-to-date.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves bottomWaves" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="7">Your New<BR>Property Management System<BR>in the Cloud</H2>
			<BR>
			<P DATA-SIZE="3">
				Empowering property management with flexible, full-featured tools for maximum revenue.<BR>
				Simplify, Automate and Elevate.
			</P>
		</DIV>

		<BR><BR><BR><BR>

		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="websiteAndBookingEngine"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Real Time<BR>Interactive Dashboard</H3>

				<BR>

				<P DATA-SIZE="2">
					Effortlessly perform common tasks directly from the reservation grid. Update room status, add requests, make reservations, place maintenance and temporary holds, modify rooms, and more.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="yieldManagement"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Proprietary Flexible Rate Plans</H3>

				<BR>

				<P DATA-SIZE="2">
					Handle complex rate scenarios with ease. Enjoy multiple discount types, promo codes, flexible length-of-stay enforcement, and strong support for surcharges and taxes.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="guestMessaging"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Automated Guest Engagement</H3>

				<BR>

				<P DATA-SIZE="2">
					For contactless check-in, use our Express Check-in to allow guests to complete registration prior to arrival. Generate automated messages to engage your guests prior, during, and at post stay.
				</P>
			</DIV>
		</DIV>

		<UL CLASS="screenshotsRow">
			<CFOUTPUT>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/dashboard1.png" REL="prettyPhoto[dashboard]">
						<FIGURE>
							<IMG SRC="/images/products/dashboard1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Interactive<BR>dashboard</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR DASHBOARD --->
					<A HREF="//#REQUEST.domain#/images/products/dashboard2.png" REL="prettyPhoto[dashboard]"></A>
					<A HREF="//#REQUEST.domain#/images/products/dashboard3.png" REL="prettyPhoto[dashboard]"></A>
					<A HREF="//#REQUEST.domain#/images/products/dashboard4.png" REL="prettyPhoto[dashboard]"></A>
					<A HREF="//#REQUEST.domain#/images/products/dashboard5.png" REL="prettyPhoto[dashboard]"></A>
					<A HREF="//#REQUEST.domain#/images/products/dashboard6.png" REL="prettyPhoto[dashboard]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/ratePlans1.png" REL="prettyPhoto[ratePlans]">
						<FIGURE>
							<IMG SRC="/images/products/ratePlans1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Flexible<BR>rate plans</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR RATE PLANS --->
					<A HREF="//#REQUEST.domain#/images/products/ratePlans2.png" REL="prettyPhoto[ratePlans]"></A>
					<A HREF="//#REQUEST.domain#/images/products/ratePlans3.png" REL="prettyPhoto[ratePlans]"></A>
					<A HREF="//#REQUEST.domain#/images/products/ratePlans4.png" REL="prettyPhoto[ratePlans]"></A>
					<A HREF="//#REQUEST.domain#/images/products/ratePlans5.png" REL="prettyPhoto[ratePlans]"></A>
					<A HREF="//#REQUEST.domain#/images/products/ratePlans6.png" REL="prettyPhoto[ratePlans]"></A>
					<A HREF="//#REQUEST.domain#/images/products/ratePlans7.png" REL="prettyPhoto[ratePlans]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/responses1.png" REL="prettyPhoto[responses]">
						<FIGURE>
							<IMG SRC="/images/products/responses1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Automatic<BR>Responses</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR RESPONSES --->
					<A HREF="//#REQUEST.domain#/images/products/responses2.png" REL="prettyPhoto[responses]"></A>
				</LI>
			</CFOUTPUT>
		</UL>
	</DIV>

	<!--- CALL TO ACTION --->
	<CFINCLUDE TEMPLATE="#REQUEST.templates#/cta.cfm">

	<BR><BR><BR><BR>

	<DIV CLASS="innerContainer">
		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="housekeeping"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Housekeeping and Maintenance</H3>

				<BR>

				<P DATA-SIZE="2">
					Robust interactive dashboard that enables staff to easily update room status, create notes, and submit requests. Assign housekeepers and place maintenance holds all from one point of management.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="premierPartners"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Flexible<BR>Group<BR>Bookings</H3>

				<BR>

				<P DATA-SIZE="2">
					Create group bookings with flexible inventory hold schedules and negotiated rate plans. Provide your guests with a convenience of booking online using a custom rate code.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="package"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Packages, Options and Addons</H3>

				<BR>

				<P DATA-SIZE="2">
					Upsell your guest experience with package deals to include options and addons. Showcase your properties options and addons through the guest booking experience.
				</P>
			</DIV>
		</DIV>

		<UL CLASS="screenshotsRow">
			<CFOUTPUT>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/housekeeping1.png" REL="prettyPhoto[housekeeping]">
						<FIGURE>
							<IMG SRC="/images/products/housekeeping1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Housekeeping<BR>and Maintenance</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR HOUSEKEEPING --->
					<A HREF="//#REQUEST.domain#/images/products/housekeeping2.png" REL="prettyPhoto[housekeeping]"></A>
					<A HREF="//#REQUEST.domain#/images/products/housekeeping3.png" REL="prettyPhoto[housekeeping]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/groups1.png" REL="prettyPhoto[groups]">
						<FIGURE>
							<IMG SRC="/images/products/groups1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Group<BR>Bookings</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR GROUPS --->
					<A HREF="//#REQUEST.domain#/images/products/groups2.png" REL="prettyPhoto[groups]"></A>
					<A HREF="//#REQUEST.domain#/images/products/groups3.png" REL="prettyPhoto[groups]"></A>
					<A HREF="//#REQUEST.domain#/images/products/groups4.png" REL="prettyPhoto[groups]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/packages3.png" REL="prettyPhoto[packages]">
						<FIGURE>
							<IMG SRC="/images/products/packages3.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Packages<BR>Options and Addons</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR PACKAGES --->
					<A HREF="//#REQUEST.domain#/images/products/packages4.png" REL="prettyPhoto[packages]"></A>
					<A HREF="//#REQUEST.domain#/images/products/packages5.png" REL="prettyPhoto[packages]"></A>
					<A HREF="//#REQUEST.domain#/images/products/packages1.png" REL="prettyPhoto[packages]"></A>
					<A HREF="//#REQUEST.domain#/images/products/packages2.png" REL="prettyPhoto[packages]"></A>
				</LI>
			</CFOUTPUT>
		</UL>

		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="channelManagement"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Dynamic Reporting</H3>

				<BR>

				<P DATA-SIZE="2">
					Generate tailored reports to track, project, compare, and pace your ADR, revenue, occupancy and inventory.  Enjoy visually captivating graphs and charts to identify ongoing trends.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="payments"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Payment Processing</H3>

				<BR>

				<P DATA-SIZE="2">
					OpenHotel offers multitude of payment options to include, gateway, merchant processing and payment packages. Integrates seamlessly within the PMS.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="security"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Departments and Security</H3>

				<BR>

				<P DATA-SIZE="2">
					Flexibility in restricting or allowing staff to access different parts of the system and track their activity. Two-factor authentication for secure logins.
				</P>
			</DIV>
		</DIV>

		<UL CLASS="screenshotsRow">
			<CFOUTPUT>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/reports1.png" REL="prettyPhoto[reports]">
						<FIGURE>
							<IMG SRC="/images/products/reports1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Dynamic<BR>reporting</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR REPORTS --->
					<A HREF="//#REQUEST.domain#/images/products/reports2.png" REL="prettyPhoto[reports]"></A>
					<A HREF="//#REQUEST.domain#/images/products/reports3.png" REL="prettyPhoto[reports]"></A>
					<A HREF="//#REQUEST.domain#/images/products/reports4.png" REL="prettyPhoto[reports]"></A>
					<A HREF="//#REQUEST.domain#/images/products/reports5.png" REL="prettyPhoto[reports]"></A>
					<A HREF="//#REQUEST.domain#/images/products/reports6.png" REL="prettyPhoto[reports]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/payments1.png" REL="prettyPhoto[payments]">
						<FIGURE>
							<IMG SRC="/images/products/payments1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Payments<BR>Processing</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR PAYMENTS --->
					<A HREF="//#REQUEST.domain#/images/products/payments2.png" REL="prettyPhoto[payments]"></A>
					<A HREF="//#REQUEST.domain#/images/products/payments3.png" REL="prettyPhoto[payments]"></A>
					<A HREF="//#REQUEST.domain#/images/products/payments4.png" REL="prettyPhoto[payments]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/security1.png" REL="prettyPhoto[security]">
						<FIGURE>
							<IMG SRC="/images/products/security1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Departments<BR>and Security</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR DEPARTMENTS AND SECURITY --->
					<A HREF="//#REQUEST.domain#/images/products/security2.png" REL="prettyPhoto[security]"></A>
					<A HREF="//#REQUEST.domain#/images/products/security3.png" REL="prettyPhoto[security]"></A>
					<A HREF="//#REQUEST.domain#/images/products/security4.png" REL="prettyPhoto[security]"></A>
				</LI>
			</CFOUTPUT>
		</UL>
	</DIV>
</SECTION>

<SECTION>
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="8">Deep Integration with<BR>Channel Manager and Yield Manager</H2>
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