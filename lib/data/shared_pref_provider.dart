import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_provider.g.dart';

@riverpod
class TextValueHandler extends _$TextValueHandler {
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String> _getTextFromPref() async {
    final pref = await _getPrefs();
    return pref.getString('mtext') ?? "пусто";
  }

  @override
  FutureOr<String> build() async {
    return _getTextFromPref();
  }

  void updateText(String val){
      state = AsyncData(val);
  }

  Future<void> saveText() async {
    final currentState = await future;

    final pref = await _getPrefs();
    await pref.setString('mtext', currentState);
    state = AsyncData(currentState);
  }

  Future<void> loadText() async {
    final pref = await SharedPreferences.getInstance();
    final textVal = pref.getString('mtext') ?? "";

    state = AsyncData(textVal);
  }
}
