<!--- secure the template --->
<CF_SECURETEMPLATE>

<!--- LOGO --->
<A CLASS="logo" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>" TITLE="OpenHotel">
	<IMG SRC="/images/template/logo.svg" ALT="OpenHotel">
</A>

<!--- BURGER MENU --->
<INPUT TYPE="checkbox" ID="menuButton" NAME="menuButton">
<LABEL CLASS="burgerButton" FOR="menuButton">
	<SPAN></SPAN>
</LABEL>

<!--- NAVIGATION --->
<NAV CLASS="primaryNav">
	<UL ROLE="list">
		<LI DATA-DROPDOWN="true">
			<A HREF="#" TITLE="Products">Products</A>
			<UL CLASS="submenu" ROLE="list">
				<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/pms.cfm" TITLE="Property Management System">Property Management System</A></LI>
				<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/channels.cfm" TITLE="Channel Management System">Channel Management System</A></LI>
				<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/yield.cfm" TITLE="Yield Management System">Yield Management System</A></LI>
				<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/enterprise.cfm" TITLE="Enterprise Management System">Enterprise Management System</A></LI>
				<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/products/bookingengine.cfm" TITLE="Booking Engine and Website">Booking Engine and Website</A></LI>
			</UL>
		</LI>
		<LI DATA-DROPDOWN="true">
			<A HREF="#">Solutions</A>
			<UL CLASS="submenu" ROLE="list">
				<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/solutions/independent.cfm" TITLE="Independent Hotels">Independent Hotels</A></LI>
				<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/solutions/brands.cfm" TITLE="Management Groups and Brands">Management Groups and Brands</A></LI>
				<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/solutions/casino.cfm" TITLE="Casino Hotels">Casino Hotels</A></LI>
				<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/solutions/vacation.cfm" TITLE="Vacation Home Rentals">Vacation Home Rentals</A></LI>
			</UL>
		</LI>
		<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/pricing.cfm" TITLE="Pricing">Pricing</A></LI>
		<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/integrations/index.cfm" TITLE="Integrations">Integrations</A></LI>
		<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/support.cfm" TITLE="Support">Support</A></LI>
		<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/contact.cfm" TITLE="Contact">Contact</A></LI>
		<LI><A HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/demo.cfm" CLASS="button" DATA-COLOR="pink" TITLE="Book a Demo">Book a Demo</A></LI>
	</UL>
</NAV>