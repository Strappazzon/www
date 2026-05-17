// https://www.aleksandrhovhannisyan.com/blog/jekyll-copy-to-clipboard/

const CODE_BLOCKS    = document.querySelectorAll('.machine__code-header + .highlight .highlighter-rouge');
const CLIPBOARD_BTNS = document.querySelectorAll('.machine__code-header .clipboard');

CLIPBOARD_BTNS.forEach((copyBtn, index) => {
  const CODE_BLOCK = CODE_BLOCKS[index];
  const ALERT_EL   = copyBtn.nextElementSibling;

  if (!CODE_BLOCK || !ALERT_EL) return;

  let cooldown = false;

  copyBtn.addEventListener('click', () => {
    // Prevent spam-clicking the button
    if (cooldown) return;

    cooldown = true;

    const CODE_CNT     = CODE_BLOCK.innerText.trim();
    const COPY_TEXT    = copyBtn.textContent;
    const COPIED_TEXT  = 'DONE';
    const COPIED_ALERT = 'Code block copied to clipboard';

    window.navigator.clipboard.writeText(CODE_CNT);

    copyBtn.textContent = COPIED_TEXT;

    setTimeout(() => {
      copyBtn.textContent = COPY_TEXT;
      ALERT_EL.textContent = new String();
      cooldown = false;
    }, 2000);

    // (Re)Announce to screen readers that the code block has been copied
    ALERT_EL.textContent = COPIED_ALERT;
  });
});
