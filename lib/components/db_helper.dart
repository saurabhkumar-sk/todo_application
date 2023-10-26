import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/models/todo_model.dart';

class DBHelper {
  static const _dbName = 'todo.db';
  static const _tableName = 'todo';

  static const _version = 1;

  DBHelper._(); //private constructor

  static final instance = DBHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await opedDb();

    return opedDb();
  }

  static Database? _database;

//open database
  Future<Database> opedDb() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT,complete BOOLEAN)',
        );
      },
      version: _version,
    );
    return database;
  }

//create
  Future<void> createTodos(TodoModel model) async {
    final db = await database;

    await db.insert(
      _tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TodoModel>> getTodos() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query(_tableName);

    return List.generate(
      maps.length,
      (index) => TodoModel.fromJson(
        maps[index],
      ),
    );
  }

  //update todos
  Future<void> update(TodoModel todo) async {
    final db = await database;

    await db.update(
      _tableName,
      todo.toMap(),
      where: 'id=?',
      whereArgs: [todo.title],
    );
  }

  //delete
  Future<void> delete(TodoModel todo) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id=?',
      whereArgs: [todo.title],
    );
  }

  // deleteCompletedTasks() {}
}
