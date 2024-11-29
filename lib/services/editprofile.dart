import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interntask/services/utils.dart';
import 'package:interntask/state/profile_controller.dart'; // Import your controller

class EditProfilePage extends StatelessWidget {
  // You can now use the ProfileController with GetX
  final ProfileController _controller = Get.put(ProfileController());

  // Method to select an image from the gallery or camera
  void selectImage() async {
    try {
      Uint8List? img = await pickImage(ImageSource.gallery); // Assuming pickImage is your method
      _controller.selectImage(img); // Update the image in the controller
    } catch (e) {
      print('Error selecting image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2044FF),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontSize: 23.0,
            fontFamily: 'Euclid',
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios, // iOS-style back arrow
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFFEAECF0), // Background color of the container
          ),
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Stack(
              children: [
                // Profile Image and Text Fields
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                      child: Stack(
                        children: [
                          // Reactive profile image
                          Obx(() {
                            return _controller.image.value != null
                                ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(_controller.image.value!),
                            )
                                : const CircleAvatar(
                              radius: 64,
                              backgroundImage: AssetImage('assets/images/profile.jpg'),
                            );
                          }),
                          // Camera Icon Button Overlay
                          Positioned(
                            bottom: 3,
                            left: 95,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF2044FF),
                                shape: BoxShape.circle,
                              ),
                              width: 33,
                              height: 31,
                              child: IconButton(
                                onPressed: selectImage,
                                icon: const Icon(Icons.camera_alt_outlined),
                                color: Colors.white,
                                iconSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Text Fields Section (Reactive Text Fields)
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First Name Field
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              'First Name',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Euclid',
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              _controller.name.value = value; // Update the name in controller
                            },
                            decoration: InputDecoration(
                              hintText: "Vigneshwaran",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF2044FF), width: 1.0),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              'Last Name',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Euclid',
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              _controller.surname.value = value; // Update the name in controller
                            },
                            decoration: InputDecoration(
                              hintText: "Krishnamoorthy",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF2044FF), width: 1.0),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Euclid',
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              _controller.email.value = value; // Update the name in controller
                            },
                            decoration: InputDecoration(
                              hintText: "vigneshwaranrk2@gmail.com",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF2044FF), width: 1.0),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: 'Euclid',
                              ),
                            ),
                          ),
                          TextField(
                            onChanged: (value) {
                              _controller.phone.value = value; // Update the name in controller
                            },
                            decoration: InputDecoration(
                              hintText: "8248084792",
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Color(0xFF2044FF), width: 1.0),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  const SizedBox(height: 100),
                                  ElevatedButton(
                                    onPressed: () {
                                      _controller.updateProfile();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      backgroundColor: const Color(0xFF2044FF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: const Text(
                                      'Update account information',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: 'Euclid',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
