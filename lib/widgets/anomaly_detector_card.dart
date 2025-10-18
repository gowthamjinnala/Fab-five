import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnomalyDetectorCard extends StatelessWidget {

  const AnomalyDetectorCard({
    super.key,
    required this.isMonitoring,
    required this.anomalyConfidence,
    required this.isEmergencyMode,
  });
  final bool isMonitoring;
  final double anomalyConfidence;
  final bool isEmergencyMode;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.purple.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.purple.withOpacity(0.1),
              Colors.purple.withOpacity(0.05),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.radar, color: Colors.purple, size: 24),
                const SizedBox(width: 12),
                Text(
                  'Anomaly Detection',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.purple,
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
                    color: isMonitoring
                        ? Colors.green.withOpacity(0.2)
                        : Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    isMonitoring ? 'SCANNING' : 'OFFLINE',
                    style: TextStyle(
                      color: isMonitoring ? Colors.green : Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            if (isMonitoring) ...[
              _buildSensorStatus(context),
              const SizedBox(height: 16),
              _buildConfidenceMeter(context),
              const SizedBox(height: 16),
              _buildSensorVisualization(context),
            ] else ...[
              _buildOfflineMessage(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSensorStatus(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSensorIndicator('Accelerometer', true, Colors.green),
        _buildSensorIndicator('Gyroscope', true, Colors.blue),
        _buildSensorIndicator('Location', true, Colors.orange),
      ],
    );
  }

  Widget _buildSensorIndicator(String name, bool isActive, Color color) {
    return Column(
      children: [
        Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive
                    ? color.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.2),
                border: Border.all(
                  color: isActive ? color : Colors.grey,
                  width: 2,
                ),
              ),
              child: Center(
                child: Icon(
                  isActive ? Icons.check : Icons.close,
                  color: isActive ? color : Colors.grey,
                  size: 20,
                ),
              ),
            )
            .animate(target: isActive ? 1 : 0)
            .scale(duration: 300.ms)
            .then()
            .shimmer(duration: 2000.ms, color: color.withOpacity(0.3)),
        const SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            fontSize: 12,
            color: isActive ? color : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildConfidenceMeter(BuildContext context) {
    Color meterColor;
    String status;

    if (anomalyConfidence > 70) {
      meterColor = Colors.red;
      status = 'HIGH RISK';
    } else if (anomalyConfidence > 40) {
      meterColor = Colors.orange;
      status = 'MEDIUM RISK';
    } else {
      meterColor = Colors.green;
      status = 'SAFE';
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Risk Level',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: meterColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: meterColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[200],
          ),
          child: Stack(
            children: [
              Container(
                    height: 20,
                    width:
                        MediaQuery.of(context).size.width *
                        (anomalyConfidence / 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [meterColor.withOpacity(0.7), meterColor],
                      ),
                    ),
                  )
                  .animate()
                  .scaleX(duration: 500.ms, curve: Curves.easeOut)
                  .then()
                  .shimmer(
                    duration: 1000.ms,
                    color: meterColor.withOpacity(0.3),
                  ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${anomalyConfidence.toStringAsFixed(1)}%',
          style: TextStyle(
            color: meterColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSensorVisualization(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Stack(
        children: [
          // Animated waveform visualization
          Positioned.fill(
            child: CustomPaint(
              painter: WaveformPainter(
                confidence: anomalyConfidence,
                isEmergencyMode: isEmergencyMode,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isEmergencyMode ? Icons.warning : Icons.radar,
                  color: isEmergencyMode ? Colors.red : Colors.purple,
                  size: 24,
                ),
                const SizedBox(height: 4),
                Text(
                  isEmergencyMode ? 'Anomaly Detected!' : 'Monitoring Active',
                  style: TextStyle(
                    color: isEmergencyMode ? Colors.red : Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineMessage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          const Icon(Icons.radar_outlined, color: Colors.grey, size: 48),
          const SizedBox(height: 12),
          Text(
            'Anomaly Detection Offline',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start monitoring to enable real-time anomaly detection and safety alerts.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {

  WaveformPainter({required this.confidence, required this.isEmergencyMode});
  final double confidence;
  final bool isEmergencyMode;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isEmergencyMode ? Colors.red : Colors.purple
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    final waveHeight = (confidence / 100) * (size.height * 0.8);
    final centerY = size.height / 2;

    for (double x = 0; x < size.width; x += 2) {
      final y =
          centerY +
          sin(x * 0.1 + DateTime.now().millisecondsSinceEpoch * 0.01) *
              waveHeight;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
