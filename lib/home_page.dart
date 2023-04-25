import 'package:flutter/material.dart';
import 'package:testrun_app/models/user.dart';
import 'package:testrun_app/services/userAPI.dart';
    
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

cclass _HomepageState extends State<Homepage> {
Future<List<User>?>? _futureUsers;

@override
void initState() {
  super.initState();
  _futureUsers = UserApi().getAllUsers();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text("Python RestAPI Flutter")),
    body: FutureBuilder<List<User>?>(
      future: _futureUsers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Failed to load user data."),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text("No user data found."),
          );
        }

        final users = snapshot.data!;

        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return Container(
              child: ListTile(
                title: Text(users[index].name),
                subtitle: Text(users[index].contact),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.edit)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
            );
          },
        );
      },
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: const Icon(Icons.add),
    ),
  );
}
}

