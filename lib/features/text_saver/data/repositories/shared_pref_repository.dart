import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepository {
  SharedPreferences? _prefInstance;

  Future<SharedPreferences> _getPrefs() async {
    _prefInstance ??= await SharedPreferences.getInstance();
    return _prefInstance!;

  }

  Future<bool> saveString(String val, String key) async {
    final prefs = await _getPrefs();
    return await prefs.setString(key, val);
  }

  Future<String> getString(String key, {String defaultValue = ""}) async {
    final prefs = await _getPrefs();
    return prefs.getString(key) ?? defaultValue;
  }

}
