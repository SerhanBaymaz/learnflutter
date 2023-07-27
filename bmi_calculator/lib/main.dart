import 'package:bmi_calculator/my_colors.dart';
import 'package:bmi_calculator/pages/selector_page.dart';
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
      title: 'BMI Calculator',
      theme: ThemeData(
        primaryColor: MyColors.colourMainBackground,
        // ignore: deprecated_member_use
        accentColor: MyColors.colourMainPink,
        appBarTheme: const AppBarTheme(
          backgroundColor: MyColors.colourMainBackground,
        ),
        scaffoldBackgroundColor: MyColors.colourMainBackground,
        backgroundColor: MyColors.colourMainBackground,
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: const SelectorPage(),
    );
  }
}
