import 'package:flutter/material.dart';
import 'package:seru_testing_app/view/register_page.dart';
import 'package:seru_testing_app/view/register_page_2.dart';
import 'package:seru_testing_app/view/register_page_3.dart';
import 'package:seru_testing_app/view/register_summary_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/register-1',
      routes: {
        '/register-1': (context) => const RegisterPage(),
        '/register-2': (context) => const RegisterPage2(),
        '/register-3': (context) => const RegisterPage3(),
        '/register-summary': (context) => const RegisterSummaryPage(),
      },
    );
  }
}
