import 'dart:async';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:record/record.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notification_service.dart';

class EmergencyService {
  factory EmergencyService() => _instance;
  EmergencyService._internal();
  static final EmergencyService _instance = EmergencyService._internal();

  final AudioRecorder _audioRecorder = AudioRecorder();
  Position? _currentPosition;
  String? _audioFilePath;
  bool _isRecording = false;
  Timer? _locationTimer;

  // Emergency contacts
  List<EmergencyContact> _emergencyContacts = [];
  
  // Callbacks
  Function(String location)? onLocationUpdate;
  Function(bool isRecording)? onRecordingStatusChanged;
  Function(String audioPath)? onAudioRecorded;

  List<EmergencyContact> get emergencyContacts => _emergencyContacts;

  Future<void> initialize() async {
    await _loadEmergencyContacts();
    await _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    // Request location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Request microphone permission
    await _audioRecorder.hasPermission();
  }

  Future<void> _loadEmergencyContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = prefs.getString('emergency_contacts');
    if (contactsJson != null) {
      final List<dynamic> contactsList = json.decode(contactsJson);
      _emergencyContacts = contactsList
          .map((contact) => EmergencyContact.fromJson(contact))
          .toList();
    } else {
      // Default demo contacts for hackathon
      _emergencyContacts = [
        EmergencyContact(
          name: 'Emergency Services',
          phoneNumber: '911',
          isPrimary: true,
        ),
        EmergencyContact(
          name: 'Mom',
          phoneNumber: '+1234567890',
          isPrimary: false,
        ),
        EmergencyContact(
          name: 'Dad',
          phoneNumber: '+1234567891',
          isPrimary: false,
        ),
        EmergencyContact(
          name: 'Best Friend',
          phoneNumber: '+1234567892',
          isPrimary: false,
        ),
      ];
      await _saveEmergencyContacts();
    }
  }

  Future<void> _saveEmergencyContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final contactsJson = json.encode(
      _emergencyContacts.map((contact) => contact.toJson()).toList(),
    );
    await prefs.setString('emergency_contacts', contactsJson);
  }

  Future<void> triggerEmergencyResponse() async {
    // Start location tracking
    await _startLocationTracking();
    
    // Start audio recording
    await _startAudioRecording();
    
    // Send emergency notifications
    await _sendEmergencyNotifications();
    
    // Send location to emergency contacts (simulated)
    await _sendLocationToContacts();
  }

  Future<void> _startLocationTracking() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      
      onLocationUpdate?.call(_formatLocation(_currentPosition!));
      
      // Update location every 10 seconds during emergency
      _locationTimer = Timer.periodic(const Duration(seconds: 10), (timer) async {
        try {
          _currentPosition = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          onLocationUpdate?.call(_formatLocation(_currentPosition!));
        } catch (e) {
          print('Error updating location: $e');
        }
      });
    } catch (e) {
      print('Error getting location: $e');
      onLocationUpdate?.call('Location unavailable');
    }
  }

  Future<void> _startAudioRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        _audioFilePath = 'emergency_recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
        await _audioRecorder.start(const RecordConfig(), path: _audioFilePath!);
        _isRecording = true;
        onRecordingStatusChanged?.call(true);
      }
    } catch (e) {
      print('Error starting audio recording: $e');
    }
  }

  Future<void> _sendEmergencyNotifications() async {
    await NotificationService.showEmergencyNotification(
      'Emergency Alert',
      'Anomaly detected! Your location is being tracked and emergency contacts have been notified.',
    );
  }

  Future<void> _sendLocationToContacts() async {
    if (_currentPosition == null) return;
    
    final locationMessage = '''
🚨 EMERGENCY ALERT 🚨
Anomaly detected in walking pattern!
Location: ${_formatLocation(_currentPosition!)}
Time: ${DateTime.now().toString()}
Please check on me immediately!
    ''';

    // Simulate sending messages to emergency contacts
    for (final contact in _emergencyContacts) {
      await _simulateMessageSend(contact.phoneNumber, locationMessage);
    }
  }

  Future<void> _simulateMessageSend(String phoneNumber, String message) async {
    // For demo purposes, we'll just print the message
    // In a real app, this would integrate with SMS/WhatsApp API
    print('Sending to $phoneNumber: $message');
    
    // Simulate API call delay
    await Future.delayed(const Duration(milliseconds: 500));
  }

  Future<void> stopEmergencyResponse() async {
    _locationTimer?.cancel();
    
    if (_isRecording) {
      await _audioRecorder.stop();
      _isRecording = false;
      onRecordingStatusChanged?.call(false);
      onAudioRecorded?.call(_audioFilePath ?? '');
    }
    
    await NotificationService.showNotification(
      'Safety Alert',
      'Emergency response stopped. You are safe.',
    );
  }

  String _formatLocation(Position position) {
    return '${position.latitude.toStringAsFixed(6)}, ${position.longitude.toStringAsFixed(6)}';
  }

  Future<void> addEmergencyContact(EmergencyContact contact) async {
    _emergencyContacts.add(contact);
    await _saveEmergencyContacts();
  }

  Future<void> removeEmergencyContact(int index) async {
    if (index >= 0 && index < _emergencyContacts.length) {
      _emergencyContacts.removeAt(index);
      await _saveEmergencyContacts();
    }
  }

  Future<void> updateEmergencyContact(int index, EmergencyContact contact) async {
    if (index >= 0 && index < _emergencyContacts.length) {
      _emergencyContacts[index] = contact;
      await _saveEmergencyContacts();
    }
  }

  void dispose() {
    _locationTimer?.cancel();
    _audioRecorder.dispose();
  }
}

class EmergencyContact {

  EmergencyContact({
    required this.name,
    required this.phoneNumber,
    required this.isPrimary,
  });

  factory EmergencyContact.fromJson(Map<String, dynamic> json) {
    return EmergencyContact(
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      isPrimary: json['isPrimary'],
    );
  }
  final String name;
  final String phoneNumber;
  final bool isPrimary;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'isPrimary': isPrimary,
    };
  }
}
