#!/bin/bash -e

app_name=$1
herokuapp=$2

cat > ${HOME}/.netrc <<EOF
machine api.heroku.com
  login ${HEROKU_USER}
  password ${HEROKU_API_TOKEN}
EOF

cd ${app_name}
git config --global user.email "${HEROKU_USER}"
git config --global user.name "CircleCI"
git init
git add -A
git commit -m "Deploy ${app_name}"
git remote add heroku git@heroku.com:${herokuapp}.git
git push -f heroku master

heroku config:add CIRCLE_SHA1=${CIRCLE_SHA1} --app ${herokuapp}
