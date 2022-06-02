import 'dart:convert';

import 'package:http/http.dart' as http;

class GymApi {
  Future<http.Response> loginUser(String email, String password) async {
    var request = await http.post(
        Uri.parse('http://152.206.85.91:3000/api/auth/login'),
        body: json.encode({"email": email, "password": password}),
        headers: {'Content-Type': 'application/json'});

    return request;
  }
}
