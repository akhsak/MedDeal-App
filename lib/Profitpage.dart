// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfitPage extends StatelessWidget {
  const ProfitPage({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatRow('Sold Quantity', '5', 'Purchase Quantity', '10'),
            SizedBox(height: 10),
            _buildStatRow('Spending(₹)', '50', 'Earning(₹)', '100'),
            SizedBox(height: 20),
            _buildSectionHeader('Transaction History'),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return _buildTransactionCard('Dateee', 'Stall: no A2');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(
    String label1,
    String value1,
    String label2,
    String value2,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 159, 156, 156),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildStatItem(label1, value1),
          _buildStatItem(label2, value2),
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
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildTransactionCard(String date, String stall) {
    return Card(
      color: Color(0xFFF7F7F8),
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        subtitle: Text(
          date,
          style: TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
        ),
        trailing: Text(stall),
      ),
    );
  }
}
