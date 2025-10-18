import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SafetyTipsCard extends StatefulWidget {
  const SafetyTipsCard({super.key});

  @override
  State<SafetyTipsCard> createState() => _SafetyTipsCardState();
}

class _SafetyTipsCardState extends State<SafetyTipsCard>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  int _currentTip = 0;

  final List<SafetyTip> _safetyTips = [
    SafetyTip(
      title: 'Stay Alert',
      description:
          'Always be aware of your surroundings. Avoid using headphones in unfamiliar areas.',
      icon: Icons.visibility,
      color: Colors.blue,
    ),
    SafetyTip(
      title: 'Trust Your Instincts',
      description:
          'If something feels wrong, it probably is. Trust your gut feeling and take action.',
      icon: Icons.psychology,
      color: Colors.purple,
    ),
    SafetyTip(
      title: 'Share Your Location',
      description:
          'Let trusted contacts know where you are, especially when traveling alone.',
      icon: Icons.location_on,
      color: Colors.green,
    ),
    SafetyTip(
      title: 'Emergency Contacts',
      description:
          'Keep emergency contacts easily accessible and program them in your phone.',
      icon: Icons.contacts,
      color: Colors.orange,
    ),
    SafetyTip(
      title: 'Well-Lit Areas',
      description: 'Stick to well-lit, populated areas, especially at night.',
      icon: Icons.lightbulb,
      color: Colors.yellow,
    ),
    SafetyTip(
      title: 'Self-Defense',
      description:
          'Consider taking self-defense classes and carry personal safety devices.',
      icon: Icons.security,
      color: Colors.red,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Auto-advance tips
    Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        _nextTip();
      } else {
        timer.cancel();
      }
    });
  }

  void _nextTip() {
    _currentTip = (_currentTip + 1) % _safetyTips.length;
    _pageController.animateToPage(
      _currentTip,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: Colors.amber.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.amber.withOpacity(0.1),
              Colors.amber.withOpacity(0.05),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.tips_and_updates,
                  color: Colors.amber.shade700,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Safety Tips',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.amber.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${_currentTip + 1}/${_safetyTips.length}',
                    style: TextStyle(
                      color: Colors.amber.shade700,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 120,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentTip = index;
                  });
                },
                itemCount: _safetyTips.length,
                itemBuilder: (context, index) {
                  return _buildTipCard(_safetyTips[index]);
                },
              ),
            ),
            const SizedBox(height: 12),
            _buildPageIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(SafetyTip tip) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: tip.color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: tip.color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: tip.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(tip.icon, color: tip.color, size: 32),
              )
              .animate()
              .scale(duration: 600.ms, curve: Curves.elasticOut)
              .then()
              .shimmer(duration: 2000.ms, color: tip.color.withOpacity(0.3)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tip.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: tip.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tip.description,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _safetyTips.length,
        (index) =>
            Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentTip == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentTip == index
                        ? Colors.amber.shade700
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
                .animate(target: _currentTip == index ? 1 : 0)
                .scale(duration: 300.ms, curve: Curves.easeInOut),
      ),
    );
  }
}

class SafetyTip {

  SafetyTip({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
  final String title;
  final String description;
  final IconData icon;
  final Color color;
}
