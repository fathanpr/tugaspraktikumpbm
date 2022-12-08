import 'package:tugaspertemuan7/todo.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  static late Database _database;

  Future<Database> get database async {
    return _database = await _initializeDb();
  }

  static const String _tableName = 'todos';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'todo_db.db'),
      onCreate: (db, version) async {
        await db.execute(
            '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, kegiatan TEXT, waktu TEXT, prioritas TEXT, keterangan TEXT)''');
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertTodo(Todo todo) async {
    final Database db = await database;
    await db.insert(
      _tableName,
      todo.toMap(),
    );
  }

  Future<List<Todo>> getTodos() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(_tableName);

    return result.map((res) => Todo.fromMap(res)).toList();
  }

  Future<int> deleteTodo(int id) async {
    final Database db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateTodo(Todo todo) async {
    final Database db = await database;
    return await db.update(_tableName, todo.toMap(),
        where: 'id = ?', whereArgs: [todo.id]);
  }
}
