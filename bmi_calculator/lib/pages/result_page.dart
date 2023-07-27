// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/my_colors.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'BMI Calculator',
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Your Result',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                color: MyColors.colourCardActive,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Normal', //TODO: Change this to BMI result -> Underweight, Normal, Overweight, Obese
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    '18.3', //TODO: Change this to BMI result -> 18.3, 22.1, 28.3, 33.1
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Normal BMI range: \n 18,5 - 25 kg/m2",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'You have a normal body weight. Good job!', //TODO: Change this to BMI result -> You have a normal body weight. Good job!, You have a lower than normal body weight. You can eat a bit more., You have a higher than normal body weight. Try to exercise more., You have a much higher than normal body weight. You should exercise more and eat less.
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyColors.colourCardDeactive),
                    ),
                    child: Text("Save Result"),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
