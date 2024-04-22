function homeManager(){

	this.init = function() {
		myHomeManager.initCarousel();
		myHomeManager.initWindowScroll();
		myHomeManager.initTabSwitcher();
		myHomeManager.initLighbox();
		myHomeManager.initScrollToTop();
	};

	// HOME CARROUSEL
	this.initCarousel = function() {
		jQuery("#carousel").slick({
			dots: false,
			infinite: true,
			speed: 500,
			slidesToShow: 1,
			adaptiveHeight: false,
			useCSS: true,
			autoplay: true,
			autoplaySpeed: 500000,
			nextArrow: '<button TYPE="button" data-role="none" CLASS="slick-next" aria-label="Next" tabindex="0" role="button"></button>'
		});
	};

	// BLURRED HEADER
	this.initWindowScroll = function() {
		jQuery(window).scroll(function() {
			let scroll = jQuery(window).scrollTop();

			if (scroll >= 50) {
				jQuery("#mainHeader").addClass("blurry");
				if (scroll >= 500) {
					jQuery("#backToTop").removeClass("invisible");
				}
			} else {
				jQuery("#mainHeader").removeClass("blurry");
				jQuery("#backToTop").addClass("invisible");
			}
		});
	};

	// TABS SWTICH
	this.initTabSwitcher = function() {
		let tabsGrid = document.querySelectorAll('.tabsGrid');
		if (!tabsGrid) return;

		tabsGrid.forEach((element) => {
			let tabsContainer = element.querySelector('.tabsContainer');
			let tabButtons = tabsContainer.querySelectorAll('li');
			let tabPanelsContainer = element.querySelector('.tabPanelsContainer');
			let tabPanels = tabPanelsContainer.querySelectorAll('.tabPanel');

			tabButtons.forEach((tab, index) => {
				if (index === 0) {
					tab.setAttribute('aria-selected', 'true');
				} else {
					tabPanels[index].setAttribute('hidden', '');
				}
			});

			tabsContainer.addEventListener('click', (e) => {
				e.preventDefault();
				let clickedLi = e.target.closest('li');
				if (!clickedLi) return;

				let clickedTab = clickedLi.querySelector('a');
				let activePanel = document.querySelector(clickedTab.getAttribute('href'));

				tabButtons.forEach((button) => {
					button.setAttribute('aria-selected', 'false');
				})

				tabPanels.forEach((panel) => {
					panel.setAttribute('hidden', '');
				});

				activePanel.removeAttribute('hidden');
				clickedLi.setAttribute('aria-selected', 'true');
			});
		});
	};

	// LIGHTBOX
	this.initLighbox = function() {
		jQuery('a[rel^="prettyPhoto"]').prettyPhoto();
	}

	// SCROLL TO TOP
	this.initScrollToTop = function() {
		let backToTop = document.querySelector('#backToTop');
		if (!backToTop) return;

		backToTop.addEventListener('click', function() {
			document.querySelector('#mainContent').scrollIntoView({
				behavior: 'smooth', block: 'start'
			})
		})
	}
}

myHomeManager = new homeManager();

jQuery(document).ready(function(){
	myHomeManager.init();
});