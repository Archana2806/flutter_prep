import 'package:flutter/material.dart';
import '../services/database_helper.dart';

class AddTaskScreen extends StatelessWidget {
  final Function refreshTasks;
  AddTaskScreen(this.refreshTasks);

  final TextEditingController taskController = TextEditingController();

  void saveTask(BuildContext context) async {
    if (taskController.text.isNotEmpty) {
      await DatabaseHelper.addTask(taskController.text);
      refreshTasks();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: taskController, decoration: InputDecoration(labelText: "Task Name")),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () => saveTask(context), child: Text("Save Task")),
          ],
        ),
      ),
    );
  }
}