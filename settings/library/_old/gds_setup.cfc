<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateCFC("#REQUEST.domainRoot#/settings/library/local.cfc")>
</CFIF>

<!--- gds setup main --->
<CFFUNCTION NAME="main" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var optionsList    = "">
	<CFSET var fieldCount     = 0>
	<CFSET var columnCount    = 0>
	<CFSET var columnWidth    = "">
	<CFSET var optionsListLen = 0>

	<!--- step templates --->
	<CFSET var steps = getSteps()>

	<!--- initialize loop counters --->
	<CFSET var counter = 0>
	<CFSET var a       = "">
	<CFSET var f       = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("URL.step","numeric",1);
		param("URL.hotel","string","");
		param("URL.domain","string","");
	</CFSCRIPT>

	<!--- decode the URL variables --->
	<CFSET URL.hotel  = Trim(Replace(URLDecode(URL.hotel),"--SLASH--","/","ALL"))>
	<CFSET URL.domain = Trim(Replace(URLDecode(URL.domain),"--SLASH--","/","ALL"))>

	<!--- You are not allowed to pass a non-existant step through the URL. Sorry. --->
	<CFIF URL.step GT ArrayLen(steps)>
		<CFSET URL.step = 1>
	</CFIF>

	<CFINCLUDE TEMPLATE="#REQUEST.templates#/#steps[URL.step]#">

</CFFUNCTION>

<!--- controller function that delegates the form submissions to the appropriate subroutines --->
<CFFUNCTION NAME="submit" ACCESS="public">

	<!--- initialize variables --->
	<CFSET var DoCommit   = "Yes">
	<CFSET var definition = "">
	<CFSET var steps      = getSteps()>

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.step","numeric",0);
		param("FORM.definition","string","");
	</CFSCRIPT>

	<!--- You are not allowed to pass a non-existant step through the FORM. Sorry. --->
	<CFIF FORM.step GT ArrayLen(steps)>
		<CFSET FORM.step = 0>
	</CFIF>

	<CFIF FORM.step EQ 1>
		<CFSET DoCommit = step1_submit()>
	<CFELSEIF FORM.step EQ 2>
		<CFSET DoCommit = step2_submit()>
	<CFELSEIF FORM.step EQ 3>
		<CFSET DoCommit = step3_submit()>
	<CFELSEIF FORM.step EQ 4>
		<CFSET DoCommit = step4_submit()>
	<CFELSEIF FORM.step EQ 5>
		<CFSET FORM.definition = "This step is not submitted. Please send an email containing the GDS photos and relevant information to <A CLASS='link' HREF='mailto:gdsphotos@alternateimage.com'>gdsphotos@alternateimage.com</A>.<BR>Thank you!">
	<CFELSE>
		<CFSET DoCommit        = "No">
		<CFSET FORM.definition = "There is no step #FORM.step#. For more information, please contact Alternate Image Support.">
	</CFIF>

	<CFSET definition = FORM.definition>

	<CFIF DoCommit EQ "Yes">
		<!--- confirm, next step --->
		<CFIF FORM.step EQ ArrayLen(steps)>
			<CF_DEFINITION TEXT="#definition#" TITLE="Thank You">
		<CFELSE>
			<CF_DEFINITION TEXT="#definition#" TITLE="Thank You" LINK_TEXT="Click Here to Continue to the Next Step" LINK="http://#REQUEST.domain#/setup/gds.cfm/step/#FORM.step+1#/hotel/#Trim(URLEncodedFormat(Replace(FORM.name,'/','--SLASH--','ALL')))#/domain/#Trim(URLEncodedFormat(Replace(FORM.domain,'/','--SLASH--','ALL')))#" LINK_STYLE="color:##005378">
		</CFIF>
	<CFELSE>
		<!--- bounce back to form --->
		<CF_DEFINITION TEXT="#definition#" TITLE="Alert">

		<CFIF FORM.step EQ 0>
			<CFSET FORM.step = 1>
		</CFIF>

		<CFSET URL.step = FORM.step>

		<CFSCRIPT>main();</CFSCRIPT>
	</CFIF>

</CFFUNCTION>

<CFFUNCTION NAME="step1_submit" ACCESS="private">

	<!--- initialize variables --->
	<CFSET var DoCommit   = "Yes">
	<CFSET var definition = "You have successfully completed Step 1!">
	<CFSET var today      = DateFormat(Now(),"YYYY-MM-DD")>

	<!--- mail variables --->
	<CFSET var to      = "val@alternateimage.com">
	<CFSET var from    = "gds@alternateimage.com">
	<CFSET var cc      = "john@alternateimage.com,cindy@alternateimage.com,mic@alternateimage.com">
	<CFSET var subject = "">
	<CFSET var body    = "">

	<!--- initialize loop counters --->
	<CFSET var a = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.name","string","");
		param("FORM.domain","string","");
		param("FORM.contact_firstname","string","");
		param("FORM.contact_lastname","string","");
		param("FORM.contact_title","string","");
		param("FORM.contact_phone","string","");
		param("FORM.contact_email","string","");
		param("FORM.property_type","string","");
		param("FORM.property_segment","string","");
		param("FORM.property_location","string","");
		param("FORM.star_rating","numeric",0);
		param("FORM.diamond_rating","numeric",0);
		param("FORM.total_rooms","numeric",0);
		param("FORM.total_floors","numeric",0);
		param("FORM.total_elevators","numeric",0);
		param("FORM.total_suites","numeric",0);
		param("FORM.twin_beds","numeric",0);
		param("FORM.queen_beds","numeric",0);
		param("FORM.double_beds","numeric",0);
		param("FORM.rollaway_beds","numeric",0);
		param("FORM.cribs","numeric",0);
		param("FORM.rollaway_bed_cost","numeric",0);
		param("FORM.crib_cost","numeric",0);
		param("FORM.extra_person_charge","numeric",0);
		param("FORM.extra_child_charge","numeric",0);
		param("FORM.handicapped_rooms","numeric",0);
		param("FORM.king_beds","numeric",0);
		param("FORM.meeting_capacity","numeric",0);
		param("FORM.meeting_rooms","numeric",0);
		param("FORM.meeting_sqft","numeric",0);
		param("FORM.nonsmoking_rooms","numeric",0);
		param("FORM.handicapped_rooms","numeric",0);
		param("FORM.payment_card","string","");
		param("FORM.discounts","string","");
		param("FORM.channels","string","");
		param("FORM.contracts","string","");
	</CFSCRIPT>

	<CFSET FORM.date_open      = getFormDate("open")>
	<CFSET FORM.date_renovated = getFormDate("renovated")>

	<CFSET FORM.check_in_time      = TimeFormat(getFormTime("check_in"), "hh:mm tt")>
	<CFSET FORM.check_out_time     = TimeFormat(getFormTime("check_out"), "hh:mm tt")>
	<CFSET FORM.late_check_in_time = TimeFormat(getFormTime("late_check_in"), "hh:mm tt")>
	<CFSET FORM.hold_time          = TimeFormat(getFormTime("hold"), "hh:mm tt")>

	<!--- VALIDATE FORM --->

	<CFIF validateCaptcha() IS false>
		<CFSET DoCommit   = "No">
		<CFSET definition = "Invalid security code.">
	</CFIF>

	<CFIF Trim(FORM.name) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the property's hotel name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.domain) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the property's current or future domain.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND (Trim(FORM.contact_firstname) EQ "" OR Trim(FORM.contact_lastname) EQ "")>
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the full name for the contact person for the property.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.contact_title) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the title of the contact person for the property.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.contact_phone) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the phone number of the contact person for the property.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND isValid("email",FORM.contact_email) EQ "No">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the email address of the contact person for the property.">
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<!--- if any airport fields are completed, make sure they're completed completely --->
		<CFLOOP FROM="1" TO="4" STEP="1" INDEX="a">
			<CFIF Trim(FORM["airport#a#_code"]) NEQ "">
				<CFIF Trim(FORM["airport#a#_distance"]) EQ "" OR Trim(FORM["airport#a#_transportation"]) EQ "">
					<CFSET DoCommit   = "No">
					<CFSET definition = "If you are to fill out airport code fields, please fill out all of the fields for the input codes.">
				</CFIF>
			</CFIF>
		</CFLOOP>
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND DateBefore(FORM.date_open) EQ "No">
		<CFSET DoCommit  = "No">
		<CFSET definition = "This hotel must have been opened before today.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND ListLen(FORM.property_segment) EQ 0>
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must check at least one property segment.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND ListLen(FORM.property_location) EQ 0>
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must check at least one property location.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.total_rooms EQ 0>
		<CFSET DoCommit   = "No">
		<CFSET definition = "Your property must have at least one room.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.total_floors EQ 0>
		<CFSET DoCommit   = "No">
		<CFSET definition = "Your property must have at least one floor.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND ListLen(FORM.payment_card) EQ 0>
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must check at least one credit card to accept.">
	</CFIF>
		
	<CFMAIL TO="jeff@openhotel.com" FROM="error@#REQUEST.domain#" SUBJECT="gds form" TYPE="html" SPOOLENABLE="false">
		<CFDUMP VAR="#FORM#">
	</CFMAIL>	

	<!--- put the mail together, send it out --->
	<CFIF DoCommit EQ "Yes">
		<CFTRY>
			<CFSET subject = "GDS Setup - #FORM.domain# - Step 1 (#today#)">

			<CFSET body = "<DIV ALIGN='center' STYLE='margin:5px;margin-bottom:20px;'><B>GDS Setup - Step 1</B><BR>#FORM.name# (#FORM.domain#)<BR><B STYLE='font-size:10px;'>Submitted #today# from IP '#CGI.remote_host#'</B></DIV>">
			<CFSET body = "#body#<B>Hotel Name:</B> #FORM.name#<BR>">
			<CFSET body = "#body#<B>Hotel Domain:</B> #FORM.domain#<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Hotel Address:</B> #FORM.address#<BR>">
			<CFSET body = "#body#<B>Hotel City:</B> #FORM.city#<BR>">
			<CFSET body = "#body#<B>Hotel State:</B> #FORM.state#<BR>">
			<CFSET body = "#body#<B>Hotel Zip:</B> #FORM.zip#<BR>">
			<CFSET body = "#body#<B>Hotel Country:</B> #FORM.country#<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Contact Person:</B> #titleCase(FORM.contact_firstname & ' ' & FORM.contact_lastname)#<BR>">
			<CFSET body = "#body#<B>Contact Title:</B> #FORM.contact_title#<BR>">
			<CFSET body = "#body#<B>Contact Phone:</B> #FORM.contact_phone#<BR>">
			<CFSET body = "#body#<B>Contact Email:</B> #FORM.contact_email#<BR>">
			<CFSET body = "#body#<B>Res Phone:</B> #FORM.res_phone#<BR>">
			<CFSET body = "#body#<B>Res Fax:</B> #FORM.res_fax#<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Nearby Airports:</B><BR>">

			<!--- output only completed airport code fields --->
			<CFLOOP FROM="1" TO="4" STEP="1" INDEX="a">
				<CFIF Trim(FORM["airport#a#_code"]) NEQ "">
					<CFIF a NEQ 1>
						<CFSET body = "#body#<BR>">
					</CFIF>
					<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;Airport Code: #FORM['airport#a#_code']#<BR>">
					<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;Airport Direction: #UCase(FORM['airport#a#_direction'])#<BR>">
					<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;Distance: #FORM['airport#a#_distance']#<BR>">
					<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;Units: #FORM['airport#a#_units']#<BR>">
					<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;Transportation Codes: #FORM['airport#a#_transportation']#<BR>">
				</CFIF>
			</CFLOOP>

			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Date Opened:</B> #FORM.date_open#<BR>">
			<CFSET body = "#body#<B>Date Renovated:</B> #FORM.date_renovated#<BR>">
			<CFSET body = "#body#<B>Property Type:</B> #FORM.property_type#<BR>">
			<CFSET body = "#body#<B>Property Type:</B> #FORM.property_type#<BR>">
			<CFSET body = "#body#<B>Check In Time:</B> #FORM.check_in_time#<BR>">
			<CFSET body = "#body#<B>Check Out Time:</B> #FORM.check_out_time#<BR>">
			<CFSET body = "#body#<B>Late Check In Time:</B> #FORM.late_check_in_time#<BR>">
			<CFSET body = "#body#<B>Hold Time:</B> #FORM.hold_time#<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Property Segment:</B><BR>">

			<CFLOOP LIST="#FORM.property_segment#" DELIMITERS="," INDEX="a">
				<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;#a#<BR>">
			</CFLOOP>

			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Property Location:</B><BR>">

			<CFLOOP LIST="#FORM.property_location#" DELIMITERS="," INDEX="a">
				<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;#a#<BR>">
			</CFLOOP>

			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Star Rating:</B> #FORM.star_rating# Stars<BR>">
			<CFSET body = "#body#<B>Diamond Rating:</B> #FORM.diamond_rating# Diamonds<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Total Rooms:</B> #FORM.total_rooms#<BR>">
			<CFSET body = "#body#<B>Total Floors:</B> #FORM.total_floors#<BR>">
			<CFSET body = "#body#<B>Total Elevators:</B> #FORM.total_elevators#<BR>">
			<CFSET body = "#body#<B>Total Suites:</B> #FORM.total_suites#<BR>">
			<CFSET body = "#body#<B>Twin Beds:</B> #FORM.twin_beds#<BR>">
			<CFSET body = "#body#<B>Queen Beds:</B> #FORM.queen_beds#<BR>">
			<CFSET body = "#body#<B>Double Beds:</B> #FORM.double_beds#<BR>">
			<CFSET body = "#body#<B>Rollaway Beds:</B> #FORM.rollaway_beds#<BR>">
			<CFSET body = "#body#<B>Cribs:</B> #FORM.cribs#<BR>">
			<CFSET body = "#body#<B>Handicapped Rooms:</B> #FORM.handicapped_rooms#<BR>">
			<CFSET body = "#body#<B>King Beds:</B> #FORM.king_beds#<BR>">
			<CFSET body = "#body#<B>Meeting Room Capacity:</B> #FORM.meeting_capacity#<BR>">
			<CFSET body = "#body#<B>Max Occupancy:</B> #FORM.max_occupancy#<BR>">
			<CFSET body = "#body#<B>Total Occupancy:</B> #FORM.total_occupancy#<BR>">
			<CFSET body = "#body#<B>Meeting Rooms:</B> #FORM.meeting_rooms#<BR>">
			<CFSET body = "#body#<B>Meeting Sqft:</B> #FORM.meeting_sqft#<BR>">
			<CFSET body = "#body#<B>Non-Smoking Rooms:</B> #FORM.nonsmoking_rooms#<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Rollaway Bed Cost:</B> #FORM.rollaway_bed_cost#<BR>">
			<CFSET body = "#body#<B>Crib Cost:</B> #FORM.crib_cost#<BR>">
			<CFSET body = "#body#<B>Extra Person Charge:</B> #FORM.extra_person_charge#<BR>">
			<CFSET body = "#body#<B>Extra Child Charge:</B> #FORM.extra_child_charge#<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Accepted Credit Cards:</B><BR>">

			<CFLOOP LIST="#FORM.payment_card#" DELIMITERS="," INDEX="a">
				<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;#a#<BR>">
			</CFLOOP>
			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>GDS Discounts:</B><BR>">

			<CFLOOP LIST="#FORM.discounts#" DELIMITERS="," INDEX="a">
				<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;#a#<BR>">
			</CFLOOP>

			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Requested GDS Channels:</B><BR>">

			<CFLOOP LIST="#FORM.channels#" DELIMITERS="," INDEX="a">
				<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;#a#<BR>">
			</CFLOOP>

			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Current Channels w/ Contracts:</B><BR>">

			<CFLOOP LIST="#FORM.contracts#" DELIMITERS="," INDEX="a">
				<CFSET body = "#body#&nbsp;&nbsp;&nbsp;&nbsp;#a#<BR>">
			</CFLOOP>

			<!--- send the email --->
			<CFINVOKE COMPONENT="components.mailer.main" METHOD="sendEmail" TO="#to#" CC="#cc#" FROM="#from#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#subject#" BODY="#body#" />

			<CFCATCH TYPE="Any">
				<CFSET DoCommit   = "No">
				<CFSET definition = "There was an error preparing the email for this step. Please call Alternate Image Support for assistance.">
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<CFSET FORM.definition = definition>

	<CFRETURN DoCommit>

</CFFUNCTION>

<CFFUNCTION NAME="step2_submit" ACCESS="private">

	<!--- initialize variables --->
	<CFSET var DoCommit   = "Yes">
	<CFSET var definition = "You have successfully completed Step 2!">
	<CFSET var today      = DateFormat(Now(),"YYYY-MM-DD")>

	<!--- mail variables --->
	<CFSET var to      = "val@alternateimage.com">
	<CFSET var from    = "gds@alternateimage.com">
	<CFSET var cc      = "john@alternateimage.com,cindy@alternateimage.com,mic@alternateimage.com">
	<CFSET var subject = "">
	<CFSET var body    = "">

	<!--- initialize loop counters --->
	<CFSET var a = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.name","string","");
		param("FORM.domain","string","");
		param("FORM.amenities","string","");
	</CFSCRIPT>	

	<!--- VALIDATE FORM --->

	<CFIF validateCaptcha() IS false>
		<CFSET DoCommit   = "No">
		<CFSET definition = "Invalid security code.">
	</CFIF>

	<CFIF Trim(FORM.name) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the property's hotel name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.domain) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the property's current or future domain.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.amenities) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must select at least one amenity.">
	</CFIF>

	<!--- put the mail together, send it out --->
	<CFIF DoCommit EQ "Yes">
		<CFTRY>
			<CFSET subject = "GDS Setup - #FORM.domain# - Step 2 (#today#)">

			<CFSET body = "<DIV ALIGN='center' STYLE='margin:5px;margin-bottom:20px;'><B>GDS Setup - Step 2</B><BR>#FORM.name# (#FORM.domain#)<BR><B STYLE='font-size:10px;'>Submitted #today# from IP '#CGI.remote_host#'</B></DIV>">
			<CFSET body = "#body#<B>Hotel Name:</B> #FORM.name#<BR>">
			<CFSET body = "#body#<B>Hotel Domain:</B> #FORM.domain#<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">
			<CFSET body = "#body#<B>Amenities</B><BR>">

			<CFLOOP LIST="#FORM.amenities#" DELIMITERS="," INDEX="a">
				<CFSET body = "#body##a#<BR>">
			</CFLOOP>

			<!--- send the email --->
			<CFINVOKE COMPONENT="components.mailer.main" METHOD="sendEmail" TO="#to#" CC="#cc#" FROM="#from#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#subject#" BODY="#body#" />

			<CFCATCH TYPE="Any">
				<CFSET DoCommit   = "No">
				<CFSET definition = "There was an error preparing the email for this step. Please call Alternate Image Support for assistance.">
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<CFSET FORM.definition = definition>
			
	<CFRETURN DoCommit>
	
</CFFUNCTION>

<CFFUNCTION NAME="step3_submit" ACCESS="private">

	<!--- initialize variables --->
	<CFSET var DoCommit   = "Yes">
	<CFSET var definition = "You have successfully completed Step 3!">
	<CFSET var validRooms = "No">
	<CFSET var today      = DateFormat(Now(),"YYYY-MM-DD")>

	<!--- mail variables --->
	<CFSET var to      = "val@alternateimage.com">
	<CFSET var from    = "gds@alternateimage.com">
	<CFSET var cc      = "john@alternateimage.com,cindy@alternateimage.com,mic@alternateimage.com">
	<CFSET var subject = "">
	<CFSET var body    = "">

	<!--- initialize loop counters --->
	<CFSET var count = 1>
	<CFSET var a     = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.name","string","");
		param("FORM.domain","string","");
		param("FORM.roomCount","numeric",0);
	</CFSCRIPT>

	<!--- VALIDATE FORM --->

	<CFIF validateCaptcha() IS false>
		<CFSET DoCommit   = "No">
		<CFSET definition = "Invalid security code.">
	</CFIF>

	<CFIF Trim(FORM.name) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the property's hotel name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.domain) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the property's current or future domain.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND FORM.roomCount EQ 0>
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must submit data for at least one GDS room.">
	</CFIF>

	<!--- ensure we actually have room data --->
	<CFIF DoCommit EQ "Yes">
		<CFLOOP FROM="1" TO="#FORM.roomCount#" STEP="1" INDEX="a">
			<CFIF isDefined("FORM.gds#a#_name") EQ "Yes" AND (Trim(FORM["gds#a#_name"]) NEQ "" AND Trim(FORM["gds#a#_inventory"]) GT 0)>
				<CFSET validRooms = "Yes">
				<CFBREAK>
			</CFIF>
		</CFLOOP>

		<CFIF validRooms EQ "No">
			<CFSET DoCommit   = "No">
			<CFSET definition = "You must provide information for at least one GDS Room.">
		</CFIF>
	</CFIF>

	<!--- put the mail together, send it out --->
	<CFIF DoCommit EQ "Yes">
		<CFTRY>
			<CFSET subject = "GDS Setup - #FORM.domain# - Step 3 (#today#)">

			<CFSET body = "<DIV ALIGN='center' STYLE='margin:5px;margin-bottom:20px;'><B>GDS Setup - Step 3</B><BR>#FORM.name# (#FORM.domain#)<BR><B STYLE='font-size:10px;'>Submitted #today# from IP '#CGI.remote_host#'</B></DIV>">
			<CFSET body = "#body#<B>Hotel Name:</B> #FORM.name#<BR>">
			<CFSET body = "#body#<B>Hotel Domain:</B> #FORM.domain#<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">

			<!--- output only completed GDS Room fields --->
			<CFLOOP FROM="1" TO="#FORM.roomCount#" STEP="1" INDEX="a">
				<CFIF isDefined("FORM.gds#a#_name") EQ "Yes" AND (Trim(FORM["gds#a#_name"]) NEQ "" AND Trim(FORM["gds#a#_inventory"]) GT 0)>
					<CFSCRIPT>
						param("FORM.gds#a#_inventory","numeric",0);
						param("FORM.gds#a#_extra","numeric",0);
						param("FORM.gds#a#_king","numeric",0);
						param("FORM.gds#a#_queen","numeric",0);
						param("FORM.gds#a#_single","numeric",0);
						param("FORM.gds#a#_sofa","numeric",0);
						param("FORM.gds#a#_double","numeric",0);
						param("FORM.gds#a#_bedrooms","numeric",0);
						param("FORM.gds#a#_occtype","string","openhotel");
						param("FORM.gds#a#_minocc","numeric",0);
						param("FORM.gds#a#_maxocc","numeric",0);
					</CFSCRIPT>

					<CFSET body = "#body#<B>GDS Room #count#:</B><BR>">
					<CFSET body = "#body#<B>Name:</B> #FORM['gds#a#_name']#<BR>">
					<CFSET body = "#body#<B>Total Rooms:</B> #FORM['gds#a#_inventory']#<BR>">
					<CFSET body = "#body#<B>Extra Person:</B> #DollarFormat(FORM['gds#a#_extra'])#<BR>">
					<CFSET body = "#body#<B>Type:</B> #FORM['gds#a#_type']#<BR>">
					<CFSET body = "#body#<B>Quality:</B> #FORM['gds#a#_quality']#<BR>">
					<CFSET body = "#body#<B>GDS/ODD:</B> #FORM['gds#a#_odd']#<BR>">
					<CFSET body = "#body#<B>Short Description:</B> #FORM['gds#a#_shortdesc']#<BR>">
					<CFSET body = "#body#<B>Long Description:</B> #FORM['gds#a#_longdesc']#<BR>">
					<CFSET body = "#body#<B>Room Amenities:</B> #FORM['gds#a#_amenities']#<BR>">
					<CFSET body = "#body#<B>King Beds:</B> #FORM['gds#a#_king']#<BR>">
					<CFSET body = "#body#<B>Single/Twin Beds:</B> #FORM['gds#a#_single']#<BR>">
					<CFSET body = "#body#<B>Queen Beds:</B> #FORM['gds#a#_queen']#<BR>">
					<CFSET body = "#body#<B>Pullout/Sofa Beds:</B> #FORM['gds#a#_sofa']#<BR>">
					<CFSET body = "#body#<B>Double/Full Beds:</B> #FORM['gds#a#_double']#<BR>">
					<CFSET body = "#body#<B>Bedrooms Per Unit:</B> #FORM['gds#a#_bedrooms']#<BR>">

					<CFIF FORM["gds#a#_occtype"] EQ "openhotel">
						<CFSET body = "#body#<B>Occupancy:</B> Use OpenHotel Settings<BR>----------------------------------------------<BR>">
					<CFELSE>
						<CFSET body = "#body#<B>Min Occupancy:</B> #FORM['gds#a#_minocc']#<BR>">
						<CFSET body = "#body#<B>Max Occupancy:</B> #FORM['gds#a#_maxocc']#<BR>----------------------------------------------<BR>">
					</CFIF>

					<CFSET count = count + 1>
				</CFIF>
			</CFLOOP>

			<!--- send the email --->
			<CFINVOKE COMPONENT="components.mailer.main" METHOD="sendEmail" TO="#to#" CC="#cc#" FROM="#from#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#subject#" BODY="#body#" />

			<CFCATCH TYPE="Any">
				<CFSET DoCommit   = "No">
				<CFSET definition = "There was an error preparing the email for this step. Please call Alternate Image Support for assistance.">
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<CFSET FORM.definition = definition>

	<CFRETURN DoCommit>

</CFFUNCTION>

<CFFUNCTION NAME="step4_submit" ACCESS="private">

	<!--- initialize variables --->
	<CFSET var DoCommit   = "Yes">
	<CFSET var definition = "You have successfully completed Step 4!">
	<CFSET var today      = DateFormat(Now(),"YYYY-MM-DD")>

	<!--- mail variables --->
	<CFSET var to      		  = "val@alternateimage.com">
	<CFSET var from    		  = "gds@alternateimage.com">
	<CFSET var cc             = "john@alternateimage.com,cindy@alternateimage.com,mic@alternateimage.com">
	<CFSET var subject 		  = "">
	<CFSET var body    		  = "">
	<CFSET var fieldList 	  = "">
	<CFSET var fieldTitleList = "">
	<CFSET var formItem		  = "">
	<CFSET var x			  = 1>

	<!--- initialize loop counters --->
	<CFSET var a = "">

	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.attractionsCount","numeric",0);

		param("FORM.name","string","");
		param("FORM.domain","string","");
		param("FORM.cancelationrule","string","");
		param("FORM.guaranteerule","string","");
		param("FORM.commissionpolicy","string","N/A");
		param("FORM.dining","string","N/A");
		param("FORM.directions","string","N/A");
		param("FORM.facilities","string","N/A");
		param("FORM.staypolicies","string","N/A");
		param("FORM.location","string","N/A");
		param("FORM.marketing","string","N/A");
		param("FORM.attractions","string","N/A");
		param("FORM.corporate","string","N/A");
		param("FORM.parking","string","N/A");
		param("FORM.policy","string","N/A");
		param("FORM.property","string","N/A");
		param("FORM.awards","string","N/A");
		param("FORM.recreation","string","N/A");
		param("FORM.rfp","string","N/A");
		param("FORM.safety","string","N/A");
		param("FORM.specials","string","N/A");
		param("FORM.transportation","string","N/A");
	</CFSCRIPT>	

	<!--- these are parallel lists so be careful if you update or change --->
	<CFSET fieldList 	  = "cancelationrule,commissionpolicy,dining,directions,facilities,staypolicies,guaranteerule,location,marketing,corporate,parking,policy,property,awards,recreation,rfp,safety,specials,transportation">
	<CFSET fieldTitleList = "Cancelation Rule,Commission Policy,Dining,Directions,Facilities,Frequent Stay Policies,Guarantee Rule,Location,Marketing Text,Nearby Corporate Locations,Parking,Policies Description,Property Description,Ratings/Awards,Recreation,RFP/Meeting Information,Safety,Special Rate Programs,Transportation">

	<!--- VALIDATE FORM --->

	<CFIF validateCaptcha() IS false>
		<CFSET DoCommit   = "No">
		<CFSET definition = "Invalid security code.">
	</CFIF>

	<CFIF Trim(FORM.name) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the property's hotel name.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.domain) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter the property's current or future domain.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.guaranteerule) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your hotel's GDS guarantee rule.">
	</CFIF>

	<CFIF DoCommit EQ "Yes" AND Trim(FORM.cancelationrule) EQ "">
		<CFSET DoCommit   = "No">
		<CFSET definition = "You must enter your hotel's GDS cancelation rule.">
	</CFIF>

	<CFIF DoCommit EQ "Yes">
		<CFLOOP FROM="1" TO="#attractionsCount#" STEP="1" INDEX="a">
			<CFIF isDefined("FORM.attractions_desc_#a#") EQ "Yes">
				<CFIF Trim(FORM["attractions_desc_#a#"]) EQ "" OR Trim(FORM["attractions_dist_#a#"]) EQ "">
					<CFSET DoCommit   = "No">
					<CFSET definition = "All attractions fields are required. Please put 'N/A' on fields that are not applicable.">
					<CFBREAK>
				</CFIF>
			</CFIF>
		</CFLOOP>
	</CFIF>

	<!--- put the mail together, send it out --->
	<CFIF DoCommit EQ "Yes">
		<CFTRY>
			<CFSET subject = "GDS Setup - #FORM.domain# - Step 4 (#today#)">

			<CFSET body = "<DIV ALIGN='center' STYLE='margin:5px;margin-bottom:20px;'><B>GDS Setup - Step 4</B><BR>#FORM.name# (#FORM.domain#)<BR><B STYLE='font-size:10px;'>Submitted #today# from IP '#CGI.remote_host#'</B></DIV>">
			<CFSET body = "#body#<B>Hotel Name:</B> #FORM.name#<BR>">
			<CFSET body = "#body#<B>Hotel Domain:</B> #FORM.domain#<BR>">
			<CFSET body = "#body#----------------------------------------------<BR>">

			<CFLOOP LIST="#fieldTitleList#" DELIMITERS="," INDEX="a">
				<CFSET formItem = ListGetAt(fieldList,x)>
				<CFSET body = "#body#<B>#Trim(a)#</B><BR>">
				<CFSET body = "#body##Trim(FORM[formItem])#<BR><BR>">
				<CFSET x = x + 1>
			</CFLOOP>

			<CFSET body = "#body#<B>Nearby Attractions:</B><BR>">
			<CFLOOP FROM="1" TO="#attractionsCount#" STEP="1" INDEX="a">
				<CFIF isDefined("FORM.attractions_desc_#a#") EQ "Yes">
					<CFSET body = "#body##FORM['attractions_desc_#a#']# - #FORM['attractions_dist_#a#']# #LCase(FORM['attractions_unit_#a#'])# #UCase(FORM['attractions_dir_#a#'])#<BR>">
				</CFIF>
			</CFLOOP>

			<!--- send the email --->
			<CFINVOKE COMPONENT="components.mailer.main" METHOD="sendEmail" TO="#to#" CC="#cc#" FROM="#from#" FRIENDLY="#REQUEST.site_name#" SUBJECT="#subject#" BODY="#body#" />

			<CFCATCH TYPE="Any">
				<CFSET DoCommit   = "No">
				<CFSET definition = "There was an error preparing the email for this step. Please call Alternate Image Support for assistance.">
			</CFCATCH>
		</CFTRY>
	</CFIF>

	<CFSET FORM.definition = definition>
			
	<CFRETURN DoCommit>
	
</CFFUNCTION>

<!--- ----------------- --->
<!---  Helper Functions --->
<!--- ----------------- --->

<!--- returns an array of strings for the step template paths --->
<CFFUNCTION NAME="getSteps" ACCESS="private" RETURNTYPE="array">

	<!--- initialize variables --->
	<CFSET var result = ArrayNew(1)>

	<!--- define template paths in array --->
	<CFSET result[1] = "setup/gds_step1_form.cfm">
	<CFSET result[2] = "setup/gds_step2_form.cfm">
	<CFSET result[3] = "setup/gds_step3_form.cfm">
	<CFSET result[4] = "setup/gds_step4_form.cfm">
	<CFSET result[5] = "setup/gds_step5_form.cfm">

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

</CFCOMPONENT>