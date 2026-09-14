import 'dart:io';

import 'package:device_features_app/features/gallery/presentation/manager/gallery_state.dart';
import 'package:device_features_app/features/gallery/presentation/screens/widgets/empty_gallery.dart';
import 'package:device_features_app/features/gallery/presentation/screens/widgets/gallery_error.dart';
import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

// Widget for displaying gallery content based on current state
class GalleryContent extends StatelessWidget {
  final GalleryState state;

  const GalleryContent({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    switch (state.status) {
      case GalleryStatus.initial:
      case GalleryStatus.success:
        if (state.images.isEmpty) {
          return const EmptyGallery();
        }

        return ListView.separated(
          itemCount: state.images.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 300),
                child: Image.file(
                  File(state.images[index].path),
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
            );
          },
        );

      case GalleryStatus.loading:
        return const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        );

      case GalleryStatus.error:
        return GalleryError(message: state.errorMessage);
    }
  }
}
