<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateObject("component", "local")>
</CFIF>

<CFFUNCTION NAME="main" ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="reseller_main.cfm" />

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>

<CFFUNCTION NAME="submit" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var DoCommit   = "Yes">
	<CFSET var definition = "We will review your application and contact you accordingly.">
	<CFSET var today      = DateFormat(Now(),"DDDD, MM-DD-YYYY")>

	<!--- mail variables --->
	<CFSET var to      = REQUEST.admin_email>
	<CFSET var cc      = "sergio@openhotel.com">
	<CFSET var from    = "noreply@openhotel.com">
	<CFSET var subject = "Reseller Request from openhotel.com">
	<CFSET var body    = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.type","string","");
		param("FORM.firstName","string","");
		param("FORM.lastName","string","");
		param("FORM.company","string","");
		param("FORM.email","string","");
		param("FORM.website","string","");
		param("FORM.phone","string","");
		param("FORM.howManyHotels","string","");
		param("FORM.comments","string","");
		param("FORM.captcha","string","");
	</CFSCRIPT>

	<CFSET FORM.type          = StripHTML(FORM.type)>
	<CFSET FORM.firstName     = StripHTML(FORM.firstName)>
	<CFSET FORM.lastName      = StripHTML(FORM.lastName)>
	<CFSET FORM.company       = StripHTML(FORM.company)>
	<CFSET FORM.email         = LCase(StripHTML(FORM.email))>
	<CFSET FORM.website       = StripHTML(FORM.website)>
	<CFSET FORM.phone         = StripHTML(FORM.phone)>
	<CFSET FORM.howManyHotels = StripHTML(FORM.howManyHotels)>
	<CFSET FORM.comments      = StripHTML(FORM.comments)>
	<CFSET FORM.captcha       = StripHTML(FORM.captcha)>


	<CFIF DoCommit EQ "Yes" AND (FORM.firstName EQ "" AND FORM.lastName EQ "")>
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your first and last name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.company EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your company name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND isValid("email",FORM.email) EQ "No">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter a valid contact email address.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.website EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your website.">
	</CFIF>

	<!--- VALIDATION ADDED SAT 04/13/24 12:38 EST --->
	<CFIF validateCaptcha() IS false>
		<CFSET FORM.status = "invalidCaptchaCode">

		<CFOUTPUT>
			<SCRIPT>
				jQuery(document).ready(function() { jQuery("form##contactForm [data-validate='requireDefault']").attr("data-validate","requiredDefault"); });
			</SCRIPT>
		</CFOUTPUT>

		<CFINCLUDE TEMPLATE="#REQUEST.templates#/contact_main.cfm">

		<CFRETURN FALSE>
	</CFIF>

	<!--- create the email --->
	<CFIF DoCommit EQ "Yes">
		<CFTRY>
			<CFSET body = "<B>Form Submitted:</B> #today#<BR><BR>">
			<CFSET body = body & "<B>Name:</B> #FORM.firstName# #FORM.lastName#<BR>">
			<CFSET body = body & "<B>Company:</B> #FORM.company#<BR>">
			<CFSET body = body & "<B>Email:</B> #FORM.email#<BR>">
			<CFSET body = body & "<B>Website:</B> #FORM.website#<BR>">
			<CFSET body = body & "<B>Phone:</B> #FORM.phone#<BR>">
			<CFSET body = body & "<B>Number of Hotels they work with:</B> #FORM.howManyHotels#<BR>">
			<CFSET body = body & "<B>About them and their company:</B> #FORM.comments#<BR>">
			<CFSET body = body & "<B>Security code submitted:</B> #FORM.captcha#<BR>">

			<!--- send the email --->
			<CFINVOKE COMPONENT="mailer.main" METHOD="sendEmail" TO="#to#" FROM="#from#" CC="#cc#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#subject#" BODY="#body#" />

			<CFCATCH TYPE="Any">
				<CFSET DoCommit   = "No">
				<CFSET definition = "There was an error processing your information. If this occurs frequently, please contact the site administrator.">
				<CFDUMP var="#cfcatch#">
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<CF_DEFINITION TEXT="#definition#" TITLE="#IIF(DoCommit EQ 'Yes','"Thank You!"','"Alert"')#">

	<CFIF DoCommit EQ "No">
		<CFSCRIPT>main();</CFSCRIPT>
	</CFIF>

</CFFUNCTION>

</CFCOMPONENT>