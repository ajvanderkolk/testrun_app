import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testrun_app/models/user.dart';

class UserApi {
  // Get all User Details
  Future<List<User>?> getAllUsers() async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:5000/user');
    var response = await client.get(uri);
    //print(response.body);
    if (response.statusCode == 200) {
      var json = response.body;
      print(json); // Add this line to print the response data
      return userFromJson(json);
    }
  }


}