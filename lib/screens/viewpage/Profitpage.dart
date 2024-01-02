import 'package:flutter/material.dart';
import 'package:stockapp/function/functions/db_function.dart';

class ProfitPage extends StatefulWidget {
  const ProfitPage({Key? key}) : super(key: key);

  @override
  State<ProfitPage> createState() => _ProfitPageState();
}

class _ProfitPageState extends State<ProfitPage> {
  late double profit;
  late double cost;
  double totalSpending = 0;
  double totalEarning = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalValues();
  }

  Future<void> calculateTotalValues() async {
    double totalCost = 0;
    double totalSelling = 0;

    for (var item in itemlistnotifier.value) {
      totalCost += double.parse(item.costprice);
      totalSelling += double.parse(item.sellprice);
    }

    setState(() {
      totalEarning = totalSelling;
      totalSpending = totalCost;
      profit = totalCost - totalSpending;
      cost = totalSelling - totalSpending;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 2, 85, 1),
        title: const Center(
          child: Text(
            'Profit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatRow('Spending', '$totalSpending'),
            SizedBox(
              height: 30,
            ),
            _buildStatRow('Earning', '$cost'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem(label, value),
        ],
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
