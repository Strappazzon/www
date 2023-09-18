const BTN_TOP = document.querySelector('#go-top');

function scrollUp() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}

window.onscroll = () => {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		// Show button
		BTN_TOP.hasAttribute('hidden') && BTN_TOP.removeAttribute('hidden');
	} else {
		// Hide button
		BTN_TOP.setAttribute('hidden', true);
	}
};

BTN_TOP.addEventListener('click', scrollUp, false);
