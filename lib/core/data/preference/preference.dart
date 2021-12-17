import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static SharedPreferences? _prefs;
  static Map<String, dynamic> _memoryPrefs = Map<String, dynamic>();

  static Future<SharedPreferences?> load() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  static Future<bool> clearPreference() async {
    return _prefs!.clear();
  }

  static Future<bool> setString(String key, String value) {
    _memoryPrefs[key] = value;
    return _prefs!.setString(key, value);
  }

  static Future<bool> setInt(String key, int value) {
    _memoryPrefs[key] = value;
    return _prefs!.setInt(key, value);
  }

  static Future<bool> setDouble(String key, double value) {
    _memoryPrefs[key] = value;
    return _prefs!.setDouble(key, value);
  }

  static Future<bool> setBool(String key, bool value) {
    _memoryPrefs[key] = value;
    return _prefs!.setBool(key, value);
  }

  static String getString(String key) {
    String val = '';
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val = _prefs!.getString(key)!;
    _memoryPrefs[key] = val;
    return val;
  }

  static int getInt(String key) {
    int val = 0;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val = _prefs!.getInt(key)!;
    _memoryPrefs[key] = val;
    return val;
  }

  static double getDouble(String key) {
    double val = 0.0;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val = _prefs!.getDouble(key)!;
    _memoryPrefs[key] = val;
    return val;
  }

  static bool getBool(String key) {
    bool val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val = _prefs!.getBool(key)!;
    _memoryPrefs[key] = val;
    return val;
  }
}

mixin PrefKey {
  static const String isSocialLogin = "isSocialLogin";
  static const String isFacebookLogin = "isFacebookLogin";
  static const String isGmailLogin = "isGmailLogin";
}
