import 'package:apple_gadgets_assignment/app/controllers/splash_controller.dart';
import 'package:apple_gadgets_assignment/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
    SplashScreen({super.key});

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        Strings.welcome,
        style: Theme.of(context).textTheme.labelLarge,
      )),
    );
  }
}
