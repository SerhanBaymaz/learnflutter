import 'package:audioplayers/audioplayers.dart';
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
      title: 'Xylophone Piano',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildExpandedButton(Colors.red, 1),
              buildExpandedButton(Colors.orange, 2),
              buildExpandedButton(Colors.yellow, 3),
              buildExpandedButton(Colors.green, 4),
              buildExpandedButton(Colors.blue, 5),
              buildExpandedButton(Colors.indigo, 6),
              buildExpandedButton(Colors.purple, 7),
            ],
          )),
    );
  }

  Expanded buildExpandedButton(Color color, int musicNo) {
    return Expanded(
      child: TextButton(
        child: Text(''),
        onPressed: () {
          final player = AudioCache();
          player.play("note$musicNo.wav");
        },
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    );
  }
}
