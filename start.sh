#!/bin/bash

# Background me Docker daemon start karein
dockerd &

# Docker socket ready hone ka wait karein
until docker info > /dev/null 2>&1; do
  echo "Docker daemon shuru hone ka intezar kiya ja raha hai..."
  sleep 2
done

echo "Docker daemon active ho gaya hai!"

# Bot ko foreground me run karein taaki container alive rahe
pm2-runtime start index.js --name "vps-bot"
