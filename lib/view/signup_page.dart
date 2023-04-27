import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class signupPage extends StatefulWidget {
  const signupPage({Key? key}) : super(key: key);

  @override
  State<signupPage> createState() => _signupPageState();
}

class _signupPageState extends State<signupPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _birthdateController = TextEditingController();
  final _genderController = TextEditingController();
  final _emailController = TextEditingController();
  final _institutionController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _validateFirstName = false;
  bool _validateLastName = false;
  bool _validateBirthdate = false;
  bool _validateGender = false;
  bool _validateEmail = false;
  bool _validateInstitution = false;
  bool _validateUsername = false;
  bool _validatePassword = false;

  @override
  Widget build(BuildContext context) {
    double sizeWidth = MediaQuery.of(context).size.width * 0.80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up Page'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Text('Sign Up Page Here'),
            ),
            SizedBox(
              width: sizeWidth,
              child: Column(
                children: [
                  TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter First Name',
                        labelText: 'First Name',
                        errorText: _validateFirstName ? 'Required Field' : null,
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Last Name',
                        labelText: 'Last Name',
                        errorText: _validateLastName ? 'Required Field' : null,
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                      controller: _birthdateController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Select Birthdate',
                        labelText: 'Birthdate',
                        errorText: _validateBirthdate ? 'Required Field' : null,
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                      controller: _genderController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Select Gender',
                        labelText: 'Gender',
                        errorText: _validateGender ? 'Optional Field' : null,
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                      controller: _institutionController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Select Institution',
                        labelText: 'Institution',
                        errorText:
                            _validateInstitution ? 'Required Field' : null,
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Email',
                        labelText: 'Email',
                        errorText: _validateEmail ? 'Required Field' : null,
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Username',
                        labelText: 'Username',
                        errorText: _validateUsername ? 'Required Field' : null,
                      )),
                  const SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        hintText: 'Enter Password',
                        labelText: 'Password',
                        errorText: _validatePassword ? 'Required Field' : null,
                      )),
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
                            _firstNameController.text.isEmpty
                                ? _validateFirstName = true
                                : _validateFirstName = false;
                            _lastNameController.text.isEmpty
                                ? _validateLastName = true
                                : _validateLastName = false;
                            _birthdateController.text.isEmpty
                                ? _validateBirthdate = true
                                : _validateBirthdate = false;
                            _institutionController.text.isEmpty
                                ? _validateInstitution = true
                                : _validateInstitution = false;
                            _emailController.text.isEmpty
                                ? _validateEmail = true
                                : _validateEmail = false;
                            _usernameController.text.isEmpty
                                ? _validateUsername = true
                                : _validateUsername = false;
                            _passwordController.text.isEmpty
                                ? _validatePassword = true
                                : _validatePassword = false;
                          });
                          if (_validateUsername == false &&
                              _validatePassword == false) {
                            print('Sign Up Success');
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                            textStyle: const TextStyle(fontSize: 20)),
                        child: Row(
                          children: const [
                            Icon(Icons.lock),
                            Text('Signup'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
