

// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stockapp/function/functions/db_function.dart';
import 'package:lottie/lottie.dart';

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
      profit = totalEarning - totalSpending;
      cost = totalEarning;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(12, 2, 85, 1),
        title: const Center(
          child: Text(
            'Profit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLottieAnimation(screenWidth),
              const SizedBox(height: 20),
              _buildStatRow('Spending', '$totalSpending'),
              const SizedBox(height: 30),
              _buildStatRow('Earning', '$cost'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLottieAnimation(double screenWidth) {
    return SizedBox(
      //height: 200,
      width: screenWidth * 0.5, 
      child: Lottie.asset(
        'assets/doctr.json',
        fit: BoxFit.cover,
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
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
