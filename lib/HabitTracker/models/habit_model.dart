class HabitModel {
  final int? id;
  final String title;
  final int completed; 

  HabitModel({this.id, required this.title, required this.completed});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }
}