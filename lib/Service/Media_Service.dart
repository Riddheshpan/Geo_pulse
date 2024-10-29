import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MediaService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
