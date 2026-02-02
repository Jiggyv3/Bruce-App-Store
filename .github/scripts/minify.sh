#!/bin/bash

set -e  # Exit on any error

echo "Starting JavaScript minification process..."

# Read the App Store.js file content
echo "Reading App Store.js..."
CONTENT=$(cat "App Store.js")

# Create minified directory if it doesn't exist
echo "Creating minified directory..."
mkdir -p "minified"

# Remove existing minified file if it exists
if [ -f "minified/App Store.js" ]; then
  echo "Removing existing minified file..."
  rm "minified/App Store.js"
fi

# Minify the JavaScript file using terser
npx terser "App Store.js" \
  --compress \
  --mangle reserved=['e1','e2','e3','e4','e5','e6','e7','e8','d9'] \
  --output "minified/App Store.js"

# Check if minification was successful
if [ -f "minified/App Store.js" ] && [ -s "minified/App Store.js" ]; then
  echo "Minification successful!"
  echo "Original file size: $(wc -c < "App Store.js") bytes"
  echo "Minified file size: $(wc -c < "minified/App Store.js") bytes"
else
  echo "Minification failed - output file is missing or empty"
  exit 1
fi

# Configure git
echo "Configuring git..."
git config --local user.email "action@github.com"
git config --local user.name "GitHub Action"

# Add the file to staging area
git add "minified/App Store.js"

# Check if there are changes to commit
echo "Checking for changes..."
if git diff --cached --quiet 2>/dev/null; then
  echo "No changes to minified file - skipping commit"
else
  echo "Changes detected - committing minified file..."
  git commit -m "Minified"
  git push
  echo "Minified file committed and pushed successfully!"
fi

echo "Minification process completed!"