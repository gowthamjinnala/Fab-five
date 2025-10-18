class AppConstants {
  // App Information
  static const String appName = 'Women Safety App';
  static const String appVersion = '1.0.0';

  // Sensor Thresholds
  static const double accelerationThreshold = 15.0; // m/s²
  static const double velocityThreshold = 10.0; // m/s
  static const double gyroscopeThreshold = 5.0; // rad/s
  static const int historySize = 10;

  // Emergency Settings
  static const int emergencyTimeout = 30; // seconds
  static const double emergencyConfidenceThreshold = 70.0; // percentage

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double cardRadius = 16.0;
  static const double buttonRadius = 12.0;

  // Animation Durations
  static const int shortAnimationDuration = 300;
  static const int mediumAnimationDuration = 600;
  static const int longAnimationDuration = 1000;

  // Demo Data
  static const List<Map<String, dynamic>> defaultEmergencyContacts = [
    {'name': 'Emergency Services', 'phoneNumber': '911', 'isPrimary': true},
    {'name': 'Mom', 'phoneNumber': '+1234567890', 'isPrimary': false},
    {'name': 'Dad', 'phoneNumber': '+1234567891', 'isPrimary': false},
    {'name': 'Best Friend', 'phoneNumber': '+1234567892', 'isPrimary': false},
  ];

  // Safety Tips
  static const List<Map<String, dynamic>> safetyTips = [
    {
      'title': 'Stay Alert',
      'description':
          'Always be aware of your surroundings. Avoid using headphones in unfamiliar areas.',
      'icon': 'visibility',
      'color': 0xFF2196F3,
    },
    {
      'title': 'Trust Your Instincts',
      'description':
          'If something feels wrong, it probably is. Trust your gut feeling and take action.',
      'icon': 'psychology',
      'color': 0xFF9C27B0,
    },
    {
      'title': 'Share Your Location',
      'description':
          'Let trusted contacts know where you are, especially when traveling alone.',
      'icon': 'location_on',
      'color': 0xFF4CAF50,
    },
    {
      'title': 'Emergency Contacts',
      'description':
          'Keep emergency contacts easily accessible and program them in your phone.',
      'icon': 'contacts',
      'color': 0xFFFF9800,
    },
    {
      'title': 'Well-Lit Areas',
      'description': 'Stick to well-lit, populated areas, especially at night.',
      'icon': 'lightbulb',
      'color': 0xFFFFEB3B,
    },
    {
      'title': 'Self-Defense',
      'description':
          'Consider taking self-defense classes and carry personal safety devices.',
      'icon': 'security',
      'color': 0xFFF44336,
    },
  ];
}
