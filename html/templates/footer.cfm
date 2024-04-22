<!--- secure the template --->
<CF_SECURETEMPLATE>

	</MAIN>

	<FOOTER ID="mainFooter" CLASS="topWaves" DATA-BACKGROUND="darkBlue">
		<DIV CLASS="innerContainer innerFooter">
			<!--- FOOTER NAV --->
			<NAV>
				<SPAN>Products</SPAN>
				<UL ROLE="list">
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/pms.cfm" TITLE="Property Management System">Property Management System</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/channels.cfm" TITLE="Channel Management System">Channel Management System</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/yield.cfm" TITLE="Yield Management System">Yield Management System</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/enterprise.cfm" TITLE="Enterprise Management System">Enterprise Management System</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/bookingengine.cfm" TITLE="Booking Engine and Website">Booking Engine and Website</A></LI>
				</UL>
			</NAV>
			<NAV>
				<SPAN>Solutions</SPAN>
				<UL ROLE="list">
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/solutions/independent.cfm" TITLE="Independent Hotels">Independent Hotels</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/solutions/brands.cfm" TITLE="Management Groups and Brands">Management Groups and Brands</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/solutions/casino.cfm" TITLE="Casino Hotels">Casino Hotels</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/solutions/vacation.cfm" TITLE="Vacation Home Rentals">Vacation Home Rentals</A></LI>
				</UL>
			</NAV>
			<NAV>
				<SPAN>Information</SPAN>
				<UL>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/integrations/index.cfm" TITLE="Integrations">Integrations</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/pricing.cfm" TITLE="Pricing">Pricing</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/resellers.cfm" TITLE="Resellers">Resellers</A></LI>
				</UL>
			</NAV>
			<NAV>
				<SPAN>Company</SPAN>
				<UL ROLE="list">
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/blog/news-and-articles-for-hotels" TITLE="News & Articles">News &amp; Articles</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/testimonials.cfm" TITLE="Testimonials">Testimonials</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/support.cfm" TITLE="Support">Support</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/about.cfm">About</A></LI>
					<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/contact.cfm" TITLE="Contact">Contact</A></LI>
				</UL>
			</NAV>

			<!--- PHONE NUMBERS --->
			<DIV CLASS="footerContact">
				<A CLASS="logo" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/">
					<IMG SRC="/images/template/logo-white.svg" ALT="OpenHotel" TITLE="OpenHotel" LOADING="lazy">
				</A>
				<DIV>
					<UL>
						<LI>
							<SPAN>Office</SPAN>
						</LI>
						<LI>
							<SPAN>Sales</SPAN>
						</LI>
						<!---<LI>
							<SPAN>Support</SPAN>
						</LI>--->
					</UL>
					<UL>
						<LI>
							<A HREF="tel:7026285014" TITLE="Office: (702) 628-5014">
								<SPAN CLASS="phone">(702) 628-5014</SPAN>
							</A>
						</LI>
						<LI>
							<A HREF="tel:7025511149" TITLE="Sales: (702) 551-1149">
								<SPAN CLASS="phone">(702) 551-1149</SPAN>
							</A>
						</LI>
						<!---<LI>
							<A HREF="tel:7026285037" TITLE="Support: (702) 628-5037">
								<SPAN CLASS="phone">(702) 628-5037</SPAN>
							</A>
						</LI>--->
					</UL>
				</DIV>

				<!--- SOCIAL ICONS --->
				<UL CLASS="footerSocial">
					<LI TITLE="Facebook">
						<A TARGET="_blank" HREF="//www.facebook.com/openhotelsystems/"><SPAN CLASS="ohIcon" DATA-ICON="facebook" ARIA-LABEL="Facebook"></SPAN></A>
					</LI>
					<LI TITLE="LinkedIn">
						<A TARGET="_blank" HREF="//www.linkedin.com/company/openhotel-inc"><SPAN CLASS="ohIcon" DATA-ICON="linkedIn" ARIA-LABEL="LinkedIn"></SPAN></A>
					</LI>
					<LI TITLE="Twitter (X)">
						<A TARGET="_blank" HREF="//twitter.com/openhoteldotcom"><SPAN CLASS="ohIcon" DATA-ICON="twitter" ARIA-LABEL="Twitter (X)"></SPAN></A>
					</LI>
					<LI TITLE="Youtube">
						<A TARGET="_blank" HREF="//www.youtube.com/c/Openhotelhotelsoftware"><SPAN CLASS="ohIcon" DATA-ICON="youtube" ARIA-LABEL="Youtube"></SPAN></A>
					</LI>
				</UL>
			</DIV>
		</DIV>

		<DIV CLASS="footerStamp">
			<DIV CLASS="copyrights">
				<SPAN DATA-SIZE="1">© <CFOUTPUT>#Year(Now())#</CFOUTPUT> OpenHotel, Inc. • All Rights Reserved • <A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/privacy.cfm" DATA-SIZE="1">Privacy Policy</A></SPAN>
			</DIV>
		</DIV>
	</FOOTER>

	<BUTTON ID="backToTop" CLASS="invisible">
		<SPAN CLASS="ohIcon" DATA-ICON="backToTop"></SPAN>
	</BUTTON>

	<CFINVOKE COMPONENT="website.main" METHOD="analytics" />
</BODY>
</HTML>