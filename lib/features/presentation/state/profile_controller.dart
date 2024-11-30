import 'dart:typed_data';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var image = Rx<Uint8List?>(null); // Observable for the profile image
  var name = ''.obs;
  var surname = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;

  // Method to select an image
  void selectImage(Uint8List? img) {
    image.value = img;
  }

  // Method to update profile details
  void updateProfile() {
    print('Name: ${name.value}, Surname: ${surname.value}, Email: ${email.value}, Phone: ${phone.value}');
    // Handle profile update logic (e.g., API call)
  }
}
