import 'package:shared_preferences/shared_preferences.dart';

class LocalDBService {
  Future<void> saveToLocalDB(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is String) {
      await prefs.setString(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else {
      // Handle other data types if needed
      throw Exception("Unsupported data type");
    }
  }

  Future<dynamic> getFromLocalDB(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve data based on the type
    if (prefs.containsKey(key)) {
      if (prefs.getInt(key) != null) {
        return prefs.getInt(key);
      } else if (prefs.getDouble(key) != null) {
        return prefs.getDouble(key);
      } else if (prefs.getBool(key) != null) {
        return prefs.getBool(key);
      } else if (prefs.getString(key) != null) {
        return prefs.getString(key);
      } else if (prefs.getStringList(key) != null) {
        return prefs.getStringList(key);
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
