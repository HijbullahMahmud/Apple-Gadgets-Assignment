import 'dart:convert';

import 'package:apple_gadgets_assignment/model/user_profile.dart';
import 'package:apple_gadgets_assignment/services/local_db_service.dart';
import 'package:apple_gadgets_assignment/utils/constants.dart';
import 'package:apple_gadgets_assignment/utils/helper.dart';
import 'package:apple_gadgets_assignment/utils/keys.dart';
import 'package:http/http.dart' as http;
import 'package:apple_gadgets_assignment/services/api_client.dart';

class NetworkService {
  Future<http.Response> login(
      {required String userName, required String password}) async {
    String endPoint = Constants.authEndPoint;
    var body = {"login": userName, "password": password};
    var response = await ApiClient.post(endPoint: endPoint, body: body);
    return response;
  }

  Future<UserProfile?> userProfile() async {
    String? token = await LocalDBService().getFromLocalDB(Keys.token);
    String? login = await LocalDBService().getFromLocalDB(Keys.loginId);
    if (token == null || login == null) return null;
    var body = {"login": login, "token": token};
    var response =
        await ApiClient.post(endPoint: Constants.profileEndPoint, body: body);
    if (response.statusCode == 200) {
      printLog("profile: ${jsonDecode(response.body)}");
      return UserProfile.fromJson(jsonDecode(response.body));
    } else {
      printLog("profile error: ${response.body}");
    }
    return null;
  }

  Future<String?> lastFourDigitsPhoneNumber() async {
    String? token = await LocalDBService().getFromLocalDB(Keys.token);
    String? login = await LocalDBService().getFromLocalDB(Keys.loginId);
    if (token == null || login == null) return null;
    var body = {"login": login, "token": token};
    var response = await ApiClient.post(
        endPoint: Constants.fourDigitsPhoneNumberEndPoint, body: body);
    if (response.statusCode == 200) {
      printLog("lastFourDigitsPhoneNumber: ${response.body}");
      return response.body;
    } else {
      printLog("lastFourDigitsPhoneNumber error: ${response.body}");
    }
    return null;
  }
}
