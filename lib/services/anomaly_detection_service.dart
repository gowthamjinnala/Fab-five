import 'dart:math';
import 'dart:async';
import 'package:sensors_plus/sensors_plus.dart';

class AnomalyDetectionService {
  factory AnomalyDetectionService() => _instance;
  AnomalyDetectionService._internal();
  static final AnomalyDetectionService _instance = AnomalyDetectionService._internal();

  StreamSubscription<AccelerometerEvent>? _accelerometerSubscription;
  StreamSubscription<GyroscopeEvent>? _gyroscopeSubscription;

  final List<double> _accelerationHistory = [];
  final List<double> _velocityHistory = [];
  final List<double> _gyroscopeHistory = [];

  bool _isMonitoring = false;
  bool _anomalyDetected = false;

  // Thresholds for anomaly detection
  static const double accelerationThreshold = 15.0; // m/s²
  static const double velocityThreshold = 10.0; // m/s
  static const double gyroscopeThreshold = 5.0; // rad/s
  static const int historySize = 10;

  // Callbacks
  Function()? onAnomalyDetected;
  Function()? onNormalPattern;
  Function(double confidence)? onConfidenceUpdate;

  bool get isMonitoring => _isMonitoring;
  bool get anomalyDetected => _anomalyDetected;

  void startMonitoring() {
    if (_isMonitoring) return;

    _isMonitoring = true;
    _anomalyDetected = false;
    _accelerationHistory.clear();
    _velocityHistory.clear();
    _gyroscopeHistory.clear();

    _accelerometerSubscription = accelerometerEvents.listen((AccelerometerEvent event) {
      _processAccelerometerData(event.x, event.y, event.z);
    });

    _gyroscopeSubscription = gyroscopeEvents.listen((GyroscopeEvent event) {
      _processGyroscopeData(event.x, event.y, event.z);
    });
  }

  void stopMonitoring() {
    _isMonitoring = false;
    _accelerometerSubscription?.cancel();
    _gyroscopeSubscription?.cancel();
  }

  void _processAccelerometerData(double x, double y, double z) {
    // Calculate magnitude of acceleration
    double magnitude = sqrt(x * x + y * y + z * z);
    
    // Calculate velocity (simplified integration)
    double velocity = magnitude * 0.1; // Assuming 0.1s time step

    _accelerationHistory.add(magnitude);
    _velocityHistory.add(velocity);

    // Keep only recent history
    if (_accelerationHistory.length > historySize) {
      _accelerationHistory.removeAt(0);
    }
    if (_velocityHistory.length > historySize) {
      _velocityHistory.removeAt(0);
    }

    _detectAnomalies();
  }

  void _processGyroscopeData(double x, double y, double z) {
    double magnitude = sqrt(x * x + y * y + z * z);
    _gyroscopeHistory.add(magnitude);

    if (_gyroscopeHistory.length > historySize) {
      _gyroscopeHistory.removeAt(0);
    }
  }

  void _detectAnomalies() {
    if (_accelerationHistory.length < historySize) return;

    // Calculate statistical measures
    double maxAcceleration = _accelerationHistory.reduce((a, b) => a > b ? a : b);
    double maxVelocity = _velocityHistory.reduce((a, b) => a > b ? a : b);

    // Calculate anomaly score (0-100)
    double anomalyScore = 0;

    // Check for sudden acceleration spikes
    if (maxAcceleration > accelerationThreshold) {
      anomalyScore += (maxAcceleration - accelerationThreshold) * 2;
    }

    // Check for sudden velocity changes
    if (maxVelocity > velocityThreshold) {
      anomalyScore += (maxVelocity - velocityThreshold) * 2;
    }

    // Check for irregular patterns
    double variance = _calculateVariance(_accelerationHistory);
    if (variance > 5.0) {
      anomalyScore += variance;
    }

    // Check for gyroscope anomalies (phone being shaken/thrown)
    if (_gyroscopeHistory.isNotEmpty) {
      double avgGyroscope = _gyroscopeHistory.reduce((a, b) => a + b) / _gyroscopeHistory.length;
      if (avgGyroscope > gyroscopeThreshold) {
        anomalyScore += avgGyroscope * 2;
      }
    }

    // Normalize score to 0-100
    double confidence = min(anomalyScore, 100.0);

    onConfidenceUpdate?.call(confidence);

    // Detect anomaly if confidence > 70
    bool wasAnomalyDetected = _anomalyDetected;
    _anomalyDetected = confidence > 70;

    if (_anomalyDetected && !wasAnomalyDetected) {
      onAnomalyDetected?.call();
    } else if (!_anomalyDetected && wasAnomalyDetected) {
      onNormalPattern?.call();
    }
  }

  double _calculateVariance(List<double> values) {
    if (values.isEmpty) return 0;
    
    double mean = values.reduce((a, b) => a + b) / values.length;
    double variance = values.map((x) => pow(x - mean, 2)).reduce((a, b) => a + b) / values.length;
    return sqrt(variance);
  }

  // Demo mode for hackathon presentation
  void simulateAnomaly() {
    _anomalyDetected = true;
    onAnomalyDetected?.call();
    onConfidenceUpdate?.call(85.0);
  }

  void simulateNormalPattern() {
    _anomalyDetected = false;
    onNormalPattern?.call();
    onConfidenceUpdate?.call(15.0);
  }

  void dispose() {
    stopMonitoring();
  }
}
