#!/usr/bin/env bash
url="https://www.hoyenlahistoria.com/efemerides.php"
timestamp=$(date +"%D %T")
cd "$HOME"/estudio/tweepy_bot || exit
git pull origin main
./scrapers/hoy_en_la_historia_scraper.sh "$url"
python3 bot_spanish_runner.py
git add .
git commit -m "bot_spanish_runner executed: $timestamp"
git push origin main