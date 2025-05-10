import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app.dart';

void main() async {
  // Ensure that plugin services are initialized so that `availableBiometrics`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Uses the generated firebase_options.dart
  );

  runApp(const MyApp());
}