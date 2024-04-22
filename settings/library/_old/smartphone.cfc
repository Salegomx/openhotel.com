<CFCOMPONENT EXTENDS="base">

<CFIF isDefined("localObj") EQ "No">
	<CFSET localObj = CreateObject("component", "local")>
</CFIF>

<!--- ----------------------- --->
<!---   Dashboard Functions   --->
<!--- ----------------------- --->

<!--- Shows The approval form. --->
<CFFUNCTION NAME="approval">

	<CFARGUMENT NAME="template" TYPE="string" REQUIRED="No" DEFAULT="smartphone/smartphone_approval.cfm" />
	
	<!--- initialize variables --->
	<CFSET var fileResults = "">
	<CFSET var DoCommit    = "Yes">
	<CFSET var app         = StructNew()>
	
	<CFSCRIPT>param("URL.app","string","");</CFSCRIPT>
	
	<CFIF Trim(URL.app) EQ "">
		<CFSET DoCommit = "No">
	</CFIF>
	
	<CFIF DoCommit EQ "Yes">
		<CFTRY>
			<CFIF fileExists("#REQUEST.domainRoot#/html/templates/smartphone/_apps/#LCase(URL.app)#.cfm")>
				<CFINCLUDE TEMPLATE="#REQUEST.templates#/smartphone/_apps/#LCase(URL.app)#.cfm">
			<CFELSE>
				<CFSET DoCommit = "No">
			</CFIF>
	
			<CFCATCH TYPE="ANY">
				<CFDUMP VAR="#CFCATCH#">
			</CFCATCH>
		</CFTRY>
	</CFIF>
	
	<CFIF DoCommit EQ "Yes">
		<CFINCLUDE TEMPLATE="#REQUEST.templates#/#ARGUMENTS.template#">
	<CFELSE>
		<CF_DEFINITION TEXT="We could not find the mobile app you have requeted.">
	</CFIF>

</CFFUNCTION>

<!--- submit process --->
<CFFUNCTION NAME="submit">
	
	<!--- initialize variables --->
	<CFSET var message    = "">
	<CFSET var DoCommit   = "Yes">
	<CFSET var definition = "The App Questionaiore was successfully submitted. Your App will now be submitted for final approval to the app store.">
	<CFSET var app        = StructNew()>
	
	<!--- param variables --->
	<CFSCRIPT>
		param("FORM.app","string","");
		param("FORM.name","string","");
		param("FORM.keywords","string","");
		param("FORM.descriptions","string","");
		param("FORM.comments","string","");
	</CFSCRIPT>
	
	<!--- get app settings --->
	<CFIF fileExists("#REQUEST.domainRoot#/html/templates/smartphone/_apps/#LCase(FORM.app)#.cfm")>
		<CFINCLUDE TEMPLATE="#REQUEST.templates#/smartphone/_apps/#LCase(FORM.app)#.cfm">
	<CFELSE>
		<CFSET DoCommit   = "No">
		<CFSET definition = "We could not find the App you requested.">
	</CFIF>
	
	<CFIF DoCommit EQ "Yes">
		<CFSAVECONTENT VARIABLE="message">
			<CFOUTPUT>
				<strong>iPhone Questionaire:</strong>  #app.hotel#
				<BR><BR>
				<strong>App Name:</strong> #app.name#<BR>
				<strong>App Keywords:</strong> #app.keywords#<BR>
				<strong>iPhone:</strong> #app.iphone#<BR>
				<strong>Android:</strong> #app.android#<BR><BR>
				<strong>App Descciption:</strong><BR> #app.description#
				<BR><BR>
			</CFOUTPUT>
		</CFSAVECONTENT>
		
		<CFMAIL TO="jeff@alternateimage.com" FROM="iphone@openhotel.com" SUBJECT="iPhone Acceptance Form" TYPE="HTML" SPOOLENABLE="false">
			#message#
		</CFMAIL>
	</CFIF>
	
	<CF_DEFINITION TEXT="#definition#">

</CFFUNCTION>

</CFCOMPONENT>