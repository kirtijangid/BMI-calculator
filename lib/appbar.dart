import 'package:flutter/material.dart';


class Appbar extends StatefulWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
   final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

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
      child:
       Column(
        children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                suffixText: 'centmeters'
              ),
            )
      ],
      )
      ,),

    );
  }
}
