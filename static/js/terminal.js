const TERM_MINMZ_BTN = document.getElementById('term-min');
const TERM_MAXMZ_BTN = document.getElementById('term-max');
const TERM_CLOSE_BTN = document.getElementById('term-close');
let isMinimized = false;

TERM_MINMZ_BTN.addEventListener('click', () => {
	var term = document.querySelector('.terminal');
	var termCnt = document.querySelector('.terminal .content');

	if (isMinimized == false) {
		term.classList.add('mh-0');
		termCnt.classList.add('d-n');
		isMinimized = true;
	}
});

TERM_MAXMZ_BTN.addEventListener('click', () => {
	var term = document.querySelector('.terminal');
	var termCnt = document.querySelector('.terminal .content');

	if (isMinimized) {
		term.classList.remove('mh-0');
		termCnt.classList.remove('d-n');
		isMinimized = false;
	}
});

TERM_CLOSE_BTN.addEventListener('click', () => {
	var term = document.querySelector('.terminal');
	var dlCnt = document.querySelector('.downloads__container');

	term.parentNode.removeChild(term);
	dlCnt.classList.add('ml-0');
});
