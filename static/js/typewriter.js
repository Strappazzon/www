let i = 0;
const TYPE = document.querySelector('#typewriter');
const TEXT = TYPE.dataset.text;
const SPEED = 125;

// https://www.w3schools.com/howto/howto_js_typewriter.asp
function typeWriter() {
  if (i < TEXT.length) {
    TYPE.innerHTML += TEXT.charAt(i);
    i++;
    setTimeout(typeWriter, SPEED);
  }
}

TYPE.hasAttribute('hidden') && TYPE.removeAttribute('hidden');

typeWriter();
