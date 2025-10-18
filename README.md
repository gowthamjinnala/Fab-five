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
Event: Smart India Hackathon 2025
Focus: Real-time Personal Safety

📞 Support
For queries, contact team Fab five
