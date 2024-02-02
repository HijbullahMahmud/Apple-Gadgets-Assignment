import 'package:apple_gadgets_assignment/app/routes.dart';
import 'package:apple_gadgets_assignment/app/theme/custom_theme.dart';
import 'package:apple_gadgets_assignment/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      theme: CustomTheme.lightTheme,
      routes: Routes.list,
      initialRoute: Routes.splashScreen,
       
    );
  }
}
 