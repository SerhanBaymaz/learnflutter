// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/my_colors.dart';
import 'package:bmi_calculator/pages/saved_results_page.dart';
import 'package:flutter/material.dart';

import '../bmi_results.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage(
      {Key? key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI Calculator',
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.insert_chart),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SavedResultsPage()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Your Result",
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
                  MyText(resultText: resultText, bmiResult: bmiResult),
                  Text(
                    bmiResult,
                    style: const TextStyle(
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
                      interpretation,
                      style: const TextStyle(
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
                    child: const Text("Save Result"),
                    onPressed: () {
                      DateTime now = DateTime.now();
                      String formattedDate =
                          "${now.day}-${now.month}-${now.year}\n${now.hour + 3}: ${now.minute}";

                      BmiResults.bmiResultsList.add({
                        "bmiResult": bmiResult,
                        "resultText": resultText,
                        "formatedDate": formattedDate,
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SavedResultsPage()));
                    },
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

class MyText extends StatelessWidget {
  const MyText({
    Key? key,
    required this.resultText,
    required this.bmiResult,
  }) : super(key: key);

  final String resultText;
  final String bmiResult;

  @override
  Widget build(BuildContext context) {
    int bmi = double.parse(bmiResult).toInt();
    Color color = Colors.green;

    if (bmi < 16.5) {
      color = Colors.red;
    } else if (bmi >= 16.5 && bmi < 18.5) {
      color = Colors.yellow;
    } else if (bmi >= 18.5 && bmi < 25) {
      color = Colors.green;
    } else if (bmi >= 25 && bmi < 30) {
      color = Colors.yellow;
    } else if (bmi >= 30) {
      color = Colors.red;
    }

    return Text(
      resultText.toUpperCase(),
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
