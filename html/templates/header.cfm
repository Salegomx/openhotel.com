 <!--- secure the template --->
<CF_SECURETEMPLATE>

<!DOCTYPE HTML>
<HTML XMLNS:PRINTTAG="<CFOUTPUT>#REQUEST.domain#</CFOUTPUT>" LANG="en">
<HEAD>
	<META CHARSET="UTF-8">
	<META NAME="viewport" CONTENT="width=device-width, initial-scale=1.0">
 	<CFSCRIPT>loadDocHead();</CFSCRIPT>
	<LINK REL="apple-touch-icon" HREF="/favicon.ico">
	<LINK REL="icon shortcut" HREF="/favicon.ico" TYPE="image/x-icon">
	<LINK REL="stylesheet" TYPE="text/css" MEDIA="screen" HREF="/templates/styles.css">
	<LINK REL="stylesheet" TYPE="text/css" MEDIA="screen" HREF="/templates/openhotelIcons.css">
	<SCRIPT SRC="/templates/scripts.js"></SCRIPT>
 	<CFSET gradientColor = ListFirstRandom("pink,blue,purple")>
	<CFSET waveOptions = "1,2,3,4,5,6">

	<!--- HERO CAROUSEL --->
	<LINK REL="stylesheet" TYPE="text/css" MEDIA="screen" HREF="/templates/general/js/carousel/slick.css">
	<SCRIPT TYPE="text/javascript" SRC="/templates/general/js/carousel/slick.js"></SCRIPT>

	 <!--- OVERRIDES FOR BLOG--->
	 <CFIF CGI.script_name CONTAINS "/blog/">
		 <LINK REL="stylesheet" TYPE="text/css" HREF="/templates/blog.css">
	 </CFIF>
	 <CFIF CGI.script_name CONTAINS "/post.cfm">
		 <LINK REL="stylesheet" TYPE="text/css" HREF="/templates/post.css">
	 </CFIF>
</HEAD>
<BODY ID="ohBody">
	<A HREF="#mainContent" CLASS="sr-only"><SPAN TITLE="Skip to content">Skip to content</SPAN></A> <!--- Skip to content for screen readers --->

	<!--- HEADER --->
	<HEADER ID="mainHeader">
		<DIV CLASS="innerHeader">
			<!--- HEADER NAVIGATION --->
			<CFINCLUDE TEMPLATE="#REQUEST.templates#/menu_main.cfm">
		</DIV>
	</HEADER>
		
	<MAIN ID="mainContent">