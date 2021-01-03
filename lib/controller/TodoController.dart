import 'package:get/get.dart';
import 'package:my_todo_list/model/DbHelper.dart';
import 'package:my_todo_list/model/Todo.dart';

class TodoController extends GetxController {
  List<Todo> todos = List<Todo>().obs;
  var isTodoLoading = false.obs;
  var isAddTodoLoading = false.obs;
  @override
  void onInit() {
    print("init Todo Controller");
    isTodoLoading.value = true;
    getAllTodosFromDB();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

// add new todo
  Future<int> addTodo(Todo todo) async {
    isAddTodoLoading.value = true;
    var dbHelper = DBHelper();
    int lastInsertId = await dbHelper.insertTodo(todo);
    // print("=========[lastInsertId]=====$lastInsertId");
    // todo.id = lastInsertId;
    var insertedTodo = Todo(
        id: lastInsertId,
        title: todo.title,
        date: todo.date,
        priority: todo.priority,
        isDone: todo.isDone);
    todos.insert(0, insertedTodo);
    isAddTodoLoading.value = false;
    return lastInsertId;
  }

  // update todo
  updateTodo(Todo todo, int index) async {
    print("===todo.isDone = ${todo.isDone}");
    var dbHelper = DBHelper();
    await dbHelper.updateTodo(todo);
    todos[index] = todo;
  }

  //delete todo
  deleteTodo(int index) {
    todos.removeAt(index);
  }

  void getAllTodosFromDB() async {
    var dbHelper = DBHelper();
    var todo = await dbHelper.getAllToods();
    print(todo);
    todos.addAll(todo);
    isTodoLoading.value = false;
  }
}
