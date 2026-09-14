import 'package:device_features_app/features/gallery/data/data_source/gallery_datasource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'gallery_state.dart';

// Cubit for managing gallery state and image selection
class GalleryCubit extends Cubit<GalleryState> {
  final GalleryDataSource _dataSource;

  GalleryCubit(this._dataSource) : super(const GalleryState());

  // Integration with device gallery using image_picker package
  Future<void> pickImages() async {
    emit(const GalleryState(status: GalleryStatus.loading));

    try {
      // Fetch selected images from the data source.
      final images = await _dataSource.pickImages();

      // Empty list means user cancelled selection - treat as success with empty state
      emit(GalleryState(status: GalleryStatus.success, images: images));
    } catch (e) {
      emit(
        GalleryState(status: GalleryStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
