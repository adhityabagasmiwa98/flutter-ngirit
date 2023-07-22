import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/pages/form_screen/form_screen_page.dart';
import 'package:flutter_ngirit/presentation/pages/home/home_page.dart';

class MainController {
  int _selectedNavBar = 0;

  final List<String> bottomNavlabels = ['Home', 'Tambah', 'Dompet', 'Profile'];
  final List<IconData> _icons = const [
    Icons.home_outlined,
    Icons.calculate,
    Icons.wallet,
    Icons.person_outline
  ];
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> bodyView = <Widget>[
    HomePage(),
    FormScreenPage(),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: School',
      style: optionStyle,
    ),
  ];

  int get selectedNavBar => _selectedNavBar;
  List<IconData> get icons => _icons;
  void changeSelectedNavBar(int index) {
    _selectedNavBar = index;
  }
}
