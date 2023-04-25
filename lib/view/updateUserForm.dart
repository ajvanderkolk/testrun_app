import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/userAPI.dart';

class updateUserForm extends StatefulWidget {
  final User user;
  const updateUserForm(this.user, {Key? key}) : super(key: key);

  @override
  State<updateUserForm> createState() => _updateUserFormState();
}

class _updateUserFormState extends State<updateUserForm> {
  var _userNameController = TextEditingController();
  var _contactController = TextEditingController();

  bool _validateName = false;
  bool _validateContact = false;

  @override
  void initState() {
    _userNameController.text = widget.user.name;
    _contactController.text = widget.user.contact;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Update User'),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Edit User Details',
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
                        var result = await UserApi().updateUser(_userNameController.text, _contactController.text, widget.user.id);
                        Navigator.pop(context, result);
                      }
                    },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(fontSize: 15)),
                    child: const Text('Update Details')),
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
