// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/Profit_provider.dart';

class ProfitPage extends StatefulWidget {
  const ProfitPage({Key? key}) : super(key: key);

  @override
  State<ProfitPage> createState() => _ProfitPageState();
}

class _ProfitPageState extends State<ProfitPage> {
  @override
  void initState() {
    Provider.of<ProfitProvider>(context, listen: false).calculateTotalValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<ProfitProvider>(context, listen: false);

    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 43, 90, 152),
        title: const Center(
          child: Text(
            'Profitpage',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildLottieAnimation(screenWidth),
              const SizedBox(height: 20),
              buildStatRow('Spending', '${pro.cost}'),
              const SizedBox(height: 30),
              buildStatRow('Earning', '${pro.profit}'),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLottieAnimation(double screenWidth) {
    return SizedBox(
      height: 270,
      width: screenWidth * 0.6,
      child: Lottie.asset(
        'assets/doctr.json',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildStatRow(String label, String value) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 12, 69, 166),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildStatItem(label, value),
        ],
      ),
    );
  }

  Widget buildStatItem(String label, String value) {
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
