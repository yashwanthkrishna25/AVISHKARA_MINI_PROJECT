#!/bin/bash

# 1. Download a lightweight, portable stable version of the Flutter SDK
echo "📥 Downloading portable Flutter SDK..."
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# 2. Add the portable binary to the active system execution path
export PATH="$PATH:`pwd`/flutter/bin"

# 3. Enable web building inside the downloaded SDK wrapper
echo "⚙️ Configuring web engine platforms..."
flutter config --enable-web

# 4. Fetch your project's pub packages dependencies
echo "📦 Resolving project dependencies..."
flutter pub get

# 5. Compile your parking application down to highly optimized web files
echo "🚀 Building production web distribution app..."
flutter build web --release --dart-define=FLUTTER_WEB_AUTO_DETECT=false

# 6. Create a clean public directory for Vercel to host
echo "📁 Staging compiled output files..."
mkdir -p public
cp -r build/web/* public/

echo "✅ Build Process Completed Successfully!"