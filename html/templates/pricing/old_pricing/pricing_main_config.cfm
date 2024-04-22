<!-- secure the template -->
<CF_SECURETEMPLATE>

<LINK REL="stylesheet" HREF="//<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>/templates/pricing/styles.css">

<!--- param variables --->
<CFSCRIPT>param("FORM.num_rooms","numeric",0);</CFSCRIPT>

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
			jQuery("#dispNumRooms",formtag).html(thisRms);

			if(thisRms != 1) {
				jQuery("#dispRoomsS",formtag).html("s");
			} else {
				jQuery("#dispRoomsS",formtag).empty();
			}

			setTimeout(myCalcManager.calculate,500);
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
				var thisRmAmt    = (5 * thisRms); // $4 per room
				var thisCMAmt    = 0;
				var thisYieldAmt = 0;

				if(thisRmAmt < 60) thisRmAmt = 60; // we do not go under 60

				// cm is tiered by num rooms
				if(thisData.channelmanager) {
					if(thisRms <= 10) {
						thisCMAmt = 35;
					} else if(thisRms >= 11 && thisRms <= 20) {
						thisCMAmt = 40;
					} else if(thisRms >= 21 && thisRms <= 40) {
						thisCMAmt = 50;
					} else if(thisRms >= 41 && thisRms <= 60) {
						thisCMAmt = 55;
					} else if(thisRms >= 61 && thisRms <= 80) {
						thisCMAmt = 65;
					} else if(thisRms >= 81 && thisRms <= 100) {
						thisCMAmt = 70;
					} else if(thisRms >= 101 && thisRms <= 150) {
						thisCMAmt = 90;
					} else if(thisRms >= 151 && thisRms <= 200) {
						thisCMAmt = 105;
					} else if(thisRms >= 201 && thisRms <= 300) {
						thisCMAmt = 140;
					} else if(thisRms >= 301) {
						thisCMAmt = 200;
					}
				}

				// yield is fixed
				if(thisData.yield) thisYieldAmt = 50;

				finalPrice = thisRmAmt + thisCMAmt + thisYieldAmt;

				jQuery("#calcPlan_"+thisPlan).html(moneyFormat(finalPrice,"textfull1c").replace(".00","")+" / month");
			}
		};
	}

	myCalcManager = new calcManager();

	jQuery(document).ready(function() { myCalcManager.start(); });
</SCRIPT>