import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class TodoListTile extends StatelessWidget {
  final String titleText;
  final String date;
  final Function onChanged;
  final bool value;
  final String priority;
  final bool isDone;
  Iterable<Map> getTodoPriorityDetails() {
    return Config.prioritiesItems.where((element) {
      if (element["value"] == this.priority) return true;
      return false;
    });
  }

  const TodoListTile(
      {Key key,
      this.titleText,
      this.date,
      this.onChanged,
      this.value,
      this.priority = "high",
      this.isDone = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var prioritiesDetails = getTodoPriorityDetails();
    return Container(
      color: Config.white,
      child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: CustomText(
            titleText ?? "",
            deletedText: isDone,
          ),
          subtitle: Row(
            children: [
              CustomText(
                "${date ?? ''}",
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
                  value: "Delete",
                ),
              ];
            },
          ), //CustomText(trailingText ?? "Tue"),

          value: value ?? false,
          onChanged: onChanged ?? (value) {}),
    );
  }
}
