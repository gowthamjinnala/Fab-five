import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:women_safety_app/widgets/gradient_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  int _currentPage = 0;

  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Smart Safety',
      subtitle: 'AI-Powered Protection',
      description:
          'Advanced anomaly detection keeps you safe by monitoring your walking patterns and detecting unusual behavior.',
      icon: Icons.security,
      color: const Color(0xFF6C5CE7),
    ),
    OnboardingPage(
      title: 'Real-time Monitoring',
      subtitle: 'Always Watching',
      description:
          'Passive monitoring using phone sensors detects sudden movements, stops, or changes in walking patterns.',
      icon: Icons.radar,
      color: const Color(0xFF00B894),
    ),
    OnboardingPage(
      title: 'Instant Response',
      subtitle: 'Emergency Ready',
      description:
          'Automatic emergency response with live location sharing, audio recording, and instant contact notifications.',
      icon: Icons.emergency,
      color: const Color(0xFFE84393),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _pages[_currentPage].color.withOpacity(0.1),
              _pages[_currentPage].color.withOpacity(0.05),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                    _animationController.reset();
                    _animationController.forward();
                  },
                  itemCount: _pages.length,
                  itemBuilder: (context, index) {
                    return FadeTransition(
                      opacity: _fadeAnimation,
                      child: _buildPage(_pages[index]),
                    );
                  },
                ),
              ),
              _buildPageIndicator(),
              _buildBottomSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPage(OnboardingPage page) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: page.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Icon(page.icon, size: 60, color: page.color),
              )
              .animate()
              .scale(duration: 600.ms, curve: Curves.elasticOut)
              .then()
              .shimmer(duration: 1500.ms, color: page.color.withOpacity(0.3)),

          const SizedBox(height: 40),

          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                page.title,
                textStyle: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: page.color,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],
            totalRepeatCount: 1,
          ),

          const SizedBox(height: 16),

          Text(
                page.subtitle,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              )
              .animate()
              .fadeIn(delay: 300.ms, duration: 600.ms)
              .slideY(begin: 0.3, end: 0),

          const SizedBox(height: 24),

          Text(
                page.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[700],
                  height: 1.6,
                ),
              )
              .animate()
              .fadeIn(delay: 600.ms, duration: 800.ms)
              .slideY(begin: 0.3, end: 0),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _pages.length,
        (index) =>
            Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? _pages[_currentPage].color
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                )
                .animate(target: _currentPage == index ? 1 : 0)
                .scale(duration: 300.ms, curve: Curves.easeInOut),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          GradientButton(
                text: _currentPage == _pages.length - 1
                    ? 'Get Started'
                    : 'Next',
                onPressed: () {
                  if (_currentPage == _pages.length - 1) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    // PageView will handle the transition
                  }
                },
                gradient: LinearGradient(
                  colors: [
                    _pages[_currentPage].color,
                    _pages[_currentPage].color.withOpacity(0.8),
                  ],
                ),
              )
              .animate()
              .fadeIn(delay: 900.ms, duration: 600.ms)
              .slideY(begin: 0.3, end: 0),

          const SizedBox(height: 16),

          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: _pages[_currentPage].color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ).animate().fadeIn(delay: 1200.ms, duration: 600.ms),
        ],
      ),
    );
  }
}

class OnboardingPage {

  OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.color,
  });
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;
  final Color color;
}
