import 'package:flutter/material.dart';

class FormScreenController {
  bool _nominalValid = false,
      _categoryValid = false,
      _dateValid = false,
      _descriptionValid = false;

  List<String> categoryData = [
    'Makanan dan Minuman',
    'Belanja Bulanan',
    'Hiburan',
    'Tagihan',
    'Bensin',
  ];

  final TextEditingController _nominalTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

  TextEditingController get nominalTextController => _nominalTextController;
  TextEditingController get descriptionTextController =>
      _descriptionTextController;

  String _categoryValue = '';
  String _dateValue = '';

  String get categoryValue => _categoryValue;
  String get dateValue => _dateValue;

  void validateNominal() {
    _nominalValid = _nominalTextController.text.isNotEmpty;
  }

  void validateCategory(String value) {
    _categoryValid = value.isNotEmpty;
    _categoryValue = value;
  }

  void validateDate(String value) {
    _dateValid = value.isNotEmpty;
    _dateValue = value;
  }

  void validateDescription() {
    _descriptionValid = _descriptionTextController.text.isNotEmpty;
  }

  void handleSubmitButton() {
    // TODO : Push to API
    print('Nominal : ' + nominalTextController.text);
    print('Kategori : ' + categoryValue);
    print('Tanggal : ' + dateValue);
    print('Keterangan : ' + descriptionTextController.text);
  }

  bool isBtnEnabled() {
    return _nominalValid && _descriptionValid && _categoryValid && _dateValid;
  }
}
