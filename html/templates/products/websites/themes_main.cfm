<!-- secure the template -->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#ListFirstRandom("pink,blue,purple")#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="9">Website Themes</H1>
			<BR>
			<P DATA-SIZE="3">
				Designed to showcase your property.
			</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">
		<DIV ID="themes" CLASS="gridInfoCards">
			<CFOUTPUT QUERY="themeResults">
				<DIV>
					<H2 CLASS="heading" DATA-SIZE="5">Theme #NumberFormat(name)#</H2>
					<BR>
					<A HREF="//#REQUEST.domain#/products/bookingengine.cfm/mode/details/id/#id#" TITLE="Theme #NumberFormat(name)#"><IMG CLASS="graphic" SRC="/common/images/admin/hotel/themes/template_#name#.jpg" TITLE="Theme #NumberFormat(name)#" ALT="Theme #NumberFormat(name)#"></A>
					<A CLASS="button" DATA-COLOR="purple" HREF="//#REQUEST.domain#/products/bookingengine.cfm/mode/details/id/#id#" TITLE="View theme #NumberFormat(name)#">View theme</A>
				</DIV>
			</CFOUTPUT>
		</DIV>

		<BR><BR>

		<CFIF themeResults.totalRecords GT ARGUMENTS.limit>
			<CF_PAGENUMBERS ID="pagenums_top" RECORDCOUNT="#themeResults.totalRecords#" LIMIT="#ARGUMENTS.limit#" PAGENUMBER="#URL.page#">
		</CFIF>
	</DIV>
</SECTION>