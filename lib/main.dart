import 'package:flutter/material.dart';
import 'package:onboard_page_view/pages/onboard_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "onboarding",
      routes: {
        "onboarding": (context) => OnboardingPage(),
      },
    );
  }
}
