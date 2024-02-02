 import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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

