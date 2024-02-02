import 'package:apple_gadgets_assignment/app/controllers/profile_controller.dart';
import 'package:apple_gadgets_assignment/app/routes.dart';
import 'package:apple_gadgets_assignment/app/views/widgets/custom_button.dart';
import 'package:apple_gadgets_assignment/model/profile_response.dart';
import 'package:apple_gadgets_assignment/model/user_profile.dart';
import 'package:apple_gadgets_assignment/utils/dimensions.dart';
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
      body: FutureBuilder<ProfileResponse?>(
        future: controller.getProfileAndPhoneNumber(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            ProfileResponse response = snapshot.data!;
            UserProfile? profile = response.userProfile;
            String? number = response.phoneNumber;
            return _buildProfile(context, profile, number);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _buildProfile(
      BuildContext context, UserProfile? profile, String? number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ListView(
          children: [
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
            const SizedBox(height: Dimensions.defaultPadding),
            _profileTile("Name: ${profile?.name}", context),
            _profileTile("Last 4 digits phone: $number", context),
            _profileTile("Phone: ${profile?.phone}", context),
            _profileTile("Address: ${profile?.address}", context),
            _profileTile(
                "TotalTradesCount: ${profile?.totalTradesCount}", context),
            _profileTile(
                "TotalTradesVolume: ${profile?.totalTradesVolume}", context),
            _profileTile("Balance: ${profile?.balance}", context),
            const SizedBox(height: 50),
            CustomButton(
                onPressed: () {
                  Get.toNamed(Routes.tradeListScreen);
                },
                label: const Text(Strings.seeTradeList))
          ],
        ),
      ),
    );
  }

  ListTile _profileTile(String? label, BuildContext context) {
    return ListTile(
      title: Text(label ?? ''),
      titleTextStyle: Theme.of(context).textTheme.bodyMedium,
      dense: true,
    );
  }
}
