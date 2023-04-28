import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testrun_app/models/login_credentials.dart';

class LoginCredentialAPI {
  // Get all LoginCredential Details
  Future<LoginCredentials?> getAllLoginCredentials() async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:5000/login-credential');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print(json); // Add this line to print the response data
      return loginCredentialsFromJson(json);
    } else {
      return null;
    }
  }

  // Add New LoginCredential
  Future<LoginCredentials> addLoginCredential(LoginCredentials loginCredentials) async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:5000/login-credential');
    final http.Response response = await client.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: loginCredentialsToJson(loginCredentials),
    );
    if (response.statusCode == 200) {
      var json = response.body;
      return LoginCredentials.fromJson(jsonDecode(json));
    } else {
      throw Exception('Failed to Save LoginCredential.');
    }
  }

  // Delete LoginCredential
  Future<LoginCredentials> deleteLoginCredential(String id) async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:5000/login-credential/$id');
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
      print(
          'delete login credential $json'); // Add this line to print the response data
      return LoginCredentials.fromJson(jsonDecode(json));
    } else {
      print(response.statusCode);
      throw Exception('Failed to Delete LoginCredential.');
    }
  }

  // Update LoginCredential
  Future<LoginCredentials> updateLoginCredential(
      LoginCredentials loginCredential, String uuid) async {
    var client = http.Client();
    var uri = Uri.parse('http://127.0.0.1:5000/login-credential/$uuid');
    print('attempt update $uuid'); //Test attempt
    final http.Response response = await client.put(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginCredential.toJson()),
    );
    print('client edit passed');
    if (response.statusCode == 200) {
      var json = response.body;
      print('update login credential $json'); // Print response data
      return LoginCredentials.fromJson(jsonDecode(json));
    } else {
      print(response.statusCode);
      throw Exception('Failed to Update LoginCredential.');
    }
  }
}
