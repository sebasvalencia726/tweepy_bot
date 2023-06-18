#!/usr/bin/env bash
timestamp=$(date +"%D %T")
url="https://www.hoyenlahistoria.com/efemerides.php"
dir="$HOME/estudio/tweepy_bot/"
file_path="$dir/hoy_en_la_historia.txt"
cd "$dir" || exit
git pull origin feature/api_v2
if [ -f "$file_path" ]; then
    echo "hoy_en_la_historia exists. Executing my_bot_end and data cleaner."
    # Place your commands to be executed if the file exists here
    python3 "$dir"/bot_end_runner.py
    rm -rf "$dir"/scrapers/hoy_en_la_historia.txt
    git add .
    git commit -m "My_bot_end executed: $timestamp"
    git push origin feature/api_v2
else
    echo "hoy_en_la_historia does not exist. Executing tweepy_botV2 to scrape data and my_bot_start"
    # Place your commands to be executed if the file does not exist here
    bash "$dir"/scrapers/hoy_en_la_historia_scraper.sh "$url"
    python3 "$dir"/bot_start_runner.py
    git add .
    git commit -m "My_bot_start executed: $timestamp"
    git push origin feature/api_v2
fi