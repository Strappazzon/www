const CODE_BLOCKS = document.querySelectorAll('.machine__code-header + .highlight .highlighter-rouge');
const CLIPBOARD_BTNS = document.querySelectorAll('.machine__code-header .clipboard');

// https://www.aleksandrhovhannisyan.com/blog/jekyll-copy-to-clipboard/
CLIPBOARD_BTNS.forEach((clipboardButton, index) => {
  const CODE = CODE_BLOCKS[ index ].innerText;

  clipboardButton.addEventListener('click', () => {
    window.navigator.clipboard.writeText(CODE);
  });
});
