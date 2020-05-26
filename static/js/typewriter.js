let i = 0;
let text = document.getElementById('typewriter').dataset.text; // stackoverflow.com/a/37880192
let speed = 125;

// www.w3schools.com/howto/howto_js_typewriter.asp
function typeWriter() {
	if (i < text.length) {
		document.getElementById('typewriter').innerHTML += text.charAt(i);
		i++;
		setTimeout(typeWriter, speed);
	}
}

let noJsEl = document.querySelector('.nojs');

// alligator.io/js/classlist
function removeNoJs() {
	if (noJsEl.classList.contains('nojs')) {
		noJsEl.classList.remove('nojs');
	}
}

// Remove "nojs" attribute
removeNoJs();

// Start typewriter animation
typeWriter();
