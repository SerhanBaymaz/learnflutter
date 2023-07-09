import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[500],
        body: SafeArea(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blueGrey[500],
                backgroundImage: AssetImage("assets/images/profilepicture.jpg"),
              ),
              Text(
                "Serhan Baymaz",
                style: TextStyle(
                    fontFamily: "Pacifico",
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.normal),
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                    fontFamily: "Source Sans",
                    color: Colors.teal.shade100,
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 3),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  height: 10,
                  color: Colors.white,
                  thickness: 1,
                ),
              ),
              buildCardContainerInfo("serhanbaymaz@gmail.com", Icons.email),
              buildCardContainerInfo("+90 544 826 6989", Icons.phone)
            ],
          ),
        ),
      ),
    );
  }

  Card buildCardContainerInfo(String str, IconData? icon) {
    return Card(
        //padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        child: ListTile(
          leading: Icon(icon, color: Colors.blueGrey),
          title: Text(str,
              style: TextStyle(
                  fontFamily: "Source Sans",
                  fontSize: 20,
                  color: Colors.blueGrey)),
        ));
  }
} //MyApp stateless widget
