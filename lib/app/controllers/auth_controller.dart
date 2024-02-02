import 'dart:convert';

import 'package:apple_gadgets_assignment/app/routes.dart';
import 'package:apple_gadgets_assignment/services/local_db_service.dart';
import 'package:apple_gadgets_assignment/services/network_service.dart';
import 'package:apple_gadgets_assignment/utils/helper.dart';
import 'package:apple_gadgets_assignment/utils/keys.dart';
import 'package:apple_gadgets_assignment/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;
  bool isLoading = false;

  void toggleIsObscure() {
    isObscure = !isObscure;
    update(['obscure']);
  }

  void _toggleLoading() {
    isLoading = !isLoading;
    update();
  }

  Future<void> login() async {
    _toggleLoading();
    hideKeyboard();
    //cjeck internet connection
    if (await checkInternetConnectivity() == false) {
      showSnackBar(Strings.noInternet);
      _toggleLoading();
      return;
    }
    //login functionality
    var response = await NetworkService().login(
        userName: userNameController.text.toString(),
        password: passwordController.text.toString());
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      var token = jsonBody['token'];
      var result = jsonBody['result'];
      printLog("login: $token, $result");
      if (result) {
        LocalDBService().saveToLocalDB(Keys.token, token);
        Get.offAllNamed(Routes.profileScreen);
      } else {
        showSnackBar(Strings.errorLogin);
      }
    } else {
      showSnackBar(Strings.errorLogin);
    }
    _toggleLoading();
  }
}
