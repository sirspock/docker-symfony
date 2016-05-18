#!/bin/bash

cd /var/www/symfony

php app/console doctrine:database:create --if-not-exists; 
if [ $? -ne 0 ]; then
	php app/console doctrine:schema:create;
	php app/console doctrine:fixtures:load --fixtures=src/AppBundle/DataFixtures/ORMProd/
	app/console app:assets --env=prod
fi

php app/console doctrine:schema:update --dump-sql --force
app/console app:assets --env=prod
php app/console ca:c --env=prod

chmod -R 777 /var/www/symfony/app/logs/
chmod -R 777 /var/www/symfony/app/cache/

php5-fpm -F