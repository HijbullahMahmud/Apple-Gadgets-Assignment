import 'package:http/http.dart' as http;
import 'package:apple_gadgets_assignment/services/api_client.dart';

class NetworkService {
  
  Future<http.Response> login(
      {required String userName, required String password}) async {
    String endPoint = "ClientCabinetBasic/IsAccountCredentialsCorrect";
    var body = {"login": userName, "password": password};
    var response = await ApiClient.post(endPoint: endPoint, body: body);
    return response;
  }
}
