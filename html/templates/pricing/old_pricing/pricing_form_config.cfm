<!-- secure the template -->
<CF_SECURETEMPLATE>

<STYLE TYPE="text/css" MEDIA="screen">
    .numberOfRooms {border:1px solid #ccc; padding: 10px; margin: 10px 0px 0px 25px; font-size: 16px;   width: calc(100% - 50px); box-sizing: border-box;}
    .subheadM {font-size: 16px; text-transform: uppercase; font-weight: bold; letter-spacing: 1px;}
    .pricingButton {float:none!important;background: #2dbf24; color:#fff; display: block; width:100%; box-sizing: border-box; padding: 5px 20px; border-radius: 3px; text-decoration: none; margin: 20px 0px 20px;}
    .pricingButton:hover {background: #359A3E; transition: all ease .2s;}

    .pricingButtonTwo {float:none!important;text-align:center; background: #286FC8; color:#fff; display: block; width:100%; box-sizing: border-box; padding: 5px 20px; border-radius: 3px; text-decoration: none; margin: 20px 0px 20px;}
    .pricingButtonTwo:hover {background: #359A3E; transition: all ease .2s; color:#FFFFFF;}
</STYLE>

<CFSET thisNumRooms = "">