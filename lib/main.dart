import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mpgov/gynecology.dart';
import 'package:mpgov/history.dart';
import 'package:mpgov/home.dart';
import 'package:mpgov/pediatric.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (_) => const HomePage(),
        '/gyneco': (_) => GynecologyPage(),
        '/pedia': (_) => PediatricPage(),
        '/history': (_) => const HistoryPage(),
      },
    ),
  );
}
