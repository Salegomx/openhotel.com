<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateCFC("#REQUEST.domainRoot#/settings/library/local.cfc")>
</CFIF>

<CFSET THIS.tempRoot          = "#REQUEST.domainRoot#/temp">
<CFSET THIS.pictureExtensions = "gif,jpg,jpeg,bmp,png">
<CFSET THIS.docExtensions     = "pdf,doc,txt,gif,jpg,jpeg">
<CFSET THIS.photoExtensions   = THIS.pictureExtensions>

<!--- setup main --->
<CFFUNCTION NAME="main" ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="Yes" />

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>

<!--- contact info submit --->
<CFFUNCTION NAME="contactinfo_submit" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var DoCommit     = "Yes">
	<CFSET var domainFilled = "No">

	<!--- mail variables --->
	<CFSET var to      = "val@openhotel.com">
	<CFSET var cc      = "cindy@openhotel.com,mic@openhotel.com">
	<CFSET var from    = REQUEST.admin_email>
	<CFSET var subject = "#REQUEST.site_name# Setup - Contact Information Submission">
	<CFSET var body    = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.definition","string","Thank you for taking the time to fill out our contact information form. Our representatives will contact you shortly.");
		param("FORM.primary_name","string","#titleCase(FORM.primary_firstname & ' ' & FORM.primary_lastname)#");
		param("FORM.secondary_name","string","#titleCase(FORM.secondary_firstname & ' ' & FORM.secondary_lastname)#");
		param("FORM.domainCount","numeric","1");
		param("FORM.newsEmailCount","numeric","1");
		param("FORM.has_no_secondary","numeric","0");
		param("FORM.billing_same","numeric","0");
	</CFSCRIPT>

	<CFIF validateCaptcha() IS false>
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "Invalid security code.">
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<CFIF FORM.has_domain EQ 1>
			<CFIF Trim(FORM.domain) EQ "">
				<CFSET DoCommit        = "No">
				<CFSET FORM.definition = "You must provide a domain.">
			</CFIF>
		<CFELSEIF FORM.has_domain EQ 0>
			<CFLOOP FROM="1" TO="#FORM.domainCount#" INDEX="a">
				<CFIF Trim(FORM["domain_#a#"]) NEQ "">
					<CFSET domainFilled = "Yes">
					<CFBREAK>
				</CFIF>
			</CFLOOP>

			<CFIF domainFilled EQ "No" AND 1 EQ 2>
				<CFSET DoCommit        = "No">
				<CFSET FORM.definition = "If you do not have a domain, please specify at least one domain you'd like.">
			</CFIF>
		<CFELSE>
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must specify whether or not you have a domain.">
		</CFIF>
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.primary_name) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide a name for your primary contact.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.primary_phone) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide a work phone for your primary contact.">
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<CFIF Trim(FORM.primary_email) NEQ "">
			<CFIF isValid("email", FORM.primary_email) EQ "No">
				<CFSET DoCommit        = "No">
				<CFSET FORM.definition = "If you are to provide an email for your primary contact, it must be a valid email address.">
			</CFIF>
		</CFIF>
	</CFIF>

	<CFIF FORM.has_no_secondary EQ 0>
		<CFIF DoCommit EQ "Yes" AND Trim(FORM.secondary_name) EQ "">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must provide a name for your secondary contact.">
		</CFIF>

		<CFIF DoCommit EQ "Yes" AND Trim(FORM.secondary_phone) EQ "">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must provide a work phone for your secondary contact.">
		</CFIF>

		<CFIF DoCommit EQ "Yes">
			<CFIF Trim(FORM.secondary_email) NEQ "">
				<CFIF isValid("email", FORM.secondary_email) EQ "No">
					<CFSET DoCommit        = "No">
					<CFSET FORM.definition = "If you are to provide an email for your secondary contact, it must be a valid email address.">
				</CFIF>
			</CFIF>
		</CFIF>
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.business_address) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must specify your business address.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.business_city) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must specify your business city.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.business_state) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must specify your business state.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.business_zip) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must specify your business zip.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.business_country) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must specify your business country.">
	</CFIF>

	<CFIF FORM.billing_same EQ 0>
		<CFIF DoCommit EQ "Yes" AND Trim(FORM.billing_address) EQ "">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must specify your billing address.">
		</CFIF>

		<CFIF DoCommit EQ "Yes" AND Trim(FORM.billing_city) EQ "">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must specify your billing city.">
		</CFIF>

		<CFIF DoCommit EQ "Yes" AND Trim(FORM.billing_state) EQ "">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must specify your billing state.">
		</CFIF>

		<CFIF DoCommit EQ "Yes" AND Trim(FORM.billing_zip) EQ "">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must specify your billing zip.">
		</CFIF>

		<CFIF DoCommit EQ "Yes" AND Trim(FORM.billing_country) EQ "">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must specify your billing country.">
		</CFIF>
	</CFIF>

	<!--- put the mail together --->
	<CFIF DoCommit EQ "Yes">
		<CFSET body = "<B>Has Domain:</B> #YesNoFormat(FORM.has_domain)#<BR>">

		<CFIF FORM.has_domain EQ 1>
			<CFSET body = body & "   <B>Domain:</B> #FORM.domain#<BR>">
		<CFELSE>
			<CFLOOP FROM="1" TO="#FORM.domainCount#" INDEX="a">
				<CFIF Trim(FORM["domain_#a#"]) NEQ "">
					<CFSET body = body & "   <B>Requested Domain #a#:</B> #FORM['domain_#a#']#<BR>">
				</CFIF>
			</CFLOOP>
		</CFIF>

		<CFSET body = body & "--------------------------------------------<BR>">
		<CFSET body = body & "<B>Primary Contact Name:</B> #FORM.primary_name#<BR>">
		<CFSET body = body & "<B>Primary Contact Work Phone:</B> #FORM.primary_phone#">

		<CFIF FORM.primary_ext NEQ "">
			<CFSET body = body & " <B>Ext:</B> #FORM.primary_ext#">
		</CFIF>

		<CFSET body = body & "<BR><B>Primary Contact Cell Phone:</B> #FORM.primary_cell#<BR>">
		<CFSET body = body & "<B>Primary Contact Alt. Phone:</B> #FORM.primary_alt#<BR>">
		<CFSET body = body & "<B>Primary Contact Fax:</B> #FORM.primary_fax#<BR>">
		<CFSET body = body & "<B>Primary Contact Email:</B> #FORM.primary_email#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">

		<CFIF FORM.has_no_secondary EQ 0>
			<CFSET body = body & "<B>Secondary Contact Name:</B> #FORM.secondary_name#<BR>">
			<CFSET body = body & "<B>Secondary Contact Work Phone:</B> #FORM.secondary_phone#">

			<CFIF FORM.secondary_ext NEQ "">
				<CFSET body = body & " <B>Ext:</B> #FORM.secondary_ext#">
			</CFIF>

			<CFSET body = body & "<BR><B>Secondary Contact Cell Phone:</B> #FORM.secondary_cell#<BR>">
			<CFSET body = body & "<B>Secondary Contact Alt. Phone:</B> #FORM.secondary_alt#<BR>">
			<CFSET body = body & "<B>Secondary Contact Fax:</B> #FORM.secondary_fax#<BR>">
			<CFSET body = body & "<B>Secondary Contact Email:</B> #FORM.secondary_email#">
			<CFSET body = body & "<BR>--------------------------------------------<BR>">
		</CFIF>

		<CFSET body = body & "<B>Business Address:</B> #FORM.business_address#<BR>">
		<CFSET body = body & "<B>Business City:</B> #FORM.business_city#<BR>">
		<CFSET body = body & "<B>Business State:</B> #FORM.business_state#<BR>">
		<CFSET body = body & "<B>Business Zip:</B> #FORM.business_zip#<BR>">
		<CFSET body = body & "<B>Business Country:</B> #FORM.business_country#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">

		<CFIF FORM.billing_same EQ 0>
			<CFSET body = body & "<B>Billing Address:</B> #FORM.billing_address#<BR>">
			<CFSET body = body & "<B>Billing City:</B> #FORM.billing_city#<BR>">
			<CFSET body = body & "<B>Billing State:</B> #FORM.billing_state#<BR>">
			<CFSET body = body & "<B>Billing Zip:</B> #FORM.billing_zip#<BR>">
			<CFSET body = body & "<B>Billing Country:</B> #FORM.billing_country#">
		<CFELSE>
			<CFSET body = body & "<B>The billing address is the same as the business address.</B>">
		</CFIF>

		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>The following emails were listed to receive the Alternate Image Newsletter:</B><BR>">
		<CFLOOP FROM="1" TO="#FORM.newsEmailCount#" INDEX="a">
			<CFIF isDefined("FORM.news_email_#a#") EQ "Yes" AND Trim(FORM["news_email_#a#"]) NEQ "">
				<CFSET body = body & Trim(FORM["news_email_#a#"]) & "<BR>">
			</CFIF>
		</CFLOOP>

		<!--- send the email --->
		<CFINVOKE COMPONENT="components.mailer.main" METHOD="sendEmail" TO="#to#" CC="#cc#" FROM="#from#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#subject#" BODY="#body#" />

		<!--- Activity Log --->
		<CFSET FORM.id      = 0>
		<CFSET FORM.to      = to>
		<CFSET FORM.from    = from>
		<CFSET FORM.subject = subject>
		<CFSET FORM.body    = body>

		<CFINVOKE COMPONENT="components.tracking.track" METHOD="activityLog" />
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<CF_DEFINITION TEXT="#FORM.definition#" LINK_TEXT="Click Here to Return to Setup Form List" LINK="http://#REQUEST.domain#/setup">
	<CFELSE>
		<CF_DEFINITION TEXT="#FORM.definition#">
	</CFIF>

	<CFIF DoCommit EQ "No">
		<CFSCRIPT>main(template="setup/contactinfo_form.cfm");</CFSCRIPT>
	</CFIF>

</CFFUNCTION>

<!--- design submit --->
<CFFUNCTION NAME="design_submit" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var DoCommit = "Yes">

	<!--- mail variables --->
	<CFSET var to      = "val@openhotel.com">
	<CFSET var cc      = "cindy@openhotel.com,mic@openhotel.com,jeff@openhotel.com">
	<CFSET var from    = REQUEST.admin_email>
	<CFSET var subject = "#REQUEST.site_name# Setup - Design Questionnaire Submission">
	<CFSET var body    = "">

	<!--- initialize variables --->
	<CFSET var a = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.definition","string","Thank you for taking the time to fill out our design questionnaire form.");
		param("FORM.name","string","#titleCase(FORM.firstname & ' ' & FORM.lastname)#");
		param("FORM.logo","string","");
		param("FORM.doc","string","");
		param("FORM.photo","string","");
		param("FORM.site","string","");
		param("FORM.demographic","string","");
		param("FORM.menu","string","");
		param("FORM.pictureCount","numeric","1");
		param("FORM.photoCount","numeric","1");
		param("FORM.docCount","numeric","1");
		param("FORM.siteCount","numeric","1");
	</CFSCRIPT>

	<!--- set submissionId (timestamp for submission's images folder) --->
	<CFSET FORM.submissionId = "#DateFormat(Now(),'YYYYMMDD')##TimeFormat(Now(),'HHMMSSl')#">

	<CFIF validateCaptcha() IS false>
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "Invalid security code.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.name) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide your name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.business_name) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide your business name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND isValid("email", FORM.emailAddress) EQ "No">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide a valid email address.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.domain) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide a domain.">
	</CFIF>

	<!--- handle site list --->
	<CFLOOP FROM="1" TO="#FORM['siteCount']#" INDEX="a">
		<CFIF Trim(FORM["site_#a#"]) NEQ "">
			<CFSET FORM.site = ListAppend(FORM.site, FORM["site_#a#"], ",")>
		</CFIF>
	</CFLOOP>

	<CFSET FORM.site = ReplaceNoCase(FORM.site, ",", "<BR>", "ALL")>

	<!--- handle upload of logo --->
	<CFIF DoCommit EQ "Yes">
		<CFSET FORM.logo = handleUploads(submissionId=FORM.submissionId,uploadType="picture")>

		<CFIF FORM.logo EQ "No">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "Your logo failed to upload.">
		</CFIF>
	</CFIF>

	<!--- handle upload of documents --->
	<CFIF DoCommit EQ "Yes">
		<CFSET FORM.doc = handleUploads(submissionId=FORM.submissionId,uploadType="doc")>

		<CFIF FORM.doc EQ "No">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "Your documents failed to upload.">
		</CFIF>
	</CFIF>

	<!--- handle upload of photos --->
	<CFIF DoCommit EQ "Yes">
		<CFSET FORM.photo = handleUploads(submissionId=FORM.submissionId,uploadType="photo")>

		<CFIF FORM.photo EQ "No">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "Your photos failed to upload.">
		</CFIF>
	</CFIF>

	<!--- put the mail together --->
	<CFIF DoCommit EQ "Yes">
		<CFSET body = "<B>Name:</B> #FORM.name#<BR>">
		<CFSET body = body & "<B>Business Name:</B> #FORM.business_name#<BR>">
		<CFSET body = body & "<B>Email Address:</B> #FORM.emailAddress#<BR>">
		<CFSET body = body & "<B>Your Domain:</B> #FORM.domain#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Do You Have a Tagline or Marketing Phrase?:</B> #FORM.tagline#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Please List A Few Sites You Like:</B><BR>#FORM.site#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>What features do you like about the websites you listed? Please Describe:</B> #FORM.site_details#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Do You Have Any Specific Color Scheme in Mind? Please Describe:</B> #FORM.color_scheme#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Do You Have Any Specific Colors You DO NOT Want? Please Describe:</B> #FORM.color_not#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Do You Have A Specific Demographic Target?:</B><BR>#Replace(FORM.demographic, ',', '<BR>', 'ALL')#<BR><BR><B>Other:</B> #FORM.demographic_other#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Please List All Major Menu Items For Your Site:</B><BR>#Replace(FORM.menu, ',', '<BR>', 'ALL')#<BR><BR><B>Items in your contract will be included in the menu but are there other menu items you would like to include?:</B> #FORM.menu_other#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Additional Comments:</B> #FORM.comments#">

		<!--- send the email --->
		<CFTRY>
			<CFMAIL TYPE="HTML" TO="#to#" CC="#cc#" FROM="#from#" SUBJECT="#subject#" TIMEOUT="240" SPOOLENABLE="No">
				<CFLOOP LIST="#FORM.logo#" INDEX="a" DELIMITERS=",">
					<CFMAILPARAM FILE="#THIS.tempRoot#/#FORM.submissionId#/#a#">
				</CFLOOP>
				<CFLOOP LIST="#FORM.doc#" INDEX="a" DELIMITERS=",">
					<CFMAILPARAM FILE="#THIS.tempRoot#/#FORM.submissionId#/#a#">
				</CFLOOP>
				<CFLOOP LIST="#FORM.photo#" INDEX="a" DELIMITERS=",">
					<CFMAILPARAM FILE="#THIS.tempRoot#/#FORM.submissionId#/#a#">
				</CFLOOP>

				#body#
			</CFMAIL>

			<!--- Activity Log --->
			<CFSET FORM.id      = 0>
			<CFSET FORM.to      = to>
			<CFSET FORM.from    = from>
			<CFSET FORM.subject = subject>
			<CFSET FORM.body    = body>

			<CFINVOKE COMPONENT="components.tracking.track" METHOD="activityLog" />

			<CFCATCH TYPE="Any">
				<CFSET DoCommit        = "No">
				<CFSET FORM.definition = "There was an error submitting your design questionnaire. If this occurs frequently, please contact us.">
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<CF_DEFINITION TEXT="#FORM.definition#" LINK_TEXT="Click Here to Return to Setup Form List" LINK="http://#REQUEST.domain#/setup">
	<CFELSE>
		<CF_DEFINITION TEXT="#FORM.definition#">
	</CFIF>

	<!--- remove submission directory --->
	<CFIF FORM.submissionId NEQ "">
		<CFSET deleteTempDirectory(submissionId=FORM.submissionId)>
	</CFIF>

	<CFIF DoCommit EQ "No">
		<CFSCRIPT>main(template="setup/design_form.cfm");</CFSCRIPT>
	</CFIF>

</CFFUNCTION>

<!--- email submit --->
<CFFUNCTION NAME="email_submit" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var DoCommit   = "Yes">
	<CFSET var thisDomain = "">
	<CFSET var emailFlag  = "">

	<!--- mail variables --->
	<CFSET var to       = "val@openhotel.com">
	<CFSET var cc       = "cindy@openhotel.com,mic@openhotel.com,jeff@openhotel.com">
	<CFSET var from     = REQUEST.admin_email>
	<CFSET var subject  = "#REQUEST.site_name# Setup - Email Account Submission">
	<CFSET var body     = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.definition","string","Thank you for taking the time to fill out our email account request form. Our representatives will contact you shortly.");
		param("FORM.name","string","#titleCase(FORM.firstname & ' ' & FORM.lastname)#");
		param("FORM.emailCount","numeric",1);
		param("FORM.hosting","string","");
	</CFSCRIPT>

	<CFIF validateCaptcha() IS false>
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "Invalid security code.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.name) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide your full name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND isValid("email", FORM.emailAddress) EQ "No">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide a valid email address for your primary contact.">
	</CFIF>

	<CFSET thisDomain = validateDomainAddress(FORM.domain)>

	<CFIF DoCommit EQ "Yes" AND thisDomain EQ "No">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide a domain.">
	<CFELSE>
		<CFSET FORM.domain = thisDomain>
	</CFIF>

	<!--- validate the emails or MX domains --->
	<CFIF FORM.hosting EQ "Yes">
		<CFSET emailFlag = validateEmailAccounts()>

		<CFIF DoCommit EQ "Yes" AND emailFlag EQ "No">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "One or more of the provided email accounts have an invalid property.">
		</CFIF>

		<CFIF DoCommit EQ "Yes" AND emailFlag EQ "ZeroAccounts">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must provide at least one email account to setup.">
		</CFIF>
	<CFELSEIF FORM.hosting EQ "No">
		<CFIF DoCommit EQ "Yes" AND Trim(FORM.mx1) EQ "" AND Trim(FORM.mx2) EQ "">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "You must specify at least one MX domain for your email.">
		</CFIF>

		<CFIF DoCommit EQ "Yes" AND Trim(FORM.mx1) NEQ "">
			<CFIF validateDomainAddress(FORM.mx1) NEQ "No">
				<CFSET FORM.mx1 = validateDomainAddress(FORM.mx1)>
			<CFELSE>
				<CFSET DoCommit        = "No">
				<CFSET FORM.definition = "The MX1 domain is invalid.">
			</CFIF>
		</CFIF>

		<CFIF DoCommit EQ "Yes" AND Trim(FORM.mx2) NEQ "">
			<CFIF validateDomainAddress(FORM.mx2) NEQ "No">
				<CFSET FORM.mx2 = validateDomainAddress(FORM.mx2)>
			<CFELSE>
				<CFSET DoCommit        = "No">
				<CFSET FORM.definition = "The MX2 domain is invalid.">
			</CFIF>
		</CFIF>
	<CFELSE>
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must specify whether or not we are hosting your email.">
	</CFIF>

	<!--- put the mail together --->
	<CFIF DoCommit EQ "Yes">
		<CFSET body = "<B>Name:</B> #FORM.name#<BR>">
		<CFSET body = body & "<B>Email Address:</B> #FORM.emailAddress#<BR>">
		<CFSET body = body & "<B>Your Domain:</B> #FORM.domain#<BR>">
		<CFSET body = body & "<B>Are We Hosting Your Email?:</B> #FORM.hosting#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">

		<CFIF FORM.hosting EQ "Yes">
			<CFSET body = body & "<B>Requested Accounts:</B><BR><BR>">

			<CFLOOP FROM="1" TO="#FORM.emailCount#" INDEX="a">
				<!--- blank emails are skipped --->
				<CFIF Trim(FORM["email_#a#"]) NEQ "">
					<CFSET body = body & "<B>Email:</B> #FORM['email_#a#']#@#domain#<BR>">

					<CFIF FORM["type_#a#"] EQ "pop">
						<CFSET body = body & "<B>Account Type:</B> Regular<BR>">
						<CFSET body = body & "<B>Password:</B> #FORM['password_#a#']#">
					<CFELSEIF FORM["type_#a#"] EQ "alias">
						<CFSET body = body & "<B>Account Type:</B> Forward<BR>">
						<CFSET body = body & "<B>Forwards To:</B> #FORM['forward_#a#']#">
					</CFIF>

					<CFSET body = body & "<BR>-----------------------<BR>">
				</CFIF>
			</CFLOOP>
		<CFELSE>
			<CFSET body = body & "<B>MX Domains:</B><BR><BR>">
			<CFSET body = body & "<B>MX1 Domain:</B> #FORM.mx1#<BR>">
			<CFSET body = body & "<B>MX2 Domain:</B> #FORM.mx2#<BR>">
		</CFIF>

		<!--- send the email --->
		<CFINVOKE COMPONENT="components.mailer.main" METHOD="sendEmail" TO="#to#" CC="#cc#" FROM="#from#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#subject#" BODY="#body#" />

		<!--- Activity Log --->
		<CFSET FORM.id      = 0>
		<CFSET FORM.to      = to>
		<CFSET FORM.from    = from>
		<CFSET FORM.subject = subject>
		<CFSET FORM.body    = body>

		<CFINVOKE COMPONENT="components.tracking.track" METHOD="activityLog" />
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<CF_DEFINITION TEXT="#FORM.definition#" LINK_TEXT="Click Here to Return to Setup Form List" LINK="http://#REQUEST.domain#/setup">
	<CFELSE>
		<CF_DEFINITION TEXT="#FORM.definition#">
	</CFIF>

	<CFIF DoCommit EQ "No">
		<CFSCRIPT>main(template="setup/email_form.cfm");</CFSCRIPT>
	</CFIF>

</CFFUNCTION>

<!--- hotel submit --->
<CFFUNCTION NAME="hotel_submit" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var DoCommit = "Yes">

	<!--- mail variables --->
	<CFSET var to       = "val@alternateimage.com">
	<CFSET var from     = REQUEST.admin_email>
	<CFSET var subject  = "#REQUEST.site_name# Setup - Hotel Setup Submission">
	<CFSET var body     = "">

	<!--- initialize variables --->
	<CFSET var a        = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.definition","string","Thank you for taking the time to fill out our hotel setup form.");
		param("FORM.name","string","");
		param("FORM.domain","string","");
		param("FORM.contact_name","string","#titleCase(FORM.contact_firstname & ' ' & FORM.contact_lastname)#");
		param("FORM.res_days","numeric","0");
		param("FORM.aaa","numeric","0");
		param("FORM.mobile","numeric","0");
		param("FORM.ssl","numeric","0");
		param("FORM.tax_rate","numeric","0");
		param("FORM.check_in_date","string","");
		param("FORM.check_out_date","string","");
		param("FORM.amenities","string","");
		param("FORM.room_options","string","");
		param("FORM.discounts","string","");
		param("FORM.room_types","string","");
		param("FORM.rates_doc","string","");
		param("FORM.docCount","numeric","1");
		param("FORM.optionCount","numeric","1");
		param("FORM.discountCount","numeric","1");
		param("FORM.typeCount","numeric","1");
	</CFSCRIPT>

	<CFSET FORM.check_in_time  = TimeFormat(getFormTime("check_in"), "hh:mm tt")>
	<CFSET FORM.check_out_time = TimeFormat(getFormTime("check_out"), "hh:mm tt")>

	<!--- set submissionId (timestamp for submission's images folder) --->
	<CFSET FORM.submissionId = "#DateFormat(Now(), 'YYYYMMDD')##TimeFormat(Now(), 'HHMMSSl')#">

	<CFIF validateCaptcha() IS false>
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "Invalid security code.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.name) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide your hotel's name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.state) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide a state.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.contact_name) EQ "">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide your contact's name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND isValid("email", FORM.res_email) EQ "No">
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "You must provide a valid reservation email address.">
	</CFIF>

	<!--- handle room options --->
	<CFSET FORM.room_options = "<TABLE CELLPADDING='0' CELLSPACING='0' WIDTH='100%'><TR><TD><B>Room Option:</B></TD><TD><B>Per Night:</B></TD><TD><B>Per Stay:</B></TD></TR>">

	<CFLOOP FROM="1" TO="#FORM['optionCount']#" INDEX="a">
		<CFIF Trim(FORM["option_name_#a#"]) NEQ "">
			<CFSET FORM.room_options = "#FORM.room_options#<TR>">
			<CFSET FORM.room_options = "#FORM.room_options#<TD>#FORM['option_name_#a#']#</TD>">
			<CFSET FORM.room_options = "#FORM.room_options#<TD>#FORM['option_per_night_#a#']#</TD>">
			<CFSET FORM.room_options = "#FORM.room_options#<TD>#FORM['option_per_stay_#a#']#</TD>">
			<CFSET FORM.room_options = "#FORM.room_options#<TR>">
		</CFIF>
	</CFLOOP>
	<CFSET FORM.room_options = "#FORM.room_options#</TABLE>">

	<!--- handle discounts --->
	<CFSET FORM.discounts = "<TABLE CELLPADDING='0' CELLSPACING='0' WIDTH='100%'><TR><TD><B>Discount:</B></TD><TD><B>Per Night:</B></TD><TD><B>Per Stay:</B></TD></TR>">

	<CFLOOP FROM="1" TO="#FORM['discountCount']#" INDEX="a">
		<CFIF Trim(FORM["discount_name_#a#"]) NEQ "">
			<CFSET FORM.discounts = "#FORM.discounts#<TR>">
			<CFSET FORM.discounts = "#FORM.discounts#<TD>#FORM['discount_name_#a#']#</TD>">
			<CFSET FORM.discounts = "#FORM.discounts#<TD>#FORM['discount_per_night_#a#']#</TD>">
			<CFSET FORM.discounts = "#FORM.discounts#<TD>#FORM['discount_per_stay_#a#']#</TD>">
			<CFSET FORM.discounts = "#FORM.discounts#<TR>">
		</CFIF>
	</CFLOOP>
	<CFSET FORM.discounts = "#FORM.discounts#</TABLE>">

	<!--- handle room types --->
	<CFSET FORM.room_types = "<TABLE CELLPADDING='0' CELLSPACING='0' WIDTH='100%'><TR><TD><B>Room Type:</B></TD><TD><B>Inv.:</B></TD><TD><B>Std:</B></TD><TD><B>Max:</B></TD><TD><B>Extra Occupancy Fee:</B></TD></TR>">

	<CFLOOP FROM="1" TO="#FORM['typeCount']#" INDEX="a">
		<CFIF Trim(FORM["type_name_#a#"]) NEQ "">
			<CFSET FORM.room_types = "#FORM.room_types#<TR>">
			<CFSET FORM.room_types = "#FORM.room_types#<TD>#FORM['type_name_#a#']#</TD>">
			<CFSET FORM.room_types = "#FORM.room_types#<TD>#FORM['type_inv_#a#']#</TD>">
			<CFSET FORM.room_types = "#FORM.room_types#<TD>#FORM['type_std_#a#']#</TD>">
			<CFSET FORM.room_types = "#FORM.room_types#<TD>#FORM['type_max_#a#']#</TD>">
			<CFSET FORM.room_types = "#FORM.room_types#<TD>#FORM['type_extra_#a#']#</TD>">
			<CFSET FORM.room_types = "#FORM.room_types#<TR>">
		</CFIF>
	</CFLOOP>
	<CFSET FORM.room_types = "#FORM.room_types#</TABLE>">

	<!--- handle upload of rates doc --->
	<CFIF DoCommit EQ "Yes">
		<CFSET FORM.rates_doc = handleUploads(submissionId=FORM.submissionId,uploadType="doc")>

		<CFIF FORM.rates_doc EQ "No">
			<CFSET DoCommit        = "No">
			<CFSET FORM.definition = "Your rates document failed to upload.">
		</CFIF>
	</CFIF>

	<!--- put the mail together --->
	<CFIF DoCommit EQ "Yes">
		<CFSET body = "<B>Hotel Name:</B> #FORM.name#<BR>">
		<CFSET body = body & "<B>Domain Name:</B> #FORM.domain#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Hotel Address:</B> #FORM.address#<BR>">
		<CFSET body = body & "<B>Hotel City:</B> #FORM.city#<BR>">
		<CFSET body = body & "<B>Hotel State:</B> #FORM.state#<BR>">
		<CFSET body = body & "<B>Hotel Zip:</B> #FORM.zip#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Contact Person:</B> #FORM.contact_name#<BR>">
		<CFSET body = body & "<B>Reservation Email:</B> #FORM.res_email#<BR>">
		<CFSET body = body & "<B>Reservation Phone:</B> #FORM.res_phone#<BR>">
		<CFSET body = body & "<B>Toll-Free:</B> #FORM.res_phone2#<BR>">
		<CFSET body = body & "<B>Fax:</B> #FORM.res_fax#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Policies</B><BR><BR><B>Cancellation Policy:</B> #FORM.res_days# Days<BR>">
		<CFSET body = body & "<B>Tax Rate:</B> #FORM.tax_rate#<BR>">
		<CFSET body = body & "<B>Check In/Out Time:</B> #FORM.check_in_time# - #FORM.check_out_time#">

		<CFIF FORM.aaa EQ 1><CFSET body = body & "<BR><B>AAA Hotel</B>"></CFIF>
		<CFIF FORM.mobile EQ 1><CFSET body = body & "<BR><B>Mobile Hotel</B>"></CFIF>
		<CFIF FORM.ssl EQ 1><CFSET body = body & "<BR><B>Superior Small Lodging</B>"></CFIF>

		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Room Options</B><BR><BR>#FORM.room_options#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Discounts</B><BR><BR>#FORM.discounts#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Room Types</B><BR><BR>#FORM.room_types#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Property Description:</B><BR><BR>#FORM.description#">
		<CFSET body = body & "<BR>--------------------------------------------<BR>">
		<CFSET body = body & "<B>Amenities:</B><BR><BR>#ReplaceNoCase(FORM.amenities, ',', '<BR>', 'ALL')#">

		<!--- send the email --->
		<CFTRY>
			<CFMAIL TYPE="HTML" TO="#to#" FROM="#from#" SUBJECT="#subject#" TIMEOUT="120" SPOOLENABLE="No">
				<CFLOOP LIST="#FORM.rates_doc#" INDEX="a" DELIMITERS=",">
					<CFMAILPARAM FILE="#THIS.tempRoot#/#FORM.submissionId#/#a#">
				</CFLOOP>

				#body#
			</CFMAIL>

			<!--- Activity Log --->
			<CFSET FORM.id      = 0>
			<CFSET FORM.to      = to>
			<CFSET FORM.from    = from>
			<CFSET FORM.subject = subject>
			<CFSET FORM.body    = body>

			<CFINVOKE COMPONENT="components.tracking.track" METHOD="activityLog" />

			<CFCATCH TYPE="Any">
				<CFSET DoCommit        = "No">
				<CFSET FORM.definition = "There was an error submitting your hotel setup form. If this occurs frequently, please contact us.">
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<CF_DEFINITION TEXT="#FORM.definition#" LINK_TEXT="Click Here to Return to Setup Form List" LINK="http://#REQUEST.domain#/setup">
	<CFELSE>
		<CF_DEFINITION TEXT="#FORM.definition#">
	</CFIF>

	<!--- remove submission directory --->
	<CFIF FORM.submissionId NEQ "">
		<CFSET deleteTempDirectory(submissionId=FORM.submissionId)>
	</CFIF>

	<CFIF DoCommit EQ "No">
		<CFSCRIPT>main(template="setup/hotel_form.cfm");</CFSCRIPT>
	</CFIF>

</CFFUNCTION>

<!--- ----------------- --->
<!---  Helper Functions --->
<!--- ----------------- --->

<!--- validate the emails (FORM must be defined) --->
<CFFUNCTION NAME="validateEmailAccounts" ACCESS="private" RETURNTYPE="string">

	<!--- initialize variables --->
	<CFSET var result            = "Yes">
	<CFSET var validAccountTypes = "pop,alias">
	<CFSET var thisEmail         = "">

	<!--- initialize variables --->
	<CFSET var a           = "">
	<CFSET var totalEmails = 0>

	<CFLOOP FROM="1" TO="#FORM.emailCount#" INDEX="a">
		<CFSET thisEmail = "">

		<!--- blank emails are skipped --->
		<CFIF Trim(FORM["email_#a#"]) NEQ "">
			<CFSET totalEmails = totalEmails + 1>

			<CFSET thisEmail = FORM["email_#a#"] & "@#FORM.domain#">

			<!--- email must be valid --->
			<CFIF isValid("email", thisEmail) EQ "No">
				<CFSET result = "No">
				<CFBREAK>
			</CFIF>

			<!--- account type must be pop or alias --->
			<CFIF ListFind(validAccountTypes,FORM["type_#a#"],",") EQ 0>
				<CFSET result = "No">
				<CFBREAK>
			</CFIF>

			<!--- if pop, must have password greater than or equal to 5 chars --->
			<CFIF FORM["type_#a#"] EQ "pop">
				<CFIF Len(Trim(FORM["password_#a#"])) LT 5>
					<CFSET result = "No">
					<CFBREAK>
				</CFIF>
			</CFIF>

			<!--- if alias, must provide a forward and it MUST be valid --->
			<CFIF FORM["type_#a#"] EQ "alias">
				<CFIF Trim(FORM["forward_#a#"]) EQ "" OR isValid("email",FORM["forward_#a#"]) EQ "No">
					<CFSET result = "No">
					<CFBREAK>
				</CFIF>
			</CFIF>
		</CFIF>
	</CFLOOP>

	<CFIF totalEmails EQ 0>
		<CFSET result = "ZeroAccounts">
	</CFIF>

	<CFRETURN result>

</CFFUNCTION>

<!--- validates domain address --->
<!--- returns either the validated domain address or 'No' --->
<CFFUNCTION NAME="validateDomainAddress" ACCESS="private" RETURNTYPE="string">

	<CFARGUMENT NAME="domain" TYPE="string" REQUIRED="Yes">

	<!--- initialize variables --->
	<CFSET var result = trimHost(Trim(LCase(ARGUMENTS.domain)))>

	<CFIF isValidURL(result) EQ "No">
		<CFSET result = "No">
	</CFIF>

	<CFRETURN result>

</CFFUNCTION>

<!--- uploads and returns a filename list --->
<CFFUNCTION NAME="handleUploads" ACCESS="private" RETURNTYPE="string">

	<CFARGUMENT NAME="submissionId" TYPE="string" REQUIRED="Yes" HINT="The name of the submission folder.">
	<CFARGUMENT NAME="uploadType"   TYPE="string" REQUIRED="Yes" HINT="Can be picture, doc or photo.">

	<!--- initialize variables --->
	<CFSET var result         = "">
	<CFSET var directoryFlag  = "Yes">
	<CFSET var cleanType      = Trim(LCase(ARGUMENTS.uploadType))>
	<CFSET var thisExtensions = "">
	<CFSET var resizeOnUpload = "">

	<CFSET var coreDirObj  = CreateObject("component","core.directory")>
	<CFSET var coreFileObj = CreateObject("component","core.file")>

	<!--- initialize loop counters --->
	<CFSET var a = 1>

	<CFIF ListFind("picture,doc,photo",cleanType,",") EQ 0>
		<CFSET result = "No">
	<CFELSE>
		<CFSET thisExtensions = Evaluate("THIS.#cleanType#Extensions")>

		<CFIF ListFind("picture,photo", ARGUMENTS.uploadType, ",") GT 0>
			<CFSET resizeOnUpload = "600x5000">
		</CFIF>
	</CFIF>

	<!--- create -temproot-/-submissionId- directory if missing --->
	<CFIF result NEQ "No">
		<CFSET directoryFlag = coreDirObj.create(directory="#THIS.tempRoot#/#ARGUMENTS.submissionId#")>
		<CFIF directoryFlag EQ "No"><CFSET result = "No"></CFIF>
	</CFIF>

	<!--- upload attachment items --->
	<CFIF result NEQ "No">
		<CFTRY>
			<CFLOOP FROM="1" TO="#FORM['#cleanType#Count']#" INDEX="a">
				<!--- upload and clean filename --->
				<CFIF "#Trim(FORM['#cleanType#_#a#'])#" NEQ "">
					<CFSET "FORM.final_#cleanType#_#a#" = coreFileObj.upload(destination="#THIS.tempRoot#/#ARGUMENTS.submissionId#",fileField="#cleanType#_#a#",resize="#resizeOnUpload#",extensions="#thisExtensions#")>

					<CFIF FORM["final_#cleanType#_#a#"] NEQ "No">
						<CFSET result = ListAppend(result, "#FORM['final_#cleanType#_#a#']#", ",")>
					</CFIF>
				</CFIF>
			</CFLOOP>

			<CFCATCH TYPE="Any">
				<CFSET result = "No">
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<CFRETURN result>

</CFFUNCTION>

<!--- removes the temp directory --->
<CFFUNCTION NAME="deleteTempDirectory" ACCESS="private">

	<CFARGUMENT NAME="submissionId" TYPE="string" REQUIRED="Yes" />

	<CFIF ARGUMENTS.submissionId NEQ "" AND DirectoryExists("#THIS.tempRoot#/#ARGUMENTS.submissionId#") EQ "Yes">
		<CFDIRECTORY ACTION="DELETE" DIRECTORY="#THIS.tempRoot#/#ARGUMENTS.submissionId#" RECURSE="Yes">
	</CFIF>

</CFFUNCTION>

</CFCOMPONENT>