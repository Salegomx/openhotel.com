<!-- secure the template -->
<CF_SECURETEMPLATE>

<CFINCLUDE TEMPLATE="#REQUEST.templates#/pricing/pricing_form_config.cfm">

<FORM NAME="pricingForm" ID="pricingForm" METHOD="POST" ACTION="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/pricing_hidden.cfm/new/1" AUTOCOMPLETE="off" <CFIF CGI.script_name EQ "/pricing_hidden.cfm">ONSUBMIT="return false;"</CFIF>>
	<DIV STYLE="background:#E9F8FE; border:1px solid #286FC8;padding:20px;border-radius:4px">
		<SPAN CLASS="subheadM" STYLE="font-size:32px; color:#286FC8;;">START HERE <i class="fas fa-arrow-down"></i></SPAN>
		<DIV STYLE="font-weight: bold; color:#000;">
			<I CLASS="fas fa-bed" STYLE="color:rgba(0,0,0,.3); margin-right: 5px;"></I> Enter Your Number of Rooms
			<INPUT TYPE="text" CLASS="numberOfRooms" NAME="num_rooms" ID="num_rooms" DATA-FOCUSABLE="1" DATA-BLURDEFAULT="Number of Rooms" ONKEYUP="return requireNumeric(this);" VALUE="<CFOUTPUT>#thisNumRooms#</CFOUTPUT>">
		</DIV>
		<DIV STYLE="padding-left:25px;">
			<INPUT TYPE="submit" CLASS="pricingButton" NAME="submit_btn" ID="submit_btn" VALUE="Calculate Pricing" <CFIF CGI.script_name EQ "/pricing_hidden.cfm">ONCLICK="myCalcManager.submit();"</CFIF> STYLE="float:none!important;margin:0px 0px 20px!important;width:calc(100% - 20px)!important;letter-spacing:normal;text-transform:none;">
		</DIV>
		<DIV STYLE="margin-top:20px; padding-left:25px;">
			<CFIF CGI.script_name EQ "/pricing.cfm">
				<DIV ID="dispBlock" STYLE="text-transform:none!important;letter-spacing:normal!important;font-size:14px;line-height:20px;margin:0px;">* These are monthly charges based on <B ID="dispNumRooms"><CFOUTPUT>#thisNumRooms#</CFOUTPUT></B> room<SPAN ID="dispRoomsS"><CFIF thisNumRooms NEQ 1>s</CFIF></SPAN></DIV>
			</CFIF>
			<DIV STYLE="text-transform:none!important;letter-spacing:normal!important;font-size:14px;line-height:20px;margin:0px;">* If you have a hostel, RV park or multiple properties, please contact us for pricing.</DIV>
		</DIV>
	</DIV>
</FORM>