# Behat 3 Playground

## Short story

Install dependencies, start phantom & run tests
	
	$ ./bin/run-behat.sh

## Long story

 1) Install Composer dependencies
	
	$ curl http://getcomposer.org/installer | php
	$ ./composer.phar install --dev -o --prefer-dist

 2) Install Node.js dependencies:

 	$ npm install

 3) Run PhantomJS in separate console:

	$ ./bin/run-phantomjs.sh

 4) Run Behat tests:

	$ ./bin/behat

 5) Profit!