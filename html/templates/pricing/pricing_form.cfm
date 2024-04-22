<!--- secure the template --->
<CF_SECURETEMPLATE>

<DIV ID="pricingFormContainer">
	<FORM NAME="pricingForm" ID="pricingForm" METHOD="POST" ACTION="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/pricing.cfm/new/1" AUTOCOMPLETE="off" <CFIF CGI.script_name EQ "/pricing.cfm">ONSUBMIT="return false;"</CFIF>>

		<H3 ID="startHere" CLASS="heading" DATA-SIZE="5">START HERE <i class="fas fa-arrow-down"></i></H3>

		<LABEL FOR="num_rooms">
			<SPAN ID="numberOfRoomsTitle"><SPAN CLASS="fas fa-bed" STYLE="color:rgba(0,0,0,.3)<!--- MUST BE INLINE FOR FA --->"></SPAN> Enter your number of rooms</SPAN>
			<INPUT TYPE="number" CLASS="num_rooms" NAME="num_rooms" ID="num_rooms" PLACEHOLDER="Number of Rooms" MAXLENGTH="4" ONINPUT="myCalcManager.checkMaxLength(this);" VALUE="<CFOUTPUT>#thisNumRooms#</CFOUTPUT>">
		</LABEL>

		<INPUT TYPE="submit" CLASS="button pricingButton" DATA-COLOR="pink" NAME="submit_btn" ID="submit_btn" VALUE="Calculate Pricing" <CFIF CGI.script_name EQ "/pricing.cfm">ONCLICK="myCalcManager.submit();"</CFIF>><BR>

		<CFIF CGI.script_name EQ "/pricing.cfm">
			<SPAN ID="dispBlock" CLASS="pricingFormInfo" DATA-SIZE="1">* Monthly charges based on <B ID="dispNumRooms"><CFOUTPUT>#thisNumRooms#</CFOUTPUT></B> room<SPAN ID="dispRoomsS"><CFIF thisNumRooms NEQ 1>s</CFIF></SPAN></SPAN>
		</CFIF>

		<SPAN CLASS="pricingFormInfo" DATA-SIZE="1">* For alternative accommodations please contact us for pricing.</SPAN>

	</FORM>
</DIV>