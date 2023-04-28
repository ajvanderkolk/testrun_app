// To parse this JSON data, do
//
//     final loginCredentials = loginCredentialsFromJson(jsonString);

import 'dart:convert';

LoginCredentials loginCredentialsFromJson(String str) => LoginCredentials.fromJson(json.decode(str));

String loginCredentialsToJson(LoginCredentials data) => json.encode(data.toJson());

class LoginCredentials {
  String birthdate;
  String email;
  String firstName;
  String gender;
  String institution;
  String lastName;
  String password;
  String phoneNumber;
  String username;

  LoginCredentials({
    required this.birthdate,
    required this.email,
    required this.firstName,
    required this.gender,
    required this.institution,
    required this.lastName,
    required this.password,
    required this.phoneNumber,
    required this.username,
  });

  factory LoginCredentials.fromJson(Map<String, dynamic> json) => LoginCredentials(
    birthdate: json["birthdate"],
    email: json["email"],
    firstName: json["first_name"],
    gender: json["gender"],
    institution: json["institution"],
    lastName: json["last_name"],
    password: json["password"],
    phoneNumber: json["phone_number"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "birthdate": birthdate,
    "email": email,
    "first_name": firstName,
    "gender": gender,
    "institution": institution,
    "last_name": lastName,
    "password": password,
    "phone_number": phoneNumber,
    "username": username,
  };
}
