import 'package:flutter/material.dart';
import 'package:testrun_app/models/user.dart';
import 'package:testrun_app/services/userAPI.dart';
import 'package:testrun_app/view/updateUserForm.dart';
import 'addUserForm.dart';


class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: <Widget>[
              const Text(
                'Navigation Bar',
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.explore,
                  size: 20,
                ),
                color: Colors.orange,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.commute,
                  size: 20,
                ),
                color: Colors.green,
                onPressed: () {},
              ),
              IconButton(
                selectedIcon: Icon(Icons.bookmark),
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 20,
                ),
                color: Colors.yellow,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 20,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}