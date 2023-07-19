import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          color: Colors.grey[300],
          child: const Center(
            child: Text(
              '© 2023 - Quiz App',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 6,
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                child: const Center(
                  child: Text(
                    'Questions show here ?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildElevatedButton("TRUE", Colors.green),
                  buildElevatedButton("FALSE", Colors.red),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButton(String text, Color color) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: const Size(160, 70),
        elevation: 10,
        textStyle: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(text),
    );
  }
}
