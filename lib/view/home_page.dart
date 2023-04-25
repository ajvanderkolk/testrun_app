import 'package:flutter/material.dart';
import 'package:testrun_app/models/user.dart';
import 'package:testrun_app/services/userAPI.dart';

import 'addUserForm.dart';



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
    print('begin get Record');

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
        replacement: const Center(child: CircularProgressIndicator()),
        child: ListView.builder(
        itemCount: users?.length,
        itemBuilder: (context, index){
          return Container(
            child: ListTile(
              title: Text(users![index].name),
              subtitle: Text(users![index].contact),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: (){}, icon: const Icon(Icons.edit),),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.delete),),
                ],
              ),
            ),
          );
        },
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
                MaterialPageRoute(builder: (context)=>const addUserForm())
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

