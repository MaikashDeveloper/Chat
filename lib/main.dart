import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/services/auth/auth_gate.dart';
import 'package:minimal_chat_app/firebase_options.dart';
import 'package:minimal_chat_app/themes/ligth_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await Firebase.initializeApp(options: DefaultF);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const AuthGate(),
    );
  }
}
