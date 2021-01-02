import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class TodoListTile extends StatelessWidget {
  final String titleText;
  final String trailingText;
  final Function onChanged;
  final bool value;

  const TodoListTile(
      {Key key, this.titleText, this.trailingText, this.onChanged, this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Config.white,
      child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: CustomText(
            titleText ?? "",
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
