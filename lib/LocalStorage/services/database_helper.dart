import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static final String tableName = "tasks";

  static Future<Database> getDatabase() async {
    if (_database != null) return _database!;
    
    String path = join(await getDatabasesPath(), 'tasks.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute("CREATE TABLE $tableName (id INTEGER PRIMARY KEY, title TEXT)");
      },
    );
    return _database!;
  }

  static Future<void> addTask(String title) async {
    final db = await getDatabase();
    await db.insert(tableName, {"title": title});
  }

  static Future<List<Map<String, dynamic>>> getTasks() async {
    final db = await getDatabase();
    return await db.query(tableName);
  }

  static Future<void> deleteTask(int id) async {
    final db = await getDatabase();
    await db.delete(tableName, where: "id = ?", whereArgs: [id]);
  }
}