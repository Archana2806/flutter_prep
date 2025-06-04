import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<bool> addUser(String name, String email) async {
    final response = await http.post(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email}),
    );

    return response.statusCode == 201; // Check if submission was successful
  }
}