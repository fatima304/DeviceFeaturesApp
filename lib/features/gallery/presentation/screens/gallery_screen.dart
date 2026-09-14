import 'package:device_features_app/features/gallery/data/data_source/gallery_datasource.dart';
import 'package:device_features_app/features/gallery/presentation/manager/gallery_cubit.dart';
import 'package:device_features_app/features/gallery/presentation/manager/gallery_state.dart';
import 'package:device_features_app/features/gallery/presentation/screens/widgets/gallery_content.dart';
import 'package:device_features_app/features/gallery/presentation/screens/widgets/pick_image_button.dart';
import 'package:device_features_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Main gallery screen for displaying picked images
class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GalleryCubit(GalleryDataSource()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: const Text('My Gallery'),
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
        body: BlocBuilder<GalleryCubit, GalleryState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(child: GalleryContent(state: state)),
                  const SizedBox(height: 20),
                  PickImageButton(
                    isLoading: state.status == GalleryStatus.loading,
                    onPressed: () {
                      context.read<GalleryCubit>().pickImages();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
