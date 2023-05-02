import 'package:flutter/material.dart';
import 'package:testrun_app/view/account_home_page.dart';
import 'package:testrun_app/view/home_page.dart';
import 'package:logging/logging.dart';

class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    final logger = Logger('LoginPage');

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          child: Row(
            children: <Widget>[
              Row(
                children: [
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                    onPressed: currentRoute == '/home'
                        ? null
                        : () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/home', (route) => false);
                          },
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueGrey,
                        textStyle: const TextStyle(fontSize: 15)),
                    child: const Text('Home'),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const SizedBox(
                    child: Text('Navigation Bar'),
                  ),
                ],
              ),
              const Spacer(),
              // Explore - Home Page
              IconButton(
                icon: const Icon(
                  Icons.explore,
                  size: 20,
                ),
                color: Colors.orange,
                onPressed: () async {
                  var message = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomePage(title: 'Home Page');
                  }));
                },
              ),
              // Commute - Home Page
              IconButton(
                icon: const Icon(
                  Icons.commute,
                  size: 20,
                ),
                color: Colors.green,
                onPressed: () async {
                  var message = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomePage(title: 'Home Page');
                  }));
                },
              ),
              // Bookmark - Account Home Page
              IconButton(
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 20,
                ),
                color: Colors.yellow,
                onPressed: () async {
                  var message = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const AccountHomePage();
                  }));
                },
              ),
              // Search - Home Page
              IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 20,
                ),
                color: Colors.white,
                onPressed: () async {
                  var message = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return const HomePage(title: 'Home Page');
                  }));
                },
              ),
              // Vertical Dots - None
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  size: 20,
                ),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                onPressed: () async {
                  logger.fine('Navigating to SignUp page');
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                tooltip: 'Logout',
                icon: const Icon(
                  Icons.logout,
                  size: 20,
                ),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
