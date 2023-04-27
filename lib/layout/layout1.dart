import 'package:flutter/material.dart';

class layout1 extends StatefulWidget {
  const layout1({Key? key}) : super(key: key);

  @override
  State<layout1> createState() => _layout1State();
}

class _layout1State extends State<layout1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            height: 20,
            thickness: 1,
            indent: 20,
            endIndent: 0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.deepOrangeAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/**
    Container(
    margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
    child: InkWell(
    child: Card(
    child: Row(
    children: <Widget>[
    Expanded(
    child: ListTile(
    leading: Image.asset(
    'assets/images/photo.png',
    fit: BoxFit.contain,
    ),
    title: const Text('Johannesburg'),
    ),
    ),
    Container(
    color: Colors.blue,
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10.0),
    child: const Text(
    "22",
    style: TextStyle(color: Colors.white),
    )),
    ],
    ),
    ),
    ),
    ), **/