import 'package:get/get.dart';

class SettingsController extends GetxController {
  // Reactive state variables
  var isEmailOn = false.obs;
  var isWhatsappOn = false.obs;
  var isPushOn = false.obs;

  // Methods to toggle states
  void toggleEmailNotification(bool value) {
    isEmailOn.value = value;
  }

  void toggleWhatsappNotification(bool value) {
    isWhatsappOn.value = value;
  }

  void togglePushNotification(bool value) {
    isPushOn.value = value;
  }
}
