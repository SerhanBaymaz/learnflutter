import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Magic Ball',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int ballNumber = 1;

  void changeBallNumber() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Ask me anything'),
        centerTitle: true,
      ),
      body: Center(
        child: TextButton(
            onPressed: () {
              changeBallNumber();
            },
            child: Image.asset('images/ball$ballNumber.png'),
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            )),
      ),
    );
  }
}
