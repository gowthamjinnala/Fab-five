import 'package:flutter/material.dart';

class SafetyStatusCard extends StatelessWidget {

  const SafetyStatusCard({
    super.key,
    required this.isMonitoring,
    required this.isEmergencyMode,
    required this.anomalyConfidence,
    required this.currentLocation,
    required this.isRecording,
    required this.onToggleMonitoring,
    required this.onStopEmergency,
  });
  final bool isMonitoring;
  final bool isEmergencyMode;
  final double anomalyConfidence;
  final String currentLocation;
  final bool isRecording;
  final VoidCallback onToggleMonitoring;
  final VoidCallback onStopEmergency;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: isEmergencyMode
          ? Colors.red.withOpacity(0.3)
          : Colors.blue.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isEmergencyMode
                ? [Colors.red.withOpacity(0.1), Colors.red.withOpacity(0.05)]
                : [Colors.blue.withOpacity(0.1), Colors.blue.withOpacity(0.05)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isEmergencyMode ? Icons.emergency : Icons.security,
                  color: isEmergencyMode ? Colors.red : Colors.blue,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  isEmergencyMode ? 'EMERGENCY MODE' : 'Safety Status',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: isEmergencyMode ? Colors.red : Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isEmergencyMode
                        ? Colors.red.withOpacity(0.2)
                        : (isMonitoring
                              ? Colors.green.withOpacity(0.2)
                              : Colors.grey.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isEmergencyMode
                        ? 'ALERT'
                        : (isMonitoring ? 'ACTIVE' : 'INACTIVE'),
                    style: TextStyle(
                      color: isEmergencyMode
                          ? Colors.red
                          : (isMonitoring ? Colors.green : Colors.grey),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            if (isEmergencyMode) ...[
              _buildEmergencyInfo(context),
            ] else ...[
              _buildMonitoringInfo(context),
            ],

            const SizedBox(height: 20),

            if (isEmergencyMode)
              _buildStopEmergencyButton(context)
            else
              _buildToggleButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyInfo(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Location: $currentLocation',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Icon(
                isRecording ? Icons.mic : Icons.mic_off,
                color: Colors.red,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                isRecording ? 'Recording in progress...' : 'Recording stopped',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMonitoringInfo(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.location_on, color: Colors.grey[600], size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Location: $currentLocation',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(Icons.radar, color: Colors.grey[600], size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Anomaly Confidence: ${anomalyConfidence.toStringAsFixed(1)}%',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        if (anomalyConfidence > 0) ...[
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: anomalyConfidence / 100,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              anomalyConfidence > 70 ? Colors.red : Colors.orange,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildToggleButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onToggleMonitoring,
        icon: Icon(
          isMonitoring ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
        ),
        label: Text(
          isMonitoring ? 'Stop Monitoring' : 'Start Monitoring',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: isMonitoring ? Colors.orange : Colors.blue,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _buildStopEmergencyButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onStopEmergency,
        icon: const Icon(Icons.stop, color: Colors.white),
        label: const Text(
          'Stop Emergency',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
