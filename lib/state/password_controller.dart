import 'package:get/get.dart';

class PasswordController extends GetxController {
  var oldPassword = ''.obs;
  var newPassword = ''.obs;
  var confirmPassword = ''.obs;

  // Password Update Logic
  void updatePassword() {
    if (newPassword.value != confirmPassword.value) {
      Get.snackbar("Error", "Passwords do not match");
    } else {
      // You can call your API or backend here for password update
      Get.snackbar("Success", "Password updated successfully");
    }
  }
}
