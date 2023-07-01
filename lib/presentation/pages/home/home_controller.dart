import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';

class HomeController {
  // TODO: Map data from fireStore
  List<BarChartGroupData> barChartGroupsData = [
    BarChartGroupData(x: 1, barRods: [
      BarChartRodData(toY: 4, color: barChartColor),
    ]),
    BarChartGroupData(x: 2, barRods: [
      BarChartRodData(toY: 8, color: barChartColor),
    ]),
    BarChartGroupData(x: 3, barRods: [
      BarChartRodData(toY: 6, color: barChartColor),
    ]),
    BarChartGroupData(x: 4, barRods: [
      BarChartRodData(toY: 4, color: barChartColor),
    ]),
    BarChartGroupData(x: 5, barRods: [
      BarChartRodData(toY: 1, color: barChartColor),
    ]),
    BarChartGroupData(x: 6, barRods: [
      BarChartRodData(toY: 8, color: barChartColor),
    ]),
    BarChartGroupData(x: 7, barRods: [
      BarChartRodData(toY: 3, color: barChartColor),
    ]),
    BarChartGroupData(x: 8, barRods: [
      BarChartRodData(toY: 2, color: barChartColor),
    ]),
    BarChartGroupData(x: 9, barRods: [
      BarChartRodData(toY: 7.2, color: barChartColor),
    ]),
  ];

  // TODO: Create struct for saving data transaction from fireStore
  List<String> _transactions = [];
  List<String> get transactions => _transactions;
}
