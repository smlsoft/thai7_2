import 'package:flutter/material.dart';
import 'package:thai7/api/connect.dart';
import 'package:thai7/mainscreen.dart';

void main() {
  apiLogin();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thai 7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen(),
    );
  }
}
