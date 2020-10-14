function ezUUID$() {
	return (new Date().getTime() + "" + Math.floor(65535 * Math.random()));
}

