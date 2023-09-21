import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? bmi;
  String errorText = '';
  String status = '';

  void calculateBMI() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        shadowColor: const Color.fromARGB(255, 80, 27, 215),
        title: const Text("BMI calculator"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  labelText: 'Height (cm)', suffixText: 'centmeters'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                  labelText: 'Weight (kg)', suffixText: 'kilograms'),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: calculateBMI,
                  child: const Text('Calculate'),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(errorText),
          ],
        ),
      ),
    );
  }
}
