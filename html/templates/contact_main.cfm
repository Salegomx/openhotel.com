<!--- secure the template --->
<CF_SECURETEMPLATE>

<SECTION CLASS="needsBottomPadding" DATA-BACKGROUND="gradient" DATA-COLOR="<CFOUTPUT>#ListFirstRandom("pink,blue,purple")#</CFOUTPUT>">
	<DIV CLASS="innerContainer">
		<DIV CLASS="containerHeader" TEXT-ALIGN="center">
			<CFIF isDefined("definition") EQ "Yes">
				<CF_DEFINITION TEXT="#definition#" TITLE="Alert">
			<CFELSE>
				<H2 CLASS="heading" DATA-SIZE="8">Ready to get Started?</H2>
				<BR>
				<P DATA-SIZE="3">
					We are happy to answer any questions you might have.<BR>Please complete the form below and someone will reach out to you.
				</P>
			</CFIF>
		</DIV>
	</DIV>
</SECTION>

<SECTION CLASS="topWaves ohBackgroundContainer" DATA-BACKGROUND="white">
	<DIV CLASS="innerContainer">
		<DIV CLASS="subHeadingCard contactGrid">
			<FORM ID="contactForm" ACTION="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/contact.cfm" METHOD="post" ONSUBMIT="return validateForm('contactForm');">
				<INPUT TYPE="hidden" NAME="mode" ID="mode" VALUE="submit">
				<FIELDSET>
					<LEGEND CLASS="sr-only">Personal Information:</LEGEND>
					<SPAN DATA-SIZE="3">Your name:</SPAN>
					<DIV CLASS="contactRow">
						<CFSET v.thisVal = "">
						<CFIF isDefined("FORM.firstname") EQ "Yes">
							<CFSET v.thisVal = FORM.firstname>
						</CFIF>
							<LABEL FOR="firstName"><INPUT TYPE="text" ID="firstName" NAME="firstName" PLACEHOLDER="First" VALUE="<CFOUTPUT>#v.thisVal#</CFOUTPUT>" REQUIRED></LABEL>
						<CFIF isDefined("FORM.lastName") EQ "Yes">
							<CFSET v.thisVal = FORM.lastName>
						</CFIF>
						<LABEL FOR="lastName"><INPUT TYPE="text" ID="lastName" NAME="lastName" PLACEHOLDER="Last" VALUE="<CFOUTPUT>#v.thisVal#</CFOUTPUT>" REQUIRED></LABEL>
					</DIV>
					<LABEL FOR="email">
						Email:<BR>
						<CFIF isDefined("FORM.email") EQ "Yes">
							<CFSET v.thisVal = FORM.email>
						</CFIF>
						<INPUT TYPE="email" ID="email" NAME="email" VALUE="<CFOUTPUT>#v.thisVal#</CFOUTPUT>" REQUIRED>
					</LABEL>
					<LABEL FOR="phone">
						Phone:<BR>
						<CFIF isDefined("FORM.phone") EQ "Yes">
							<CFSET v.thisVal = FORM.phone>
						</CFIF>
						<INPUT TYPE="number" ID="phone" NAME="phone" VALUE="<CFOUTPUT>#v.thisVal#</CFOUTPUT>" MAXLENGTH="10" REQUIRED>
					</LABEL>
				</FIELDSET>
				<FIELDSET>
					<LEGEND CLASS="sr-only">Information about the property</LEGEND>
					<LABEL FOR="propertyName">
						Property name:<BR>
						<CFIF isDefined("FORM.propertyName") EQ "Yes">
							<CFSET v.thisVal = FORM.propertyName>
						</CFIF>
						<INPUT TYPE="text" ID="propertyName" VALUE="<CFOUTPUT>#v.thisVal#</CFOUTPUT>" NAME="propertyName" REQUIRED>
					</LABEL>
					<LABEL FOR="propertyLocation">
						Property Location:<BR>
						<CFIF isDefined("FORM.propertyLocation") EQ "Yes">
							<CFSET v.thisVal = FORM.propertyLocation>
						</CFIF>
						<INPUT TYPE="text" ID="propertyLocation" VALUE="<CFOUTPUT>#v.thisVal#</CFOUTPUT>" NAME="propertyLocation" REQUIRED>
					</LABEL>
				</FIELDSET>
				<FIELDSET>
					<LEGEND CLASS="sr-only">What interests you:</LEGEND>
					<LABEL FOR="selectInterest">
						I am interested in:<BR>
						<SELECT ID="selectInterest" NAME="selectInterest">
							<OPTION VALUE="All OH systems" SELECTED>All OpenHotel systems</OPTION>
							<OPTION VALUE="PMS">Property Management System</OPTION>
							<OPTION VALUE="CM">Channel Management System</OPTION>
							<OPTION VALUE="YM">Yield Management System</OPTION>
							<OPTION VALUE="Enterprise">Enterprise Management System</OPTION>
							<OPTION VALUE="Solutions">Solutions</OPTION>
							<OPTION VALUE="Integrations">Integrations</OPTION>
							<OPTION VALUE="Pricing">Pricing</OPTION>
							<OPTION VALUE="Support">Support</OPTION>
						</SELECT>
					</LABEL>
					<LABEL FOR="comments">
						Comments:<BR>
						<CFIF isDefined("FORM.comments") EQ "Yes">
							<CFSET v.thisVal = FORM.comments>
						</CFIF>
						<TEXTAREA ID="comments" NAME="comments" ROWS="3"><CFOUTPUT>#v.thisVal#</CFOUTPUT></TEXTAREA>
					</LABEL>
					<LABEL FOR="subscribe">
						<INPUT TYPE="checkbox" ID="subscribe" NAME="subscribe" CHECKED>
						Yes, I would like to receive communication about OpenHotel services on an ongoing basis. Ability to unsubscribe at anytime.
					</LABEL>
				</FIELDSET>
				<FIELDSET>
					<LABEL FOR="captcha">Security Code:<BR>
						<CF_CAPTCHA WIDTH="240" HEIGHT="50" FONTSIZE="20" LEFTOFFSET="5" TOPOFFSET="25" SHEARXRANGE="0" SHEARYRANGE="0" FONTNAME="serif.bold">
						<BR>
						<INPUT TYPE="text" NAME="captcha" ID="captcha" <CFIF hasRights("admin,webmaster,master") EQ "Yes">VALUE="<CFOUTPUT>#SESSION.captcha#</CFOUTPUT>" DATA-VALIDATE="requiredDefault"<CFELSE> DATA-VALIDATE="required"</CFIF> DATA-VALIDATENAME="your security code" REQUIRED>
					</LABEL>
					<INPUT TYPE="submit" ID="submitForm" NAME="submitForm" CLASS="button" DATA-COLOR="pink" VALUE="Submit" DATA-DISABLEONSUBMIT="Yes">
				</FIELDSET>
			</FORM>

			<DIV CLASS="contactContent">
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

				<BR>

				<A CLASS="button" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/resellers.cfm" DATA-COLOR="pink" DATA-SIZE="2">Are you a reseller?<BR>Click here to contact us</A>
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