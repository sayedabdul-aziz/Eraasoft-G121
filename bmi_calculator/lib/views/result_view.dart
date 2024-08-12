import 'package:bmi_calculator/colors.dart';
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  ResultView({super.key, required this.result});
  final double result;

// ≤ 18.4	Underweight
// 18.5 - 24.9	Normal
// 25.0 - 39.9	Overweight
// ≥ 40.0	Obese

  Color color = Colors.white;
  String getClass() {
    if (result <= 18.5) {
      color = Colors.red;
      return 'Underweight';
    } else if (result <= 24.9) {
      color = Colors.green;
      return 'Normal';
    } else if (result <= 39.9) {
      color = Colors.yellow;
      return 'Overweight';
    } else {
      color = Colors.red;
      return 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        foregroundColor: AppColors.white,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text(
          'Result',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getClass(),
              style: TextStyle(
                fontSize: 20,
                color: color,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              result.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
