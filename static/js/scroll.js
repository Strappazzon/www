const BTN_TOP = document.querySelector('#scroll-up');

function scrollUp() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}

window.onscroll = () => {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		BTN_TOP.classList.add('d-b');
		BTN_TOP.classList.remove('d-n');
	} else {
		BTN_TOP.classList.remove('d-b');
		BTN_TOP.classList.add('d-n');
	}
};

BTN_TOP.addEventListener('click', scrollUp, false);
