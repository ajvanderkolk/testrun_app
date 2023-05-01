import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import '../view/account_home_page.dart';
import '../view/login_page.dart';
import '../view/home_page.dart';

void main() {
  _setupLogging(); // Initialize logging
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logger = Logger('MyApp');
    logger.info('----------New Session----------');
    logger.info('Building MyApp');

    return MaterialApp(
      title: 'Test Run App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) {
          logger.fine('Navigating to LoginPage');
          return LoginPage();
        },
        '/home': (context) {
          logger.fine('Navigating to HomePage');
          return HomePage(title: 'Home Page');
        },
        '/account': (context) {
          logger.fine('Navigating to AccountHomePage');
          return AccountHomePage();
        },
      },
    );
  }
}

void _setupLogging() {
  final file = File('log.txt');
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    file.writeAsStringSync(
      '${record.time}: ${record.loggerName}: ${record.message}\n',
      mode: FileMode.append,
    );
  });
}
