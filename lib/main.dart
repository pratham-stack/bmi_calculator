import 'package:flutter/material.dart';
import 'inputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF0C0F28),
          scaffoldBackgroundColor: Color(0xFF0C0F28),
      ),
      home: InputPage(),
    );
  }
}

