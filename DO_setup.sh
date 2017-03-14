#!/bin/bash         

echo "Running /etc/default/unicorn..."
. /etc/default/unicorn

echo "Creating and Migrating DB in production environment..."
RAILS_ENV=production rake db:create
RAILS_ENV=production rake db:migrate

echo "Removing old public/assets files..."
rm -rf public/assets

echo "Precompiling assets..."
RAILS_ENV=production rake assets:precompile

echo "Changing ownership of App folder..."
chown -R rails: /home/rails/TrackMyPowerApp/

echo "Restarting unicorn and nginx services..."
service unicorn restart
service nginx reload
