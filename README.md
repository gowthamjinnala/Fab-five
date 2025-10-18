📱 Women Safety App

A mobile application designed to enhance women's safety by tracking real-time location, detecting suspicious activity, and instantly alerting trusted contacts in case of emergency.

🚀 Features
👤 Step 1: Secure Login and Contact Setup

Users must register/login using their phone number and create a secure password.

During the initial setup, users are required to enter three emergency contact numbers – typically a father, mother, and brother (or other trusted contacts).

🛡️ Step 2: Safety Mode Activation

A safety button must be activated (kept ON) whenever the user is going out alone.

This indicates the app should begin monitoring the user's activity.

📍 Step 3: Real-Time Tracking

Once safety mode is active, the app continuously tracks the user’s location.

Location data is used to monitor for any sudden stops in unsafe areas or rapid movements (like running), which may indicate a potential threat.

🚨 Step 4: Emergency Auto-Alert System

If suspicious activity is detected:

The app automatically calls the saved emergency contacts.

It also shares live location and begins audio recording, sending updates continuously.

All this happens without needing manual input from the user.

🛑 Step 5: Cancel Alert

If the user manually turns off the alert button:

The app will delay the cancellation for 5 seconds.

If not reactivated within that time, the alert system will stop all emergency actions (calls, location sharing, recording).

🛠️ Tech Stack (Suggested)

Frontend: Flutter

Backend: Firebase

Maps API: Google Maps API

Authentication: Firebase Auth

Real-time Location: GeoLocation package

Audio Recording & Call Handling: Native APIs

🧩 Future Enhancements

SOS Button Widget for lock screen

AI-based activity recognition

Integration with local police stations

📁 Repository Structure (Suggested)
/WomenSafetyApp
│
├── /assets              # App icons, images, etc.
├── /screens             # UI Screens
├── /services            # Location, Alerts, API handling
├── /components          # Reusable UI components
├── /utils               # Helper functions
├── main.dart / App.js   # Entry point
└── README.md            # Project Documentation
