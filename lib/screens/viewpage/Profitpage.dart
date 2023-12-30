import 'package:flutter/material.dart';
import 'package:stockapp/function/functions/db_function.dart';

class ProfitPage extends StatefulWidget {
  const ProfitPage({Key? key}) : super(key: key);

  @override
  State<ProfitPage> createState() => _ProfitPageState();
}

class _ProfitPageState extends State<ProfitPage> {
  late String profit;
  late String cost;

  @override
  void initState() {
    super.initState();
    if (itemlistnotifier.value.isNotEmpty) {
      profit = '₹ ${itemlistnotifier.value.first.sellprice}';
      cost = '₹ ${itemlistnotifier.value.first.costprice}';
    } else {
      profit = '₹ 0';
      cost = '₹ 0';
    }
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildStatRow('Spending', cost),
            SizedBox(height: 30,),
            _buildStatRow('Earning', profit),
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


