import 'package:flutter/material.dart';
import 'package:testrun_app/models/user.dart';
import 'package:testrun_app/services/userAPI.dart';
import 'package:testrun_app/view/updateUserForm.dart';
import 'addUserForm.dart';


class UserAccountPage extends StatefulWidget {
  const UserAccountPage({Key? key}) : super(key: key);

  @override
  State<UserAccountPage> createState() => _UserAccountPageState();
}


class _UserAccountPageState extends State<UserAccountPage> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(
              Icons.explore,
              color: Colors.blue,
            ),
            label: 'Explore All Users',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.commute,
              color: Colors.green,
            ),
            label: 'Explore',
          ),
          NavigationDestination(
            selectedIcon: Icon(
                Icons.bookmark
            ),
            icon: Icon(
                Icons.bookmark_border,
                color: Colors.amber
            ),
            label: 'Account',
          ),
        ],
      ),

    );
  }
}