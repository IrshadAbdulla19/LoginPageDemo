import 'package:flutter/material.dart';
import 'package:login_page_1/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

const userlogin = 'logincheck';
void main() {
  runApp(MyApp());
  SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: SplashScreen(),
    );
  }
}
