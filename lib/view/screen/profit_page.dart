// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stockapp/controller/profit_provider.dart';
import 'package:stockapp/view/widget/profit_widgt_page.dart';


class ProfitPage extends StatefulWidget {
  const ProfitPage({Key? key}) : super(key: key);

  @override
  State<ProfitPage> createState() => _ProfitPageState();
}

class _ProfitPageState extends State<ProfitPage> {
  @override
  void initState() {
    Provider.of<ProfitProvider>(context, listen: false).calculateTotalValues(context);
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

 
 }
