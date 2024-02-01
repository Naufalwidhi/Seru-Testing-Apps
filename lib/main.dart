import 'package:flutter/material.dart';
import 'package:seru_testing_app/view/register_page.dart';

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
      },
    );
  }
}
