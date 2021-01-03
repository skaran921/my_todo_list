import 'package:flutter/material.dart';
import 'package:my_todo_list/utils/config.dart';

class CustomText extends StatelessWidget {
  final text;
  final double fontSize;
  final Color fontColor;
  final bool deletedText;
  const CustomText(this.text,
      {Key key, this.fontSize, this.fontColor, this.deletedText = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: TextStyle(
          color: fontColor ?? Config.grayWhite,
          fontSize: fontSize,
          decoration:
              deletedText ? TextDecoration.lineThrough : TextDecoration.none),
    );
  }
}
