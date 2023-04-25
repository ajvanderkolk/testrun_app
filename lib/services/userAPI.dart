import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:testrun_app/models/user.dart';

class UserApi {
  // Get all User Details
  Future<List<User>?> getAllUsers() async {
    var client = http.Client();
    //http://127.0.0.1:5000/user
    var uri = Uri.parse("http://10.0.2.2:5000/user");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return userFromJson(json);
    }
  }
}