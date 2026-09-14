import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

// Button widget for triggering image picker
class PickImageButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const PickImageButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: const Icon(Icons.add_photo_alternate_outlined),
        label: const Text('Pick Image'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
