import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interntask/features/presentation/pages/changepass.dart';
import 'package:interntask/features/presentation/pages/editprofile.dart';
import 'package:interntask/features/presentation/state/SettingsController.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAECF0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2044FF),
        title: const Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23.0,
            fontFamily: 'Euclid',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Desktop view
            return Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: buildSettingsContent(context),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Obx(() {
                    // Dynamically show Edit Profile or Change Password page
                    return controller.currentPage.value == 'editProfile'
                        ? EditProfilePage()
                        : PasswordPage();
                  }),
                ),
              ],
            );
          } else {
            // Mobile view
            return SingleChildScrollView(
              child: buildSettingsContent(context),
            );
          }
        },
      ),
    );
  }

  Widget buildSettingsContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 16.0),
          child: Text(
            'General',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Euclid',
            ),
          ),
        ),
        buildSectionTile(
          context: context,
          iconPath: 'assets/icons/edit.png',
          title: 'Edit Profile',
          onTap: () {
            if (MediaQuery.of(context).size.width > 800) {
              // For larger screens (desktop), update the page state using the controller
              controller.setCurrentPage('editProfile');
            } else {
              // For smaller screens (mobile), navigate to PasswordPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              );
            }
          },
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 5.0),
          child: Text(
            'Security',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Euclid',
            ),
          ),
        ),
        buildSectionTile(
          context: context,
          iconPath: 'assets/icons/padlock.png',
          title: 'Change Password',
          onTap: () {
            if (MediaQuery.of(context).size.width > 800) {
              // For larger screens (desktop), update the page state using the controller
              controller.setCurrentPage('changePassword');
            } else {
              // For smaller screens (mobile), navigate to PasswordPage
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PasswordPage()),
              );
            }
          },

        ),
        const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 5.0),
          child: Text(
            'Notifications',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Euclid',
            ),
          ),
        ),
        Obx(() => buildNotificationSwitch(
              iconPath: 'assets/icons/email.png',
              title: 'Email Notification',
              value: controller.isEmailOn.value,
              onChanged: controller.toggleEmailNotification,
            )),
        Obx(() => buildNotificationSwitch(
              iconPath: 'assets/icons/conversation.png',
              title: 'Whatsapp',
              value: controller.isWhatsappOn.value,
              onChanged: controller.toggleWhatsappNotification,
            )),
        Obx(() => buildNotificationSwitch(
              iconPath: 'assets/icons/notification-bell.png',
              title: 'Push',
              value: controller.isPushOn.value,
              onChanged: controller.togglePushNotification,
            )),
        const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 5.0),
          child: Text(
            'Support & About',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Euclid',
            ),
          ),
        ),
        buildSectionTile(
          context: context,
          iconPath: 'assets/icons/speech-ballon.png',
          title: 'Help & Support',
          onTap: () {},
        ),
        buildSectionTile(
          context: context,
          iconPath: 'assets/icons/condition.png',
          title: 'Terms and Policies',
          onTap: () {},
        ),
      ],
    );
  }

  Widget buildSectionTile({
    required BuildContext context,
    required String iconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconPath,
                  width: 24.0,
                  height: 24.0,
                ),
                const SizedBox(width: 16.0),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Euclid',
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(6.0),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for notification switches
  Widget buildNotificationSwitch({
    required String iconPath,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 5, bottom: 5, right: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  iconPath,
                  width: 24.0,
                  height: 24.0,
                ),
                const SizedBox(width: 16.0),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Euclid',
                  ),
                ),
              ],
            ),
            Transform.scale(
              scale: 0.8,
              child: Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.white,
                activeTrackColor: const Color(0xFF2044FF),
                inactiveThumbColor: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
