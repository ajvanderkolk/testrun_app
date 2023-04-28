// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    required this.contact,
    required this.id,
    required this.name,
  });

  String contact;
  int id;
  String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        contact: json["contact"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "contact": contact,
        "id": id,
        "name": name,
      };

  @override
  String toString() {
    String result = name.toString();
    return result;
  }
}
