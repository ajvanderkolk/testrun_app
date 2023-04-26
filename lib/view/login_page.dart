import 'package:flutter/material.dart';
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
      body:
      Column(
        children: [
          Center(

          ),
          Padding(
              padding: const EdgeInsets.all(50.0)
          ),
          SizedBox(
            child: Container(
              padding: const EdgeInsets.all(50.0),
              color: Colors.blue,
              child: const Text('Hello World'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16.0),
            child: InkWell(
              child: Card(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        leading: Image.asset('assets/images/photo.png',
                            fit: BoxFit.contain,),
                          title: const Text('Johannesburg'),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.blue,
                        child: const
                        Text("22",
                          style: TextStyle(
                          color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ], // Row Children
      ),
/**
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.blueAccent, Colors.blue],
            ),
          ),
          child: const AppBarContent(),
        ),
      ),
**/
    );
  }
}
