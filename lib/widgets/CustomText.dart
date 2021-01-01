import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';

class CustomText extends StatelessWidget {
  final text;
  final double fontSize;
  final Color fontColor;
  const CustomText(this.text, {Key key, this.fontSize, this.fontColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(color: fontColor ?? Config.black, fontSize: fontSize),
    );
  }
}
