import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'user_detail_screen.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<dynamic> users = [];
  List<dynamic> filteredUsers = [];
  TextEditingController searchController = TextEditingController();
  int start = 0;
  final int limit = 10;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchUsers();
    searchController.addListener(() {
      filterUsers();
    });
  }

  Future<void> fetchUsers() async {
    setState(() => isLoading = true);

    try {
      var newUsers = await ApiService.fetchUsers(start, limit);
      setState(() {
        users.addAll(newUsers);
        filteredUsers = users;
        start += limit;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error fetching users")),
      );
    }

    setState(() => isLoading = false);
  }

  void filterUsers() {
    setState(() {
      filteredUsers = users
          .where((user) => user["name"]
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Users")),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(labelText: "Search Users"),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                var user = filteredUsers[index];
                return ListTile(
                  title: Text(user["name"]),
                  subtitle: Text(user["email"]),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserDetailScreen(user),
                    ),
                  ),
                );
              },
            ),
          ),
          if (isLoading) Center(child: CircularProgressIndicator()),
          ElevatedButton(
            onPressed: fetchUsers,
            child: Text("Load More"),
          ),
        ],
      ),
    );
  }
}