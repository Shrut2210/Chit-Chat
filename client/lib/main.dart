import 'package:client/EditProfile.dart';
import 'package:client/HomePage.dart';
import 'package:client/LandingPage.dart';
import 'package:client/LogIn.dart';
import 'package:client/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Future<void> main() async {
//   await dotenv.load(fileName: ".env");
//   await Supabase.initialize(url: dotenv.get('SUPABASE_URL'), anonKey: dotenv.get('SUPABASE_API_KEY'));
//   runApp(const MyApp());
// }

Future<void> main() async {
  // await dotenv.load(fileName: ".env");
  await Supabase.initialize(url: "https://vdfzjiaaxzgiscsjqbnm.supabase.co", anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZkZnpqaWFheHpnaXNjc2pxYm5tIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM5MjczNDUsImV4cCI6MjA0OTUwMzM0NX0.4DZ1yzvpybrwk1w-8UYrgL9hAmFshvEI7Ap8LyL994o");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Landingpage(),
    );
  }
}

final supabase = Supabase.instance.client;
