import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

// Widget for displaying error state when image picking fails
class GalleryError extends StatelessWidget {
  final String? message;

  const GalleryError({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 60, color: AppColors.error),
          const SizedBox(height: 16),
          Text(
            message ?? 'Something went wrong',
            style: AppTextStyles.error,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
