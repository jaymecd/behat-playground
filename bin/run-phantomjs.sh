#!/usr/bin/env sh

cd "$(dirname "$0")/.."

alias phantomjs="node_modules/.bin/phantomjs"

cookie_file=/tmp/webdriver_cookie.txt

trap "rm -f $cookie_file" SIGINT SIGTERM EXIT

echo "Running PhantomJS $(phantomjs --version)"
echo

phantomjs --webdriver=4444 --ignore-ssl-errors=yes --cookies-file=$cookie_file "$@"
