import 'package:flutter/material.dart';
import 'src/Onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dapur",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      // Aplikasi mulai dari Onboarding, baru nanti pindah ke MainNavigation
      home: const OnboardingScreen(),
    );
  }
}