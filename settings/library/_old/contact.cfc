<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateObject("component", "local")>
</CFIF>

<CFFUNCTION NAME="inquiry_main" ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="inquiry_form.cfm" />

	<!--- initialize variables --->
	<CFSET var thisState   = "">
	<CFSET var thisCountry = "">

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>

<CFFUNCTION NAME="inquiry_submit" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var DoCommit   = "Yes">
	<CFSET var definition = "Thank you for your inquiry!<BR>We will review what you have sent and get back to you as soon as possible.">
	<CFSET var thisList   = "">

	<!--- mail variables --->
	<CFSET var emailTo      = "sales@openhotel.com">
	<CFSET var emailFrom    = REQUEST.admin_email>
	<CFSET var emailSubject = "OpenHotel Inquiry">
	<CFSET var emailbody    = "">

	<CFSET var leadTo      = "saleslead@openhotel.com">
	<CFSET var leadFrom    = REQUEST.admin_email>
	<CFSET var leadSubject = "OpenHotel Inquiry">
	<CFSET var leadBody    = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.inquiry_subject","string","");
		param("FORM.also_interested","string","");
	</CFSCRIPT>

	<CFSET FORM.firstname        = StripHTML(FORM.firstname)>
	<CFSET FORM.lastname         = StripHTML(FORM.lastname)>
	<CFSET FORM.emailAddress     = LCase(Trim(FORM.emailAddress))>
	<CFSET FORM.phone            = StripHTML(FORM.phone)>
	<CFSET FORM.property_name    = StripHTML(FORM.property_name)>
	<CFSET FORM.property_address = StripHTML(FORM.property_address)>
	<CFSET FORM.property_city    = StripHTML(FORM.property_city)>
	<CFSET FORM.property_state   = StripHTML(FORM.property_state)>
	<CFSET FORM.property_zip     = StripHTML(FORM.property_zip)>
	<CFSET FORM.property_country = StripHTML(FORM.property_country)>
	<CFSET FORM.comments         = StripHTML(FORM.comments)>
	<CFSET FORM.how_heard        = StripHTML(FORM.how_heard)>

	<CFIF validateCaptcha() EQ "No">
		<CFSET DoCommit   = "No">
		<CFSET definition = "Invalid security code.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.firstname EQ "" AND FORM.lastname EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your full name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND isValid("email", FORM.emailAddress) EQ "No">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter a valid email address.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.phone EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your contact phone number.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.property_name EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your property name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.property_address EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your property address.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.property_city EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your property city.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.property_state EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your property state.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.property_zip EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your property zip code.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.property_country EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your property country.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.inquiry_subject EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "Please select the subject of your inquiry">
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<!-- create the email -->
		<CFSET emailBody = "<B>Name:</B> #FORM.firstname# #FORM.lastname#<BR>">
		<CFSET emailBody = emailBody & "<B>Contact Email:</B> #FORM.emailAddress#<BR>">
		<CFSET emailBody = emailBody & "<B>Contact Phone:</B> #FORM.phone#<BR>--------------------------------<BR>">
		<CFSET emailBody = emailBody & "<B>Property Name:</B> #FORM.property_name#<BR>">
		<CFSET emailBody = emailBody & "<B>Property Address:</B> #FORM.property_address#<BR>">
		<CFSET emailBody = emailBody & "<B>Property City:</B> #FORM.property_city#<BR>">
		<CFSET emailBody = emailBody & "<B>Property State:</B> #FORM.property_state#<BR>">
		<CFSET emailBody = emailBody & "<B>Property Zip:</B> #FORM.property_zip#<BR>">
		<CFSET emailBody = emailBody & "<B>Property Country:</B> #FORM.property_country#<BR>--------------------------------<BR>">

		<CFSET leadBody = "Name:#FORM.firstname# #FORM.lastname##Chr(10)##Chr(13)#">
		<CFSET leadBody = leadBody & "ContactEmail:#FORM.emailAddress##Chr(10)##Chr(13)#">
		<CFSET leadBody = leadBody & "ContactPhone:#FORM.phone##Chr(10)##Chr(13)#">
		<CFSET leadBody = leadBody & "PropertyName:#FORM.property_name##Chr(10)##Chr(13)#">
		<CFSET leadBody = leadBody & "PropertyAddress:#FORM.property_address##Chr(10)##Chr(13)#">
		<CFSET leadBody = leadBody & "PropertyCity:#FORM.property_city##Chr(10)##Chr(13)#">
		<CFSET leadBody = leadBody & "PropertyState:#FORM.property_state##Chr(10)##Chr(13)#">
		<CFSET leadBody = leadBody & "PropertyZip:#FORM.property_zip##Chr(10)##Chr(13)#">
		<CFSET leadBody = leadBody & "PropertyCountry:#FORM.property_country##Chr(10)##Chr(13)#">

		<CFSET thisList = ArrayToList(ListToArray(FORM.inquiry_subject,","),", ")>
		<CFSET emailBody = emailBody & "<B>Inquiry Subject:</B> #thisList#<BR>--------------------------------<BR>">
		<CFSET leadBody  = leadBody & "InquirySubject:#thisList##Chr(10)##Chr(13)#">

		<CFIF FORM.also_interested NEQ "">
			<CFSET thisList  = ArrayToList(ListToArray(FORM.also_interested,","),", ")>
			<CFSET emailBody = emailBody & "<B>Interested In:</B> #thisList#<BR>--------------------------------<BR>">
			<CFSET leadBody  = leadBody & "InterestedIn:#thisList##Chr(10)##Chr(13)#">
		<CFELSE>
			<CFSET emailBody = emailBody & "<B>Interested In:</B> Not Provided<BR>--------------------------------<BR>">
		</CFIF>

		<CFSET emailBody = emailBody & "<B>Comments:</B> #FORM.comments#<BR>--------------------------------<BR>">
		<CFSET emailBody = emailBody & "<B>How Did You Hear About Us:</B> #FORM.how_heard#">

		<CFSET leadBody  = leadBody & "Comments:#FORM.comments.replaceAll('#Chr(10)#',' ').replaceAll('#Chr(13)#','')##Chr(10)##Chr(13)#">
		<CFSET leadBody  = leadBody & "HowHeard:#FORM.how_heard.replaceAll('#Chr(10)#',' ').replaceAll('#Chr(13)#','')#">

		<!--- send email to sales --->
		<CFINVOKE COMPONENT="components.mailer.main" METHOD="sendEmail" TO="#emailTo#" FROM="#emailFrom#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#emailSubject#" BODY="#emailBody#" />

		<!--- send lead to sales --->
		<CFMAIL FROM="#leadFrom#" TO="#leadTo#" SUBJECT="#leadSubject#" TYPE="text/plain">#Trim(leadBody)#</CFMAIL>
	</CFIF>

	<CF_DEFINITION TEXT="#definition#" TITLE="#IIF(DoCommit EQ 'Yes','"Inquiry Sent"','"Alert"')#">

	<CFIF DoCommit EQ "No">
		<CFSCRIPT>inquiry_main();</CFSCRIPT>
	</CFIF>

</CFFUNCTION>

</CFCOMPONENT>