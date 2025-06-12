import 'package:flutter/material.dart';
import '../services/database_helper.dart';

class AddHabitScreen extends StatelessWidget {
  final Function refreshHabits;
  AddHabitScreen(this.refreshHabits);

  final TextEditingController habitController = TextEditingController();

  void saveHabit(BuildContext context) async {
    if (habitController.text.isNotEmpty) {
      await DatabaseHelper.addHabit(habitController.text);
      refreshHabits();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Habit")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: habitController, decoration: InputDecoration(labelText: "Habit Name")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => saveHabit(context), child: Text("Save Habit")),
          ],
        ),
      ),
    );
  }
}