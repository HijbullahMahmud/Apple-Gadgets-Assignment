import 'package:apple_gadgets_assignment/app/controllers/profile_controller.dart';
import 'package:apple_gadgets_assignment/utils/keys.dart';
import 'package:apple_gadgets_assignment/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  ProfileController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.profile),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String result) {
              if (result == Keys.logout) {
                controller.logout();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: Keys.logout,
                child: const Text(Strings.logout),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
