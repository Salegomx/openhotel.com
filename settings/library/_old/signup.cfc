<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateObject("component", "local")>
</CFIF>

<!--- signup main --->
<CFFUNCTION NAME="main" ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="signup/signup_form.cfm" />

	<!--- this is a new signup --->
	<CFSET SESSION.openhotel.account_payment_id = 0>
	<CFSET SESSION.openhotel.account_id         = 0>

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>

<!--- signup submit --->
<CFFUNCTION NAME="submit" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var DoCommit         = "Yes">
	<CFSET var definition       = "Signup Successful.">
	<CFSET var returnResults    = "">
	<CFSET var duplicateResults = "">
	<CFSET var userDataResults  = "">
	<CFSET var appResults       = "">
	<CFSET var openHotelDGRId   = 52>
	<CFSET var banList          = "cathy21dec@gmail.com">
	<CFSET var checkoutObject   = CreateObject("component","appstore.checkout")>
	<CFSET var today            = DateFormat(Now(),"YYYY-MM-DD")>
	<CFSET var rightNow         = TimeFormat(Now(),"HH:MM:SS")>
	<CFSET var trialEnds        = DateFormat(DateAdd("d",15,today),"YYYY-MM-DD")>

	<!--- Ensure that they aren't just hitting refresh on confirmation --->
	<CFIF 1 EQ 2><CFSCRIPT>checkSignupProcessed();</CFSCRIPT></CFIF>

	<!--- param variables --->
	<CFSCRIPT>
		// Signup Params
		param("FORM.firstname","string","");
		param("FORM.lastname","string","");
		param("FORM.phone","string","");
		param("FORM.emailAddress","string","");
		param("FORM.password","string","#randomString()#");
		param("FORM.username","string","");
		param("FORM.usergroup","string","3");
		param("FORM.newsletter","numeric",0);
		param("FORM.how_heard","string","");
		param("FORM.comments","string","");
		param("FORM.our_comments","string","Open Hotel Free Trial Signup");

		// Site Params
		param("FORM.site_url","string","");
		param("FORM.site_name","string","");
		param("FORM.site_website","string","");
		param("FORM.site_phone","string","");
		param("FORM.site_address","string","");
		param("FORM.site_city","string","");
		param("FORM.site_state","string","");
		param("FORM.site_zip","string","");
		param("FORM.site_country","string","");

		// Important Purchase Params
		param("FORM.app_id","numeric",0);
		param("FORM.user_id","numeric",0);
		param("FORM.account_id","numeric",0);
		param("FORM.account_user_id","numeric",0);
		param("FORM.account_payment_id","numeric",0);
		param("FORM.account_site_id","numeric",0);
		param("FORM.created_site_id","numeric",0);
		param("FORM.site_id","numeric",0);

		// Total Params
		param("FORM.total_sub","numeric",0);
		param("FORM.total_discount","numeric",0); // Not used yet.
		param("FORM.total_grand","numeric",0);

		// Settings
		param("FORM.send_email","numeric",1); // 0 = No, 1 = Yes, 2 = Email AI
	</CFSCRIPT>

	<!--- CLEAN FORM VARIABLES --->
	<CFSET FORM.site_id            = REQUEST.site_id>
	<CFSET FORM.password           = Trim(LCase(FORM.password))>
	<CFSET FORM.password_encrypted = doEncrypt(FORM.password)>
	<CFSET FORM.date_made          = today>
	<CFSET FORM.time_made          = rightNow>
	<CFSET FORM.date_expire        = trialEnds>

	<CFIF isLoggedIn() EQ "Yes">
		<CFSET FORM.firstname    = Trim(IIF(FORM.firstname NEQ "","FORM.firstname","SESSION.user.firstname"))>
		<CFSET FORM.lastname     = Trim(IIF(FORM.lastname NEQ "","FORM.lastname","SESSION.user.lastname"))>
		<CFSET FORM.emailAddress = Trim(LCase(SESSION.user.email))>
	<CFELSE>
		<CFSET FORM.emailAddress = Trim(LCase(FORM.emailAddress))>
	</CFIF>

	<CFSET FORM.firstname      = Trim(FORM.firstname)>
	<CFSET FORM.lastname       = Trim(FORM.lastname)>
	<CFSET FORM.phone          = Trim(FORM.phone)>
	<CFSET FORM.user_firstname = FORM.firstname>
	<CFSET FORM.user_lastname  = FORM.lastname>
	<CFSET FORM.user_email     = FORM.emailAddress>
	<CFSET FORM.user_phone     = FORM.phone>

	<CFSET FORM.username = FORM.user_email>
	<CFSET FORM.comments = Trim(FORM.comments)>

	<CFSET FORM.site_name  = Trim(FORM.site_name)>
	<CFSET FORM.site_phone = Trim(FORM.site_phone)>

	<!--- special cleaning for website --->
	<CFSET FORM.site_website = Trim(REReplace(FORM.site_website,"https?://","","ALL"))>
	<CFSET FORM.site_website = Replace(FORM.site_website,"www.","","ALL")>
	<CFSET FORM.site_website = extractDomain(FORM.site_website)>
	<CFSET FORM.site_website = LCase(FORM.site_website)>

	<!--- Should always be Open Hotel Booking Engine (App 1) --->
	<CFSET appResults = checkoutObject.getApp(appId=1)>

	<CFIF appResults.recordCount EQ 1>
		<CFSET FORM.app_id      = appResults.id>
		<CFSET FORM.level       = appResults.level>
		<CFSET FORM.total_sub   = 0> <!--- appResults.price ---> <!--- Always Free Trial --->
		<CFSET FORM.total_grand = FORM.total_sub>
	<CFELSE>
		<CFSET DoCommit   = "No">
		<CFSET definition = "There was an error processing this request. Please refresh the page and try again.">
	</CFIF>

	<!--- VALIDATE FORM --->

	<CFIF DoCommit EQ "Yes" AND validateCaptcha() EQ "No">
		<CFSET DoCommit   = "No">
		<CFSET definition = "Please enter the security code at the bottom of the form to proceed.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND (ListFind(banList,FORM.emailAddress,",") GT 0 OR LCase(FORM.site_country) EQ "in")>
		<CFSET DoCommit   = "No">
		<CFSET definition = "The open hotel booking engine demo has been restricted through this method. If you'd like to try out our booking engine, please call 386-310-2001.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND (Trim(FORM.firstname) EQ "" AND Trim(FORM.lastname) EQ "")>
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must provide your first and last name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND isValid("email", FORM.emailAddress) EQ "No">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must provide a valid email address.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.password) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must provide an account password.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.site_name) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must provide your hotel's name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.site_address) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must provide your hotel's address.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.site_city) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must provide your hotel's city.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.site_state) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must provide your hotel's state.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.site_zip) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must provide your hotel's zip.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.site_country) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must provide your hotel's country.">
	</CFIF>

	<!--- PROCESS USER SIGNUP (If not logged in) --->
	<CFIF DoCommit EQ "Yes">
		<CFIF isLoggedIn() EQ "Yes">
			<CFSET FORM.user_id = SESSION.user.id>
		<CFELSE>
			<CFINVOKE COMPONENT="security.main" METHOD="getDuplicateUser" EMAIL="#FORM.emailAddress#" USERNAME="#FORM.emailAddress#" RETURNVARIABLE="duplicateResults" />

			<CFIF duplicateResults.recordCount EQ 1 AND duplicateResults.id GT 0 AND duplicateResults.active EQ 2 AND (isDefined("FORM.id") EQ "No" OR (isDefined("FORM.id") EQ "Yes" AND FORM.id EQ duplicateResults.id)) AND (isLoggedIn() EQ false OR (isLoggedIn() EQ true AND Trim(Lcase(FORM.emailAddress)) EQ SESSION.user.email))>
				<!--- This is a pending user - Pass for signup --->
			<CFELSEIF duplicateResults.recordCount EQ 1 AND duplicateResults.id GT 0>
				<!--- This is a duplicate user - attach purchase to user_id --->
				<CFSET FORM.user_id = duplicateResults.id>
			<CFELSEIF duplicateResults.recordCount GT 1>
				<!--- This is a duplicate user - attach purchase to first user_id --->
				<CFSET FORM.user_id = duplicateResults.id>
			</CFIF>

			<CFIF DoCommit EQ "Yes" AND FORM.user_id EQ 0>
				<CFSET FORM.mode             = "insert">
				<CFSET FORM.silent           = "Yes">
				<CFSET FORM.silentdefinition = "Yes">
				<CFSET FORM.sendEmail        = "No">
				<CFINVOKE COMPONENT="security.main" METHOD="signup" HASCAPTCHA="No" PRESERVEHASCAPTCHA="Yes" />
				<CFSET FORM.mode = "process">

				<CFIF isLoggedIn() EQ "Yes">
					<CFSET FORM.user_id = SESSION.user.id>
				<CFELSE>
					<CFSET DoCommit   = "No">
					<CFSET definition = "There was an error processing your user creation. No charge has been made at this time.<BR><BR>If you are already registered with us, please log in below. You can retrieve your password by clicking <A CLASS='link' HREF='http://#REQUEST.domain#/login.cfm/mode/forgot' TARGET='_blank'>here</A>.">
				</CFIF>
			</CFIF>
		</CFIF>
	</CFIF>

	<!--- PROCESS ACCOUNT CREATION --->
	<CFIF DoCommit EQ "Yes">
		<CFTRY>
			<!--- CREATE ACCOUNT --->
			<CFSET checkoutObject.createAccount()>

			<!--- register the site_website to the account --->
			<CFIF Trim(FORM.site_website) NEQ "">
				<CFSET FORM.site_url = FORM.site_website>
				<CFSET checkoutObject.registerAccountDomain()>
				<CFSET FORM.site_url = "">
			</CFIF>

			<CFCATCH TYPE="Any">
				<CFSET DoCommit   = "No">
				<CFSET definition = "There was an error processing your account creation. No charge has been made at this time.<BR><BR>If you are already registered with us, please log in below. You can retrieve your password by clicking <A CLASS='link' HREF='http://#REQUEST.domain#/login.cfm/mode/forgot' TARGET='_blank'>here</A>.">

				<CFIF CFCATCH.Type EQ "custom_type">
					<CFSET definition = CFCATCH.Message>
				</CFIF>
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<!--- PROCESS PURCHASE --->
	<CFIF DoCommit EQ "Yes">
		<CFTRANSACTION ACTION="BEGIN">
			<CFTRY>
				<!--- REGISTER ACCOUNT APP FOR HOTEL --->
				<CFSET checkoutObject.registerAccountApp()>

				<!--- CONFIRM PURCHASE --->
				<CFSET checkoutObject.confirmPurchase(
					confirmTemplateUser="signup/confirmation_email_user.cfm",
					confirmTemplateAdmin="signup/confirmation_email_admin.cfm"
				)>

				<CFQUERY NAME="userDataResults" DATASOURCE="#dsn#">
					INSERT INTO users.data ( site_id, datagroup_id, user_id, name, "value", data, date_made, time_made )
					VALUES (
						<CFQUERYPARAM VALUE="#REQUEST.site_id#" CFSQLTYPE="CF_SQL_INTEGER">,
						<CFQUERYPARAM VALUE="#openHotelDGRId#" CFSQLTYPE="CF_SQL_INTEGER">,
						<CFQUERYPARAM VALUE="#FORM.user_id#" CFSQLTYPE="CF_SQL_INTEGER">,
						<CFQUERYPARAM VALUE="how_heard" CFSQLTYPE="CF_SQL_VARCHAR">,
						<CFQUERYPARAM VALUE="#FORM.how_heard#" CFSQLTYPE="CF_SQL_VARCHAR">,
						<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
						<CFQUERYPARAM VALUE="#today#" CFSQLTYPE="CF_SQL_DATE">,
						<CFQUERYPARAM VALUE="#rightNow#" CFSQLTYPE="CF_SQL_TIME">
					);
				</CFQUERY>

				<!--- PROCESS PAYMENT --->
				<CFSET processPayment()>

				<!--- PURCHASE COMPLETE --->
				<CFSET SESSION.openhotel.account_payment_id = FORM.account_payment_id>
				<CFSET SESSION.openhotel.account_id         = FORM.account_id>

				<CFTRANSACTION ACTION="COMMIT" />

				<CFCATCH TYPE="Any">
					<CFSET DoCommit   = "No">
					<CFSET definition = "There was an error processing your signup. If this occurs frequently, please contact the site administrator.">

					<CFIF CFCATCH.Type EQ "custom_type">
						<CFSET definition = CFCATCH.Message>
					</CFIF>

					<CFTRANSACTION ACTION="ROLLBACK" />
				</CFCATCH>
			</CFTRY>
		</CFTRANSACTION>
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<!--- CREATE NUMBER DOT --->
		<CFSET setupNumberDot()>

		<!--- APPLY TO TRANSACTIONS --->
		<CFIF hasRights("transactions") EQ "No">
			<CFSET checkoutObject.applyTransactions(userId=FORM.user_id)>
		</CFIF>

		<!--- ACTIVITY LOG --->
		<CFINVOKE COMPONENT="tracking.track" METHOD="activityLog" TYPE="insert" SECTION="openhotel_purchase" />

		<!--- CONFIRMATION/DEFINITION --->
		<CFSET confirmation()>
	<CFELSE>
		<!--- BOUNCE --->
		<CF_DEFINITION TEXT="#definition#" TITLE="Alert">
		<BR>

		<CFSCRIPT>main();</CFSCRIPT>
	</CFIF>

	<CFSET checkoutObject = "">

</CFFUNCTION>

<!--- ------------------------- --->
<!---   Beta Signup Functions   --->
<!--- ------------------------- --->

<CFFUNCTION NAME="beta_main" ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="signup/beta_form.cfm" />

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">

</CFFUNCTION>

<CFFUNCTION NAME="beta_submit" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var DoCommit    = "Yes">
	<CFSET var definition  = "You have successfully signed up for the PMS Beta Test!<BR><BR>Returning to the PMS information page...">
	<CFSET var flagResults = 0>
	<CFSET var signupTag   = 757>

	<!--- mail variables --->
	<CFSET var to      = "mic@alternateimage.com">
	<CFSET var from    = REQUEST.admin_email>
	<CFSET var subject = "PMS Beta Signup">
	<CFSET var body    = "">

	<CFSET FORM.id           = 0>
	<CFSET FORM.firstname    = Trim(StripHTML(FORM.firstname))>
	<CFSET FORM.lastname     = Trim(StripHTML(FORM.lastname))>
	<CFSET FORM.emailAddress = Trim(LCase(FORM.emailAddress))>
	<CFSET FORM.phone        = Trim(StripHTML(FORM.phone))>
	<CFSET FORM.comments     = Trim(StripHTML(FORM.comments))>
	<CFSET FORM.username     = FORM.emailAddress>
	<CFSET FORM.usergroup    = 3>

	<CFIF isLoggedIn() EQ "Yes">
		<CFSET FORM.id = SESSION.user.id>
	</CFIF>

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

	<!--- Check for Duplicate Users --->
	<CFIF DoCommit EQ "Yes" AND FORM.id EQ 0>
		<CFINVOKE COMPONENT="security.main" METHOD="getDuplicateUser" EMAIL="#FORM.emailAddress#" USERNAME="#FORM.username#" RETURNVARIABLE="duplicateResults" />

		<CFIF duplicateResults.recordCount GT 0 AND duplicateResults.id GT 0>
			<!--- just give them the flag. What harm is signing someone else up for a beta gonna do --->
			<CFSET FORM.id = duplicateResults.id>
		</CFIF>

		<CFIF FORM.id EQ 0>
			<CFSET FORM.silent     = "Yes">
			<CFSET FORM.mode       = "insert">
			<CFSET FORM.newsletter = 1>
			<CFINVOKE COMPONENT="security.main" METHOD="signup" RETURNVARIABLE="DoCommit" />
			<CFSET FORM.mode       = "submit">

			<CFIF DoCommit EQ "No">
				<CFSET definition = "There was an error signing you up. Please check your email address.">
			<CFELSEIF isLoggedIn() EQ "Yes">
				<CFSET FORM.id = SESSION.user.id>
			</CFIF>
		</CFIF>
	</CFIF>

	<!--- record into data log --->
	<CFIF DoCommit EQ "Yes" AND FORM.id GT 0>
		<CFTRANSACTION ACTION="BEGIN">
			<CFTRY>
				<CFQUERY NAME="flagResults" DATASOURCE="#dsn#">
					DELETE
					FROM users.tag_user
					WHERE tag_id    = <CFQUERYPARAM VALUE="#signupTag#" CFSQLTYPE="CF_SQL_INTEGER">
						AND user_id = <CFQUERYPARAM VALUE="#FORM.id#" CFSQLTYPE="CF_SQL_INTEGER">;

					INSERT INTO users.tag_user ( user_id, tag_id )
					VALUES (
						<CFQUERYPARAM VALUE="#FORM.id#" CFSQLTYPE="CF_SQL_INTEGER">,
						<CFQUERYPARAM VALUE="#signupTag#" CFSQLTYPE="CF_SQL_INTEGER">
					);
				</CFQUERY>

				<!--- create the email --->
				<CFSET body = "<B>Name:</B> #FORM.firstname# #FORM.lastname#<BR>">
				<CFSET body = body & "<B>Email Address:</B> #FORM.emailAddress#<BR>">
				<CFSET body = body & "<B>Contact Phone ##:</B> #FORM.phone#<BR>">
				<CFSET body = body & "<B>Tell Us About Your Hotel:</B> #FORM.comments#">

				<!--- send the email --->
				<CFINVOKE COMPONENT="mailer.main" METHOD="sendEmail" TO="#to#" FROM="#from#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#subject#" BODY="#body#" />

				<CFTRANSACTION ACTION="COMMIT" />

				<CFCATCH TYPE="Any">
					<CFSET DoCommit   = "No">
					<CFSET definition = "There was an error.<BR><BR>If this occurs frequently, please contact the site administrator.">
					<CFTRANSACTION ACTION="ROLLBACK" />
				</CFCATCH>
			</CFTRY>
		</CFTRANSACTION>
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<CF_DEFINITION TEXT="#definition#" TITLE="#IIF(DoCommit EQ 'Yes','"Success"','"Alert"')#">
		<CFSCRIPT>metaRefresh("http://#REQUEST.domain##CGI.script_name#",2);</CFSCRIPT>
	<CFELSE>
		<CFSET FORM.definition = definition>
		<CFINCLUDE TEMPLATE="#REQUEST.templates#/pms_main.cfm">

		<CFOUTPUT>
			<SCRIPT LANGUAGE="Javascript" TYPE="text/javascript">
				location.href='##beta_signup';
			</SCRIPT>
		</CFOUTPUT>
	</CFIF>

</CFFUNCTION>

<!--- -------------------------- --->
<!---   Confirmation Functions   --->
<!--- -------------------------- --->

<!--- Shows the final confirmation. Assumes all FORM variables from appstore.checkout.process exist. --->
<CFFUNCTION NAME="confirmation" HINT="Shows the final confirmation. Assumes all FORM variables from appstore.checkout.process exist." ACCESS="public">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="signup/confirmation_main.cfm" />

	<!--- initialize variables --->
	<CFSET var siteResults = "">

	<CFQUERY NAME="siteResults" DATASOURCE="#dsn#">
		SELECT s.name, s.site_url, s.phone, s.phone2, ( SELECT a."value" FROM site.preferences a WHERE a.site_id = s.id AND a.name = 'admin_email' ) AS admin_email
		FROM site.site s
		WHERE s.id = <CFQUERYPARAM VALUE="#REQUEST.site_id#" CFSQLTYPE="CF_SQL_INTEGER">;
	</CFQUERY>

	<CFIF Trim(ARGUMENTS.template) NEQ "">
		<CFINCLUDE TEMPLATE="#getTemplateInclude(ARGUMENTS.template)#">
	</CFIF>

	<!--- Send off Prepared Confirmations (If it errors now, it won't be seen by the user) --->
	<CFIF FORM.send_email EQ 1>
		<!--- User Confirmation --->
		<CFINVOKE COMPONENT="mailer.main" METHOD="sendEmail" TO="#FORM.user_email#" FROM="#siteResults.admin_email#" FRIENDLY="#siteResults.name#" SUBJECT="Confirmation ###FORM.confirmation_code#" BODY="#FORM.confirmation_email_user#" />

		<!--- Admin Confirmation --->
		<CFINVOKE COMPONENT="mailer.main" METHOD="sendEmail" TO="#siteResults.admin_email#" FROM="#siteResults.admin_email#" FRIENDLY="#siteResults.name#" SUBJECT="New Signup for #siteResults.site_url# - ###FORM.confirmation_code#" BODY="#FORM.confirmation_email_admin#" />

		<!--- Jeff and Me Confirmation --->
		<CFMAIL TO="jeff@alternateimage.com" FROM="#siteResults.admin_email#" CC="john@alternateimage.com" SUBJECT="Processed Open Hotel Signup" TYPE="html">
			<CFDUMP VAR="#REQUEST#" LABEL="REQUEST">
			<CFDUMP VAR="#SESSION#" LABEL="SESSION">
			<CFDUMP VAR="#FORM#" LABEL="FORM">
		</CFMAIL>

		<!--- Michelle Confirmation --->
		<CFMAIL TO="7025924800@txt.att.net" FROM="#siteResults.admin_email#" SUBJECT="New Open Hotel Signup" TYPE="html">
			<B>New Open Hotel Signup</B><BR>
			Hotel Name: #FORM.site_name#<BR>
			Hotel Phone: #FORM.site_phone#<BR>
			User Email: #FORM.user_email#<BR>
			Referrer: #FORM.how_heard#
		</CFMAIL>
	</CFIF>

</CFFUNCTION>

<!--- ------------------------- --->
<!---   Transaction Functions   --->
<!--- ------------------------- --->

<!--- Grabs the site's payment information and charges the payment interface. --->
<!--- MUST BE IN A TRANSACTION BLOCK. --->
<CFFUNCTION NAME="processPayment" HINT="Grabs the site's payment information and charges the payment interface." ACCESS="public">

	<!--- initialize variables --->
	<CFSET var accountPaymentResults = "">

	<!--- No Payment is Actually Made --->

	<!--- Create FORM fields for Processor --->
	<CFSET FORM.total        = FORM.total_grand>
	<CFSET FORM.approvalcode = FORM.account_app_id>

	<CFQUERY NAME="accountPaymentResults" DATASOURCE="#dsn#">
		INSERT INTO appstore.account_payment ( site_id, account_id, account_app_id, user_id, status, "level",
			interface, interface_request, interface_response, amount, creditcard_num, creditcard_exp, creditcard_cvv,
			comments, our_comments, date_made, time_made, confirmation_email_user, confirmation_email_admin, confirmation_code )
		VALUES (
			<CFQUERYPARAM VALUE="#REQUEST.site_id#" CFSQLTYPE="CF_SQL_INTEGER">,
			<CFQUERYPARAM VALUE="#FORM.account_id#" CFSQLTYPE="CF_SQL_INTEGER">,
			<CFQUERYPARAM VALUE="#FORM.account_app_id#" CFSQLTYPE="CF_SQL_INTEGER">,
			<CFQUERYPARAM VALUE="#FORM.user_id#" CFSQLTYPE="CF_SQL_INTEGER">,
			<CFQUERYPARAM VALUE="0" CFSQLTYPE="CF_SQL_SMALLINT">,
			<CFQUERYPARAM VALUE="#FORM.level#" CFSQLTYPE="CF_SQL_INTEGER">,
			<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFQUERYPARAM VALUE="#FORM.total#" CFSQLTYPE="CF_SQL_REAL">,
			<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFQUERYPARAM VALUE="#FORM.comments#" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFIF isDefined("FORM.our_comments") EQ "Yes">
				<CFQUERYPARAM VALUE="#FORM.our_comments#" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFELSE>
				<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
			</CFIF>
			<CFQUERYPARAM VALUE="#FORM.date_made#" CFSQLTYPE="CF_SQL_DATE">,
			<CFQUERYPARAM VALUE="#FORM.time_made#" CFSQLTYPE="CF_SQL_TIME">,
			<CFQUERYPARAM VALUE="#FORM.confirmation_email_user#" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFQUERYPARAM VALUE="#FORM.confirmation_email_admin#" CFSQLTYPE="CF_SQL_VARCHAR">,
			<CFQUERYPARAM VALUE="#FORM.confirmation_code#" CFSQLTYPE="CF_SQL_VARCHAR">
		) RETURNING id;
	</CFQUERY>

	<CFSET FORM.account_payment_id = accountPaymentResults.id>

</CFFUNCTION>

<!--- Creates the account's number dot subdomain for openhotel.com. --->
<!--- CALLED AFTER PURCHASE IS PROCESSED --->
<CFFUNCTION NAME="setupNumberDot" ACCESS="public" RETURNTYPE="boolean" HINT="Creates the account's number dot subdomain for openhotel.com.">

	<!--- initialize variables --->
	<CFSET var DoCommit     = "Yes">
	<CFSET var siteResults  = "">
	<CFSET var adminResults = "">
	<CFSET var confirmhtml  = "">
	<CFSET var decryptPass  = "">
	<CFSET var siteObj      = CreateObject("component","server.website.admin.site")>

	<CFTRY>
		<!--- o000.openhotel.com will automatically be assigned a number dot --->
		<CFSET FORM.site_url = "hotel000.#SESSION.domain#">

		<CFSET siteResults = siteObj.createSite(
			siteurl=FORM.site_url,
			name=FORM.site_name,
			website=FORM.site_website,
			apps="site,content,security,hotel",
			copypackagefrom="#docRoot#/#SESSION.domain#/html/templates/custom/packages",
			dateadded=FORM.date_made,
			startbilling=FORM.date_expire,
			address=FORM.site_address,
			city=FORM.site_city,
			state=FORM.site_state,
			zip=FORM.site_zip,
			country=FORM.site_country,
			phone=FORM.site_phone
		)>

		<CFIF siteResults.DoCommit EQ "Yes">
			<CFSET FORM.created_site_id = siteResults.id>
			<CFSET FORM.site_path       = siteResults.finalpath>
			<CFSET FORM.site_url        = siteResults.finalurl>
		<CFELSE>
			<CFTHROW TYPE="custom_type" MESSAGE="There was an error creating the site : #siteResults.definition#" />
		</CFIF>

		<!--- set the admin email --->
		<CFSET siteObj.setSitePreference(siteId=FORM.created_site_id,schema="site",name="admin_email",value="#FORM.emailAddress#")>

		<!--- set the hotel type to open hotel --->
		<CFSET siteObj.setSitePreference(siteId=FORM.created_site_id,schema="hotel",name="hotel_type",value="3")>

		<!--- update with final settings --->
		<CFSET siteObj.createSiteSettingsFile(siteId=FORM.created_site_id,overwrite="Yes",copyFrom="#docRoot#/#SESSION.domain#/html/templates/custom/packages")>

		<!--- add the user to the site as an administrator --->
		<CFSET setupUserAdmin()>

		<!--- attach site to the account/create snippets --->
		<CFSET attachAccountSite()>
	
		<!--- Send off Site Creation Confirmations (If it errors now, it won't be seen by the user) --->
		<CFIF FORM.send_email EQ 1>
			<CFTRY>
				<CFQUERY NAME="adminResults" DATASOURCE="#dsn#">
					SELECT a."value" AS admin_email,
					(	SELECT u.email
						FROM users.users u
						WHERE u.site_id = <CFQUERYPARAM VALUE="#REQUEST.site_id#" CFSQLTYPE="CF_SQL_INTEGER">
							AND u.id    = <CFQUERYPARAM VALUE="#FORM.user_id#" CFSQLTYPE="CF_SQL_INTEGER">
					) AS user_email,
					(	SELECT u.password
						FROM users.users u
						WHERE u.site_id = <CFQUERYPARAM VALUE="#REQUEST.site_id#" CFSQLTYPE="CF_SQL_INTEGER">
							AND u.id    = <CFQUERYPARAM VALUE="#FORM.user_id#" CFSQLTYPE="CF_SQL_INTEGER">
					) AS user_pass
					FROM site.preferences a
					WHERE a.site_id = <CFQUERYPARAM VALUE="#REQUEST.site_id#" CFSQLTYPE="CF_SQL_INTEGER">
						AND a.name  = <CFQUERYPARAM VALUE="admin_email" CFSQLTYPE="CF_SQL_VARCHAR">
				</CFQUERY>

				<CFSET decryptPass = doDecrypt(adminResults.user_pass,"MyEncryptionKey")>
				<CFSET confirmhtml = "Your Open Hotel account has been created and is ready to use!<BR><BR>">
				<CFSET confirmhtml = confirmhtml & "To access your administration panel, please visit <A CLASS='link' HREF='http://#FORM.site_url#/admin'>http://#FORM.site_url#/admin</A> and log in with the below user information.<BR><BR>">
				<CFSET confirmhtml = confirmhtml & "<B>Hotel Name:</B> #FORM.site_name#<BR>">
				<CFSET confirmhtml = confirmhtml & "<B>Your Hotel Site ##:</B> #FORM.created_site_id#<BR>">
				<CFSET confirmhtml = confirmhtml & "<B>Your Hotel Reservation Page:</B> <A CLASS='link' HREF='http://#FORM.site_url#'>http://#FORM.site_url#</A><BR>">
				<CFSET confirmhtml = confirmhtml & "<B>Your Hotel Admin Area:</B> <A CLASS='link' HREF='http://#FORM.site_url#'>http://#FORM.site_url#/admin</A><BR>">
				<CFSET confirmhtml = confirmhtml & "<B>Login Email:</B> #adminResults.user_email#<BR>">
				<CFSET confirmhtml = confirmhtml & "<B>Login Password:</B> #decryptPass#<BR><BR>">
				<CFSET confirmhtml = confirmhtml & "Please keep this information for your records in case you need it. If you require any assistance or have any questions, please contact us at <A CLASS='link' HREF='http://#REQUEST.domain#/contact.cfm'>http://#REQUEST.domain#/contact.cfm</A> or call us anytime at 386-310-2001.">

				<!--- User Site Creation Confirmation --->
				<CFINVOKE COMPONENT="mailer.main" METHOD="sendEmail" TO="#FORM.user_email#" FROM="#adminResults.admin_email#" FRIENDLY="Open Hotel" SUBJECT="Your Open Hotel Site Has Been Created!" BODY="#confirmhtml#" />

				<!--- Admin Site Creation Confirmation --->
				<CFINVOKE COMPONENT="mailer.main" METHOD="sendEmail" TO="#adminResults.admin_email#" CC="val@openhotel.com" FROM="#adminResults.admin_email#" FRIENDLY="Open Hotel" SUBJECT="Open Hotel Site Created" BODY="#confirmhtml#" />

				<CFCATCH TYPE="Any">
					<!--- Do Nothing --->
				</CFCATCH>
			</CFTRY>
		</CFIF>

		<CFCATCH TYPE="Any">
			<!--- Continue unabated; but let us know --->
			<CFMAIL TO="john@alternateimage.com" FROM="error@alternateimage.com" SUBJECT="Open Hotel - local.signup().setupNumberDot() - Caught on Error" TYPE="html">
				<CFDUMP VAR="#CFCATCH#">
				<CFDUMP VAR="#FORM#">
			</CFMAIL>
		</CFCATCH>
	</CFTRY>

	<CFSET siteObj = "">

	<CFRETURN DoCommit>

</CFFUNCTION>

<!--- Add the site to the account and create the snippets. --->
<CFFUNCTION NAME="attachAccountSite" HINT="Add the site to the account and create the snippets." ACCESS="public">

	<!--- initialize variables --->
	<CFSET var accountSiteResults = "">
	<CFSET var accountSnipResults = "">
	<CFSET var today              = DateFormat(Now(),"YYYY-MM-DD")>
	<CFSET var rightNow           = TimeFormat(Now(),"HH:MM:SS")>

	<CFTRANSACTION ACTION="BEGIN">
		<CFTRY>
			<CFQUERY NAME="accountSiteResults" DATASOURCE="#dsn#">
				INSERT INTO appstore.account_site ( account_id, site_id )
				VALUES (
					<CFQUERYPARAM VALUE="#FORM.account_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="#FORM.created_site_id#" CFSQLTYPE="CF_SQL_INTEGER">
				) RETURNING id;

				/* Level is our temporary go-to for storing created site id */
				UPDATE appstore.account_payment
				SET "level"   = <CFQUERYPARAM VALUE="#FORM.created_site_id#" CFSQLTYPE="CF_SQL_INTEGER">
				WHERE site_id = <CFQUERYPARAM VALUE="#REQUEST.site_id#" CFSQLTYPE="CF_SQL_INTEGER">
					AND id    = <CFQUERYPARAM VALUE="#FORM.account_payment_id#" CFSQLTYPE="CF_SQL_INTEGER">;
			</CFQUERY>

			<CFSET FORM.account_site_id = accountSiteResults.id>

			<CFQUERY NAME="accountSnipResults" DATASOURCE="#dsn#">
				INSERT INTO appstore.account_snippet ( account_id, snippet_id, account_app_id, label, data,
					date_made, time_made, skin_section_id, skin_layout_id, skin_style_id )
				VALUES (
					<CFQUERYPARAM VALUE="#FORM.account_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="1" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="#FORM.account_app_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="Box Reservation (Normal)" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="component=display|method=res|hoteldomain=#FORM.site_url#" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="#today#" CFSQLTYPE="CF_SQL_DATE">,
					<CFQUERYPARAM VALUE="#rightNow#" CFSQLTYPE="CF_SQL_TIME">,
					<CFQUERYPARAM VALUE="49" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="108" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="0" NULL="Yes" CFSQLTYPE="CF_SQL_INTEGER">
				);

				INSERT INTO appstore.account_snippet ( account_id, snippet_id, account_app_id, label, data,
					date_made, time_made, skin_section_id, skin_layout_id, skin_style_id )
				VALUES (
					<CFQUERYPARAM VALUE="#FORM.account_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="1" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="#FORM.account_app_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="Box Reservation (Dark)" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="component=display|method=res|hoteldomain=#FORM.site_url#" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="#today#" CFSQLTYPE="CF_SQL_DATE">,
					<CFQUERYPARAM VALUE="#rightNow#" CFSQLTYPE="CF_SQL_TIME">,
					<CFQUERYPARAM VALUE="49" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="108" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="13" CFSQLTYPE="CF_SQL_INTEGER">
				);

				INSERT INTO appstore.account_snippet ( account_id, snippet_id, account_app_id, label, data,
					date_made, time_made, skin_section_id, skin_layout_id, skin_style_id )
				VALUES (
					<CFQUERYPARAM VALUE="#FORM.account_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="1" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="#FORM.account_app_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="Box Reservation (Horizontal)" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="component=display|method=res|hoteldomain=#FORM.site_url#" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="#today#" CFSQLTYPE="CF_SQL_DATE">,
					<CFQUERYPARAM VALUE="#rightNow#" CFSQLTYPE="CF_SQL_TIME">,
					<CFQUERYPARAM VALUE="49" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="110" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="0" NULL="Yes" CFSQLTYPE="CF_SQL_INTEGER">
				);

				INSERT INTO appstore.account_snippet ( account_id, snippet_id, account_app_id, label, data,
					date_made, time_made, skin_section_id, skin_layout_id, skin_style_id )
				VALUES (
					<CFQUERYPARAM VALUE="#FORM.account_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="1" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="#FORM.account_app_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="Box Reservation (Horizontal Dark)" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="component=display|method=res|hoteldomain=#FORM.site_url#" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="#today#" CFSQLTYPE="CF_SQL_DATE">,
					<CFQUERYPARAM VALUE="#rightNow#" CFSQLTYPE="CF_SQL_TIME">,
					<CFQUERYPARAM VALUE="49" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="110" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="13" CFSQLTYPE="CF_SQL_INTEGER">
				);
			</CFQUERY>

			<CFTRANSACTION ACTION="COMMIT" />

			<CFCATCH TYPE="Any">
				<CFMAIL TO="john@alternateimage.com" CC="jeff@alternateimage.com" FROM="error@alternateimage.com" SUBJECT="#SESSION.domain# - Failed to Set Up Number Dot on Signup" TYPE="html">
					<CFDUMP VAR="#CFCATCH#">
					<CFDUMP VAR="#FORM#">
				</CFMAIL>

				<CFTRANSACTION ACTION="ROLLBACK" />
				<CFTHROW TYPE="custom_type" MESSAGE="#CFCATCH.Message#" />
			</CFCATCH>
		</CFTRY>
	</CFTRANSACTION>

</CFFUNCTION>

<!--- Sets up the user as an admin account on their new website. --->
<CFFUNCTION NAME="setupUserAdmin" HINT="Sets up the user as an admin account on their new website." ACCESS="public">

	<!--- initialize variables --->
	<CFSET var adminResults      = "">
	<CFSET var adminGroupResults = "">

	<!--- create the user administrator account; all information should already be in the FORM --->
	<CFTRANSACTION ACTION="BEGIN">
		<CFTRY>
			<CFQUERY NAME="adminResults" DATASOURCE="#dsn#">
				INSERT INTO users.users ( site_id, email, username, password, firstname, lastname, active,
					address, city, state, zip, phone, country, newsletter, signup_date, imported,
					avatar )
				VALUES (
					<CFQUERYPARAM VALUE="#FORM.created_site_id#" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="#FORM.emailAddress#" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="#FORM.username#" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="#FORM.password_encrypted#" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="#FORM.firstname#" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="#FORM.lastname#" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="1" CFSQLTYPE="CF_SQL_SMALLINT">,
					<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">,
					<CFQUERYPARAM VALUE="1" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="#FORM.date_made#" CFSQLTYPE="CF_SQL_DATE">,
					<CFQUERYPARAM VALUE="0" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="" CFSQLTYPE="CF_SQL_VARCHAR">
				) RETURNING id;
			</CFQUERY>

			<CFSET FORM.site_admin_id = adminResults.id>

			<!--- insert the administrator into their groups --->
			<CFQUERY NAME="adminGroupResults" DATASOURCE="#dsn#">
				INSERT INTO users.user_usergroup ( usergroup_id, user_id ) 
				VALUES (
					<CFQUERYPARAM VALUE="2" CFSQLTYPE="CF_SQL_INTEGER">,
					<CFQUERYPARAM VALUE="#FORM.site_admin_id#" CFSQLTYPE="CF_SQL_INTEGER">
				);
			</CFQUERY>

			<CFTRANSACTION ACTION="COMMIT" />

			<CFCATCH TYPE="Any">
				<CFMAIL TO="john@alternateimage.com" CC="jeff@alternateimage.com" FROM="error@alternateimage.com" SUBJECT="#SESSION.domain# - Failed to Set Up Number Dot on Signup" TYPE="html">
					<CFDUMP VAR="#CFCATCH#">
					<CFDUMP VAR="#FORM#">
				</CFMAIL>

				<CFTRANSACTION ACTION="ROLLBACK" />
				<CFTHROW TYPE="custom_type" MESSAGE="#CFCATCH.Message#" />
			</CFCATCH>
		</CFTRY>
	</CFTRANSACTION>

</CFFUNCTION>

<!--- -------------------- --->
<!---   Helper Functions   --->
<!--- -------------------- --->

<!--- if the signup has already processed, then bounce them. --->
<CFFUNCTION NAME="checkSignupProcessed" ACCESS="public">

	<CFIF isDefined("SESSION.openhotel.account_payment_id") EQ "Yes" AND SESSION.openhotel.account_payment_id GT 0 AND isDefined("SESSION.openhotel.account_id") EQ "Yes" AND SESSION.openhotel.account_id GT 0>
		<CF_DEFINITION TEXT="Your account creation and purchase were already processed by your first request. You have not been charged for any additional requests. You should receive a confirmation email soon.<BR><BR>If you have any questions or concerns about what happened, please <A CLASS='link' HREF='http://#REQUEST.domain#/contact.cfm'>contact us</A>" TITLE="Processed">
		<CFINCLUDE TEMPLATE="#REQUEST.templates#/footer.cfm">
		<CFABORT>
	</CFIF>

</CFFUNCTION>

</CFCOMPONENT>