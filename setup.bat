@echo off
echo 🚺 Setting up Women Safety App for Hackathon Demo
echo =================================================

REM Check if Flutter is installed
flutter --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Flutter is not installed. Please install Flutter first.
    echo Visit: https://flutter.dev/docs/get-started/install
    pause
    exit /b 1
)

echo ✅ Flutter found
flutter --version | findstr /C:"Flutter"

REM Check Flutter doctor
echo 🔍 Running Flutter doctor...
flutter doctor

REM Get dependencies
echo 📦 Installing dependencies...
flutter pub get

REM Check for any issues
echo 🔧 Checking for issues...
flutter analyze

echo 🎉 Setup complete! You can now run the app with:
echo    flutter run
echo.
echo 📱 For the hackathon demo:
echo    1. Start the app and go through onboarding
echo    2. Enable monitoring on the home screen
echo    3. Use the demo controls to simulate scenarios
echo    4. Show emergency response features
echo.
echo 🎯 Demo Tips:
echo    - Use 'Simulate Anomaly' for emergency demo
echo    - Show the beautiful animations and UI
echo    - Highlight the sensor monitoring features
echo    - Demonstrate emergency contact system

pause
