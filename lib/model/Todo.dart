class Todo {
  final int id;
  final String date;
  final String title;
  final String priority;
  final String isDone;
  const Todo(
      {this.id, this.date, this.title, this.priority, this.isDone = "false"});

  // set id(int id) {
  //   this.id = 0;
  // }

  factory Todo.fromJson(Map<String, dynamic> todo) {
    return Todo(
      id: todo["TODO_ID"],
      date: todo["TODO_DATE"],
      title: todo["TODO_TITLE"],
      priority: todo["TODO_PRIORITY"],
      isDone: todo["IS_DONE"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "TODO_DATE": this.id,
      "TODO_TITLE": this.title,
      "TODO_PRIORITY": this.priority,
      "IS_DONE": this.isDone,
    };
  }
}
