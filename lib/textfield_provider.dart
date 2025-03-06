import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'textfield_provider.g.dart';

@riverpod
String textValue(Ref ref) {
  return "ivan";
}

@riverpod
class TextHandler extends _$textHandler {
  @override
  String build() {
    return "....";
  }

  void textChanged(String val) {
    state = val;
  }
}
