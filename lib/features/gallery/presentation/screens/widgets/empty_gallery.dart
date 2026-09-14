import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

// Widget for displaying empty state when no images are selected
class EmptyGallery extends StatelessWidget {
  const EmptyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.photo_library_outlined,
            size: 80,
            color: AppColors.primary.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 16),
          Text('No Images Yet', style: AppTextStyles.heading),
          const SizedBox(height: 8),
          Text(
            'Pick images from your device gallery\nto see them here.',
            style: AppTextStyles.body,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
