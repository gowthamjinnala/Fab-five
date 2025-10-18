import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:women_safety_app/services/anomaly_detection_service.dart';

class DemoControls extends StatefulWidget {
  const DemoControls({super.key});

  @override
  State<DemoControls> createState() => _DemoControlsState();
}

class _DemoControlsState extends State<DemoControls> {
  final AnomalyDetectionService _anomalyService = AnomalyDetectionService();
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.indigo.withOpacity(0.3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.indigo.withOpacity(0.1),
              Colors.indigo.withOpacity(0.05),
            ],
          ),
        ),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.science, color: Colors.indigo),
              title: Text(
                'Demo Controls',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: const Text('Simulate scenarios for demo'),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                icon: Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.indigo,
                ),
              ),
            ),
            if (_isExpanded) ...[
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildDemoButton(
                      'Simulate Anomaly',
                      'Trigger anomaly detection for demo',
                      Icons.warning,
                      Colors.red,
                      () => _simulateAnomaly(),
                    ),
                    const SizedBox(height: 12),
                    _buildDemoButton(
                      'Simulate Normal Pattern',
                      'Reset to normal walking pattern',
                      Icons.check_circle,
                      Colors.green,
                      () => _simulateNormalPattern(),
                    ),
                    const SizedBox(height: 12),
                    _buildDemoButton(
                      'Show Safety Alert',
                      'Display safety notification',
                      Icons.notifications,
                      Colors.orange,
                      () => _showSafetyAlert(),
                    ),
                    const SizedBox(height: 12),
                    _buildInfoCard(),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.3, end: 0);
  }

  Widget _buildDemoButton(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: color.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.play_arrow, color: color, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
      ),
      child: const Row(
        children: [
          Icon(Icons.info, color: Colors.blue, size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'These controls are for demonstration purposes only. In a real scenario, the app would automatically detect anomalies using phone sensors.',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _simulateAnomaly() {
    _anomalyService.simulateAnomaly();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('🚨 Simulating anomaly detection...'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _simulateNormalPattern() {
    _anomalyService.simulateNormalPattern();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Simulating normal pattern...'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showSafetyAlert() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          '⚠️ Safety tip: Always stay alert and trust your instincts!',
        ),
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
