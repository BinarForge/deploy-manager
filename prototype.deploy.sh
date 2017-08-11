#!/bin/sh
# requires to run: git, nodejs, npm, rsync, ssh, sshpass

HOST="host@example.com"
HOST_PASS="secret`password`"
HOST_PORT=12345

REPOSITORY_URL="https://github.com/BinarForge/the-next-essential-javascript-framework"
PROJECT_NAME="javascript-framework-goddammit"
DEST_PATH="/home/my_cheap_vps/domains/javascript-frameworks-for-all.com/public/examples/"

# -- build
cd workspace
rm -rf $PROJECT_NAME
git clone $REPOSITORY_URL $PROJECT_NAME
cd ./$PROJECT_NAME
npm i
npm run bundle
# -- end of build

# -- deploy
sshpass -p $HOST_PASS rsync -avz -e 'ssh -p '$HOST_PORT * $HOST:/$DEST_PATH --delete
cd ../
rm -rf $PROJECT_NAME
cd ../
# -- end of deploy