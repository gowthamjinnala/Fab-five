import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:women_safety_app/services/anomaly_detection_service.dart';
import 'package:women_safety_app/services/emergency_service.dart';
import 'package:women_safety_app/widgets/safety_status_card.dart';
import 'package:women_safety_app/widgets/emergency_button.dart';
import 'package:women_safety_app/widgets/anomaly_detector_card.dart';
import 'package:women_safety_app/widgets/quick_actions_grid.dart';
import 'package:women_safety_app/widgets/safety_tips_card.dart';
import 'package:women_safety_app/widgets/demo_controls.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final AnomalyDetectionService _anomalyService = AnomalyDetectionService();
  final EmergencyService _emergencyService = EmergencyService();

  late AnimationController _pulseController;
  late AnimationController _shakeController;

  bool _isMonitoring = false;
  bool _isEmergencyMode = false;
  double _anomalyConfidence = 0.0;
  String _currentLocation = 'Getting location...';
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initializeServices();
    _setupAnimations();
  }

  void _initializeServices() {
    _anomalyService.onAnomalyDetected = _handleAnomalyDetected;
    _anomalyService.onNormalPattern = _handleNormalPattern;
    _anomalyService.onConfidenceUpdate = _handleConfidenceUpdate;

    _emergencyService.onLocationUpdate = _handleLocationUpdate;
    _emergencyService.onRecordingStatusChanged = _handleRecordingStatusChanged;

    _emergencyService.initialize();
  }

  void _setupAnimations() {
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  void _handleAnomalyDetected() {
    setState(() {
      _isEmergencyMode = true;
    });
    _shakeController.forward().then((_) {
      _shakeController.reverse();
    });
    _emergencyService.triggerEmergencyResponse();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🚨 Anomaly detected! Emergency response activated.'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _handleNormalPattern() {
    setState(() {
      _isEmergencyMode = false;
    });
  }

  void _handleConfidenceUpdate(double confidence) {
    setState(() {
      _anomalyConfidence = confidence;
    });
  }

  void _handleLocationUpdate(String location) {
    setState(() {
      _currentLocation = location;
    });
  }

  void _handleRecordingStatusChanged(bool isRecording) {
    setState(() {
      _isRecording = isRecording;
    });
  }

  void _toggleMonitoring() {
    setState(() {
      _isMonitoring = !_isMonitoring;
    });

    if (_isMonitoring) {
      _anomalyService.startMonitoring();
    } else {
      _anomalyService.stopMonitoring();
      _emergencyService.stopEmergencyResponse();
      setState(() {
        _isEmergencyMode = false;
        _anomalyConfidence = 0.0;
      });
    }
  }

  void _triggerManualEmergency() {
    _emergencyService.triggerEmergencyResponse();
    setState(() {
      _isEmergencyMode = true;
    });
  }

  void _stopEmergency() {
    _emergencyService.stopEmergencyResponse();
    setState(() {
      _isEmergencyMode = false;
    });
  }

  @override
  void dispose() {
    _anomalyService.dispose();
    _emergencyService.dispose();
    _pulseController.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _isEmergencyMode
                ? [Colors.red.withOpacity(0.1), Colors.red.withOpacity(0.05)]
                : [const Color(0xFF6C5CE7).withOpacity(0.1), Colors.white],
          ),
        ),
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              await _emergencyService.initialize();
              setState(() {});
            },
            child: CustomScrollView(
              slivers: [
                _buildAppBar(),
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      _buildSafetyStatusCard(),
                      const SizedBox(height: 16),
                      _buildAnomalyDetectorCard(),
                      const SizedBox(height: 16),
                      _buildQuickActionsGrid(),
                      const SizedBox(height: 16),
                      _buildSafetyTipsCard(),
                      const SizedBox(height: 16),
                      const DemoControls(),
                      const SizedBox(height: 32),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _buildEmergencyButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Women Safety',
          style: TextStyle(
            color: _isEmergencyMode ? Colors.red : Colors.white,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                offset: const Offset(0, 1),
                blurRadius: 3,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _isEmergencyMode
                  ? [Colors.red, Colors.red.shade700]
                  : [const Color(0xFF6C5CE7), const Color(0xFFA29BFE)],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Icon(
                      _isEmergencyMode ? Icons.emergency : Icons.security,
                      size: 32,
                      color: Colors.white,
                    )
                    .animate()
                    .scale(duration: 1000.ms, curve: Curves.elasticOut)
                    .then()
                    .shimmer(
                      duration: 2000.ms,
                      color: Colors.white.withOpacity(0.3),
                    ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/contacts');
          },
          icon: const Icon(Icons.contacts, color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          icon: const Icon(Icons.settings, color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildSafetyStatusCard() {
    return SafetyStatusCard(
      isMonitoring: _isMonitoring,
      isEmergencyMode: _isEmergencyMode,
      anomalyConfidence: _anomalyConfidence,
      currentLocation: _currentLocation,
      isRecording: _isRecording,
      onToggleMonitoring: _toggleMonitoring,
      onStopEmergency: _stopEmergency,
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildAnomalyDetectorCard() {
    return AnomalyDetectorCard(
          isMonitoring: _isMonitoring,
          anomalyConfidence: _anomalyConfidence,
          isEmergencyMode: _isEmergencyMode,
        )
        .animate()
        .fadeIn(delay: 200.ms, duration: 600.ms)
        .slideY(begin: 0.3, end: 0);
  }

  Widget _buildQuickActionsGrid() {
    return QuickActionsGrid(
          emergencyContacts: _emergencyService.emergencyContacts,
          onEmergencyContactTap: (contact) {
            // Handle emergency contact tap
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Calling ${contact.name}...'),
                backgroundColor: Colors.green,
              ),
            );
          },
        )
        .animate()
        .fadeIn(delay: 400.ms, duration: 600.ms)
        .slideY(begin: 0.3, end: 0);
  }

  Widget _buildSafetyTipsCard() {
    return const SafetyTipsCard()
        .animate()
        .fadeIn(delay: 600.ms, duration: 600.ms)
        .slideY(begin: 0.3, end: 0);
  }

  Widget _buildEmergencyButton() {
    return EmergencyButton(
          isEmergencyMode: _isEmergencyMode,
          onPressed: _isEmergencyMode
              ? _stopEmergency
              : _triggerManualEmergency,
        )
        .animate(target: _isEmergencyMode ? 1 : 0)
        .scale(duration: 300.ms)
        .then()
        .shimmer(
          duration: 2000.ms,
          color: _isEmergencyMode
              ? Colors.red.withOpacity(0.3)
              : Colors.white.withOpacity(0.3),
        );
  }
}
