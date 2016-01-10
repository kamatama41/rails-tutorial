#!/bin/bash -e

apps="./*"
for app in ${apps}; do
  if [ -d ${app} ]; then
    echo "Test ${app}"
    cd ${app}
    bundle install
    bundle exec rake test
    cd ..
  fi
done
