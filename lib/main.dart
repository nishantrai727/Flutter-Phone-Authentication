// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import './screens/splash_screen.dart';
import './screens/entrypage.dart';
import './screens/verification_screen.dart';
import './screens/profilepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white
      ),
      home: SplashScreen(),
    );
  }
}
