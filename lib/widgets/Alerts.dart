import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todo_list/widgets/CustomIcon.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class Alerts {
  static successAlert(BuildContext context) {
    return showDialog(context: context, child: AlertDialog());
  }

  static confirmAlertBox({String contentText, Function onConfirm}) {
    return Get.dialog(AlertDialog(
      title: Row(
        children: [
          CustomIcon(Icons.help),
          SizedBox(
            width: 4.0,
          ),
          CustomText("Confirmation")
        ],
      ),
      content:
          contentText ?? CustomText("Do you really want to delete this task?"),
      actions: [
        FlatButton(
            onPressed: () {
              Get.close(1);
            },
            child: CustomText("No")),
        FlatButton(onPressed: onConfirm ?? () {}, child: CustomText("Yes"))
      ],
    ));
  }
}
