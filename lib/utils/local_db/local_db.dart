import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    log("_preferences: $_preferences");
    _preferences = await SharedPreferences.getInstance();
    log("_preferences: $_preferences");
  }
  
  static _saveData(String key, Object value) {
    if (value is String) {
      return _preferences?.setString(key, value);
    } else if (value is bool) {
      return _preferences?.setBool(key, value);
    } else if (value is int) {
      return _preferences?.setInt(key, value);
    } else if (value is double) {
      return _preferences?.setDouble(key, value);
    }
  }

  static T _get<T>(String key) {
    return _preferences!.get(key) as T;
  }

  static void saveData(String key, Object value) {
    _saveData(key, value);
  }

  static String getData(String key) {
    return _get(key) ?? '';
  }

  static getString(String key) {
    return _preferences!.getString(key);
  }

  static getBool(String key) {
    return _preferences!.getBool(key);
  }

  static getDouble(String key) {
    return _preferences!.getDouble(key);
  }

  static getInt(String key) {
    return _preferences!.getInt(key);
  }
}
