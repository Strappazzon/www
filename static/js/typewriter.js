const TYPE_EL = document.querySelector('#typewriter');
const TEXT    = TYPE_EL.dataset.text;
const SPEED   = 125;

let index = 0;

const typeWriter = () => {
  TYPE_EL.textContent += TEXT[index++];

  if (index < TEXT.length) {
    setTimeout(typeWriter, SPEED);
  }
};

TYPE_EL.hidden = false;

typeWriter();
