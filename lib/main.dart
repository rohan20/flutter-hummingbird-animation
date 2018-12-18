import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hummingbird"),
        ),
        body: Center(
          child: Text(
            "Hummingbird",
            style: TextStyle(
              fontSize: 36.0,
            ),
          ),
        ),
      ),
    );
  }
}
