import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        shadowColor: const Color.fromARGB(255, 80, 27, 215),
        title: const Text("BMI calculator"),
      ),
    );
  }
}
