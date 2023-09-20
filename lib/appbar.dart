import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        shadowColor: Color.fromARGB(255, 80, 27, 215),
        title: const Text("BMI calculator"),
      ),
    );
  }
}
