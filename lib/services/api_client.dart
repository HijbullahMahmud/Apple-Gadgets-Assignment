// ignore_for_file: non_constant_identifier_names
import 'dart:async';
import 'dart:convert';

import 'package:apple_gadgets_assignment/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<http.Response> get({required String endPoint}) async {
    var headers = {'Accept': 'application/json'};
    try {
      var request =
          http.Request('GET', Uri.parse("${Constants.baseUrl}$endPoint"));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send().timeout(
          const Duration(minutes: 3),
          onTimeout: () =>
              throw TimeoutException("Request timed out after 3 minutes."));
      var responsedata = await http.Response.fromStream(response);
      return responsedata;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<http.Response> post(
      {required String endPoint, required Map<String, dynamic> body}) async {
    var headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    var response = http.post(Uri.parse(Constants.baseUrl + endPoint),
        headers: headers, body: jsonEncode(body));
    return response;
  }
}
