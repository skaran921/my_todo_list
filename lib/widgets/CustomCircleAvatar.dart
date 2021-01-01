import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';
import 'package:my_todo_list/widgets/CustomText.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String text;

  const CustomCircleAvatar({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      child: CustomText(
        "${text ?? ''}",
        fontColor: Colors.white,
      ),
      backgroundColor: Config.indigo,
    );
  }
}
