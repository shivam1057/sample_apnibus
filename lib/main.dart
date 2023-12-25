import 'package:flutter/material.dart';
import 'package:sampleapnibus/Pages/home_page.dart';
import 'package:sampleapnibus/Pages/login_delegate.dart';
import 'package:sampleapnibus/Pages/login_page.dart';
import 'package:sampleapnibus/Pages/opt_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: OtpPage(phoneNumber: "8750168519",)
      // home: LoginDelegate(),
      home:HomePage()
    );
  }
}
