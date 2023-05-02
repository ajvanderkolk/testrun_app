import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:testrun_app/view/signup_page.dart';
import '../layout/drawer_asset.dart';
import '../services/login_credentials_API.dart';

/// Color Palette in RGB
///
/// Pine Green: Color.fromRGBO(255, 186, 0, 1)
/// Matcha Green: Color.fromRGBO(109, 151, 115, 1)
/// Sunrise Yellow: Color.fromRGBO(255, 186, 0, 1)
/// Leather Tan: Color.fromRGBO(187, 138, 82, 1)
///

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
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    final logger = Logger('LoginPage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromRGBO(12, 59, 46, 1),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () async {
              logger.fine('Navigating to SignUp page');
              var message = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const signupPage();
              }));
            },
            tooltip: 'Account Sign Up',
            icon: const Icon(Icons.account_circle),
            color: Colors.white,
            hoverColor: const Color.fromRGBO(255, 186, 0, 0.8),
          ),
        ],
      ),
      // drawer: const drawerAsset(),
      body: Container(
        color: const Color.fromRGBO(12, 59, 46, 1),
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
                        child: const Text(' '),
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
                            backgroundColor:
                                const Color.fromRGBO(255, 186, 0, 0.8),
                            textStyle: const TextStyle(fontSize: 15)),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            SizedBox(
              child: Container(
                padding: const EdgeInsets.all(150.0),
                color: const Color.fromRGBO(109, 151, 115, 1),
                child: const Text(
                  // 'AcademiXpert'
                  'AdviseU',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontFamily: 'LibreBaskerville'),
                ),
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
                            obscureText: passwordVisible,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'Enter Password',
                              labelText: 'Password',
                              errorText: _validatePassword
                                  ? 'Password Can\'t be Empty'
                                  : null,
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(
                                    () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
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
                            backgroundColor:
                                const Color.fromRGBO(109, 151, 115, 1),
                            textStyle: const TextStyle(fontSize: 20)),
                        child: Row(
                          children: const [
                            Icon(Icons.lock),
                            Text('Guest Login'),
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
                            backgroundColor:
                                const Color.fromRGBO(109, 151, 115, 1),
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
    );
  }
}
