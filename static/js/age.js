function calcAge() {
	// stackoverflow.com/a/6002276
	document.getElementById('age').innerHTML = new Date().getFullYear() - 1998 + ' years old ';
}

// Calculate my age so I don't have to update the page
calcAge();
