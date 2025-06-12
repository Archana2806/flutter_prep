import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static final String tableName = "habits";

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    
    String path = join(await getDatabasesPath(), 'habits.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute("CREATE TABLE $tableName (id INTEGER PRIMARY KEY, title TEXT, completed INTEGER)");
      },
    );
    return _database!;
  }

  static Future<void> addHabit(String title) async {
    final db = await getDatabase();
    await db.insert(tableName, {"title": title, "completed": 0});
  }

  static Future<List<Map<String, dynamic>>> getHabits() async {
    final db = await getDatabase();
    return await db.query(tableName);
  }

  static Future<void> toggleCompletion(int id, int completed) async {
    final db = await getDatabase();
    await db.update(tableName, {"completed": completed}, where: "id = ?", whereArgs: [id]);
  }

  static Future<void> deleteHabit(int id) async {
    final db = await getDatabase();
    await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}