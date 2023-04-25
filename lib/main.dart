import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Build home page
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Home Page'),
      home: const AccountHomePage(title: 'Account Home Page'),
    );
  }
}
// Create state for Home Page
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Set content and state for Home Page
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      final file = File(result.files.single.path!);
      final processResult = await Process.run(
        'python',
        ['extract_PDF.py', file.path],
      );
      log(processResult.stdout.toString(), name: 'Python Console Output');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _selectFile,
              child: const Text('Select PDF file'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}


// Create state for Account Home Page
class AccountHomePage extends StatefulWidget {
  const AccountHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AccountHomePage> createState() => _AccountHomePageState();
}

// Set content and state for Account Home Page
class _AccountHomePageState extends State<AccountHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Home Page'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            var message = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
                return const SecondPage(title: 'SecondPage');
               }));
                    // This message will print to console
            print(message);
          },
          child: const Text('Next'),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Second Page'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context, "Returned from Second Page");
          },
          child: const Text('Go Back'),
        ),
      ),
    );
  }
}


