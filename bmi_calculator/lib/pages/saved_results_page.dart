import 'package:bmi_calculator/my_colors.dart';
import 'package:flutter/material.dart';

import '../bmi_results.dart';

class SavedResultsPage extends StatefulWidget {
  const SavedResultsPage({Key? key}) : super(key: key);

  @override
  State<SavedResultsPage> createState() => _SavedResultsPageState();
}

class _SavedResultsPageState extends State<SavedResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: MyColors.colourCardActive,
                borderRadius: BorderRadius.circular(10),
              ),
              child: //list the bmi results here
                  ListView(
                children: [
                  for (var item in BmiResults.bmiResultsList)
                    MyListTile(
                      bmiResult: item["bmiResult"],
                      resultText: item["resultText"],
                      formatedDate: item["formatedDate"],
                    ),
                ],
              )),
        ),
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String formatedDate;

  const MyListTile({
    Key? key,
    required this.bmiResult,
    required this.resultText,
    required this.formatedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        resultText,
        style: const TextStyle(color: Colors.white),
      ),
      title: Text(
        bmiResult,
        style: const TextStyle(color: Colors.white, fontSize: 26),
      ),
      trailing: Text(
        formatedDate,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
