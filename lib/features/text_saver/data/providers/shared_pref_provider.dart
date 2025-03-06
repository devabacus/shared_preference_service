import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preference_service/features/text_saver/data/repositories/shared_pref_repository.dart';
import 'package:shared_preference_service/features/text_saver/domain/services/providers/text_value_service_provider.dart';

part 'shared_pref_provider.g.dart';

@riverpod
class TextValueHandler extends _$TextValueHandler {
  
  
  
  @override
  FutureOr<String> build() async {
    final service = ref.watch(textValueServiceProvider);
    return service.getText();
  }

  void updateText(String val) {
    state = AsyncData(val);
  }

  Future<void> saveText() async {
    final currentState = await future;
    final service = ref.watch(textValueServiceProvider);
    await service.saveText(currentState);
    // await _repo.setString(val: currentState, key: 'mtext');
    state = AsyncData(currentState);
  }

  Future<void> loadText() async {
    final service = ref.watch(textValueServiceProvider);
    final textVal = await service.getText();

    state = AsyncData(textVal);
  }
}
