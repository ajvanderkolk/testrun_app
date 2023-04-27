import 'package:flutter/material.dart';
import 'package:testrun_app/view/home_page.dart';
import '../view/account_home_page.dart';
import '../view/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Run App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(title: 'Home Page',),
        '/account': (context) => AccountHomePage(),
        //'/login': (context) => LoginPage(),
      },
    );
  }
}