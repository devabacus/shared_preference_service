import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepository {
  SharedPreferences? _prefInstance;

  Future<SharedPreferences> _getPrefs() async {
    _prefInstance ??= await SharedPreferences.getInstance();
    return _prefInstance!;

  }

  Future<bool> setString({required String val, required String key}) async {
    final prefs = await _getPrefs();
    return await prefs.setString(key, val);
  }

  Future<String> getString({required String key, String defaultValue = ""}) async {
    final prefs = await _getPrefs();
    return prefs.getString(key) ?? defaultValue;
  }


  Future<bool> removeKey(String key) async {
      final prefs = await _getPrefs();
      return await prefs.remove(key);
    }

  Future<bool> clearAll() async {
      final prefs = await _getPrefs();
      return await prefs.clear();
    }
}
