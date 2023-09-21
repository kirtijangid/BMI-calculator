import 'dart:math';

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
  
     if (height == null || weight == null) {
      setState(() {
        errorText = "Please enter your Height and Weight";
      });
      return;
    }

    if (height <= 0 || weight <= 0) {
      setState(() {
        errorText = "Your Height and Weight must be positive numbers";
      });
      return;
    }

    setState(() {
      bmi = weight / pow((height / 100), 2);
      if (bmi! < 18.5) {
        status = "Underweight";
      } else if (bmi! > 18.5 && bmi! < 25) {
        status = 'Normal weight';
      } else if (bmi! > 25 && bmi! < 30) {
        status = 'Pre-Obesity';
      } else if (bmi! > 30 && bmi! < 35) {
        status = 'Obesity class 1';
      } else if (bmi! > 35 && bmi! < 40) {
        status = 'Obesity class 2';
      } else {
        status = 'Obesity class 3';
      }
    });
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
            const SizedBox(
              height: 20,
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              border: Border.all(),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bmi == null? '00.00' : bmi!.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 60,
                          color: 
                                status == 'Underweight' ? Colors.blue
                                    : status == 'Normal weight' ? Colors.green
                                    : status == 'Pre-Obesity' ? Colors.yellow.shade700
                                    : status == 'Obesity class 1' ? Colors.orange
                                    : status == 'Obesity class 2' ? Colors.deepOrangeAccent
                                    : status == 'Obesity class 3' ? Colors.red
                                    : null
                        ),
                      ),
                       const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(status,
                                  style: TextStyle(
                                    color:
                                      status == 'Underweight' ? Colors.blue
                                    : status == 'Normal weight' ? Colors.green
                                    : status == 'Pre-Obesity' ? Colors.yellow.shade700
                                    : status == 'Obesity class 1' ? Colors.orange
                                    : status == 'Obesity class 2' ? Colors.deepOrangeAccent
                                    : status == 'Obesity class 3' ? Colors.red
                                    : null
                                  ),
                              ),
                                const Text('BMI',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15,
                              spreadRadius: 1,
                              offset: Offset(5, 5),
                            ),
                          ]),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text('Nutritional Status',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 15
                      ),
                      ),
                    ],
                  ),
                 ),
                ),
              ],
            ),
      ),
    );
  }
}

