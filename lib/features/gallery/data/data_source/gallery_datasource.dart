import 'package:image_picker/image_picker.dart';

// Data source for gallery integration using image_picker package
class GalleryDataSource {
  Future<List<XFile>> pickImages() {
    final ImagePicker picker = ImagePicker();
    return picker.pickMultiImage();
  }
}
