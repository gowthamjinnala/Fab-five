#!/bin/bash

echo "🚺 Setting up Women Safety App for Hackathon Demo"
echo "================================================="

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter first."
    echo "Visit: https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -n 1)"

# Check Flutter doctor
echo "🔍 Running Flutter doctor..."
flutter doctor

# Get dependencies
echo "📦 Installing dependencies..."
flutter pub get

# Check for any issues
echo "🔧 Checking for issues..."
flutter analyze

echo "🎉 Setup complete! You can now run the app with:"
echo "   flutter run"
echo ""
echo "📱 For the hackathon demo:"
echo "   1. Start the app and go through onboarding"
echo "   2. Enable monitoring on the home screen"
echo "   3. Use the demo controls to simulate scenarios"
echo "   4. Show emergency response features"
echo ""
echo "🎯 Demo Tips:"
echo "   - Use 'Simulate Anomaly' for emergency demo"
echo "   - Show the beautiful animations and UI"
echo "   - Highlight the sensor monitoring features"
echo "   - Demonstrate emergency contact system"
