<!--- secure the template --->
<CF_SECURETEMPLATE>

<!--- HERO --->
<SECTION ID="hero" DATA-BACKGROUND="teal">
	<!--- SLIDES --->
	<DIV ID="carousel">
		<!--- Advanced Software Made Simple --->
		<DIV ID="homePicSlide">
			<DIV CLASS="innerContainer subHeadingCard">
				<DIV>
					<H1 CLASS="heading" DATA-SIZE="9">
						<CF_EDIT ID="subHeading_title">
							Advanced<BR>
							Software<BR>
							Made Simple
						</CF_EDIT>
					</H1>
					<CF_EDIT ID="subHeading_description"><P DATA-SIZE="4">We have 25 years of experience in the hospitality industry writing our own proprietary hotel software.</P></CF_EDIT>
					<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm" CLASS="button" DATA-COLOR="pink" ALT="Learn More" TITLE="Learn More">Learn More</A>
				</DIV>
				<DIV CLASS="subHeadingMedia">
					<CF_EDIT ID="subHeading_media"><IMG SRC="/images/template/mainPic.png" ALT="A receptionist checking in a happy guest."></CF_EDIT>
				</DIV>
			</DIV>
		</DIV>
	</DIV>

	<!--- OH background --->
	<DIV CLASS="bg-oh-hero">
		<DIV>
			<SVG CLASS="svg-oh">
				<USE XLINK:HREF="/images/template/bg-oh.svg#bg-oh"></USE>
			</SVG>
			<SVG CLASS="svg-cross">
				<USE XLINK:HREF="/images/template/shapes.svg#cross"></USE>
			</SVG>
			<SVG CLASS="svg-triangle">
				<USE XLINK:HREF="/images/template/shapes.svg#triangle"></USE>
			</SVG>
		</DIV>
	</DIV>
</SECTION>

<SECTION ID="awards" CLASS="topWaves needsBottomPadding" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">

		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<BR><BR>
			<H2 CLASS="heading"><CF_EDIT ID="awardsTitle"><SPAN DATA-SIZE="8">Integrated. Dependable.<BR>Bilingual.</SPAN></CF_EDIT></H2>
			<BR>
			<CF_EDIT ID="awardsSubtitle"><P DATA-SIZE="3">All OpenHotel systems were built together from the first line of code rather than by acquisition.<BR>Each product offering is comprehensively developed and robust, designed to deliver complete solutions, not just a nominal set of features.<P></CF_EDIT>
		</DIV>

		<BR><BR><BR><BR>

		<DIV CLASS="gridInfoCards">
			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="premierPartners"></SPAN>
				</DIV>
				<H3 CLASS="heading">
					<CF_EDIT ID="gridCardTitle1"><SPAN DATA-SIZE="6">Expedia Elite and Booking.com Premier Partner</SPAN></CF_EDIT>
				</H3>
				<BR>
				<CF_EDIT ID="gridCardtext1">
					<P DATA-SIZE="3">
						Full Content API integration, 99.9% connectivity, 2% worldwide award recognition.
					</P>
				</CF_EDIT>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="zeroDowntime"></SPAN>
				</DIV>
				<H3 CLASS="heading">
					<CF_EDIT ID="gridCardTitle2"><SPAN DATA-SIZE="6">Zero downtime in 5 years and counting</SPAN></CF_EDIT>
				</H3>
				<BR>
				<CF_EDIT ID="gridCardtext2">
					<P DATA-SIZE="3">
						We've heavily invested in our infrastructure to give you peace of mind.
					</P>
				</CF_EDIT>
			</DIV>

			<DIV>
				<DIV CLASS="infoCardIcon">
					<SPAN CLASS="ohIcon" DATA-ICON="247support"></SPAN>
				</DIV>
				<H3 CLASS="heading">
					<CF_EDIT ID="gridCardTitle3"><SPAN DATA-SIZE="6">24/7 Support,<BR> in English and Spanish</SPAN></CF_EDIT>
				</H3>
				<BR>
				<CF_EDIT ID="gridCardtext3">
					<P DATA-SIZE="3">
						We value personal connection with our clients. Call us and we're there.
					</P>
				</CF_EDIT>
			</DIV>
		</DIV>

		<BR><BR>

		<A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm" CLASS="button" DATA-COLOR="pink" DATA-WIDTH="100%" ALT="Book A Demo" TITLE="Book A Demo">
			Book a Demo
		</A>
	</DIV>
</SECTION>

<!--- All IN ONE --->
<CFINCLUDE TEMPLATE="#REQUEST.templates#/homepage/all-in-one_main.cfm">

<!--- TESTIMONIALS --->
<CFINCLUDE TEMPLATE="#REQUEST.templates#/homepage/testimonials_main.cfm">

<!--- CALL TO ACTION --->
<CFINCLUDE TEMPLATE="#REQUEST.templates#/cta.cfm">

<!--- INTEGRATIONS --->
<CFINCLUDE TEMPLATE="#REQUEST.templates#/homepage/homePageIntegrations_main.cfm">

