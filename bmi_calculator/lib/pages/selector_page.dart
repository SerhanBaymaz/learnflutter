// ignore_for_file: avoid_print, prefer_const_literals_to_create_immutables

import 'package:bmi_calculator/my_colors.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/material.dart';

import '../calculator_brain.dart';

enum Gender { male, female }

class SelectorPage extends StatefulWidget {
  const SelectorPage({super.key});

  @override
  State<SelectorPage> createState() => _SelectorPageState();
}

class _SelectorPageState extends State<SelectorPage> {
  bool isMale = false;
  bool isFemale = false;

  int weight = 70;
  int age = 25;
  int height = 170;

  Color colourMale = MyColors.colourCardDeactive;
  Color colourFemale = MyColors.colourCardDeactive;
  Color coloutMaleText = Colors.grey;
  Color coloutFemaleText = Colors.grey;

  void changeGender(Gender gender) {
    if (gender == Gender.male) {
      isMale = true;
      isFemale = false;

      colourMale = MyColors.colourCardActive;
      colourFemale = MyColors.colourCardDeactive;

      coloutMaleText = Colors.white;
      coloutFemaleText = Colors.grey;
    } else {
      isMale = false;
      isFemale = true;

      colourMale = MyColors.colourCardDeactive;
      colourFemale = MyColors.colourCardActive;

      coloutMaleText = Colors.grey;
      coloutFemaleText = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('BMI Calculator', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: const Icon(Icons.menu),
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          minimumSize: const Size(double.infinity, 80),
        ),
        onPressed: () {
          CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            );
          }));
        },
        child: const Text('CALCULATE YOUR BMI',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            //First Row
            Expanded(
              //1.Row with 2 buttons
              child: Row(
                children: <Widget>[
                  //first buttonnnnnnnnnnnn
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeGender(Gender.male);
                        });
                      },
                      child: MyGenderCardWidget(Icons.male_rounded, "MALE",
                          colourMale, coloutMaleText),
                    ),
                  ),

                  const SizedBox(width: 6),

                  //second buttonnnnnnnnnnnn
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          changeGender(Gender.female);
                        });
                      },
                      child: MyGenderCardWidget(Icons.female_rounded, "FEMALE",
                          colourFemale, coloutFemaleText),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            //Second Row
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      color: MyColors.colourCardActive,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("HEIGHT",
                            style: TextStyle(fontSize: 20, color: Colors.grey)),
                        const SizedBox(height: 8),
                        Text(
                          height.toString(),
                          style: const TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Slider(
                          activeColor: MyColors.colourMainPink,
                          value: height.toDouble(),
                          min: 100,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          },
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 16),
            //Third Row
            Expanded(
              child: Row(
                children: <Widget>[
                  //First buttonn
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.colourCardActive,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("WEIGHT",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey)),
                          const SizedBox(height: 8),
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) {
                                      weight--;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(width: 16),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (weight < 200) {
                                      weight++;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  //Second buttonn
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.colourCardActive,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("AGE",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey)),
                          const SizedBox(height: 8),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) {
                                      age--;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                              const SizedBox(width: 16),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (age < 100) {
                                      age++;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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

class MyGenderCardWidget extends StatefulWidget {
  MyGenderCardWidget(
      this.icon, this.label, this.backgroundColorr, this.textColorr,
      {super.key});

  final IconData icon;
  final String label;
  Color backgroundColorr = MyColors.colourCardDeactive;
  Color textColorr = Colors.white;

  @override
  State<MyGenderCardWidget> createState() => _MyGenderCardWidgetState();
}

class _MyGenderCardWidgetState extends State<MyGenderCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColorr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(widget.icon, size: 80, color: widget.textColorr),
          Text(widget.label,
              style: TextStyle(fontSize: 20, color: widget.textColorr)),
        ],
      ),
    );
  }
}
