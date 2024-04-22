<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateObject("component", "local")>
</CFIF>

<CFFUNCTION NAME="main" ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="contact_main.cfm" />

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>

<CFFUNCTION NAME="submit" ACCESS="public">
	<!--- INITIALIZE VARIABLES --->
	<CFSET var DoCommit   = "Yes">
	<CFSET var definition = "Thank you for contacting us, our team will get in touch with you soon.">
	<CFSET var today      = DateFormat(Now(),"DDDD, MM-DD-YYYY")>

	<!--- MAIL VARIABLES --->
	<CFSET var to      = REQUEST.admin_email>
	<CFSET var cc      = "sergio@openhotel.com">
	<CFSET var from    = "noreply@openhotel.com">
	<CFSET var subject = "Comments from openhotel.com">
	<CFSET var body    = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.type","string","");
		param("FORM.firstName","string","");
		param("FORM.lastName","string","");
		param("FORM.email","string","");
		param("FORM.phone","string","");
		param("FORM.propertyName","string","");
		param("FORM.propertyLocation","string","");
		param("FORM.selectInterest","string","");
		param("FORM.comments","string","");
	</CFSCRIPT>

	<CFSET FORM.type             = StripHTML(FORM.type)>
	<CFSET FORM.firstName        = StripHTML(FORM.firstName)>
	<CFSET FORM.lastName         = StripHTML(FORM.lastName)>
	<CFSET FORM.email            = LCase(StripHTML(FORM.email))>
	<CFSET FORM.phone            = StripHTML(FORM.phone)>
	<CFSET FORM.propertyName     = StripHTML(FORM.propertyName)>
	<CFSET FORM.propertyLocation = StripHTML(FORM.propertyLocation)>
	<CFSET FORM.selectInterest   = StripHTML(FORM.selectInterest)>
	<CFSET FORM.comments         = StripHTML(FORM.comments)>

	<CFIF validateCaptcha() IS false>
		<CFSET DoCommit   = "No">
		<CFSET FORM.status = "invalidCaptchaCode">
		<CFSET var definition = "The security code you entered is not correct, please try again.">

		<CFINCLUDE TEMPLATE="#REQUEST.templates#/contact_main.cfm">

		<CFRETURN FALSE>
	</CFIF>

	<!--- create the email --->
	<CFIF DoCommit EQ "Yes">
		<CFTRY>
			<CFSET body = "<B>Form Submitted:</B> #today#<BR><BR>">
			<CFSET body = body & "<B>Name:</B> #FORM.firstName# #FORM.lastName#<BR>">
			<CFSET body = body & "<B>Email:</B> #FORM.email#<BR>">
			<CFSET body = body & "<B>Phone:</B> #FORM.phone#<BR>">
			<CFSET body = body & "<B>Property:</B> #FORM.propertyName#<BR>">
			<CFSET body = body & "<B>Location:</B> #FORM.propertyLocation#<BR>">
			<CFSET body = body & "<B>Interested in:</B> #FORM.selectInterest#<BR>">
			<CFSET body = body & "<B>Comments:</B> #FORM.comments#<BR>">

			<!--- send the email --->
			<CFINVOKE COMPONENT="mailer.main" METHOD="sendEmail" TO="#to#" FROM="#from#" CC="#cc#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#subject#" BODY="#body#" />

			<CFCATCH TYPE="Any">
				<CFSET DoCommit   = "No">
				<CFSET definition = "There was an error processing your information. If this occurs frequently, please contact the site administrator.">
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<CF_DEFINITION TEXT="#definition#" TITLE="#IIF(DoCommit EQ 'Yes','"Thank You!"','"Alert"')#">

	<CFIF DoCommit EQ "No">
		<CFSCRIPT>main();</CFSCRIPT>
	</CFIF>

</CFFUNCTION>

</CFCOMPONENT>