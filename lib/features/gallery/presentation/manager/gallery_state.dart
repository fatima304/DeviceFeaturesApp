import 'package:image_picker/image_picker.dart';

// State management for gallery screen
enum GalleryStatus { initial, loading, success, error }

class GalleryState {
  final GalleryStatus status;
  final List<XFile> images;
  final String? errorMessage;

  const GalleryState({
    this.status = GalleryStatus.initial,
    this.images = const [],
    this.errorMessage,
  });
}
