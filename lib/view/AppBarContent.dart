import 'package:flutter/material.dart';
import 'package:testrun_app/models/user.dart';
import 'package:testrun_app/services/userAPI.dart';
import 'package:testrun_app/view/updateUserForm.dart';
import 'package:testrun_app/view/user_account_page.dart';
import 'addUserForm.dart';


class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: <Widget>[
              TextButton(
                onPressed: currentRoute == '/' ? null : () async {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey,
                    textStyle: const TextStyle(fontSize: 15)
                ),
                child: const Text('Navigation Bar'),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(
                  Icons.explore,
                  size: 20,
                ),
                color: Colors.orange,
                onPressed: () async {
                  var message = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                        return const UserAccountPage(
                            title: 'User Account Page'
                        );
                      }));
                },
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