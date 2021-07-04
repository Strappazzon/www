const TERM_MINMZ_BTN = document.querySelector('#term-min');
const TERM_MAXMZ_BTN = document.querySelector('#term-max');
const TERM_CLOSE_BTN = document.querySelector('#term-close');
let isMinimized = false;

TERM_MINMZ_BTN.addEventListener('click', () => {
	const TERM = document.querySelector('.terminal');
	const TCNT = document.querySelector('.terminal__content');

	if (isMinimized == false) {
		TERM.classList.add('mh-0');
		TCNT.classList.add('d-n');
		isMinimized = true;
	}
});

TERM_MAXMZ_BTN.addEventListener('click', () => {
	const TERM = document.querySelector('.terminal');
	const TCNT = document.querySelector('.terminal__content');

	if (isMinimized) {
		TERM.classList.remove('mh-0');
		TCNT.classList.remove('d-n');
		isMinimized = false;
	}
});

TERM_CLOSE_BTN.addEventListener('click', () => {
	const TERM = document.querySelector('.terminal');
	const DLCT = document.querySelector('.container__pgp__downloads');

	TERM.parentNode.removeChild(TERM);
	DLCT.classList.add('ml-0');
});
