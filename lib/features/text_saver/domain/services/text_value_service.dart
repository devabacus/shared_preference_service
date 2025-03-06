import '../../data/repositories/shared_pref_repository.dart';

class TextValueService {
  final SharedPrefRepository _repository;

  TextValueService(this._repository);

  Future<String> getText() async {
    var textVal = await _repository.getString(key: 'mtext');
    if (textVal == "Stas") {
      textVal = '$textVal привет';
    }
    return textVal;
  }

  Future<bool> saveText(String val) async {
    if (val.isEmpty) {
      val = "пустая строка";
    }
    return _repository.setString(val: val, key: 'mtext');
  }
}
