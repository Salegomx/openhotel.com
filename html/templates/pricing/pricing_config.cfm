<!--- SECURE THE TEMPLATE --->
<CF_SECURETEMPLATE>

<!--- FONT AWESOME --->
<LINK REL="stylesheet" TYPE="text/css" MEDIA="screen" HREF="/templates/general/js/fontawesome/css/fontawesome.css">
<SCRIPT SRC="/templates/general/js/fontawesome/js/all.js"></SCRIPT>

<!--- STYLES --->
<LINK REL="stylesheet" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/templates/pricing/pricing.css">
<LINK REL="stylesheet" MEDIA="(min-width: 1160px)" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/templates/pricing/pricingDesktop.css">

<!--- CF VARIABLES --->
<CFSCRIPT>param("FORM.num_rooms","numeric",0);</CFSCRIPT>
<CFSET thisNumRooms = "">

<!--- PRICING CALCULATOR --->
<SCRIPT TYPE="text/javascript">
	 function calcManager() {
		this.plans    = [ "basic","avg","works" ];
		this.planData = {
			"basic": {
				channelmanager: false,
				yield: false
			},
			"avg": {
				channelmanager: true,
				yield: false
			},
			"works": {
				channelmanager: true,
				yield: true
			}
		};

		this.start = function() { myCalcManager.calculate(); };

		this.submit = function() {
			var formtag = jQuery("#pricingForm");
			var thisRms = parseInt(jQuery("#num_rooms",formtag).val());
			if(isNaN(thisRms)) thisRms = 0;

			jQuery(".pricingVal").html("Calculating...");
			jQuery("#calcPlan_multi").html("Call for Pricing");
			jQuery("#dispNumRooms",formtag).html(thisRms);

			if(thisRms !== 1) {
				jQuery("#dispRoomsS",formtag).html("s");
			} else {
				jQuery("#dispRoomsS",formtag).empty();
			}

			<!--- For mobile devices --->
			if (window.innerWidth < 1160) {
				setTimeout(myCalcManager.scrollToPlans, 100);
			}

			setTimeout(myCalcManager.calculate, 500);
		};

		this.calculate = function() {
			var formtag = jQuery("#pricingForm");
			var thisRms = parseInt(jQuery("#num_rooms",formtag).val());
			if(isNaN(thisRms)) thisRms = 0;

			if(thisRms == 0) {
				jQuery(".pricingVal").html("&nbsp;");
				jQuery("#dispBlock",formtag).hide();
				return false;
			} else {
				jQuery(".pricingVal").html("Calculating...");
				jQuery("#calcPlan_multi").html("Call for Pricing");
				jQuery("#dispBlock",formtag).show();
				jQuery("#dispNumRooms",formtag).html(thisRms);

				if(thisRms != 1) {
					jQuery("#dispRoomsS",formtag).html("s");
				} else {
					jQuery("#dispRoomsS",formtag).empty();
				}
			}

			for(var p = 0; p < myCalcManager.plans.length; p++) {
				var thisPlan     = myCalcManager.plans[p];
				var thisData     = myCalcManager.planData[thisPlan];
				var finalPrice   = 0;
				var thisRmAmt    = (5 * thisRms); <!--- $5 per room --->
				var thisCMAmt    = 0;
				var thisYieldAmt = 0;

				if(thisRmAmt < 60) thisRmAmt = 60; <!--- Minimum for PMS is $60 --->

				if(thisData.channelmanager) {
					thisCMAmt = 2 * thisRms; <!--- $2 per room --->
					if(thisCMAmt < 40) thisCMAmt = 40; <!--- Minimum is $40 --->
				}

				if(thisData.yield){
					thisYieldAmt = thisRms; <!--- $1 per room --->
					if(thisYieldAmt < 50) thisYieldAmt = 50; <!--- Minimum is $50 --->
				}

				finalPrice = thisRmAmt + thisCMAmt + thisYieldAmt;

				jQuery("#calcPlan_"+thisPlan).html(moneyFormat(finalPrice,"textfull1c").replace(".00","")+" / month");
			}
		};

		this.scrollToPlans = function() {
			document.querySelector('#scrollHere').scrollIntoView({
				behavior: 'smooth', block: 'start'
			})
		}

		this.checkMaxLength = function (object) {
			if (object.value.length > object.maxLength) {
				object.value = object.value.slice(0, object.maxLength);
			}
		}
	}

	myCalcManager = new calcManager();

	jQuery(document).ready(function() { myCalcManager.start(); });
</SCRIPT>