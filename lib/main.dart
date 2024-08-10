import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_/services/bindings.dart';
import 'package:gpa_/view/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'حساب المعدل التراكمي', 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: false,
      ),
      initialBinding: InitialBindings(),
      home: const HomeScreen(),
    );
  }
}
