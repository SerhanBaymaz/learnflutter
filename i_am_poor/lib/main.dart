import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("I am poor"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      body: const Center(
        child: Image(
          image: AssetImage("images/cat.jpg"),
        ),
      ),
    ),
  ));
}
