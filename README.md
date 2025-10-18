<<<<<<< HEAD
# 🚺 Women Safety App - Smart Anomaly Detection

A Flutter demo application for women's safety featuring advanced anomaly detection using phone sensors, emergency response system, and interactive UI designed for hackathon presentation.

## 🎯 Features

### 🔍 Smart Anomaly Detection
- **Passive Monitoring**: Uses accelerometer, gyroscope, and location sensors
- **Real-time Analysis**: Detects sudden movements, stops, or irregular walking patterns
- **AI-powered Detection**: Advanced algorithms identify potential threats
- **Confidence Scoring**: Risk assessment with visual indicators

### 🚨 Emergency Response System
- **Automatic Triggers**: Instant response when anomalies are detected
- **Live Location Sharing**: Real-time GPS tracking and sharing
- **Audio Recording**: Automatic recording during emergency situations
- **Contact Notifications**: Instant alerts to emergency contacts

### 📱 Interactive Features
- **Modern UI**: Beautiful gradient designs with smooth animations
- **Panic Button**: One-tap emergency activation
- **Quick Actions**: Fast access to essential safety features
- **Safety Tips**: Rotating safety advice and best practices
- **Demo Controls**: Simulation tools for hackathon presentation

### 🛡️ Safety Features
- **Emergency Contacts**: Pre-configured contact list with priority settings
- **Location Services**: Continuous GPS monitoring
- **Audio Capture**: Voice recording for evidence
- **Smart Notifications**: Context-aware alerts and tips

## 🚀 Quick Start

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android device or emulator (for sensor testing)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd women_safety_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📱 Demo Features for Hackathon

### 🎮 Interactive Demo Controls
The app includes special demo controls to simulate various scenarios:

1. **Simulate Anomaly**: Trigger fake anomaly detection
2. **Normal Pattern**: Reset to safe walking pattern
3. **Safety Alerts**: Show notification examples

### 🎨 Visual Elements
- **Gradient Animations**: Smooth color transitions
- **Pulse Effects**: Attention-grabbing emergency indicators
- **Waveform Visualization**: Real-time sensor data display
- **Confetti Effects**: Celebration animations for safety tips

### 📊 Real-time Monitoring
- **Sensor Status**: Visual indicators for all sensors
- **Risk Level Meter**: Color-coded confidence scoring
- **Location Display**: Current GPS coordinates
- **Recording Status**: Audio capture indicators

## 🏗️ Architecture

### Core Services
- **AnomalyDetectionService**: Handles sensor monitoring and analysis
- **EmergencyService**: Manages emergency response and contacts
- **NotificationService**: Handles alerts and user notifications

### Key Components
- **HomeScreen**: Main dashboard with all safety features
- **OnboardingScreen**: Interactive introduction to the app
- **SafetyStatusCard**: Real-time monitoring display
- **EmergencyButton**: Prominent panic button
- **AnomalyDetectorCard**: Sensor visualization and status

## 🔧 Configuration

### Permissions
The app requires the following permissions:
- **Location**: For GPS tracking and emergency location sharing
- **Microphone**: For audio recording during emergencies
- **Sensors**: For accelerometer and gyroscope access
- **Storage**: For saving emergency recordings

### Emergency Contacts
Default demo contacts are pre-configured:
- Emergency Services (911)
- Mom (+1234567890)
- Dad (+1234567891)
- Best Friend (+1234567892)

## 🎯 Hackathon Presentation Tips

### Demo Flow
1. **Start with Onboarding**: Show the beautiful introduction screens
2. **Enable Monitoring**: Demonstrate the sensor activation
3. **Simulate Anomaly**: Use demo controls to trigger emergency response
4. **Show Emergency Features**: Display location sharing, recording, contacts
5. **Highlight UI**: Emphasize animations and modern design

### Key Talking Points
- **AI-Powered Detection**: Advanced algorithms for threat identification
- **Passive Monitoring**: No user intervention required
- **Instant Response**: Automatic emergency activation
- **Modern UI/UX**: Beautiful, intuitive interface
- **Real-world Application**: Practical safety solution

## 📈 Technical Highlights

### Sensor Integration
- **Accelerometer**: Detects sudden movements and impacts
- **Gyroscope**: Identifies phone orientation changes
- **GPS**: Continuous location tracking
- **Microphone**: Emergency audio recording

### Anomaly Detection Algorithm
- **Statistical Analysis**: Variance and pattern recognition
- **Threshold-based Detection**: Configurable sensitivity levels
- **Confidence Scoring**: Risk assessment with visual feedback
- **Real-time Processing**: Instant threat identification

### Performance Optimizations
- **Efficient Sensor Reading**: Optimized sampling rates
- **Background Processing**: Minimal battery impact
- **Smart Notifications**: Context-aware alerting
- **Responsive UI**: Smooth animations and transitions

## 🛠️ Development

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── theme/
│   └── app_theme.dart        # Theme configuration
├── services/
│   ├── anomaly_detection_service.dart
│   ├── emergency_service.dart
│   └── notification_service.dart
├── screens/
│   ├── home_screen.dart
│   └── onboarding_screen.dart
└── widgets/
    ├── gradient_button.dart
    ├── safety_status_card.dart
    ├── emergency_button.dart
    ├── anomaly_detector_card.dart
    ├── quick_actions_grid.dart
    ├── safety_tips_card.dart
    └── demo_controls.dart
```

### Key Dependencies
- `sensors_plus`: Sensor data access
- `geolocator`: GPS location services
- `flutter_animate`: Smooth animations
- `record`: Audio recording capabilities
- `shared_preferences`: Local data storage

## 🎉 Demo Scenarios

### Scenario 1: Normal Walking
- Enable monitoring
- Show normal confidence levels (0-30%)
- Demonstrate sensor visualization
- Highlight safety tips

### Scenario 2: Anomaly Detection
- Use demo controls to simulate threat
- Show emergency response activation
- Display location sharing
- Demonstrate contact notifications

### Scenario 3: Manual Emergency
- Press emergency button
- Show immediate response
- Highlight recording status
- Display safety features

## 📞 Support

For questions or issues during the hackathon:
- Check the demo controls for simulation options
- Use the safety tips for additional context
- Review the emergency contact configuration
- Test all interactive elements

## 🏆 Hackathon Success Tips

1. **Start Strong**: Begin with the beautiful onboarding
2. **Show Technology**: Demonstrate sensor integration
3. **Highlight Impact**: Emphasize real-world safety benefits
4. **Interactive Demo**: Use demo controls for engagement
5. **Visual Appeal**: Showcase modern UI and animations

---

**Built with ❤️ for Women's Safety**

*This is a demo application created for hackathon presentation purposes.*
=======
Guardian stride – Personal Safety Companion App for Women

🛡️ Project Overview
Guardian stride is a personal safety application designed to enhance women's security during outdoor travel. The app focuses on emergency alerts, live location tracking, audio monitoring, and quick contact with trusted individuals. Built for quick response and real-time support, this app aims to be a digital companion for women’s safety.

🎯 Key Features

User Authentication: Secure login with mobile number and password setup

Emergency Contacts: Mandatory registration of 3 trusted contacts (Father, Mother, Brother)

Tracking System: Continuous location monitoring when the user steps outside

Emergency Detection: Smart detection of unusual movements (sudden stop/run in unsafe areas)

Automatic Alerts: Instant call, live location & audio recording sent to emergency contacts

Manual Alert Cancellation: User can cancel alerts within 5 seconds

👩‍💼 Target Users

Women of all age groups

College students

Working professionals

Parents seeking safety tools for their daughters

NGOs and women’s safety organizations

🚀 Getting Started

Prerequisites

Flutter SDK (3.9.2 or higher)

Dart SDK

Android Studio / VS Code

Android/iOS device or emulator

Installation

git clone <repository-url>
cd raksha_sathi
flutter pub get
flutter run


🔐 Demo Credentials

Name : Fabfive

Phone Number: 9876543210

Password: safe1234

📱 App Structure

lib/
├── main.dart                       # Entry point
├── models/
│   └── user_model.dart             # User & contacts model
├── services/
│   ├── location_service.dart       # GPS tracking
│   ├── alert_service.dart          # Alert trigger logic
│   └── audio_service.dart          # Audio recording
├── screens/
│   ├── splash_screen.dart          # Splash intro
│   ├── login_screen.dart           # Login page
│   ├── contact_setup_screen.dart   # Add 3 emergency contacts
│   ├── home_screen.dart            # Main tracking UI
│   └── alert_screen.dart           # Emergency alert screen
└── utils/
    └── constants.dart              # Colors, timings, configs


🎨 Design System

Color Palette

Primary Pink: #FF5E78 – Alert & urgency

Trust Blue: #006AFF – Calm and assurance

Success Green: #22C55E – Success states

Danger Red: #DC2626 – Emergency states

UI Components

Material 3 design

Large buttons for quick actions

Real-time indicators

Accessibility-first layout

🔧 Technical Stack

Framework: Flutter 3.9.2+

Language: Dart

State Management: Provider

Database: Hive (for offline contact storage)

Audio & Location: geolocator, audioplayers, permission_handler

Dependencies

dependencies:
  flutter:
  provider: ^6.1.1
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  path_provider: ^2.1.2
  uuid: ^4.3.3
  geolocator: ^10.4.2
  permission_handler: ^11.0.0
  audioplayers: ^5.2.0

dev_dependencies:
  flutter_test:
  build_runner: ^2.4.7
  hive_generator: ^2.0.1


📊 Features Overview

Splash Screen

Animated logo

Brief safety message

Login Screen

Mobile number and password

New users register

Contact Setup

Enter 3 trusted numbers (brother, father, mother)

Validate before proceeding

Live Tracking

Starts once user "steps out" and enables tracking

Continuous GPS logging

Emergency Detection

If unusual movement (sudden stop or running in danger zone), system triggers:

Auto-call to contacts

Live location sharing

Audio recording

Alert Cancellation

A 5-second countdown to cancel false alarm

Resets emergency flow

🔄 Data Flow

Contact Info: Stored locally using Hive

Location: Polled continuously while app is active

Audio: Recorded on alert trigger and sent via secured channel

Emergency Trigger: Controlled by movement detection logic

Manual Override: Cancel alert within timeout

🎯 Key Workflows

User Registration Workflow

Login → Register 3 contacts → Save to Hive → Home screen

Tracking & Alert Workflow

Enable tracking → Movement monitored → Emergency trigger (if conditions met) → Alert sent

User has 5 seconds to cancel false alarm

🚀 Future Enhancements

Planned Features

Biometric authentication

Panic button widget (home screen)

Fall detection

Offline map caching

SOS chat bot

Multi-language interface

Integration with police hotline

Technical Improvements

Firebase integration

Advanced AI movement detection

Automated alert escalation

Secure encrypted location & audio sync

🛠️ Development

# Generate Hive adapters
flutter packages pub run build_runner build

# Watch for changes
flutter packages pub run build_runner watch

# Run tests
flutter test

# Build APK
flutter build apk --release


📸 Screenshots
(Add mockups of login screen, contact setup, tracking, emergency alert, and map view)

🤝 Contributing

Fork the repo

Create a new feature branch

Implement your feature

Add unit tests

Submit PR


👥 Team

Project: Guardian stride

Focus: Real-time Personal Safety

📞 Support
For queries, contact team Fab five
>>>>>>> 91615a6afb33e08a9beaa16f088bf735d33eb327
#   F a b - f i v e  
 