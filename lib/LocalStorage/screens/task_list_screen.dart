import 'package:flutter/material.dart';
import '../services/database_helper.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatefulWidget {
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late Future<List<Map<String, dynamic>>> taskList;

  @override
  void initState() {
    super.initState();
    refreshTasks();
  }

  void refreshTasks() {
    setState(() {
      taskList = DatabaseHelper.getTasks();
    });
  }

  void removeTask(int id) async {
    await DatabaseHelper.deleteTask(id);
    refreshTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task List")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: taskList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var task = snapshot.data![index];
              return ListTile(
                title: Text(task["title"]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => removeTask(task["id"]),
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
          MaterialPageRoute(builder: (context) => AddTaskScreen(refreshTasks)),
        ),
      ),
    );
  }
}