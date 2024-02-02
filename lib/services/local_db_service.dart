import 'package:shared_preferences/shared_preferences.dart';

class LocalDBService {
  Future<void> saveToLocalDB(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<void> removeFromLocalDB(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<dynamic> getFromLocalDB(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retrieve data based on the type
    if (prefs.containsKey(key)) {
      if (prefs.getString(key) != null) {
        return prefs.getString(key);
      } else {
        // Handle other data types if needed
        throw Exception("Unsupported data type");
      }
    } else {
      // Key not found in SharedPreferences
      return null;
    }
  }
}
