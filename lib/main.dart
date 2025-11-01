import 'package:flutter/material.dart';
import 'package:trial/practice_files/login_activity.dart';
// import 'package:trial/practice_file.dart';
import 'package:trial/practice_files/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Practice File',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: WelcomePage(),
    );
  }
}
