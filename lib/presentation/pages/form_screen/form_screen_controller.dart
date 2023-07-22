import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ngirit/domain/transaction_domain.dart';

class FormScreenController extends ChangeNotifier {
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
    notifyListeners();
  }

  void validateCategory(String value) {
    _categoryValid = value.isNotEmpty;
    _categoryValue = value;
    notifyListeners();
  }

  void validateDate(String value) {
    _dateValid = value.isNotEmpty;
    _dateValue = value;
    notifyListeners();
  }

  void validateDescription() {
    _descriptionValid = _descriptionTextController.text.isNotEmpty;
    notifyListeners();
  }

  void handleSubmitButton() {
    int amount = int.tryParse(nominalTextController.text) ?? 0;

    TransactionDomain transaction = TransactionDomain(
      amount: amount,
      category: categoryValue,
      date: dateValue,
      notes: descriptionTextController.text,
    );
    DatabaseReference reference = FirebaseDatabase.instance.ref('transaction');
    DatabaseReference transactionReference = reference.push();
    transactionReference.set(transaction.toJson());
  }

  bool isBtnEnabled() {
    return _nominalValid && _descriptionValid && _categoryValid && _dateValid;
  }
}
