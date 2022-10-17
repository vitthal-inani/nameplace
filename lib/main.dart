import 'package:flutter/material.dart';
import 'package:nameplace/Screens/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff463F71),
        body: SafeArea(child: LoginScreen()),
      ),
    );
  }
}
