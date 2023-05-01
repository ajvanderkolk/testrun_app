import 'package:flutter/material.dart';
import 'package:testrun_app/view/signup_page.dart';
import '../layout/drawer_asset.dart';
import '../services/login_credentials_API.dart';
import 'AppBarContent.dart';
import 'home_page.dart';

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
        title: const Text('Login Page'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  child: Row(
                    children: [
                      SizedBox.fromSize(
                        child: Text('Nav Bar'),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () async {
                          var message = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const signupPage();
                          }));
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            textStyle: const TextStyle(fontSize: 15)),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                        ),
                      ),
                      Expanded(
                        flex: 8,
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
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    children: <Widget>[
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                        ),
                      ),
                      Expanded(
                        flex: 8,
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
                      const Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20.0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.lightGreen,
                            textStyle: const TextStyle(fontSize: 20)),
                        child: Row(
                          children: const [
                            Icon(Icons.lock),
                            Text('Google Login'),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
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
                            final String username = _usernameController.text;
                            final String password = _passwordController.text;
                            LoginAPI.login(username, password).then((response) {
                              print('Login Success');
                              Navigator.pushNamed(context, '/home');
                            }).catchError((error) {
                              // Handle login error
                              print('fail');
                              print(error);
                            });
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
            ),
          ], // Row Children
        ),
      ),
      drawer: drawerAsset(),
    );
  }
}
