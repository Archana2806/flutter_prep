import 'package:flutter/material.dart'; // Hey Flutter bring all the material design goodies 

void main() => runApp(const MyApp());
// main() is where the app starts, 
// runApp() boots up the app and takes a widget to display
// MyApp is the root widget of the application it doesn't change...Am rooting for you, MyApp! *Fist bump*

class MyApp extends StatelessWidget { // widget is stateless cuz it doesn't react to any changes...like your emotionally unavailable person
  const MyApp({super.key}); // super.key is the obedient child passing key to the parent class
  // key is used to preserve the state of the widget when it moves around in the widget tree

  @override
  Widget build(BuildContext context) { // build() is where we define the UI of the widget
    // context is the location of the widget in the widget tree
    return const MaterialApp( // MaterialApp wraps the entire app, it provides material design widgets
      home: TodoApp(), // home: this is what we call home of the non living things we code
    );
  }
}

class TodoApp extends StatefulWidget { // well let's say the App here will change and eveolve like a pokemon according to the user's input
  const TodoApp({super.key}); // Meh! super.key is still here, just like a loyal friend

  @override
  State<TodoApp> createState() => _TodoAppState(); // This my friend, is where the fun begins '_TodoAppState' is where we do all the reall stuff...the brainy one
}

class _TodoAppState extends State<TodoApp> { // drum beats! The logic begins! It controls what's displayed and how it reacts when things change
  // _TodoAppState is that nerdy friend who has a 'private' life, it can only be accessed within their tiny friend semi-circle...or say the files
  final _controller = TextEditingController(); // Maaa! we got the text controller! it helps us read what the user types into the text field
  // _controller is like the personal assistant of the text field, it keeps track of what the user types....Fans self in boss mode
  final List<String> _tasks = []; // An empty list at first...Like you know who. Will soon hold all the taks. One day it will have dreams, aspirations, and a lot of tasks to do!

  void _addTask() { // Function to add a task
    final text = _controller.text.trim(); // Get the text from the controller/ input and trim() removes extra space from the start and end...no Extra baggage sir!
    // text is like the user input, it holds the task that the user wants to add
    if (text.isNotEmpty) { // Only adds text if it's not empty
      setState(() { // Bow before your Queen(State)! and update the Castle(UI)! setState() tells Flutter to rebuild the widget with the new data
        _tasks.add(text); // Adds the task to our beloved list
        _controller.clear(); //Well let's just say this is Itachi Uchicha...wiping off the clan for new gen
      });
    }
  }

  @override
  Widget build(BuildContext context) { // Kids! this is how i met your mother... building the UI... (Cries in Flutter) 
    // build() is the boyfriend who is ready to change upon her..State calling
    return Scaffold( // Meet thy caregiver! Scaffold gives us a proper screen structure with an AppBar, body, and more
      appBar: AppBar(title: const Text('TODO')), // Hello AppBAr! Ajse tumhara naam 'TODO'... until further notice
      body: Column( // First we keep things vertical
        children: [
          Padding(
            padding: const EdgeInsets.all(12), // this is us giving space around the input area
            child: Row( // then all the elements in a ....wait for it.......row! just like your family photo
              children: [
                Expanded( // This is your sibling taking up all the space without giving a sht about anything
                  child: TextField( // this is where u put your stuffs to do
                    controller: _controller, // You know the drill, we give the text field our controller so it can read what we type
                    decoration: const InputDecoration( 
                      hintText: 'Enter task',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder( // This is where we display all the tasks in a list, like a to-do list but with more drama
              padding: const EdgeInsets.all(8), // Padding around the list, because we care about aesthetics
              itemCount: _tasks.length, // The number of tasks we have, like counting your exes
              itemBuilder: (_, index) => ListTile(title: Text(_tasks[index])), 
              // itemBuilder is like the matchmaker, it builds each item in the list
              // (_, index) => ListTile(title: Text(_tasks[index])) means for each index in the list, create a ListTile with the task text
            ),
          )
        ],
      ),
    );
  }
}


// We did it! Yeahhhh! Time for another task! (Cries more in flutter)