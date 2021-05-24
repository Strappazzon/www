let i = 0;
const TYPEWRT = document.getElementById('typewriter')
const TEXT = TYPEWRT.dataset.text; // stackoverflow.com/a/37880192
const SPEED = 125;
const NOJS = document.querySelector('.nojs');

// www.w3schools.com/howto/howto_js_typewriter.asp
function typeWriter() {
	if (i < TEXT.length) {
		TYPEWRT.innerHTML += TEXT.charAt(i);
		i++;
		setTimeout(typeWriter, SPEED);
	}
}

// Remove "nojs" class
// alligator.io/js/classlist
NOJS.classList.contains('nojs') && NOJS.classList.remove('nojs');

// Start typewriter animation
typeWriter();
