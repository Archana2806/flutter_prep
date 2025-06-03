import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<dynamic>> fetchUsers(int start, int limit) async {
    final response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users?_start=$start&_limit=$limit"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load users");
    }
  }
}