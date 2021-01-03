import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/controller/TodoController.dart';
import 'package:my_todo_list/model/Todo.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/view/update_todo.dart';
import 'package:my_todo_list/widgets/Alerts.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class TodoListTile extends StatelessWidget {
  final int index;
  final Todo todo;
  final bool isDone;
  final Function onChanged;
  final bool value;
  Iterable<Map> getTodoPriorityDetails() {
    return Config.prioritiesItems.where((element) {
      if (element["value"] == this.todo.priority) return true;
      return false;
    });
  }

  const TodoListTile(
      {Key key,
      this.onChanged,
      this.value,
      this.isDone = false,
      this.todo,
      this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var prioritiesDetails = getTodoPriorityDetails();
    return Container(
      color: Config.white,
      child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: CustomText(
            todo.title ?? "",
            deletedText: isDone,
          ),
          subtitle: Row(
            children: [
              CustomText(
                "${todo.date ?? ''}",
                deletedText: isDone,
              ),
              SizedBox(
                width: 4.0,
              ),
              CustomIcon(
                Icons.circle,
                iconColor: prioritiesDetails.first["iconColor"],
                iconSize: 14.0,
              ),
              CustomText(
                "${prioritiesDetails.first["title"]}",
                deletedText: isDone,
              )
            ],
          ),
          secondary: PopupMenuButton(
            onSelected: (value) {
              switch (value) {
                case "edit":
                  Get.to(UpdateTodo(
                    todo: todo,
                    index: index,
                  ));
                  break;
                case "delete":
                  Alerts.confirmAlertBox(onConfirm: () async {
                    await Get.find<TodoController>().deleteTodo(todo.id, index);
                    Get.close(1);
                  });
                  break;
                default:
                  return;
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [CustomIcon(Icons.edit), Text(" Edit")],
                  ),
                  value: "edit",
                ),
                PopupMenuItem(
                  child: Row(
                    children: [CustomIcon(Icons.delete), Text(" Delete")],
                  ),
                  value: "delete",
                ),
              ];
            },
          ), //CustomText(trailingText ?? "Tue"),

          value: value ?? false,
          onChanged: onChanged ?? (value) {}),
    );
  }
}
