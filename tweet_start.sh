#!/usr/bin/env bash
timestamp=$(date +"%D %T")
cd /home/sebastian/estudio/tweepy_bot || exit
git pull origin main
./tweepy_botV2.sh
python3 my_bot_start
git add .
git commit -m "History update: $timestamp"
git push origin main
