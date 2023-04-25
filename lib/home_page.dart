import 'package:flutter/material.dart';
import 'package:testrun_app/models/user.dart';
import 'package:testrun_app/services/userAPI.dart';



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<User>? users;
  var isLoaded = false;

  // Show 'Failed to load user data in pop-up box'
  void showErrorMessage() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Error"),
        content: const Text("Failed to load user data."),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // Set initial state
  @override
  void initState() {
    super.initState();
    getRecord();
  }

  Future<void> getRecord() async {
    print('balls');

    try {
      final userList = await UserApi().getAllUsers();
      if (userList != null) {
        setState(() {
          users = userList;
          isLoaded = true;
        });
      } else {
        showErrorMessage();
      }
    } catch (e) {
      showErrorMessage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Python RestAPI Flutter"),),
      body: Visibility (
        visible: isLoaded,
        replacement: const Center(child: CircularProgressIndicator())
        child: ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: const Icon(Icons.add),
      ),
    );
  }
}

