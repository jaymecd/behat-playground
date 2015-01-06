#!/usr/bin/env sh

trap "kill 0" SIGINT SIGTERM EXIT

cd "$(dirname "$0")/.."

mkdir -p build

rm -f build/phantomjs.cookie

printf "Composer install: "

composer install --dev -o > build/composer_install.log 2>&1

echo OK

printf "NPM install: "

npm install > build/npm_install.log 2>&1

echo OK

printf "Start PhantomJS: "

node_modules/.bin/phantomjs \
    --webdriver=4444 \
    --ignore-ssl-errors=yes \
    --cookies-file=build/phantomjs.cookie \
    > build/phantomjs.log 2>&1 &

while true; do 
    grep -q "PhantomJS is launching GhostDriver" build/phantomjs.log && break; 
    sleep 2; 
done

echo OK

echo "Running Behat:"

bin/behat -c behat.yml \
    -f pretty -o build/behat.pretty \
    -f progress -o std

echo "FIN"
