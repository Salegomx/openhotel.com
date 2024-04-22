<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="9">Booking Engine & Website</H1>
			<BR>
			<P DATA-SIZE="3">
				Designed to showcase your property.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves bottomWaves subHeadingBody" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">

		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="7">Your New<BR>Booking Engine and Website</H2>
			<BR>
			<P DATA-SIZE="3">
				Offers a standalone Booking Engine to match existing website.<BR>Or choose from dozens of Website designs which integrate with your OpenHotel applications.
			</P>
		</DIV>

		<BR><BR><BR><BR>

		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="design"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Booking<BR>Engine<BR>Design</H3>
				<BR>

				<P DATA-SIZE="2">
					Customize the look and feel of the results page to match your existing website. Use the same colors, titles, displays, layout and style buttons, with additional options.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="websiteAndBookingEngine"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Booking<BR>Engine<BR>Widget</H3>
				<BR>

				<P DATA-SIZE="2">
					Place the booking engine anywhere on any page within your existing website using a snippet of code. This allows guests to search dates and will redirect to the results page. Completely integrated with the PMS.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="package"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Specials, Packages and Groups</H3>
				<BR>

				<P DATA-SIZE="2">
					Display rate specials, packages and groups with a private code. Guests can book online quickly and easily without the need to call the property.
				</P>
			</DIV>
		</DIV>

		<UL CLASS="screenshotsRow">
			<CFOUTPUT>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/beDesign1.png" REL="prettyPhoto[beDesign]">
						<FIGURE>
							<IMG SRC="/images/products/beDesign1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Booking engine design</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR BOOKING ENGINE DESIGN --->
					<A HREF="//#REQUEST.domain#/images/products/beDesign2.png" REL="prettyPhoto[beDesign]"></A>
					<A HREF="//#REQUEST.domain#/images/products/beDesign3.png" REL="prettyPhoto[beDesign]"></A>
					<A HREF="//#REQUEST.domain#/images/products/beDesign4.png" REL="prettyPhoto[beDesign]"></A>
					<A HREF="//#REQUEST.domain#/images/products/beDesign5.png" REL="prettyPhoto[beDesign]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/dashboard1.png" REL="prettyPhoto[yieldManagement]">
						<FIGURE>
							<IMG SRC="/images/products/dashboard1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Automation to make your life easier</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/dashboard1.png" REL="prettyPhoto[yieldManagement]">
						<FIGURE>
							<IMG SRC="/images/products/dashboard1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Automation to make your life easier</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>
				</LI>
			</CFOUTPUT>
		</UL>
	</DIV>

	<!--- VIEW OUR WEBSITE THEMES --->
	<DIV ID="callToAction" DATA-BACKGROUND="gradient" DATA-COLOR="ctaPurple">
		<SVG CLASS="oh-watermark">
			<USE XLINK:HREF="/images/template/oh-watermark.svg#oh-watermark"></USE>
		</SVG>
		<DIV CLASS="innerContainer">
			<DIV><!--- SPACER ---></DIV>
			<SPAN>View our Website themes</SPAN>
			<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/bookingengine.cfm/mode/themes" CLASS="button" DATA-COLOR="pink" TITLE="View Themes">View Themes</A>
		</DIV>
	</DIV>

	<DIV CLASS="innerContainer">

		<BR><BR><BR><BR>

		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="PMSSystem"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Hotel<BR>Websites</H3>
				<BR>

				<P DATA-SIZE="2">
					Choose from dozens of mobile friendly website designs to showcase your property. Rooms, packages, amenities, photo gallery, specials and guest reviews, works seamlessly with OpenHotel applications suite.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="content"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Content<BR>Management</H3>
				<BR>

				<P DATA-SIZE="2">
					Simple on-screen visual editing, our content management tool is easy to use. Quickly update most areas of the website anytime.
				</P>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="landingPage"></SPAN>
				</DIV>

				<H3 CLASS="heading" DATA-SIZE="7">Landing<BR>Pages</H3>
				<BR>

				<P DATA-SIZE="2">
					Create on-the-fly website landing pages for content and tracking purposes. Use private promo codes that sync with discounts, packages and groups application to encourage online booking.
				</P>
			</DIV>
		</DIV>

		<UL CLASS="screenshotsRow">
			<CFOUTPUT>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/websites1.png" REL="prettyPhoto[websites]">
						<FIGURE>
							<IMG SRC="/images/products/websites1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Hotel websites</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR HOTEL WEBSITES --->
					<A HREF="//#REQUEST.domain#/images/products/websites2.png" REL="prettyPhoto[websites]"></A>
					<A HREF="//#REQUEST.domain#/images/products/websites3.png" REL="prettyPhoto[websites]"></A>
					<A HREF="//#REQUEST.domain#/images/products/websites4.png" REL="prettyPhoto[websites]"></A>
					<A HREF="//#REQUEST.domain#/images/products/websites5.png" REL="prettyPhoto[websites]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/content1.png" REL="prettyPhoto[content]">
						<FIGURE>
							<IMG STYLE="object-position:center" SRC="/images/products/content1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves" DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Content management</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>

					<!--- MINI GALLERY FOR CONTENT MANAGEMENT --->
					<A HREF="//#REQUEST.domain#/images/products/content2.png" REL="prettyPhoto[content]"></A>
					<A HREF="//#REQUEST.domain#/images/products/content3.png" REL="prettyPhoto[content]"></A>
					<A HREF="//#REQUEST.domain#/images/products/content4.png" REL="prettyPhoto[content]"></A>
					<A HREF="//#REQUEST.domain#/images/products/content5.png" REL="prettyPhoto[content]"></A>
					<A HREF="//#REQUEST.domain#/images/products/content6.png" REL="prettyPhoto[content]"></A>
					<A HREF="//#REQUEST.domain#/images/products/content7.png" REL="prettyPhoto[content]"></A>
				</LI>
				<LI>
					<A HREF="//#REQUEST.domain#/images/products/dashboard1.png" REL="prettyPhoto[yieldManagement]">
						<FIGURE>
							<IMG SRC="/images/products/dashboard1.png" ALT="">
							<FIGCAPTION CLASS="darkBlue">
								<DIV CLASS="hoverWaves"  DATA-WAVE="#ListFirstRandom(waveOptions)#"> <!--- WAVE --->
									<SPAN>Automation to make your life easier</SPAN>
								</DIV>
							</FIGCAPTION>
						</FIGURE>
					</A>
				</LI>
			</CFOUTPUT>
		</UL>
	</DIV>
</SECTION>

<SECTION>
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H2 CLASS="heading" DATA-SIZE="8">Deep Integration with<BR>PMS, Channel Manager and Yield Manager</H2>
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