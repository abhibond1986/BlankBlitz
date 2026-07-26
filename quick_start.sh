#!/bin/bash

# BlankBlitz Quick Start Script
# This script will help you get the app running quickly

echo "🎮 BlankBlitz Quick Start"
echo "========================="
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed!"
    echo "Please install Flutter from: https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -n 1)"
echo ""

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Installing dependencies..."
flutter pub get

# Check for issues
echo "🔍 Checking for code issues..."
flutter analyze

# Run the app
echo ""
echo "🚀 Starting BlankBlitz..."
echo ""
echo "Select platform:"
echo "1) Chrome (Web)"
echo "2) Android"
echo "3) iOS"
echo "4) Build for Production"
read -p "Enter choice (1-4): " choice

case $choice in
    1)
        echo "🌐 Launching in Chrome..."
        flutter run -d chrome
        ;;
    2)
        echo "📱 Launching on Android..."
        flutter run -d android
        ;;
    3)
        echo "📱 Launching on iOS..."
        flutter run -d ios
        ;;
    4)
        echo "🏗️ Building for production..."
        echo ""
        echo "Select build type:"
        echo "1) Web"
        echo "2) Android APK"
        echo "3) Android App Bundle"
        echo "4) iOS"
        read -p "Enter choice (1-4): " build_choice

        case $build_choice in
            1)
                flutter build web --release
                echo "✅ Web build complete! Output: build/web/"
                ;;
            2)
                flutter build apk --release
                echo "✅ APK build complete! Output: build/app/outputs/flutter-apk/"
                ;;
            3)
                flutter build appbundle --release
                echo "✅ App Bundle complete! Output: build/app/outputs/bundle/release/"
                ;;
            4)
                flutter build ios --release
                echo "✅ iOS build complete! Open ios/Runner.xcworkspace in Xcode"
                ;;
            *)
                echo "Invalid choice"
                exit 1
                ;;
        esac
        ;;
    *)
        echo "Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "✨ Done!"
