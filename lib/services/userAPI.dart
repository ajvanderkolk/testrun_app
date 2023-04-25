import 'dart:convert';
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
    } else {
      return null;
    }
  }
  //Add New User
  Future<User> addUser(String name, String contact) async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:5000/user');
    final http.Response response = await client.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
      },
        body: jsonEncode(<String, String>{
        'name' : name,
        'contact' : contact
      }),
    );
    if (response.statusCode == 200) {
      var json = response.body;
      //print(json); // Add this line to print the response data
      return User.fromJson(jsonDecode(json));
    } else {
      throw Exception('Failed to Save User.');
    }
  }

  Future<User> deleteUser(int id) async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:5000/user/$id');
    print('attempt delete $id');
    final http.Response response = await client.delete(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print('client delete passed');
    if (response.statusCode == 200) {
      var json = response.body;
      print('delete user $json'); // Add this line to print the response data
      return User.fromJson(jsonDecode(json));
    }
    else {
      print(response.statusCode);
      throw Exception('Failed to Delete User.');
    }
  }

}