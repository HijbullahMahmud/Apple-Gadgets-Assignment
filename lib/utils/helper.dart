import 'package:apple_gadgets_assignment/utils/strings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

printLog(String message) {
  if (kDebugMode) {
    print("----->${Strings.appName}<-------: $message");
  }
}

void hideKeyboard() {
  // This will hide the keyboard
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<bool> checkInternetConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile ||
      connectivityResult == ConnectivityResult.wifi) {
    try {
      final response = await http.get(Uri.parse(
          "http://www.google.com")); // You can replace this URL with any reliable server
      return response.statusCode == 200;
    } on Exception catch (_) {
      return false; // Unable to connect to the internet
    }
  } else {
    return false;
  }
}

showSnackBar(String message) {
  Future.delayed(const Duration(milliseconds: 300), () {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2), // Adjust the duration as needed
      ),
    );
  });
}
