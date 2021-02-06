install:
	composer install

lint:
	composer exec --verbose phpcs -- --standard=PSR12 index.php login.php src/class

lint-fix:
	composer exec --verbose phpcbf -- --standard=PSR12 index.php login.php src/class
