import 'package:flutter/material.dart';
import 'package:testrun_app/models/user.dart';
import 'package:testrun_app/services/userAPI.dart';
import 'package:testrun_app/view/updateUserForm.dart';
import 'AppBarContent.dart';
import 'addUserForm.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.blueAccent, Colors.blue],
            ),
          ),
          child: const AppBarContent(),
        ),
      ),
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
                Icons.bookmark,
                color: Colors.amber
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