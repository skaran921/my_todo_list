class Todo {
  int id;
  String date;
  String title;
  String priority;
  String isDone;
  Todo({this.id, this.date, this.title, this.priority, this.isDone = "false"});

  set setId(int id) {
    this.id = 0;
  }

  set setIsDone(String value) {
    this.isDone = value;
  }

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
      "TODO_DATE": this.date,
      "TODO_TITLE": this.title,
      "TODO_PRIORITY": this.priority,
      "IS_DONE": this.isDone,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      "TODO_ID": this.id,
      "TODO_DATE": this.date,
      "TODO_TITLE": this.title,
      "TODO_PRIORITY": this.priority,
      "IS_DONE": this.isDone,
    };
  }
}
