import 'package:flutter/material.dart';
import 'package:responsi_123210063_danielhanselc/views/homepage.dart';
import 'package:responsi_123210063_danielhanselc/views/listAgent.dart';
import 'package:responsi_123210063_danielhanselc/views/listMap.dart';
import 'package:responsi_123210063_danielhanselc/views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
