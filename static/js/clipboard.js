const codeBlocks = document.querySelectorAll('.machine__code-header + .highlight .highlighter-rouge');
const clipboardButtons = document.querySelectorAll('.machine__code-header .clipboard');

// https://www.aleksandrhovhannisyan.com/blog/jekyll-copy-to-clipboard/
clipboardButtons.forEach((clipboardButton, index) => {
  const code = codeBlocks[ index ].innerText;

  clipboardButton.addEventListener('click', () => {
    window.navigator.clipboard.writeText(code);
  });
});
