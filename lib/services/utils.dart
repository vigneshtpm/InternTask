import 'package:image_picker/image_picker.dart'; // Correct import
import 'dart:typed_data';

Future<Uint8List?> pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  try {
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    }
  } catch (e) {
    print('Error picking image: $e');
  }
  return null; // Return null if no image was selected
}



