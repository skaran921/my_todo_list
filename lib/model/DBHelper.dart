import 'dart:async';
import 'package:my_todo_list/model/Todo.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDB();
    return _db;
  }

  //creating a database with name myTodoList.db in your directory
  initDB() async {
    // get application document directory
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();

    // set db path
    String path = join(documentsDirectory.path, "myTodoList.db");

    // create/open database
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);

    return database;
  }

//[_onCreate] Creating a todo table with fields
  void _onCreate(Database db, int version) async {
    Database myDB = await db;
    await myDB.execute(
        "CREATE TABLE IF NOT EXISTS  TODO (TODO_ID INTEGER PRIMARY KEY,TODO_DATE TEXT,TODO_TITLE TEXT,TODO_PRIORITY TEXT,IS_DONE TEXT)");
    print("todo table created!");
  }

//getAllTodos from db
  Future<List<Todo>> getAllToods() async {
    Database myDB = await db;
    List<Map> todos =
        await myDB.rawQuery("SELECT * FROM TODO ORDER BY TODO_ID DESC");
    // print("==========DB todos $todos");
    List<Todo> todoList = [];

    todos.forEach((todo) {
      var todoItem = Todo.fromJson(todo);
      todoList.add(todoItem);
    });
    // print("==========DB todoList $todoList");

    return todoList;
  }

  Future<int> insertTodo(Todo todo) async {
    Database myDB = await db;
    return await myDB.insert("TODO", todo.toJson());
  }

  // update todo
  Future<int> updateTodo(Todo todo) async {
    Database myDB = await db;
    return await myDB.update("TODO", todo.toMap(),
        where: 'TODO_ID = ?', whereArgs: [todo.id]);
  }
}
