<!-- secure the template -->
<CF_SECURETEMPLATE>

<SCRIPT LANGUAGE="javascript">
	function websiteManager() {
		this.blockClick = function(thisColor) {
			var thisScreenshot = "/common/templates/admin/website/templates/packages/<CFOUTPUT>#templateResults.name#</CFOUTPUT>/"+thisColor+"/xlarge.jpg";
			jQuery("#template_screenshot").attr("src",thisScreenshot);
		};
	}

	myWebsiteManager = new websiteManager();
</SCRIPT>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#ListFirstRandom("pink,blue,purple")#</CFOUTPUT>">
	<DIV CLASS="innerContainer" TEXT-ALIGN="center">
		<H1 CLASS="heading" DATA-SIZE="7">Theme <CFOUTPUT>#templateResults.name#</CFOUTPUT></H1>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">
		<DIV CLASS="subHeadingCard">
			<IMG ID="template_screenshot" src="/common/templates/admin/website/templates/packages/<CFOUTPUT>#templateResults.name#</CFOUTPUT>/xlarge.jpg" TITLE="Theme <CFOUTPUT>#templateResults.name#</CFOUTPUT>" ALT="Theme <CFOUTPUT>#templateResults.name#</CFOUTPUT>">
			<DIV>
				<CFIF ListLen(templateResults.colors) GT 0>
					<DIV>
						<H2 CLASS="heading" DATA-SIZE="5">Available in the following styles</H2>
						<BR>

						<DIV CLASS="themeColors">
							<CFLOOP LIST="#templateResults.colors#" INDEX="c">
								<CFOUTPUT>
									<A CLASS="themeColor" HREF="javascript:;" ONCLICK="myWebsiteManager.blockClick('#c#')"><IMG SRC="/common/templates/admin/website/templates/packages/#templateResults.name#/#c#/block.jpg" hspace="2" ID="#c#" TITLE="View theme in color #c#" ALT="View theme in color #c#"></A>
								</CFOUTPUT>
							</CFLOOP>
						</DIV>
					</DIV>
				</CFIF>

				<BR>

				<SPAN DATA-SIZE="3">$<CFOUTPUT>#NumberFormat(templateResults.price,"00")#</CFOUTPUT> one time fee. No monthly hosting.</SPAN>

				<BR>

				<DIV CLASS="themeDescription" DATA-SIZE="3">
					<CFOUTPUT>#templateResults.description#</CFOUTPUT>
				</DIV>

				<BR>
			</DIV>
		</DIV>
	</DIV>
</SECTION>