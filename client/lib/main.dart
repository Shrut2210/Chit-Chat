import 'package:client/HomePage.dart';
import 'package:client/LandingPage.dart';
import 'package:client/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(url: dotenv.get('SUPABASE_URL'), anonKey: dotenv.get('SUPABASE_API_KEY'));
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
