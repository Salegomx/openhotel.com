<!--- secure the template --->
<CF_SECURETEMPLATE>
<STYLE>:root{--oh-blue: #0E3060;--oh-grey: #7B8898;--oh-green: #359A3E;--oh-white: #FFFFFF}#media{margin:50px 0 0 0}#media .mediaWrapper .mediaSection{margin:20px auto;max-width:1200px;min-height:70vh}#media .mediaWrapper .mediaSection .mediaTitle{font-family:"Arial",sans-serif;font-size:40px;color:var(--oh-blue);margin:0 0 20px 0;max-width:340px}#media .mediaWrapper .mediaSection p.mediaText{color:var(--oh-blue);font-size:24px;margin:5px 0}#media .mediaWrapper .mediaSection p.mediaTextSmall{color:var(--oh-grey);font-size:16px;margin:10px 0}#media .mediaWrapper .mediaSection .ohButton{background:var(--oh-green);border-radius:5px;color:var(--oh-white);padding:10px 20px;margin:40px 0 0 0;max-width:170px;display:flex;justify-content:center;align-items:center}#media .mediaWrapper .mediaSection .ohButton img{width:15px;margin:0 0 0 10px}#media .mediaWrapper .mediaSection.full{max-width:100%}#media .mediaWrapper #mediaDownload{display:flex;flex-flow:row nowrap;justify-content:center;align-items:center}@media(min-width: 768px){#media .mediaWrapper #mediaDownload .mediaDownloadLeft,#media .mediaWrapper #mediaDownload .mediaDownloadRight{width:50%}}@media(max-width: 768px){#media .mediaWrapper #mediaDownload .mediaDownloadLeft,#media .mediaWrapper #mediaDownload .mediaDownloadRight{width:100%}}#media .mediaWrapper #mediaDownload .mediaDownloadRight .mediaPapers{text-align:center}#media .mediaWrapper #mediaDownload .mediaDownloadRight .mediaPapers img{width:100%;max-width:440px}#media .mediaWrapper #mediaDownload .mediaDownloadRight .mediaPapers .btnPlusDownload{margin:-40px;text-align:right;width:95%}#media .mediaWrapper #mediaDownload .mediaDownloadRight .mediaPapers .btnPlusDownload img{max-width:50px}#media .mediaWrapper .mediaLogos{display:flex;flex-flow:row wrap;justify-content:start;align-items:center;padding:20px}#media .mediaWrapper .mediaLogos .mediaLogo{background:var(--oh-grey);height:150px;width:150px;margin:10px;border-radius:5px;text-align:right}#media .mediaWrapper .mediaLogos .mediaLogo .logo{display:flex;flex-flow:column;align-items:center;justify-content:center;width:150px;height:140px}#media .mediaWrapper .mediaLogos .mediaLogo .logo img{max-width:120px}#media .mediaWrapper .mediaLogos .mediaLogo a img.downloadLogoIcon{margin:-25px;position:absolute}#media .mediaWrapper #mediaResources{min-height:auto;margin:0 auto 80px}#media .mediaWrapper #mediaAwards{min-height:auto;margin:0 auto}#media .mediaWrapper #mediaAwards .mediaTitle{margin:0 auto 40px;max-width:1200px}#media .mediaWrapper #mediaAwards .mediaAwardsBox{padding:20px 0;width:100%}#media .mediaWrapper #mediaAwards .mediaAwardsBox .mediaAwardsImages{display:flex;flex-flow:row wrap;align-items:center;justify-content:center;min-height:200px;margin:0 auto;max-width:1200px}#media .mediaWrapper #mediaAwards .mediaAwardsBox .mediaAwardsImages .mediaAwardImg{margin:20px}#media .mediaWrapper #mediaAwards .mediaAwardsBox .mediaAwardsImages .mediaAwardImg img{max-width:320px}#media .mediaWrapper #mediaAwards .mediaAwardsBox .mediaAwardsImages .mediaAwardImg img.expediaImg{margin:0 40px;max-width:270px}#media .mediaWrapper #mediaNews .mediaItemTxt h3{font-weight:normal}#media .mediaWrapper .mediaItems{display:flex;flex-flow:row wrap;align-items:start;justify-content:center}#media .mediaWrapper .mediaItems .mediaItem{margin:20px}#media .mediaWrapper .mediaItems .mediaItem .mediaItemImg{background:var(--oh-grey);border-radius:5px;width:340px;height:220px;position:relative}#media .mediaWrapper .mediaItems .mediaItem .mediaItemImg .plusNews{position:absolute;bottom:10px;right:10px;max-width:25px;transition:all .5s ease}#media .mediaWrapper .mediaItems .mediaItem .mediaItemImg .plusNews:hover{opacity:.7}#media .mediaWrapper .mediaItems .mediaItem .mediaItemTxt{display:flex;flex-flow:row nowrap;align-items:center;justify-content:space-between}#media .mediaWrapper .mediaItems .mediaItem .mediaItemTxt a{font-size:14px;font-weight:normal}
</STYLE>
<DIV ID="media">
	<DIV CLASS="mediaWrapper">

		<DIV ID="mediaDownload" CLASS="mediaSection">
			<DIV CLASS="mediaDownloadLeft">
				<H1 CLASS="mediaTitle">Brand assets<BR>and Press Kit</H1>
				<P CLASS="mediaText">Feel free to download our kit. If you want to create something with our name on it. </P>
				<A CLASS="ohButton" HREF="/images/kit/openhotel_kit_logos.zip" DOWNLOAD REL="noopener noreferrer" target="_blank">Download Kit <IMG SRC="/images/file-arrow-download.png" width="15"/></A>
			</DIV>
			<DIV CLASS="mediaDownloadRight">
				<DIV CLASS="mediaPapers">
					<IMG SRC="/images/media_papers_01.png" ALT="Open Hotel">
					<DIV CLASS="btnPlusDownload">
						<A HREF="/images/kit/openhotel_kit_logos.zip" DOWNLOAD REL="noopener noreferrer" target="_blank">
							<IMG SRC="/images/circle-plus-solid-green.png" ALT="Download Open Hotel Kit">
						</A>
					</DIV>
				</DIV>
			</DIV>
		</DIV>

		<!--- DIV ID="mediaResources" CLASS="mediaBlocksBox mediaSection">
			<H1 CLASS="mediaTitle">Media Resources</h1>
			<DIV CLASS="mediaItems">
				<DIV CLASS="mediaItem">
					<DIV CLASS="mediaItemImg"></DIV>
					<DIV CLASS="mediaItemTxt">
						<H3>Title</H3>
						<A HREF="/images/file-arrow-download.png" DOWNLOAD REL="noopener noreferrer" target="_blank">+ Download photos</A>
					</DIV>
				</DIV>
				<DIV CLASS="mediaItem">
					<DIV CLASS="mediaItemImg"></DIV>
					<DIV CLASS="mediaItemTxt">
						<H3>Title</H3>
						<A HREF="/images/file-arrow-download.png" DOWNLOAD REL="noopener noreferrer" target="_blank">+ Download photos</A>
					</DIV>
				</DIV>
				<DIV CLASS="mediaItem">
					<DIV CLASS="mediaItemImg"></DIV>
					<DIV CLASS="mediaItemTxt">
						<H3>Title</H3>
						<A HREF="/images/file-arrow-download.png" DOWNLOAD REL="noopener noreferrer" target="_blank">+ Download photos</A>
					</DIV>
				</DIV>
			</DIV>
		</DIV --->

		<DIV ID="mediaAwards" CLASS="mediaSection full">
			<H1 CLASS="mediaTitle">Awards Badges</H1>
			<DIV CLASS="mediaAwardsBox">
				<DIV CLASS="mediaAwardsImages">
					<DIV CLASS="mediaAwardImg">
						<IMG CLASS="expediaImg" SRC="https://openhotel.com/images/awards/expedia_2022.png">
					</DIV>
					<DIV CLASS="mediaAwardImg">
						<IMG CLASS="expediaImg" SRC="https://openhotel.com/images/awards/expedia_2021.png">
					</DIV>
				</DIV>
				<DIV CLASS="mediaAwardsImages">
					<DIV CLASS="mediaAwardImg">
						<IMG SRC="https://openhotel.com/images/awards/booking_2019_blue.png" STYLE="max-width:340px;">
					</DIV>
					<DIV CLASS="mediaAwardImg">
						<IMG SRC="https://openhotel.com/images/awards/booking_2020.png" STYLE="max-width:205px;">
					</DIV>
					<DIV CLASS="mediaAwardImg">
						<IMG SRC="https://openhotel.com/images/awards/booking_2021.png" STYLE="max-width:205px;">
					</DIV>
				</DIV>
			</DIV>
		</DIV>

		<!--- DIV ID="mediaNews" CLASS="mediaBlocksBox mediaSection"">
			<H1 CLASS="mediaTitle">News</h1>
			<DIV CLASS="mediaItems">
				<DIV CLASS="mediaItem">
					<DIV CLASS="mediaItemImg">
						<A HREF="#" target="_blank">
							<IMG CLASS="plusNews" src="/images/circle-plus-solid.png" ALT="Open Hotel News">
						</A>
					</DIV>
					<DIV CLASS="mediaItemTxt">
						<H3>Title</H3>
					</DIV>
				</DIV>
				<DIV CLASS="mediaItem">
					<DIV CLASS="mediaItemImg">
						<A HREF="#" target="_blank">
							<IMG CLASS="plusNews" src="/images/circle-plus-solid.png" ALT="Open Hotel News">
						</A>
					</DIV>
					<DIV CLASS="mediaItemTxt">
						<H3>Title</H3>
					</DIV>
				</DIV>
				<DIV CLASS="mediaItem">
					<DIV CLASS="mediaItemImg">
						<A HREF="#" target="_blank">
							<IMG CLASS="plusNews" src="/images/circle-plus-solid.png" ALT="Open Hotel News">
						</A>
					</DIV>
					<DIV CLASS="mediaItemTxt">
						<H3>Title</H3>
					</DIV>
				</DIV>
				<DIV CLASS="mediaItem">
					<DIV CLASS="mediaItemImg">
						<A HREF="#" target="_blank">
							<IMG CLASS="plusNews" src="/images/circle-plus-solid.png" ALT="Open Hotel News">
						</A>
					</DIV>
					<DIV CLASS="mediaItemTxt">
						<H3>Title</H3>
					</DIV>
				</DIV>
				<DIV CLASS="mediaItem">
					<DIV CLASS="mediaItemImg">
						<A HREF="#" target="_blank">
							<IMG CLASS="plusNews" src="/images/circle-plus-solid.png" ALT="Open Hotel News">
						</A>
					</DIV>
					<DIV CLASS="mediaItemTxt">
						<H3>Title</H3>
					</DIV>
				</DIV>
				<DIV CLASS="mediaItem">
					<DIV CLASS="mediaItemImg">
						<A HREF="#" target="_blank">
							<IMG CLASS="plusNews" src="/images/circle-plus-solid.png" ALT="Open Hotel News">
						</A>
					</DIV>
					<DIV CLASS="mediaItemTxt">
						<H3>Title</H3>
					</DIV>
				</DIV>
			</DIV>
		</DIV --->

	</DIV>
</DIV>