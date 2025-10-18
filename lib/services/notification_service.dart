import 'package:flutter/material.dart';

class NotificationService {
  factory NotificationService() => _instance;
  NotificationService._internal();
  static final NotificationService _instance = NotificationService._internal();

  static Future<void> initialize() async {
    // Initialize notification service
    // In a real app, this would use flutter_local_notifications
  }

  static Future<void> showNotification(String title, String body) async {
    // Show local notification
    // For demo purposes, we'll use a simple print statement
    print('Notification: $title - $body');
  }

  static Future<void> showEmergencyNotification(String title, String body) async {
    // Show emergency notification with high priority
    print('🚨 EMERGENCY NOTIFICATION: $title - $body');
  }

  static Future<void> showSafetyTip(String tip) async {
    print('💡 Safety Tip: $tip');
  }

  static void showSnackBar(BuildContext context, String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor ?? Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  static void showSuccessSnackBar(BuildContext context, String message) {
    showSnackBar(context, message, backgroundColor: Colors.green);
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    showSnackBar(context, message, backgroundColor: Colors.red);
  }

  static void showWarningSnackBar(BuildContext context, String message) {
    showSnackBar(context, message, backgroundColor: Colors.orange);
  }
}
