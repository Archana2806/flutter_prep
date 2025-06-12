import 'package:flutter/material.dart';
import '../services/database_helper.dart';
import 'add_habit_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Map<String, dynamic>>> habitList;

  @override
  void initState() {
    super.initState();
    refreshHabits();
  }

  void refreshHabits() {
    setState(() {
      habitList = DatabaseHelper.getHabits();
    });
  }

  void toggleCompletion(int id, int completed) async {
    await DatabaseHelper.toggleCompletion(id, completed == 1 ? 0 : 1);
    refreshHabits();
  }

  void removeHabit(int id) async {
    await DatabaseHelper.deleteHabit(id);
    refreshHabits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Habit Tracker")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: habitList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var habit = snapshot.data![index];
              return ListTile(
                title: Text(habit["title"]),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: habit["completed"] == 1,
                      onChanged: (_) => toggleCompletion(habit["id"], habit["completed"]),
                    ),
                    IconButton(icon: Icon(Icons.delete), onPressed: () => removeHabit(habit["id"])),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddHabitScreen(refreshHabits)),
        ),
      ),
    );
  }
}