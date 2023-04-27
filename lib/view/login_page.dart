import 'package:flutter/material.dart';
import '../layout/drawer_asset.dart';
import 'AppBarContent.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _validateUsername = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New User'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox.fromSize(
                  child: Text('Nav Bar'),
                )
              ],
            ),
            const Center(
              child: Text('Center'),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              child: Container(
                padding: const EdgeInsets.all(50.0),
                color: Colors.blue,
                child: const Text('Hello World'),
              ),
            ),
            SizedBox(
              child: Container(
                padding: const EdgeInsets.all(50.0),
                color: Colors.red,
                child: const Text('Hello World'),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 400.0),
                  child: Container(
                    color: Colors.white30,
                    child: TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Enter Username',
                          labelText: 'Username',
                          errorText: _validateUsername
                              ? 'Username Can\'t be Empty'
                              : null,
                        )),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 400.0),
                  child: Container(
                    color: Colors.white30,
                    child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          errorText: _validatePassword
                              ? 'Username Can\'t be Empty'
                              : null,
                        )),
                  ),
                ),
                const SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton(
                      onPressed: () async {},
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.lightGreen,
                          textStyle: const TextStyle(fontSize: 20)),
                      child: Row(
                        children: const [
                          Icon(Icons.lock),
                          Text('Login with Google'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 88.0),
                    ),
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          _usernameController.text.isEmpty
                              ? _validateUsername = true
                              : _validateUsername = false;
                          _passwordController.text.isEmpty
                              ? _validatePassword = true
                              : _validatePassword = false;
                        });
                        if (_validateUsername == false &&
                            _validatePassword == false) {
                          print('Login Success');
                          // Navigator.pop(context);
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          textStyle: const TextStyle(fontSize: 20)),
                      child: Row(
                        children: const [
                          Icon(Icons.lock),
                          Text('Login'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ], // Row Children
        ),
      ),
      drawer: drawerAsset(),
    );
  }
}
