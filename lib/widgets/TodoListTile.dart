import 'package:flutter/material.dart';
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
    return CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: CustomText(
          titleText ?? "",
        ),
        secondary: CustomText(trailingText ?? "Tue"),
        value: value ?? false,
        onChanged: onChanged ?? (value) {});
  }
}
