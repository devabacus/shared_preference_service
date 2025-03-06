import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preference_service/features/text_saver/data/repositories/shared_pref_repository.dart';

part 'shared_pref_provider.g.dart';

@riverpod
class TextValueHandler extends _$TextValueHandler {
  final _repo = SharedPrefRepository();
  @override
  FutureOr<String> build() async {
    return _repo.getString(key: 'mtext');
  }

  void updateText(String val) {
    state = AsyncData(val);
  }

  Future<void> saveText() async {
    final currentState = await future;
    await _repo.setString(val: currentState, key: 'mtext');
    state = AsyncData(currentState);
  }

  Future<void> loadText() async {
    final textVal = _repo.getString(key: 'mtext').toString();

    state = AsyncData(textVal);
  }
}
