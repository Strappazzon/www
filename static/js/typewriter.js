let i = 0;
const TYPE = document.querySelector('#typewriter')
const TEXT = TYPE.dataset.text; // https://stackoverflow.com/a/37880192
const SPEED = 125;
const NOJS = document.querySelector('.nojs');

// https://www.w3schools.com/howto/howto_js_typewriter.asp
function typeWriter() {
	if (i < TEXT.length) {
		TYPE.innerHTML += TEXT.charAt(i);
		i++;
		setTimeout(typeWriter, SPEED);
	}
}

// Remove "nojs" class
// https://alligator.io/js/classlist
NOJS.classList.contains('nojs') && NOJS.classList.remove('nojs');

typeWriter();
