import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../app_colors.dart';
import '../../../../core/components/yemi_app_bar.dart';
import '../../data/models/transaction_model.dart';
import '../../../../core/components/section_title.dart';
import '../components/transaction_card.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    List<TransactionModel> transactions = [];
    for (var i = 0; i < 30; i++) {
      transactions.add(TransactionModel(
        operator: 'Orange',
        amount: 10000,
        direction: 'debit',
      ));
    }

    List<Widget> transactionWidgets =
        transactions.map((item) => TransactionCard(transaction: item)).toList();

    List<_SalesData> data = [
      _SalesData('Jan', 35),
      _SalesData('Feb', 28),
      _SalesData('Mar', 34),
      _SalesData('Apr', 32),
      _SalesData('May', 40)
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: YemiAppBar(
        title: 'Transactions',
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                // Chart title
                // title: ChartTitle(text: 'Half yearly sales analysis'),
                // Enable legend
                // legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Sales',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ],
              ),
            ),
            const SectionTitle(label: 'Transactions'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [...transactionWidgets],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
