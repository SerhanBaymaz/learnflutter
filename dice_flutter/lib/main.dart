import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Dice"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int diceLeft = Random().nextInt(5) + 1;
  int diceRight = Random().nextInt(5) + 1;

  @override
  Widget build(BuildContext context) {
    void changeLeftDice() {
      diceLeft = Random().nextInt(5) + 1;
    }

    void changeRightDice() {
      diceRight = Random().nextInt(5) + 1;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      changeLeftDice();
                    });
                    print("Left button pressed.");
                  },
                  child: Image.asset("images/dice$diceLeft.png"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        changeRightDice();
                      });
                      print("Right button pressed.");
                    },
                    child: Image.asset("images/dice$diceRight.png")),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white70,
                onPrimary: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  changeLeftDice();
                  changeRightDice();
                });
                print("Both button pressed.");
              },
              child: Text("Both"),
            ),
          ],
        ),
      ],
    );
  }
}
