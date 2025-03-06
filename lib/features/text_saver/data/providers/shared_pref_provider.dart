import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preference_service/features/text_saver/data/repositories/shared_pref_repository.dart';
import 'package:shared_preference_service/features/text_saver/domain/services/providers/text_value_service_provider.dart';
import 'package:shared_preference_service/features/text_saver/domain/services/text_value_service.dart';

part 'shared_pref_provider.g.dart';

@riverpod
class TextValueHandler extends _$TextValueHandler {
  late final TextValueService _service;

  @override
  FutureOr<String> build() async {
    final _service = ref.watch(textValueServiceProvider);
    return _service.getText();
  }

  void updateText(String val) {
    state = AsyncData(val);
  }

  Future<void> saveText() async {
    final currentState = await future;
    await _service.saveText(currentState);
    state = AsyncData(currentState);
  }

  Future<void> loadText() async {
    state = const AsyncLoading();
    final textVal = await _service.getText();
    state = AsyncData(textVal);
  }
}
