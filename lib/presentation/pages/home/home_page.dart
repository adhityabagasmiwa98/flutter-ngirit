import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ngirit/presentation/misc/app_colors.dart';
import 'package:flutter_ngirit/presentation/misc/app_sizes.dart';
import 'package:flutter_ngirit/presentation/misc/app_strings.dart';
import 'package:flutter_ngirit/presentation/misc/app_styles.dart';
import 'package:flutter_ngirit/presentation/pages/home/home_controller.dart';
import 'package:flutter_ngirit/presentation/widgets/item_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.all(AppSize.dimen24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 2.0],
                  colors: [
                    colorPrimary,
                    Colors.lightBlue.shade600,
                  ],
                ),
              ),
              child: Container(
                height: MediaQuery.of(context).size.width * 0.6,
                padding: const EdgeInsets.all(AppSize.dimen12),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.0, 2.0],
                    colors: [
                      colorPrimary,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(AppSize.dimen8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pengeluaran bulan ini",
                          style: textStyleW600S12.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Rp 1.000.000",
                          style: textStyleW700S24.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: BarChart(
                          BarChartData(
                            barGroups: _controller.barChartGroupsData,
                            maxY: 15,
                            baselineY: 0,
                            borderData: FlBorderData(show: false),
                            gridData: const FlGridData(show: false),
                            titlesData: const FlTitlesData(
                              topTitles: AxisTitles(),
                              leftTitles: AxisTitles(),
                              rightTitles: AxisTitles(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSize.dimen24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.dimen12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Transaksi Terakhir",
                    style: textStyleW700S18,
                  ),
                  // list transaction
                  Visibility(
                    visible: _controller.transactions.isNotEmpty,
                    child: Container(
                      height: 500,
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          final transaction = _controller.transactions[index];

                          return ItemTransaction(transaction: transaction);
                        },
                        itemCount: _controller.transactions.length,
                      ),
                    ),
                  ),
                  // empty state
                  Visibility(
                    visible: _controller.transactions.isEmpty,
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset(
                            '${AppStrings.imagePath}empty_transaction.png',
                            height: 226,
                            width: 219,
                          ),
                        ),
                        Text(
                          "Belum Ada Transaksi",
                          style: textStyleW700S18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
