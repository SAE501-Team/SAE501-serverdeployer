#!/bin/bash

# Create the /var/www/html directory if it doesn't exist
mkdir -p /var/www/html

# Add an index.html file in the /var/www/html directory
cat <<EOL > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Injected</title>
  </head>
  <body>
    <h1>Config successfully injected!</h1>
  </body>
</html>

EOL

echo "index.html has been created in /var/www/html"