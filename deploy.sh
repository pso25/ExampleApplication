#!/usr/bin/env bash

# Install Node.js and npm if missing
sudo apt update
sudo apt install -y nodejs npm

# Install pm2 globally
sudo npm install -g pm2

# Stop and remove the old app process (ignore errors if it doesn't exist)
pm2 stop example_app || true
pm2 delete example_app || true

# Go into the cloned repo (was "cd ExampleApp")
cd ExampleApplication

# Install dependencies
npm install

# Start the app
pm2 start ./bin/www --name example_app