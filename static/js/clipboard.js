// https://www.aleksandrhovhannisyan.com/blog/jekyll-copy-to-clipboard/

const CODE_BLOCKS    = document.querySelectorAll('.machine__code-header + .highlight .highlighter-rouge');
const CLIPBOARD_BTNS = document.querySelectorAll('.machine__code-header .clipboard');

CLIPBOARD_BTNS.forEach((copyBtn, index) => {
  const CODE_BLOCK = CODE_BLOCKS[index];

  if (!CODE_BLOCK) return;

  copyBtn.addEventListener('click', () => {
    const CODE_CNT = CODE_BLOCK.innerText.trim();

    window.navigator.clipboard.writeText(CODE_CNT);
  });
});
