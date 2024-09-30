import 'package:flutter/material.dart';
import './pages/LoginPage.dart';
void main() {
  runApp(const MyApp() as Widget);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Latihan Quiz",
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: LoginPage(),);
  }
}
