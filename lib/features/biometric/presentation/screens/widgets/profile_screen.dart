import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                child: Icon(Icons.person, size: 60, color: AppColors.primary),
              ),
              const SizedBox(height: 24),
              Text('Fatma Atef Mansour', style: AppTextStyles.heading),
              const SizedBox(height: 8),
              Text('fatma@gmail.com', style: AppTextStyles.body),
            ],
          ),
        ),
      ),
    );
  }
}
