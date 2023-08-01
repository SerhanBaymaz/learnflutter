import 'package:bmi_calculator/my_colors.dart';
import 'package:flutter/material.dart';

class SavedResultsPage extends StatefulWidget {
  const SavedResultsPage({super.key});

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
                children: const [
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    leading: Text(
                      'Normal',
                      style: TextStyle(color: Colors.white),
                    ),
                    title: Text(
                      '   BMI: 22.1',
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                    trailing: Text(
                      '01.08.2023',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                  ListTile(
                    title: Text('BMI: 22.1'),
                    subtitle: Text('Normal'),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
