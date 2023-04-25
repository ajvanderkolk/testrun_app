import 'package:flutter/material.dart';

class addUserForm extends StatefulWidget {
  const addUserForm({Key? key}) : super(key: key);

  @override
  State<addUserForm> createState() => _addUserFormState();
}

class _addUserFormState extends State<addUserForm> {
  var _userNameController = TextEditingController();
  var _contactNameController = TextEditingController();

  bool _validateName = false;
  bool _validateContact = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New User'),),
      body: SingleChildScrollView(
        child: Container(
          child: Text("Test"),
        ),
      ),
    );
  }
}
