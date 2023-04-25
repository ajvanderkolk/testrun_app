import 'package:flutter/material.dart';

import '../services/userAPI.dart';

class addUserForm extends StatefulWidget {
  const addUserForm({Key? key}) : super(key: key);

  @override
  State<addUserForm> createState() => _addUserFormState();
}

class _addUserFormState extends State<addUserForm> {
  var _userNameController = TextEditingController();
  var _contactController = TextEditingController();

  bool _validateName = false;
  bool _validateContact = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New User'),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Add New User Details',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w500),),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    errorText:
                      _validateName ? 'Name Value Can\'t be Empty' : null,
                  )),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
                controller: _contactController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Contact Number',
                  labelText: 'Contact No',
                  errorText:
                  _validateContact ? 'Contact Value Can\'t be Empty' : null,
                )),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                TextButton(
                    onPressed: () async {
                      setState(() {
                        _userNameController.text.isEmpty
                            ? _validateName = true
                            : _validateName = false;
                        _contactController.text.isEmpty
                            ? _validateContact = true
                            : _validateContact = false ;

                      });
                      if (_validateName == false && _validateContact == false) {
                        var result = await UserApi().addUser(_userNameController.text, _contactController.text);
                        Navigator.pop(context, result);
                      }
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(fontSize: 15)),
                  child: const Text('Save Details')),
                const SizedBox(
                  width: 10.0,
                ),
              TextButton(
                  onPressed: () {
                    _userNameController.text = "";
                    _contactController.text = "";
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: const TextStyle(fontSize: 15)),
                  child: const Text('Clear Details')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
