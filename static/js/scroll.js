let topBtn = document.getElementById('scroll-up');

window.onscroll = function() { scroll() };

function scroll() {
	if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		topBtn.style.display = 'block';
	} else {
		topBtn.style.display = 'none';
	}
}

function scrollUp() {
	document.body.scrollTop = 0;
	document.documentElement.scrollTop = 0;
}
