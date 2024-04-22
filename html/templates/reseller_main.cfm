<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#gradientColor#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<H1 CLASS="heading" DATA-SIZE="8">Reseller Request<BR>& Opportunity</H1>
			<BR>
			<!---<P DATA-SIZE="3">We offer a few partner programs to choose from. Regardless if you are looking to refer us clients and earn a referral fee, or you want to sell the OpenHotel System to your hotels and earn even more. We have a program for you. Please complete the form below and someone will reach out to you.</P>--->
			<P DATA-SIZE="3">Regardless of whether you are looking to refer us clients and earn a referral fee or if you want to sell the OpenHotel system to your hotels and earn even more, we have a program for you.<BR>Please complete the form below and someone will reach out to you.</P>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves ohBackgroundContainer" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">

		<DIV CLASS="subHeadingCard contactGrid">

			<CFIF 1 EQ 2>
				<!--- EMAIL ME FORM --->
				<SCRIPT SRC="https://www.emailmeform.com/builder/forms/jsform/5xdv7QCP9Rn7T" TYPE="text/javascript"></SCRIPT>
			<CFELSE>
				<FORM ID="contactForm" ACTION="#" METHOD="post">
					<INPUT TYPE="hidden" NAME="mode" ID="mode" VALUE="submit">
					<FIELDSET>
						<LEGEND CLASS="sr-only">Reseller Request</LEGEND>
						<SPAN DATA-SIZE="3">Your Name:</SPAN>
						<DIV CLASS="contactRow">
							<LABEL FOR="firstName"><INPUT TYPE="text" ID="firstName" NAME="firstName" PLACEHOLDER="First" REQUIRED></LABEL>
							<LABEL FOR="lastName"><INPUT TYPE="text" ID="lastName" NAME="lastName" PLACEHOLDER="Last" REQUIRED></LABEL>
						</DIV>
						<LABEL FOR="company">
							Your Company's Name:
							<INPUT TYPE="text" ID="company" NAME="company" REQUIRED>
						</LABEL>
						<LABEL FOR="email">
							Email:<BR>
							<INPUT TYPE="email" ID="email" NAME="email" REQUIRED>
						</LABEL>
						<LABEL FOR="website">
							Website:<BR>
							<INPUT TYPE="text" ID="website" NAME="website" REQUIRED>
						</LABEL>
						<LABEL FOR="phone">
							Phone:<BR>
							<INPUT TYPE="text" ID="phone" NAME="phone" REQUIRED>
						</LABEL>
						<LABEL FOR="howManyHotels">
							How Many Hotels Do You Currently Work With?:<BR>
							<INPUT TYPE="text" ID="howManyHotels" NAME="howManyHotels" REQUIRED>
						</LABEL>
						<LABEL FOR="comments">
							Tell Us a Little Bit About You And Your Company.<BR>
							<TEXTAREA ID="comments" NAME="comments" ROWS="3"></TEXTAREA>
						</LABEL>
					</FIELDSET>

					<FIELDSET>
						<LABEL FOR="captcha">Security Code:<BR>
							<CF_CAPTCHA WIDTH="240" HEIGHT="50" FONTSIZE="20" LEFTOFFSET="5" TOPOFFSET="25" SHEARXRANGE="0" SHEARYRANGE="0" FONTNAME="serif.bold">
							<BR>
							<INPUT TYPE="text" NAME="captcha" ID="captcha" <CFIF hasRights("admin,webmaster,master") EQ "Yes">VALUE="<CFOUTPUT>#SESSION.captcha#</CFOUTPUT>" DATA-VALIDATE="requiredDefault"<CFELSE> DATA-VALIDATE="required"</CFIF> DATA-VALIDATENAME="your security code" REQUIRED>
						</LABEL>
						<INPUT TYPE="submit" ID="submitForm" NAME="submitForm" CLASS="button" DATA-COLOR="pink" VALUE="Submit">
					</FIELDSET>
				</FORM>
			</CFIF>

			<DIV CLASS="contactContent">
				<H2 CLASS="heading" DATA-SIZE="5">Reseller Request</H2>

				<BR>

				<A CLASS="logo" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/">
					<IMG SRC="/images/template/logo.svg" ALT="OpenHotel" TITLE="OpenHotel" LOADING="lazy">
				</A><BR>
				<SPAN DATA-SIZE="3">Headquarters in Las Vegas, Nevada</SPAN>
				<DIV CLASS="contactPhones">
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
				<UL CLASS="contactSocial">
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

	</DIV>

	<!--- OH BACKGROUND --->
	<DIV CLASS="bg-oh-integrations">
		<SVG CLASS="svg-oh">
			<USE XLINK:HREF="/images/template/bg-oh.svg#bg-oh"></USE>
		</SVG>
	</DIV>
</SECTION>



