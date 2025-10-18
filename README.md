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
