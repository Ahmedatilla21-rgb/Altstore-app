#!/bin/bash

# Build script for both apps
# Usage: ./build-apps.sh

echo "🏗️  Building RemindMe..."
xcodebuild -scheme RemindMe -configuration Release -derivedDataPath build/RemindMe archive
echo "✅ RemindMe built successfully"

echo ""
echo "🏗️  Building Weather Dashboard..."
xcodebuild -scheme WeatherDashboard -configuration Release -derivedDataPath build/WeatherDashboard archive
echo "✅ Weather Dashboard built successfully"

echo ""
echo "📦 Both apps ready for distribution!"
echo "Next steps:"
echo "1. Export both archives as IPA files"
echo "2. Upload to GitHub releases"
echo "3. Share your AltStore source URL"
