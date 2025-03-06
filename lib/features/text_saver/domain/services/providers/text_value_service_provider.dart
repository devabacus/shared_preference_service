import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preference_service/features/text_saver/data/repositories/shared_pref_repository.dart';
import 'package:shared_preference_service/features/text_saver/domain/services/text_value_service.dart';

part 'text_value_service_provider.g.dart';

@riverpod
TextValueService textValueService(Ref ref) {
  return TextValueService(SharedPrefRepository());
}