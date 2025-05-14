import 'package:flutter/material.dart';
import 'pages/form_page.dart';
import 'pages/thank_you_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Praktikum',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FormPage(),
        '/thankyou': (context) => const ThankYouPage(),
      },
    );
  }
}
